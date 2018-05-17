Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id C4B8F7481C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 22:19:11 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id p14-v6so2742121pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 15:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mHrtRaJICUqyhSB/WUv5poT/pTdWYmcDuclc/qWwb8U=;
	b=epMaG7MDqpAezAewPL42TzWFVqi6i3boWKdtu4PJWNeqYC/NNmK8bI4TpQJFcNDtG1
	PqYw6y+UCwoF+aXtNxZIAuKkIrNydYBAt0aIO/G/SoKrRco4N9G5jpVjJvwxw6+r4pAc
	9y1J2e6CV9DmUfGbEhih2rncAroW4YOTfg3VrKSEr/br79qjIJPZTiT4Df+OURbW6ejM
	NfyP/oF/80eT+4x2DrpI6Mdg1rplwob3cVmlxkX/hUxTWCW6jNXTwDQFVqIOtElbvLTL
	D4PObYn6Ihs6aZa09Sa+044KyzCRQL7UXgtqFKiHG7Gkal/I+jX2U/d37o0yZPJBHYMU
	YR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mHrtRaJICUqyhSB/WUv5poT/pTdWYmcDuclc/qWwb8U=;
	b=i30Q8MKMJq1349bMJ8M4zAowj12cu0ZcXWi5yt/6yiR48hKg4HPF/qJD/Y75S6Jr6b
	QCV0umi4nQQVxEuMYiTTos2+/PZlBXm4uM/x6mggFD3IfKsfZ1hqcGQbWGzHQDMYGM8h
	bJOdhAgqrRmAO3WAZrt+q78ixyCoS5oUYlIym/ptDyKJ0dcZUn/yO31rLQSXkb9J4AXt
	Bg0oGJvzSTVOnTq4JUij3hyk/HmnWw+WgxV9kY1ya9AdSy0u2ajyWqYNxf/3tsQixsiG
	R2sr6qukXSxSFxqX0cfCwSNX2Q4f3gaArWZMfcGo1hgnWQVBqQwZ89l52Gqrzck1AFtX
	PXhg==
X-Gm-Message-State: ALKqPwclMepxk8oXULiuIj8nFZRQsLoLQ9CjNrVfbvX5gGJgZKB4wTjW
	jue6BOgZMHbJJ6k5p+yOofBaVQ==
X-Google-Smtp-Source: AB8JxZogpQ6kVh1LeruHi81u8xwaYjGauni8DvT8z/OFFu/lQFvO7m4YVfADg0jGiG0RODTxfUHgOQ==
X-Received: by 2002:a62:6304:: with SMTP id x4-v6mr6784824pfb.94.1526595552528;
	Thu, 17 May 2018 15:19:12 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h1-v6sm9997966pfg.135.2018.05.17.15.19.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 15:19:11 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 15:19:06 -0700
Message-Id: <1526595546-3621-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [morty][PATCH] libnl: fix CVE-2017-0553
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
X-List-Received-Date: Thu, 17 May 2018 22:19:11 -0000

An elevation of privilege vulnerability in libnl could enable a local
malicious application to execute arbitrary code within the context of
the Wi-Fi service. This issue is rated as Moderate because it first
requires compromising a privileged process and is mitigated by
current platform configurations. Product: Android. Versions: 5.0.2,
5.1.1, 6.0, 6.0.1, 7.0, 7.1.1. Android ID: A-32342065. NOTE: this
issue also exists in the upstream libnl before 3.3.0 library.

  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0553

Backport fix from upstream 3.3.0 release:

  https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb
  http://lists.infradead.org/pipermail/libnl/2017-May/002313.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...eck-for-integer-overflow-in-nlmsg_reserve.patch | 43 ++++++++++++++++++++++
 meta/recipes-support/libnl/libnl_3.2.28.bb         |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch

diff --git a/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
new file mode 100644
index 0000000..9e22c40
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
@@ -0,0 +1,43 @@
+From 1db543374db3e58faacdfd91e5061a8a595ce505 Mon Sep 17 00:00:00 2001
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
+
+Upstream-Status: Backport [https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb]
+CVE: CVE-2017-0553
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ lib/msg.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/msg.c b/lib/msg.c
+index e8a7e99..f30fd2d 100644
+--- a/lib/msg.c
++++ b/lib/msg.c
+@@ -410,6 +410,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
+ 	size_t nlmsg_len = n->nm_nlh->nlmsg_len;
+ 	size_t tlen;
+ 
++	if (len > n->nm_size)
++		return NULL;
++
+ 	tlen = pad ? ((len + (pad - 1)) & ~(pad - 1)) : len;
+ 
+ 	if ((tlen + nlmsg_len) > n->nm_size)
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-support/libnl/libnl_3.2.28.bb
index 26982f3..a74b455 100644
--- a/meta/recipes-support/libnl/libnl_3.2.28.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
@@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV', True).replace('.','_')}/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
+           file://lib-check-for-integer-overflow-in-nlmsg_reserve.patch \
            file://0001-lib-add-utility-function-nl_strerror_l.patch \
            file://0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch \
            file://0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch \
-- 
1.9.1


