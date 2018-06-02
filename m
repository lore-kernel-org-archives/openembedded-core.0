Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1FAB274BC3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 09:00:34 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id y15-v6so38382435wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4RctW7d/oo5VxXU/gH1r4izhn1pLVPdetH9CewB3Q1Y=;
	b=ttrKWk9BzhxhprCSx3rNiAHDqwaBPBWfQ+VKESySh4SobF7bbeKLeFeFu9AUKvoblV
	/XbH3dDEo1Zz2sY5WPO3YGTMgdChLBNlkL/rbdbduSey9wcBd+1x7keyavvzjSAk+ebc
	c1OeXlDGBK+TlBNvCyA45FMGMpWdtsnUxlafOrNCA5LppbEzvRLDR1u9vdrASJszGpSr
	MGZTfH8zFwdNZzJ7If7pnWYRcCpBy3HYFv3QV/B78/LluC91PlLH4TQmvSt0puwadlQF
	5LNsX/h7kNQCUZv7zdV18mke2YClydqBHS5jXYZY5uKfxD4ZZ+tnaixbtMobyYWFn4Op
	AcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4RctW7d/oo5VxXU/gH1r4izhn1pLVPdetH9CewB3Q1Y=;
	b=RCXzOR63TC2cHi8BSwy1zA/kGAvajoNMTqWjsTHmM2ZyNQ69uw7P/0/aRC1WIKp1iO
	IcuWNpqos3++PGA2VPeN/QgDPrCZfCa092bzgI7JDq6PMxGQpIAWLZVNKZkf3LddZvd2
	UmjFPUtUhGvBVVfuEpgU9uD0q/E0GabM8XZHOI5+hjrsQVhDZEGCus19/RbgcSjo3/Pg
	fLeOPiChV/TBQhbtE7nj++nclO5C75s4uX5c+pzDLHOeBuhApPAMlofIW31ihU0/AjCh
	UTg6BfgC0Abc0khpHm+EIMCgNqTGwzPq/a9TtSfjpPNnE0y4URi2gnJoekOvQcU48XgV
	mtOQ==
X-Gm-Message-State: APt69E0JWI87ZY0R5tYmZBaZtFGG1Zm8S8SxE2TeoDgEXk5ViY8ggRVS
	+/cWvbus7mBNiDN1FtUy/xQSSw==
X-Google-Smtp-Source: ADUXVKKzufcoeZpNEFGUUXAlPQwiEY97iKDGQo8nhIN6DPC9ajYYRinyH0fZZkOL4JiOe5/ovfhYEw==
X-Received: by 2002:a5d:4307:: with SMTP id h7-v6mr210323wrq.58.1527930035557; 
	Sat, 02 Jun 2018 02:00:35 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o12-v6sm60446809wrf.30.2018.06.02.02.00.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 02 Jun 2018 02:00:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2018 09:00:34 +0000
Message-Id: <20180602090034.31810-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180601154209.673-1-Martin.Jansa@gmail.com>
References: <20180601154209.673-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2] systemd: fix build with gcc8
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
X-List-Received-Date: Sat, 02 Jun 2018 09:00:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ild-with-gcc8-Werror-format-truncati.patch | 53 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch

diff --git a/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
new file mode 100644
index 0000000000..fcc7c500ab
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
@@ -0,0 +1,53 @@
+From f9fd4546c25a15629544bc4642a74d7909cc0840 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 1 Jun 2018 15:22:28 +0000
+Subject: [PATCH] time-util: fix build with gcc8 -Werror=format-truncation=
+
+* it fails with gcc8 when -O1 or -Os is used (and -ftree-vrp which is added by -O2 and higher isn't used)
+
+../git/src/basic/time-util.c: In function 'format_timespan':
+../git/src/basic/time-util.c:508:46: error: '%0*llu' directive output between 1 and 2147483647 bytes may cause result to exceed 'INT_MAX' [-Werror=format-truncation=]
+                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
+                                              ^~~~
+../git/src/basic/time-util.c:508:60: note: format string is defined here
+                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
+../git/src/basic/time-util.c:508:46: note: directive argument in the range [0, 18446744073709551614]
+                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
+                                              ^~~~
+../git/src/basic/time-util.c:507:37: note: 'snprintf' output 4 or more bytes (assuming 2147483651) into a destination of size 4294967295
+                                 k = snprintf(p, l,
+                                     ^~~~~~~~~~~~~~
+                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
+                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+                                              p > buf ? " " : "",
+                                              ~~~~~~~~~~~~~~~~~~~
+                                              a,
+                                              ~~
+                                              j,
+                                              ~~
+                                              b,
+                                              ~~
+                                              table[i].suffix);
+                                              ~~~~~~~~~~~~~~~~
+cc1: some warnings being treated as errors
+
+Upstream-Status: Submitted https://github.com/systemd/systemd/pull/9156
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/basic/time-util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index 0601d4fa9..db5a9cd78 100644
+--- a/src/basic/time-util.c
++++ b/src/basic/time-util.c
+@@ -484,7 +484,7 @@ char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy) {
+                 /* Let's see if we should shows this in dot notation */
+                 if (t < USEC_PER_MINUTE && b > 0) {
+                         usec_t cc;
+-                        int j;
++                        signed char j;
+ 
+                         j = 0;
+                         for (cc = table[i].usec; cc > 1; cc /= 10)
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 2e6558ded1..0113c2dc72 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -54,6 +54,7 @@ SRC_URI += "file://touchscreen.rules \
            file://libmount.patch \
            file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
            file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
+           file://0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.17.0


