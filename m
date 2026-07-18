Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD78C4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2627.1784364805011837146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Oz7NkCD/;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso50628795e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364803; x=1784969603; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bi9TAuKPVfQFqGrqTTpE+Bg7u4lruxmsvlwNDxPIE3I=;
        b=Oz7NkCD/8pQJVzqsvjxFfb01mCuKdY+QqqucM3MeFmQ2B6loyV1pofZ6nRDSnw4sxu
         sPOZlluqD9nzfLPqUhrZd8x5vrMVQ6fr/6zn9/AfBnz6Nc+afqaZwCA2g54fii58bV73
         UOsMXmh7Mt+sF4wEdci9Nf9ac1rwCxuvPSbbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364803; x=1784969603;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bi9TAuKPVfQFqGrqTTpE+Bg7u4lruxmsvlwNDxPIE3I=;
        b=NDzNZMHO5RCYMYkIZ4klwouUmvLmlWXG3xmm+InBG1vPJVvkOQh/bzNhSOAvs3M+Ar
         Po96W1I3XJHs03HWxULHJu76O4J5HQ6w8BH7QoW6NwqeMzLOIeb+AW1u6diWjstpZh2K
         BvrRUc5L/I6pxHaykOiU9GD12mqWCPlSLhGFDbtYA1yq6CV7ofZVTHpqiRzXcj1jbuwV
         9UdadTFM5THnLfInnQxBuoaPjXUJ1KMJ4vpVXdR8oYf3+W5yFUMvz7n9he0pp3GVo83S
         soZhn0XNbaihh/CDOecRn+1ArnmvxmqaruRZnclNQJ+SZ+73I2BP2dslNvv5md5zxeAH
         o3OA==
X-Gm-Message-State: AOJu0YzI7r304cZW8qr+T3WqjLnyR6ZmlwKT/yPCbXszknV1rktnu6qV
	1XBE8Zsic6XT9SNxI743o1tNbWbEcpshCLUlPTmkvRdv+71qvfKdmK+gOsomuImoQgPfo64h1je
	w5coxHok=
X-Gm-Gg: AfdE7cmbu0mJD5RNFvqbLDc9+/gMbJKExql4mNph+HnEHjc8UxOSJY9pyF0xFaG04KL
	VBMr2/oWscm0wMBEWUm3wvnLHmjXL99iuwvaHNkZ5HDIA8lCCf7+f1kkblO1rELCIgZwGVrfEhM
	vRJTzGXQrYJOx88BYh10fBnGouZ2f12zOtA/Cz9nNbXZJ9LnJiimlmpBhJlNw327YQiPjjtNf0N
	BEBwOJxhK4WUkkaSdqcH3a5GpqaOFkG452yvPVlhGXWRJQuFL5E0UUf8+u/Z8VNyPf6UL1z+lJ1
	5YTwWpEzvFiYYTsyZfDw6j2F/WCRYGo5Z2KLkysonZ7FkP/Bpe1IP0xdjToLsnT9wHLNWs1wyOQ
	eVKFbucwsG3XyScCu9VEbSQIxJVsndeZAiYosKYKmrOUcSL+yqshTJvsiL7YVe6ibpAW8jteu6M
	rQ1F2jh5XuWLmHkMe4zBJcnN5zj4sxIdf4cH6lnKULv+Qa992vn1ZrQsYJn0miAut+PJNsSWY9w
	6BqkVA=
X-Received: by 2002:a05:600c:4755:b0:493:c2cc:aecb with SMTP id 5b1f17b1804b1-4954a51590fmr67290205e9.38.1784364803119;
        Sat, 18 Jul 2026 01:53:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/17] gzip: fix CVE-2026-41992
Date: Sat, 18 Jul 2026 10:52:45 +0200
Message-ID: <a9b04813c5cb2e91e5d8071d3a9887e2d816a90f.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241243

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Backport upstream fix for a global buffer overflow in the LZH
decompression logic (unlzh.c). The left[] and right[] global arrays
shared across LZW and LZH decompression routines are not reinitialized
between files processed in the same invocation, allowing an
out-of-bounds read in the LZH decoder.

Adapted for gzip 1.14:
- Refreshed NEWS and THANKS hunks to match 1.14 release context.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-41992
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit deaaaacabbf8d21fb9271e3f6f83055893510cff)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gzip/gzip-1.14/CVE-2026-41992.patch       | 64 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.14.bb       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
new file mode 100644
index 00000000000..f55c89978d6
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
@@ -0,0 +1,64 @@
+From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 15 Apr 2026 12:00:17 -0700
+Subject: =?UTF-8?q?gzip:=20don=E2=80=99t=20mishandle=20.lzh=20after=20.Z?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* unlzh.c (read_c_len): Clear left and right when n == 0.
+
+CVE: CVE-2026-41992
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=63dbf6b3b9e6e781df1a6a64e609b10e23969681]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ NEWS    | 4 ++++
+ THANKS  | 1 +
+ unlzh.c | 6 ++++++
+ 3 files changed, 11 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index 6388227..8fb8918 100644
+--- a/NEWS
++++ b/NEWS
+@@ -4,6 +4,10 @@ GNU gzip NEWS                                    -*- outline -*-
+ 
+ ** Bug fixes
+ 
++  A buffer overflow has been fixed when decompressing an .lzh file
++  after decompressing a .Z file.
++  [bug present since the beginning]
++
+   'gzip -d' no longer omits the last partial output buffer when the
+   input ends unexpectedly on an IBM Z platform.
+   [bug introduced in gzip-1.11]
+diff --git a/THANKS b/THANKS
+index 4e545d9..a7d25e4 100644
+--- a/THANKS
++++ b/THANKS
+@@ -186,6 +186,7 @@ Jamie Lokier            u90jl@ecs.oxford.ac.uk
+ Richard Lloyd           R.K.Lloyd@csc.liv.ac.uk
+ David J. MacKenzie	djm@eng.umd.edu
+ John R MacMillan        john@chance.gts.org
++Michał Majchrowicz	mmajchrowicz@afine.com
+ Ron Male                male@eso.mc.xerox.com
+ Jakub Martisko		jamartis@redhat.com
+ Don R. Maszle           maze@bea.lbl.gov
+diff --git a/unlzh.c b/unlzh.c
+index 3320196..a6cf109 100644
+--- a/unlzh.c
++++ b/unlzh.c
+@@ -232,6 +232,12 @@ read_c_len ()
+         c = getbits(CBIT);
+         for (i = 0; i < NC; i++) c_len[i] = 0;
+         for (i = 0; i < 4096; i++) c_table[i] = c;
++
++        /* Needed in case LEFT and RIGHT are reused from a previous
++           LZW decompression.  It may be overkill to clear all of both
++           arrays, but nobody has had time to analyze this carefully.  */
++        memzero(left, (2 * NC - 1) * sizeof *left);
++        memzero(right, (2 * NC - 1) * sizeof *left);
+     } else {
+         i = 0;
+         while (i < n) {
diff --git a/meta/recipes-extended/gzip/gzip_1.14.bb b/meta/recipes-extended/gzip/gzip_1.14.bb
index c7837cdae01..99174a58c53 100644
--- a/meta/recipes-extended/gzip/gzip_1.14.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -6,6 +6,7 @@ LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-41992.patch \
            "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 

