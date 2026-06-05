Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F961CD8C87
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6274.1780698860931741064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=neLx2WXu;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490af320e2aso27619395e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698859; x=1781303659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgUDffPDovmzrLg4j5BfQ5VdkeluuQ4qlhllb3K93OU=;
        b=neLx2WXuWigmaejM8mZlC/J1gFp3CuSkFU8oWCn4nU9fd5kKl/dn4611sykC/d4SL/
         yINFeZ6dFgjdxd+R3D9hjXkt+FeJJQWOe2l/OAJOJFwnYBzdTqfTNpgTTzX6rwpQfEAw
         LHKn7UF2OMPNhzZ+2U7BwuhZm7I2pF2p3grmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698859; x=1781303659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DgUDffPDovmzrLg4j5BfQ5VdkeluuQ4qlhllb3K93OU=;
        b=POjVel1JgYy1QnLuS1aepbYL008wiVrik1oRv/3+4eDZKML9u64MIXQMwPUJ9T4j3/
         87NlmIVTMWG5n99IMeG2XS/IQc11Xw77R8tCp0lW3LwgBv3+mIDq6njVRjAXShWWv5+Y
         gnsvFTl8lUBvsXrDLG7g0SNM112MmxJTU7VEaZx8zmmRFJNvdd/kEQ5fIg8eON2aCjiF
         U/lPMRn1rFEo2diP24peRl8DDw2V3FUzYiXmvcJEdBHONlep3s74iRYsFQ79XAMLOGrT
         SG5IPa2oKsVIUmWqFvOXX5Oyp0c0/LD9yeCzmJ/a6BL8MsATlUrUir5Mr48VIvj4qJLN
         mAbw==
X-Gm-Message-State: AOJu0YzrVhSqXjasUUG05m46gGzetgMlYL9P114eFqqFqufyjCn2Q/x9
	OFVDwprhIL9DqIyyPnwo9yz6+9t8jD/Dme0VaZ3q9QF+CvEfNy8qDyN2m3XqFHu5/ZPepTxZEji
	ctNgY
X-Gm-Gg: Acq92OHv+Pd35Dvmdb/lw01OlsQZBn1tBJyImOWDubaf2sAfJh36OSJ41djyg+BGrg3
	/bQ6Q0919gDaC8QfYgFg82jkkXsXk4iLCveG7iEH5lUGZU2VAvrYMMfUMbhFv4+T/EW5sdQdjd0
	3ldSf8ppxCA2cfJzDxMHrM4kJelvHLoKuqyjRHmJoN1h7dwBZbBGEu5ShSWvpGUX+HpA4qdltF7
	uIuaSO2K4nzcKXXkuOTeZwKIDW4nUWPWItHY3aNzC+B2bX5/D69LuSVgyEjOTd2csKqso6yFIwk
	VAups+jYlJEvJ8gv/62KWWEXlYc0HKlMkUoGz5wDtMB1vyWi43WX/5Lu5ggQ+DAesBAVR1KAiPn
	YVJBxQh4a1qeAwvGJpBOGn0WjTnfnj/ctZoku8OBvtK/GWTwl1y7ItZOZnUM1AlGRgBCx4fUr9E
	1boYwo+/oiakagZLM1mOWlw1viY+gypdmwQQ6gv1vcXOUxAaPIIwTDhHGE9Dd4/H1UZ8mFZ/GPZ
	NRm96h+SOBtdsEcFxgve/klNmq1nLxBvSBcyPM=
X-Received: by 2002:a05:600c:3515:b0:490:b409:94f4 with SMTP id 5b1f17b1804b1-490c2602a24mr94020495e9.28.1780698859285;
        Fri, 05 Jun 2026 15:34:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/25] perl: link to the system zlib instead of a vendored copy
Date: Sat,  6 Jun 2026 00:33:56 +0200
Message-ID: <6e83e5520f415fc6ca9029a8aaa0af31cd832a90.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238198

From: Ross Burton <ross.burton@arm.com>

The perl module Compress-Raw-Zlib defaults to using a vendored copy of
the zlib sources which has a number of CVEs.  A newer version of perl
updates this to zlib 1.3.2 to resolve them, but we should be linking to
our zlib recipe instead of the vendored code.

This mitigates CVE-2026-4176 so mark it as not appropriate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf515229043685d4f00c965eb3e0236c37b6b403)
Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/perl/perl_5.38.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
index e59022e2bdf..5ab49ed3d77 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -49,6 +49,11 @@ export ENC2XS_NO_COMMENTS = "1"
 
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
+# Link Compress-Raw-Zlib to the system zlib instead of a vendored copy
+EXTRA_OEMAKE += "BUILD_ZLIB=False ZLIB_INCLUDE=${STAGING_INCDIR} ZLIB_LIB=${STAGING_LIBDIR}"
+
+CVE_STATUS[CVE-2026-4176] = "not-applicable-config: we do not use the vendorered zlib"
+
 do_configure:prepend() {
     rm -rf ${B}
     cp -rfp ${S} ${B}

