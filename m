Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6F9C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:36:45 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.63999.1656876996006810935
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=y7A+ugAE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id e132so7122187pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=g6ZgzLjRBlK54iWYMa1JOrAJAzzqf2uHuO9wbSa0oE4=;
        b=y7A+ugAEX4BA8zuGyMzQGkbtS7hrL8cdE9C/W8KFGqbcbontbTuCNSOdb/n4lPveMq
         9KenYNJjalS0SVo1ZLv88kxbjvL2NlqnT8ACl9uPYlM7fGIUg72RNbpqsD83LOub+rZp
         /Vt2TipyJDU08IlRxWEQEP/gU3RvPcddER9Sq7uNN37RmM8e3Vz/yrP/9dRr/XSOnsB1
         mTEesOX4pwLzuWiLAArZIIsH2iON6UnO0RMwUriiBAoWxtI8urE+P5XmlE/m0oBfVuGk
         SEphVzVaRV2bJGbxe1qPBEpwSq0TGyHRXbIUTt0A9O6myAANvu28t7Y4Q/GJCNgjj4hj
         +LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6ZgzLjRBlK54iWYMa1JOrAJAzzqf2uHuO9wbSa0oE4=;
        b=l1prQkWJeALZspF2SHIigaKqLTsry3oc88YBbpR1hZZ8aQTLPxBv4bBekmuenvlEhd
         5u5ItcynWQZTI7meoNYip665BsWQdEihzpNB0pbWwry48WqEIsnf5LHIfMp8qCAPueRE
         /aT2GKwx4jP+tiKBDK9MidIB7fZZpL0EPt+O4Tk/3z4wQuRBSeOXMrRhRAej93kZfyzT
         vaUaTsKIdZljXIdP0ukUg9iVzsjOL14Lg3eCxq35ebRtXLMl1N0D8jnkQ1SJ3/ddoDWa
         /8b+58TUIq1h5kOB1BRQCFDDrP/OwSypN61BKCZ6AT8ra9sosFZrscNpqwP+eB4DtSj0
         UvKg==
X-Gm-Message-State: AJIora+419CCF+MDuiuwENg8ZUDK4QXVeJ1MhM63YaA9OA+erxGj2mPJ
	8vl4pR4qFJAteBcBh5InLRr4zJ6W37X5I6z0
X-Google-Smtp-Source: 
 AGRyM1v3OUakWpAI2P4zM8UgPzmhoOMdha27+nYRr+uoB6bXcOOTkAfdpemO881dihyYGRJasZYRDg==
X-Received: by 2002:a05:6a00:893:b0:528:646f:528a with SMTP id
 q19-20020a056a00089300b00528646f528amr2815489pfj.21.1656876994941;
        Sun, 03 Jul 2022 12:36:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/30] cups: ignore CVE-2022-26691
Date: Sun,  3 Jul 2022 09:35:39 -1000
Message-Id: 
 <8eb224d3160e8483c2bc6ffa207a2b6fc8644c6f.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:36:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167564

From: Ross Burton <ross.burton@arm.com>

This is fixed in 2.4.2, which we have, but the complex CPE in that CVE
isn't parsed by cve-check correctly so it thinks that we're vulnerable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b40dd920f8b40eabe78db363249257818c63c074)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 8f2ad8a009..4592980766 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -26,6 +26,8 @@ CVE_CHECK_IGNORE += "CVE-2008-1033"
 CVE_CHECK_IGNORE += "CVE-2009-0032"
 # This is an Ubuntu only issue.
 CVE_CHECK_IGNORE += "CVE-2018-6553"
+# This is fixed in 2.4.2 but the cve-check class still reports it
+CVE_CHECK_IGNORE += "CVE-2022-26691"
 
 LEAD_SONAME = "libcupsdriver.so"
 
-- 
2.25.1


