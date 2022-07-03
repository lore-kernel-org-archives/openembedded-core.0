Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69D6C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:25 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.64028.1656877097474669626
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AXvN8z3n;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id q140so7118276pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k0j0hLrKG/KqrchoANK5vdrf4MEcU6bX6vNp1f2QNZA=;
        b=AXvN8z3nDF1Swrg3j6beAU84cxofwTZ8flEuoSYUdfLYRgSFyBemgkMdbUPF7peVD3
         +l/5uMLE69FiDpruLNtsjZV+5We3uJeBEDEVxRWwTxjKI6kLqhtsjEH6OsAtF2K182dA
         jHjLJr0YSdmilEj102vfxHRS6+EsvcEX0klCBC4GhObO7iKXiWkKvRSsV3MWO4bKHNDT
         nKtZC5SItyKWkBLqKMraJyzj4zAztbaFnbesqOZ8rTJnuV2kQb7y95Wr6hOFtvo7NubA
         DXHj0jr32vbZAdGcjh711OlFcKtMHWAEw6Pe20F03oBbzavErtDOLDXnhFezko8fNusg
         oqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k0j0hLrKG/KqrchoANK5vdrf4MEcU6bX6vNp1f2QNZA=;
        b=raSam4dV9OTHV8ZVxn2tiKGjh85rriVBJXvILD6WfaHmchLegKczlwJjPlIsnQfSFM
         MG/sOeQwePcshipp4vTLf9ivG6mlrwSrZmGeCVbMtS8MAvlR/LSCLvjpU/mj/nD0VIkC
         Ljr6nD1C5CsLDClGnl8oemxRjOR5hNiCxVsSJQo6dfzWQgCZwQ1e8OoE865vHnLcHgGA
         oAvKCZiLoDUVyOLXkx3A3ypFz46idQG0BDpX+mEcZkEea4+BSz/7VUAqWmrqop+JghhG
         T2C90pCJeXe3P4LY6yfRaa0/X8AHoMFC6qydR7ZPAx6zZO6m5u6blbuJsczGISibO2TF
         9ORg==
X-Gm-Message-State: AJIora/e1RabevcD5TSoDuKMJ+XX+x8xVJsSETvk3U1xTqeC6BFu1Rck
	IqjoHzkDA+8P1P/s6YlU9f1l+P7w62lZcu9s
X-Google-Smtp-Source: 
 AGRyM1tJusJqK71/4/OmscBnXoL0PuyTZ6pLwRTubuQuKAiFXqUKe9IhEVQS3RdBkcpWDP2CiZFhTQ==
X-Received: by 2002:a63:371a:0:b0:40c:9a2e:7799 with SMTP id
 e26-20020a63371a000000b0040c9a2e7799mr22882286pga.113.1656877096446;
        Sun, 03 Jul 2022 12:38:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/30] glibc-tests: not clear BBCLASSEXTEND
Date: Sun,  3 Jul 2022 09:35:59 -1000
Message-Id: 
 <1a6396c431a454a293be102c8c0e8b10f247404b.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167584

From: Kai Kang <kai.kang@windriver.com>

It clears BBCLASSEXTEND in glibc-tests recipe to remove 'nativesdk'
which is set in glibc recipe. The side effect is that it removes
"${MULTILIBS}" at same time if multilib enabled. Then there will no
multilib version glibc-tests. So only remove 'nativesdk' from
BBCLASSEXTEND rather than clear it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d15975441471c9367b6d8cfa094f093e80f910d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 414f8660de..028e83e865 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -18,7 +18,8 @@ python __anonymous() {
        d.setVar("PROVIDES", "${PN} ${PN}-ptest")
        d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
 
-       d.setVar("BBCLASSEXTEND", "")
+       bbclassextend = d.getVar("BBCLASSEXTEND").replace("nativesdk", "").strip()
+       d.setVar("BBCLASSEXTEND", bbclassextend)
        d.setVar("RRECOMMENDS", "")
        d.setVar("SYSTEMD_SERVICE:nscd", "")
        d.setVar("SYSTEMD_PACKAGES", "")
@@ -95,7 +96,7 @@ python populate_packages:prepend () {
         d.setVar('DEBIAN_NAMES', '')
 }
 
-FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
+FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/${PN}/*"
 
 EXCLUDE_FROM_SHLIBS = "1"
 
-- 
2.25.1


