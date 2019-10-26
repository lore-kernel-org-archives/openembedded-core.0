Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id C0F727FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:13 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g7so4361490wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=v7xqCKrVpnXT450E4UGO2HKQyfr2fzQC5HJQ90WnBmU=;
	b=i8wgFLV2+QGTu3ZGulR2Cya6mcdxwO5wKKL16UXWKxikrl0bntyadPyOYbvt/CzVI0
	fSiB3jN9PINfRvFgLCFiLdw2dTfw9mHStHEcg/dDwZByaNZiEUzsr4wup2kVKNHfFVnc
	K/ryaiTlIXOkNTTGxdCtpUwlRbN0nkz0TQZfbUaQg4j133bY75pCBuoJYl8jGiFbs5Pb
	uB66UMI6zbKjK/Hov4xheueNE5lXe68mZ94XhlSaeLzfRgbhSXkYFiuE/QHm7nWXOTET
	K5sYqTf2UvYUv0vz2axvpzQ7yM2vGl57gBSPy0RZqidj1x+NwnWXWw8RKz4j6ISuNfWN
	xjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=v7xqCKrVpnXT450E4UGO2HKQyfr2fzQC5HJQ90WnBmU=;
	b=Kgig9Sgvybyl5N/8QOieqbwADtweeLg7iCyvg/tue2yNGPqGsbSD+GSlQSPvmYJRXw
	JfavTQg7vlTpC5zisEKb9pOBF/VQH3FA4NxcYzMShuoT24I35zsvpsx8pxXQHuh/0JE1
	tMSzo/g6q0k0tEvMCRdgUc5TeElbQh0hmyb/fr17LpJKGWJmikGPBUS2o+UrERubJdeu
	wiQ3sjUuQGEDFCSzYfbshWJn8jIdmDxF2bLIvG5ivKVprjKoCNcYlHvnlRcJ2to/o1S3
	qcznFLbJ2RIquEFwtocwNHy69CjYULvx14vqXMwW5hD3er5VHPihFWnSdOovDJAaQQT3
	uQQQ==
X-Gm-Message-State: APjAAAUnVXZfV5vA8slGEoFlx7kEkWFLx/LzH0uaMK3YDyI1nkZaymym
	VCda/eOCcyOYPguE4JUyK55PXCxw7XY=
X-Google-Smtp-Source: APXvYqwgdeprVVdLTKlXK0MlWY1wYl/OZnR+1oZBem2jn1aYb35hWGzHp4OsVHi2J3PV/kCTDL29nA==
X-Received: by 2002:a1c:7fd8:: with SMTP id a207mr6818472wmd.10.1572072614330; 
	Fri, 25 Oct 2019 23:50:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:44 -0700
Message-Id: <e8f39536d2616ea0bb8bab459da29af63e3ee336.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 12/28] openssh: fix CVE-2019-16905
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:14 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport a patch from upstream to fix CVE-2019-16905
https://github.com/openssh/openssh-portable/commit/a546b17bbaeb12beac4c9aeed56f74a42b18a93a

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bd4b87071c073a0e4d265bc00df34684a355eff)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...x-integer-overflow-in-XMSS-private-key-pa.patch | 40 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_8.0p1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
new file mode 100644
index 0000000..3265be3
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch
@@ -0,0 +1,40 @@
+From 2014fad3d28090b59d2f8a0971166c06e5fa6da6 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 18 Oct 2019 14:56:58 +0800
+Subject: [PATCH] upstream: fix integer overflow in XMSS private key parsing.
+
+Reported by Adam Zabrocki via SecuriTeam's SSH program.
+
+Note that this code is experimental and not compiled by default.
+
+ok markus@
+
+OpenBSD-Commit-ID: cd0361896d15e8a1bac495ac583ff065ffca2be1
+
+Signed-off-by: "djm@openbsd.org" <djm@openbsd.org>
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/a546b17bbaeb12beac4c9aeed56f74a42b18a93a]
+CVE: CVE-2019-16905
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ sshkey-xmss.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sshkey-xmss.c b/sshkey-xmss.c
+index aaae702..c57681a 100644
+--- a/sshkey-xmss.c
++++ b/sshkey-xmss.c
+@@ -977,7 +977,8 @@ sshkey_xmss_decrypt_state(const struct sshkey *k, struct sshbuf *encoded,
+ 		goto out;
+ 	}
+ 	/* check that an appropriate amount of auth data is present */
+-	if (sshbuf_len(encoded) < encrypted_len + authlen) {
++	if (sshbuf_len(encoded) < authlen ||
++	    sshbuf_len(encoded) - authlen < encrypted_len) {
+ 		r = SSH_ERR_INVALID_FORMAT;
+ 		goto out;
+ 	}
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
index 01eaecd..2ffbc9a 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch \
            "
 SRC_URI[md5sum] = "bf050f002fe510e1daecd39044e1122d"
 SRC_URI[sha256sum] = "bd943879e69498e8031eb6b7f44d08cdc37d59a7ab689aa0b437320c3481fd68"
-- 
2.7.4


