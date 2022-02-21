Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3571C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:36 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.10995.1645452875671497815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QD3y56IY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 v8-20020a17090a634800b001bb78857ccdso16717352pjs.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jE6LzZ0jjyqK/yHPSA9g3KA8/i2+b8XAAhkj1PnhRr4=;
        b=QD3y56IY1bMQ/GRaA9ySWkTwBY7rSVI9FrVpwDH8R6jCrgXp+afnZjj2ticDMVC+Lb
         d0pNbXgmqg1epJ+KGes3MUdsFc4vr8oQLemUMPIqqsFnH8uWrnLpwjl0u+4ZNmLZ0/Jd
         wFDzfSwrB1nX4/lvsGLUE+SZ0IMoSkdyQqdyeRArpIc27e2b52OVvE+elYSZ1bjivrsU
         78r2nCdE/szaAX/0HejKarESkliOxJGfBVfFgft5I57hhJkv25e15dUhQPZszcB4JLLZ
         12qV5+tSl4wy42HSAq0BvAnFi9Wj4Lhcsd0vNJo/ZrNlzwsygay/vGvj6k1PPQA2X0C/
         6utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jE6LzZ0jjyqK/yHPSA9g3KA8/i2+b8XAAhkj1PnhRr4=;
        b=tnceg8HnTHLnLrRZR4rSWJTOjcATgALBdM3BELtkQC1L62eBGw4g4bcZmyd5BCuvQU
         VhqStYq48h+baz5xNl/+UMKswP1cm9nWvOj3ht1x3RhFAbYS8RjUCqFJC36hnjcbeqo7
         fscyJNdNw44Q9glUIeewQdzVI6PiX9MnVlc7eVlY8WW89w8W/3I1kk0GiSwCpe9jCOdW
         +MlX242XmLAYi0Zsq7qkR8VlIbyMjQ37pHmd418+1tgt+xoZ5J0bTU942b3nHep/Z2Li
         iFIJ++6HrhspkXzxO7QnAjAL+wkNU97+Pwrl/S59d6+pcjGFvlDQQ53NYceN2kw6WpYn
         7qOw==
X-Gm-Message-State: AOAM533mgXAiYMpqO+ddUS6nwz0cwM0mDSo0fDYThlLEFdbliWaLHA+Y
	Yqz0af4gh4g2bSY3Mff5Vbc488QxjhIo5GEr
X-Google-Smtp-Source: 
 ABdhPJzmcqlTpeuIBAp6tjcrWB2gNDMg+VYS9qhZ7rTLYtmST95xTrboCxJgUMIXg5Xwp3u7uhBgMA==
X-Received: by 2002:a17:90b:2347:b0:1bc:5def:eaaa with SMTP id
 ms7-20020a17090b234700b001bc5defeaaamr1101868pjb.130.1645452874772;
        Mon, 21 Feb 2022 06:14:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/20] expat: fix CVE-2022-23990
Date: Mon, 21 Feb 2022 04:13:59 -1000
Message-Id: 
 <6a0c9607656970c669ff12cdafd39f4fb7082f6c.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162029

Expat (aka libexpat) before 2.4.4 has an integer overflow in the
doProlog function.

Backport patch from:

https://github.com/libexpat/libexpat/pull/551/commits/ede41d1e186ed2aba88a06e84cac839b770af3a1

CVE: CVE-2021-23990
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2022-23990.patch          | 49 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23990.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-23990.patch b/meta/recipes-core/expat/expat/CVE-2022-23990.patch
new file mode 100644
index 0000000000..c599517b3e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-23990.patch
@@ -0,0 +1,49 @@
+From ede41d1e186ed2aba88a06e84cac839b770af3a1 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 26 Jan 2022 02:36:43 +0100
+Subject: [PATCH] lib: Prevent integer overflow in doProlog (CVE-2022-23990)
+
+The change from "int nameLen" to "size_t nameLen"
+addresses the overflow on "nameLen++" in code
+"for (; name[nameLen++];)" right above the second
+change in the patch.
+
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/pull/551/commits/ede41d1e186ed2aba88a06e84cac839b770af3a1
+
+CVE: CVE-2022-23990
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ lib/xmlparse.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 5ce31402..d1d17005 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5372,7 +5372,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       if (dtd->in_eldecl) {
+         ELEMENT_TYPE *el;
+         const XML_Char *name;
+-        int nameLen;
++        size_t nameLen;
+         const char *nxt
+             = (quant == XML_CQUANT_NONE ? next : next - enc->minBytesPerChar);
+         int myindex = nextScaffoldPart(parser);
+@@ -5388,7 +5388,13 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         nameLen = 0;
+         for (; name[nameLen++];)
+           ;
+-        dtd->contentStringLen += nameLen;
++
++        /* Detect and prevent integer overflow */
++        if (nameLen > UINT_MAX - dtd->contentStringLen) {
++          return XML_ERROR_NO_MEMORY;
++        }
++
++        dtd->contentStringLen += (unsigned)nameLen;
+         if (parser->m_elementDeclHandler)
+           handleDefault = XML_FALSE;
+       }
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 6a6d5c066f..4c86f90ef1 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2021-46143.patch \
            file://CVE-2022-22822-27.patch \
            file://CVE-2022-23852.patch \
+           file://CVE-2022-23990.patch \
            file://libtool-tag.patch \
          "
 
-- 
2.25.1


