Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D77C41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:06 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.178859.1692240603352778176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jliy247X;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so5456329a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240602; x=1692845402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXmay85hv23fjg1eELql8g0TsWTGzcx0glnBVzlNBtM=;
        b=jliy247X9uEUjyoUW6p1g8q1PeP4P1repn52X2zRQqb8MR0sbJN/ZFO2VV7nlG2IFX
         bWaQuPe/wU6TK++/xXOX8hAwFRJoyZVH0f4zGhKbQVmDGpx0IgScL7xmIMJpuz6+fb2z
         CYQhFGL2MUHwB9EIODHyN1hPaEU7uxYkdGNj6VegpRHl+/zwKUUiaBRSJZwSXVSSLmsF
         5TE/QW+NwV9lVf3nUGJtGDmBfV/E8hhtF9njwsjR1RJdwPAFfWrqPHzYIH+gMjetlZE9
         9Ku1FqjH7Jiv/VOsjSxJEXN38XeX6KvwVbBgpfzK/hX7Ib/NEwWzb5cJgMVQVGCkUF3V
         645g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240602; x=1692845402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXmay85hv23fjg1eELql8g0TsWTGzcx0glnBVzlNBtM=;
        b=P3+vP4sn7APJynZdHhtRd7a5wMosWR/RD7jx65CysUZ80/RCInjTOYRtQ3gJcfq5tO
         NeY40u0YNiE6dDTUBdz9KrHXeJoPdHHvqHCYZlrpGsSopziS6jEdypIBfeFcWzAE6H98
         Ch+D+rMJ3DZKzavqgvRr4wkNtz/ShKUnXVnIIKI37bItpbM5NpMm07frD8HxCwWmlvJK
         iF2ymHQgbKZg6dYpXyrjP0+0zYqtyyUMVKLNCdIHcjRR/o5C865QDGXECCph/EYhQwdq
         3XnZjTkSgs01/3HK9IHOHIGWFrTl525GnaM1r3CVlMGw8Huh3TQ0/oWKPlQK6CcIlch9
         bC1g==
X-Gm-Message-State: AOJu0YxT1AyBYgUbUVZh0wOONZr2VjGXynNG202VWrmuLviANOD0XTOG
	A2QOvdOnQcEQTgQoFBO9xL4wPzpzeyIELCOo+tU=
X-Google-Smtp-Source: AGHT+IHlAGMWbCeSqOoZv6MjRFsjJZ3G++CACRpnDyPo6cPW7yFHa/G+o33PcuKkyw2Bw1LikdZtsg==
X-Received: by 2002:a05:6a20:918f:b0:135:26ad:132 with SMTP id v15-20020a056a20918f00b0013526ad0132mr5118257pzd.7.1692240602391;
        Wed, 16 Aug 2023 19:50:02 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/16] ghostscript: fix CVE-2023-38559
Date: Wed, 16 Aug 2023 16:49:36 -1000
Message-Id: <e77c0b35969ae690b390ffae682fd6552ff8aff8.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186269

From: Archana Polampalli <archana.polampalli@windriver.com>

A buffer overflow flaw was found in base/gdevdevn.c:1973 in devn_pcx_write_rle()
in ghostscript. This issue may allow a local attacker to cause a denial of service
via outputting a crafted PDF file for a DEVN device with gs.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-38559

Upstream patch:
https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1fb9991bb95f1201abb5dea55f57f

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-38559.patch          | 32 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
new file mode 100644
index 0000000000..2b2b85fa27
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
@@ -0,0 +1,32 @@
+From 34b0eec257c3a597e0515946f17fb973a33a7b5b Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 17 Jul 2023 14:06:37 +0100
+Subject: [PATCH] Bug 706897: Copy pcx buffer overrun fix from
+ devices/gdevpcx.c
+
+Bounds check the buffer, before dereferencing the pointer.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1fb9991bb95f1201abb5dea55f57f]
+
+CVE: CVE-2023-38559
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gdevdevn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/gdevdevn.c b/base/gdevdevn.c
+index f679127..66c771b 100644
+--- a/base/gdevdevn.c
++++ b/base/gdevdevn.c
+@@ -1950,7 +1950,7 @@ devn_pcx_write_rle(const byte * from, const byte * end, int step, gp_file * file
+         byte data = *from;
+
+         from += step;
+-        if (data != *from || from == end) {
++        if (from >= end || data != *from) {
+             if (data >= 0xc0)
+                 gp_fputc(0xc1, file);
+         } else {
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 48508fd6a2..ad0b008cab 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -37,6 +37,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://cve-2023-28879.patch \
                 file://CVE-2023-36664-0001.patch \
                 file://CVE-2023-36664-0002.patch \
+                file://CVE-2023-38559.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


