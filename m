Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3CCEA74835
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 23:30:51 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a67-v6so5200156wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 16:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=R/iHTwVI2QFqviMKi1z/wmw0Gsph+4mlF0vI3535N70=;
	b=1jdeI2U4kZ7KCVUqrkGfyXjl9DG86x36E2G2UV6VVeopZPkgvsBSUvkdKF/1EZPlbO
	vjvVAgjE/xbJuSY22qee5Zy2r8sUt7Ml94gg9jYYK+MlOFIoVsxASQ2Yu4dtbU6/mxZR
	DsxWoBbnnOqoR293TV6K1ixe7DD1LKfn7eSVZ6xBM9hnf9dCd2aW/WvYO0jGGLYYANcI
	nLo1TCfsmEnfOCipRawOP0qVHMIAKpAY4VEF75dB/VGzX2kIxj7dR0WX6mp1IcFa2U1/
	9Ej4iLi31DNgDMfz+dA2XW3S52C/myBjgzR/FE9/AWBInpOBfutCqMYGvuQC7cZsZolH
	e9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=R/iHTwVI2QFqviMKi1z/wmw0Gsph+4mlF0vI3535N70=;
	b=lw7zJ8RnZImY81FyZqsTjnbDx14QVMVx+VA9kPgCv38tu0vodiZA3k1uYt0yzQcB67
	YetsbS/GyGfM8LuXWqb48geZU6lhORn8D5IIPyJ4z8apEgNoWn7XSzNtID2SorgUFD/n
	nAKzr30+6HFdD+yhHIue3qPketi/+bT3fOI3XtoK7HOAy33f6WRyMtpPk1rsyJvpTXNE
	s4lbE4GLW1VbDzFgztEWdHoMXRRq4lQl6e24cFQfkjhDpECJNZaFahjBtNpE6+sFh6Q5
	M/S0U6Q9bcWhHeHRj7FKb5kY4jOhtyiNbtx8UzdTZSunO+hLc8cBkMDnDm40042Wc59M
	ejBg==
X-Gm-Message-State: ALKqPwe1QICZyTHtfIMuizpcT0wJgXF7ojOh7Q6MHJRMydoH9BveUHaJ
	oSuEnCNZ5eMpdNUcPXbfzvYajOO+
X-Google-Smtp-Source: AB8JxZppTXM2i2CpFudaM7gnbzyBVq+Jnfj/G9rlEub8gsYYljMcanb5JyB9anFgMXEHXIz5bvzseg==
X-Received: by 2002:a1c:d546:: with SMTP id
	m67-v6mr182947wmg.117.1526513451577; 
	Wed, 16 May 2018 16:30:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b11-v6sm4748879wrf.50.2018.05.16.16.30.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 May 2018 16:30:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 00:30:46 +0100
Message-Id: <20180516233046.10217-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][rocko] libnl: protect against buffer overflow (CVE-2017-0553)
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
X-List-Received-Date: Wed, 16 May 2018 23:30:51 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libnl/libnl/overflow.patch | 39 +++++++++++++++++++++++++
 meta/recipes-support/libnl/libnl_3.2.29.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/libnl/libnl/overflow.patch

diff --git a/meta/recipes-support/libnl/libnl/overflow.patch b/meta/recipes-support/libnl/libnl/overflow.patch
new file mode 100644
index 00000000000..777fac3ea1a
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/overflow.patch
@@ -0,0 +1,39 @@
+CVE: CVE-2017-0553
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 3e18948f17148e6a3c4255bdeaaf01ef6081ceeb Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Mon, 6 Feb 2017 22:23:52 +0100
+Subject: [PATCH] lib: check for integer-overflow in nlmsg_reserve()
+
+In general, libnl functions are not robust against calling with
+invalid arguments. Thus, never call libnl functions with invalid
+arguments. In case of nlmsg_reserve() this means never provide
+a @len argument that causes overflow.
+
+Still, add an additional safeguard to avoid exploiting such bugs.
+
+Assume that @pad is a trusted, small integer.
+Assume that n->nm_size is a valid number of allocated bytes (and thus
+much smaller then SIZE_T_MAX).
+Assume, that @len may be set to an untrusted value. Then the patch
+avoids an integer overflow resulting in reserving too few bytes.
+---
+ lib/msg.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/msg.c b/lib/msg.c
+index 9af3f3a0..3e27d4e0 100644
+--- a/lib/msg.c
++++ b/lib/msg.c
+@@ -411,6 +411,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
+ 	size_t nlmsg_len = n->nm_nlh->nlmsg_len;
+ 	size_t tlen;
+ 
++	if (len > n->nm_size)
++		return NULL;
++
+ 	tlen = pad ? ((len + (pad - 1)) & ~(pad - 1)) : len;
+ 
+ 	if ((tlen + nlmsg_len) > n->nm_size)
\ No newline at end of file
diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb b/meta/recipes-support/libnl/libnl_3.2.29.bb
index 7d4839ba506..746fd3d4153 100644
--- a/meta/recipes-support/libnl/libnl_3.2.29.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.29.bb
@@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
+           file://overflow.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
 
-- 
2.11.0


