Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E5AC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 20:55:54 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.2921.1645908947656451197
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 12:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lCLIAfID;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a23so17448328eju.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 12:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=unKZasss9+AnKXtuHJfHP3IIacsw9toSwBHD9SZGiNA=;
        b=lCLIAfIDw2dDeIdRGvcIKfeTMm2PIJNQJxx0BkaM2cl+sU6bjEydUrZh32ruoGTxZA
         WRH1msQGyAcTeRa7iIgCgW4+bJnZwqBLRDux46vf7YtBCGznCQ7KCdKEVL1YUZnmlJZQ
         ddDgWuZoT8Ttf8c5BgkRwcLni5AFfqpKHFM/iYozv1ySI7i/+DyBTuFnEgLsu/oIl2W3
         XBe34CJP2mN3gccYhwM8H/v2HUEhun94/19SaSqgsQJ8wmlp7S7jgUU6hJCA/kYpOjTh
         61ck/8P1684AvEzUEgUApqxPJRI8NjTi7L40SIWnIvaeEbddCfkAUl/A80JKPmkQZDCj
         zULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=unKZasss9+AnKXtuHJfHP3IIacsw9toSwBHD9SZGiNA=;
        b=6opLusrTpEm6iEBVXrN0d1gnQ6DVlq8z/n+bClNOnuec/qCGZM3kEmg/a3anaPB3TL
         Vm3XmU18knLhy3zAP3Vmy+eAZIT+xjF29Ub71ddfZPjjpToJ3B1wXOAptEn5iItEFvIc
         +dsJ0P8KhaPc9TZvSLtJWCN6sIJIYpuyg0bIXD5L+Gl+hrIpH1lVZ5zJIt9wFMRNj3Kn
         bXNVYVQyReiVSnvgXJ+Yrn8EHNvTHrJ0R+llEfbOuffrEFqB48+9HG9QVUql19x3AwgE
         h9JWcPnPk4ndCZ6TBu9sIGnTBby7uq4fwg4IkdNKOblBqIOafQSmrfvPCh0GIJpoFVgd
         3NHA==
X-Gm-Message-State: AOAM531yIzAh0d7XK9o98Xos+7Eh7nVSyBguNTXhkvUPyouqVZxT5ahJ
	lGmzsGUFB9tYX3ThleEzvpHU0K/hJoLAEs1/pI0=
X-Google-Smtp-Source: 
 ABdhPJygpeCA5cGwm0Ft1nmGNvS3FWKtgwjQIpWS2wIZuwoLvOmWRETiFKe1Ef0Kd7QN+hVUDq6EKQ==
X-Received: by 2002:a17:906:b845:b0:6cf:37d1:f246 with SMTP id
 ga5-20020a170906b84500b006cf37d1f246mr10713575ejb.280.1645908945942;
        Sat, 26 Feb 2022 12:55:45 -0800 (PST)
Received: from localhost.localdomain (p54ae16f8.dip0.t-ipconnect.de.
 [84.174.22.248])
        by smtp.gmail.com with ESMTPSA id
 c7-20020a50f607000000b00412a6892405sm3332421edn.35.2022.02.26.12.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 12:55:45 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH 2/2] go: fix CVE-2022-23772
Date: Sat, 26 Feb 2022 20:55:35 +0000
Message-Id: <20220226205535.86919-2-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220226205535.86919-1-flowergom@gmail.com>
References: <20220226205535.86919-1-flowergom@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 20:55:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162431

math/big: prevent large memory consumption in Rat.SetString

An attacker can cause unbounded memory growth in a program using (*Rat).SetString
due to an unhandled overflow.

Upstream-Status: Backport [https://go.dev/issue/50699]
CVE: CVE-2022-23772
Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2022-23772.patch           | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index fcb316e09e..9b3c3b30a8 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -20,6 +20,7 @@ SRC_URI += "\
     file://CVE-2021-33196.patch \
     file://CVE-2021-33197.patch \
     file://CVE-2022-23806.patch \
+    file://CVE-2022-23772.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch
new file mode 100644
index 0000000000..f0daee3624
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch
@@ -0,0 +1,50 @@
+From 70882eedccac803ddcf1c3215e0ae8fd59847e39 Mon Sep 17 00:00:00 2001
+From: Katie Hockman <katie@golang.org>
+Date: Sat, 26 Feb 2022 20:03:38 +0000
+Subject: [PATCH] [release-branch.go1.16] math/big: prevent overflow in
+ (*Rat).SetString
+
+Credit to rsc@ for the original patch.
+
+Thanks to the OSS-Fuzz project for discovering this
+issue and to Emmanuel Odeke (@odeke_et) for reporting it.
+
+Updates #50699
+Fixes #50700
+Fixes CVE-2022-23772
+---
+ src/math/big/ratconv.go      | 5 +++++
+ src/math/big/ratconv_test.go | 1 +
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/math/big/ratconv.go b/src/math/big/ratconv.go
+index 941139e..e8cbdbe 100644
+--- a/src/math/big/ratconv.go
++++ b/src/math/big/ratconv.go
+@@ -168,6 +168,11 @@ func (z *Rat) SetString(s string) (*Rat, bool) {
+ 		n := exp5
+ 		if n < 0 {
+ 			n = -n
++			if n < 0 {
++				// This can occur if -n overflows. -(-1 << 63) would become
++				// -1 << 63, which is still negative.
++				return nil, false
++			}
+ 		}
+ 		pow5 := z.b.abs.expNN(natFive, nat(nil).setWord(Word(n)), nil) // use underlying array of z.b.abs
+ 		if exp5 > 0 {
+diff --git a/src/math/big/ratconv_test.go b/src/math/big/ratconv_test.go
+index ba0d1ba..b820df4 100644
+--- a/src/math/big/ratconv_test.go
++++ b/src/math/big/ratconv_test.go
+@@ -104,6 +104,7 @@ var setStringTests = []StringTest{
+ 	{in: "4/3/"},
+ 	{in: "4/3."},
+ 	{in: "4/"},
++	{in: "13e-9223372036854775808"}, // CVE-2022-23772
+ 
+ 	// valid
+ 	{"0", "0", true},
+-- 
+2.17.1
+
-- 
2.17.1


