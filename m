Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8225477CDB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 12:09:59 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g19so10824363wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3C66G9+vZCPCWPiSs85Ea2+5RR7CgyzifcjNJXwf5qQ=;
	b=s4LCqzM3q4U/TWP64uFAvYvQi2/z7QT8qS5diqSjQnPGWGK8UQu8odjXMC7/XTdmMz
	/xkPcS8Z9USdKSai0JP3SBA7ocSigQCv7tFZE0eOloZCAoiVnkDksRLbNcEQYDkM7HcL
	0eZYtsRCh818OxY/yStyKZNJZPU0p8gDfoYvbz4KfrrKFsyJUl9NkgQvV602dgAKrKzo
	qYITBevFSml6mXPsA2DDWGC+efRvkS18vURbOxqQX9NthIpWx+0fvyL8p3oeKaf3Z5b2
	Qxy6SKurdxsD+v0l3paCt0UUwmrsliT0cUlLC+IEYCL21X78NBnAfPPM8StMx52hyik2
	3PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3C66G9+vZCPCWPiSs85Ea2+5RR7CgyzifcjNJXwf5qQ=;
	b=Lt6roIwM9wtjNJS2bbTHwhQcdtMokggNSueWUvOwruXwD6tvu9J6mkH48jxEEtPbPg
	bKknVPvfSkgEF/qO7rVI0qLFVdX2LxCyVhbx5ly8jxJhXOL5r7Sudo6pqWYbqV0GMZqI
	R3ASFRmPDizzpbdo1Es056+UOCyxYWDJlO+F37wxhiuBEH8zsa7fKBUsobNiP+LpN5aA
	XwXz9MfHakHkkxkb5k4tcPFHt55z4P2d9ebi1G98KPkHzgwr7ZsfwfJ9Fp5+UeRoPqLU
	+S24UabFv25puxbixRIXjWnAKjThsqBHEzKcQYlSpt7HFN9a3wUHZyKdfS+l/qHXbccg
	iBBg==
X-Gm-Message-State: AN3rC/6Bx7ix8XpxXXMsLfkDl1JET1xCSbzoAQaF+IzOwB87jpnTkHc7aIvl4ni4b5C2lQ==
X-Received: by 10.28.188.84 with SMTP id m81mr4992391wmf.119.1491480600705;
	Thu, 06 Apr 2017 05:10:00 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.167]) by smtp.gmail.com with ESMTPSA id
	m7sm26221884wmi.34.2017.04.06.05.09.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 05:09:59 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:09:42 +0200
Message-Id: <1491480584-9725-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
References: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 2/4] crosssdk.bbclass: override TARGET_* flags
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Apr 2017 12:09:59 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Some TARGET_* flags are being exported in bitbake.conf currently, so
they are impacting all the tasks of a crosssdk recipe even they are
not in use at all.

This can lead a lot of churn when the crosssdk sysroot are shared by
machines while they have defined different TARGET_* flags.

Fix it by overriding with BUILD_* flags.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/crosssdk.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index a5ffd97..ddb98d2 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -21,8 +21,13 @@ TARGET_PREFIX = "${SDK_PREFIX}"
 TARGET_CC_ARCH = "${SDK_CC_ARCH}"
 TARGET_LD_ARCH = "${SDK_LD_ARCH}"
 TARGET_AS_ARCH = "${SDK_AS_ARCH}"
+TARGET_CPPFLAGS = "${BUILD_CPPFLAGS}"
+TARGET_CFLAGS = "${BUILD_CFLAGS}"
+TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
+TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
 TARGET_FPU = ""
 
+
 target_libdir = "${SDKPATHNATIVE}${libdir_nativesdk}"
 target_includedir = "${SDKPATHNATIVE}${includedir_nativesdk}"
 target_base_libdir = "${SDKPATHNATIVE}${base_libdir_nativesdk}"
-- 
2.7.4


