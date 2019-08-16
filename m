Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A652C7F2F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 16:12:18 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e8so3495230wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wntS40sbkT9/GLd7TAoaVCFmQK93+cD//r25o1KjYVI=;
	b=JEfWuy0uPUl1ZSs4ovf1EnnGhxUZHJZrtRAYpqkYeavMBG0BtSxUBn9hzlzotN21KO
	57a4e9ncU8Eh2kb5UIN22jsoHQanbTNLxTPQ8BE6/rf6ZgHjGaa16igp429jbAI42lK8
	Gyw19gJGG0ye2sEq/qG0sSshOltH1j0SKyJdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wntS40sbkT9/GLd7TAoaVCFmQK93+cD//r25o1KjYVI=;
	b=pC2Fy66N99Lg5oJpCPKogyfc1i+bKNWwhexMycq5pA33J00DQO/7ys12jbYF8CWIB/
	93QRtpG9WYIO0HaMf31gEbXmcp6frVVWEhdqFdVSDh0AoTCDdlRqD/aj5P9CfkbpTliV
	MXzSG2hH0Onr3hS0H6l5IGAFaV8TLWkj9LCIQ9OQjiVfpscsCWrk3v+29gQ98sfAm6U3
	cT/e4A7FNEInGT99QWGEO5WpqxEuTSxFC0H+H8sUUQPl2BE4yMmjTDQCc96E0d5XRLJ1
	v+OeieG3nKN9gFiWPdLP17xxMTPAHBh/O3pcFjLfTtM8+Bv08I274T9Fw2BTMHHD1JMd
	nw8w==
X-Gm-Message-State: APjAAAUvv/9xHNuCRQFUVV+W7pwJ5OrHea7oxxYdkoa3LtN27r3hpCEa
	GVw8d3KmG43exSi2UJ11ztMBz1Savc/Mhg==
X-Google-Smtp-Source: APXvYqwOYgFN6F0YSoR47jWUsDIVKFWVpTyeXnRX4PCnh+Hqynx6CTLyEbHhd3lou3NwVCw97/Ug2A==
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr8470852wmf.176.1565971939060; 
	Fri, 16 Aug 2019 09:12:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e11sm15327243wrc.4.2019.08.16.09.12.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 09:12:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 17:12:16 +0100
Message-Id: <20190816161216.24423-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816161216.24423-1-richard.purdie@linuxfoundation.org>
References: <20190816161216.24423-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] package: Fix race between do_package and do_packagedata
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
X-List-Received-Date: Fri, 16 Aug 2019 16:12:19 -0000
Content-Transfer-Encoding: 8bit

do_package has PKGDESTWORK as a cleandir and do_packagedata has it as an sstate-input
dir. This means do_package wipes out the directory at both do_package and do_package_setscene.

do_package_setscene and do_packagedata_setscene can run in parallel when installing from
sstate which means they can wipe out parts of each other leading to interesting
build failures.

We therefore have to add in a hardlink copy so that the directories can work independently
of each other.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e67bb5bd97d..114d6559f5e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2252,14 +2252,18 @@ python do_package_setscene () {
 }
 addtask do_package_setscene
 
-do_packagedata () {
-	:
+# Copy from PKGDESTWORK to tempdirectory as tempdirectory can be cleaned at both
+# do_package_setscene and do_packagedata_setscene leading to races
+python do_packagedata () {
+    src = d.expand("${PKGDESTWORK}")
+    dest = d.expand("${WORKDIR}/pkgdata-pdata-input")
+    oe.path.copyhardlinktree(src, dest)
 }
 
 addtask packagedata before do_build after do_package
 
 SSTATETASKS += "do_packagedata"
-do_packagedata[sstate-inputdirs] = "${PKGDESTWORK}"
+do_packagedata[sstate-inputdirs] = "${WORKDIR}/pkgdata-pdata-input"
 do_packagedata[sstate-outputdirs] = "${PKGDATA_DIR}"
 do_packagedata[stamp-extra-info] = "${MACHINE_ARCH}"
 
-- 
2.20.1


