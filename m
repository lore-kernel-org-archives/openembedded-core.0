Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9087F95C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 20:59:45 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r13so22415140ioa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 12:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jgBm5FVFzBlgwRaJx6ZADxXKe5bbLOS34AdMFMlfyAE=;
	b=dPQ5R830+OGqIxzJ+xP8aaPv8IRHuzqfZ2DobvxCSkBltx+C2I6t/OCZBS+94hWCMx
	vl/WTyqrRypxtDX0yfVkCRWxuslyqYZnRdTuyAieysJtlw5ptFS6XwvPUvicckG27fPZ
	zJF7Oa48VIGQVp9Y3lS6kYrsqLagnaowwGGE8t1CN88X7y8SEpa4ZwIuIY/Vq72nMiFz
	toddldpha6J8ZltDx4gzTgsLrqHeKIQtClik8CNr4Gyui5awqp6QUYcYwJ7m+UuRM6KN
	3hiQuUZY5UTTW+YsUbxX9P3Cx2Z4rSZEzvheqeqTNbhYiwft+Lc4oSeCZqAhaS1E7gP3
	d3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jgBm5FVFzBlgwRaJx6ZADxXKe5bbLOS34AdMFMlfyAE=;
	b=qywAju6O+z5dBTFgXcvA2poNqLEvWNloFuPAgXzPxHtlSWNTyCtuORaDBQrHi9RsLz
	bSLnIy3wnYSSiLB5h7KjpqUcqD3o1CWPY6VexTUC7ait+m18xCoHqDptzCJ1s06cAdd3
	pY1G5fG8b3HR3jlPluxKNVOPfG52kLU2/i6eSrJV/R3r5LpvFxtu3LD2gKKY4ib2j6VQ
	EDHDee1peC5L46Qi4gMMoEbfqynuN3pfnRnHWs8RTjjaKzQKFNy5TT7D1ZYwVTgL5fja
	as2pI9xMV+84kQqnmDYhx5kU5pzIF+S6onD73gZddygpXeYqKbnhaRZMwjMHnvAjETj5
	LvEg==
X-Gm-Message-State: APjAAAWtBLKhBv3+XIxsid51SzuiPJ0IB4/fOubs6gyn2Xfw4Kl0TDWt
	wGSU0ZSMTa5p3jWUnYdjWmZ80boM
X-Google-Smtp-Source: APXvYqwWwDiGxHS5FwL1NortSTOjvodmbZzZIqSXbRlEsoakBRbVj2mHbBgq1lcdLbLhkiBGAosdGw==
X-Received: by 2002:a02:cc4e:: with SMTP id i14mr53673771jaq.144.1577739586291;
	Mon, 30 Dec 2019 12:59:46 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	i13sm11918416ioi.67.2019.12.30.12.59.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 12:59:45 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2019 14:59:41 -0600
Message-Id: <20191230205941.1878175-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] python3: RDEPEND on libgcc
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
X-List-Received-Date: Mon, 30 Dec 2019 20:59:45 -0000
Content-Transfer-Encoding: 8bit

Python uses features of glibc that require it to dynamically load (i.e.
dlopen()) libgcc_s at runtime. However, since this isn't a link time
dependency, it doesn't get picked up automatically by bitbake so
manually add it to RDEPENDS.

There is an outstanding bug in Python to make it explicitly link against
libgcc at link time which would remove the need for this. See:
https://bugs.python.org/issue37395

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
index 57eaaea5e7..4c8d5134a7 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -336,6 +336,8 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
+# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
+RDEPENDS_${PN} = "libgcc"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.23.0


