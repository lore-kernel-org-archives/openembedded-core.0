Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2F577CB4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 12:09:54 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g19so10823591wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N53acnO1DfU0nRR7EAbj7hXyrFlIuJPV6F5napwAIYs=;
	b=utmbP+qXpCxwguO1r080BS0ppHBTNdHtYUJfMULIXATb17bLTBj84cLtV8FWnfO9+J
	cP5KIGFEDPkcBnZijDcDEwSNQvf8CnI0Tvigx9qLpmzTqbrGQ0p3U1LJMGUjRgyPmYpf
	crO+zeXaOx9oL3M5bEfNdvwD8lP48bsuO6uWKrF2FOMhnA7rnwbUq6pPnli8mpa/WIaY
	b15lX5ypqCXLECckERv6AU6NJ8mccKB6QlAjK8YZ6w3aElPmNnkgs9xr6iCYB7YOm/bO
	ffHz/spkYxsuxWXdVJtXJiAh9qwOn6W1xV8OB766qyI2bvz41vjh8kNwJkizR0hJ3YK2
	oTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N53acnO1DfU0nRR7EAbj7hXyrFlIuJPV6F5napwAIYs=;
	b=bInbw+lDdycwcMcEVX1Y6niDB+DvGPHzjeM7DzEUjH0HmVARaJpklen+jtMPk3qBxp
	R8P+YkHBDsLYWKT5tgcm7jgq0XCGgwVe46bEu5e+vyaQ+BKhD+zK5TAGUzbMCZQG41ag
	V7VmcasBZn64MjShAuT3HbpPJsC0xuG3MrdciT0yY0A82fLxGHNrxwuWoHMnzEkRtrEW
	OFT/z/DRCoVqBMT65W3C9kBinoqQd6HASOHC4R3jXAI70mogCiYeTQnovoCTM/Yredhr
	VmU6B6xgl/E24WasFnHs2qMkui88dgUy/dbIlLIZ4UU10WN2cMcv4HW2mcVYC3lvCPdu
	rzCg==
X-Gm-Message-State: AFeK/H0pc6ZtbcXVbYjyFdYDxRFTsZ0CkeZda4CgTRqSIGF7kPI3MWV/SIESak9JPOwgPQ==
X-Received: by 10.28.51.140 with SMTP id z134mr24872978wmz.55.1491480595949;
	Thu, 06 Apr 2017 05:09:55 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.167]) by smtp.gmail.com with ESMTPSA id
	m7sm26221884wmi.34.2017.04.06.05.09.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 05:09:55 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:09:41 +0200
Message-Id: <1491480584-9725-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
References: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 1/4] cross.bbclass: override TARGET_* flags
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
X-List-Received-Date: Thu, 06 Apr 2017 12:09:55 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Some TARGET_* flags are being exported in bitbake.conf currently, so
they are impacting all the tasks of a cross recipe even they are not
in use at all.

This can lead a lot of churn when the cross sysroot are shared by
machines while they have defined different TARGET_* flags.

And sometimes it even causes "Taskhash mismatch" errors.

Fix it by overriding with BUILD_* flags.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/cross.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 2602153..8757303 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -28,6 +28,11 @@ MULTIMACH_TARGET_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
 export PKG_CONFIG_DIR = "${exec_prefix}/lib/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = ""
 
+TARGET_CPPFLAGS = "${BUILD_CPPFLAGS}"
+TARGET_CFLAGS = "${BUILD_CFLAGS}"
+TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
+TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
+
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
 CXXFLAGS = "${BUILD_CFLAGS}"
-- 
2.7.4


