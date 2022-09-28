Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB84C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 22:13:51 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.3763.1664403225008787124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 15:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Neyld5ps;
 spf=pass (domain: gmail.com, ip: 209.85.166.47,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id p202so11280559iod.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 15:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Mwq0eIkKhMc7EQDgBAsDaRLHc0BZm1lbmOlB1enGV2M=;
        b=Neyld5ps98E/f1dp2gGwJ54I/VOuUMa7PM2XTtfx+vzu0/2Hx1Neb+sfbyRcTt78hn
         fGSAYhtD6xSMfRerseM1hg4jpJ121BZdYvms45+bToWjL/DLY/ejRdEXuLJ5QE0xTavi
         nBBxHODE16j5LMAMokSTS8OAYhW24omDpbjekracZT3wUpoU/b8e5ttsPROWNG8pkKR8
         lmFDc8UcN2wFIDJwqEIXxBs3eiiVpwz95FL9AbLnzVvIvE9LYxFQUlnDma5GCIHInZQx
         +P79QDUHUKYqdVE5s0YnfQN4HWTd2RK9V5ttqaYG5lQZ0lxQoqbzVOkF6trG694o0aAO
         HlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Mwq0eIkKhMc7EQDgBAsDaRLHc0BZm1lbmOlB1enGV2M=;
        b=1TgCCjdLS034zXnLmR5lzfK+HZ48whuXFXIen+XdOrloObkjVGuljvC9aLPLjRNyXw
         F5HtgjytQLEzXZcrNn8aJiIMYcXqHERDoL9jxy2REDLpIl/Bbqb9iMOe+l6njqKze/H2
         NAAgQgxq8i6PHxDO/igjhyywKaHz0lE6tTsqHlTAa/rgpXkpLodvK+6jKJYH8C3Erb16
         +ttfmkeBSdW3ZWtV+N/q1QDNCaCZPA0MQnwRsmViGJ1GLjFtOAly3itjHr95uvnWSdEX
         k/J7anU9ZSa6PnaBYwTloTNWcuNlBrjNH794h2jdce/uSA2836NOH/YnJTRtrd1LIpXU
         xm3A==
X-Gm-Message-State: ACrzQf2/6UX6qm+ErUHO/oSmflHb/Fr1c4rIUuZSzl20sO+VtgKJtgmg
	Lhk8ZcvEqsOcIC5DaBiSpTAALS8Y4Js=
X-Google-Smtp-Source: 
 AMsMyM6+ZLJ4WOVgWv1/fzbAEMBkCAsJ9i9RcAtCfBnnaNyQ3jqZfUtZHkBEIa606UvC5WOl69BLAA==
X-Received: by 2002:a05:6602:1551:b0:6a1:6852:baa7 with SMTP id
 h17-20020a056602155100b006a16852baa7mr39265iow.48.1664403224213;
        Wed, 28 Sep 2022 15:13:44 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id
 g39-20020a02852a000000b0035b0af5783dsm2191931jai.32.2022.09.28.15.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 15:13:43 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 3/3] systemd: generate manpages indexes
Date: Wed, 28 Sep 2022 16:13:20 -0600
Message-Id: <20220928221320.1763684-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928221320.1763684-1-danismostlikely@gmail.com>
References: <20220928221320.1763684-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 22:13:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171158

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Now that python3-lxml is in core, use it to generate
systemd.directives and systemd.index manual pages.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/systemd/systemd_251.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.4.bb
index 910ea71bf64..b4ad7e45eb0 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -159,7 +159,10 @@ PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
 PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
 PACKAGECONFIG[lz4] = "-Dlz4=true,-Dlz4=false,lz4"
 PACKAGECONFIG[machined] = "-Dmachined=true,-Dmachined=false"
-PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,python3-lxml-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+# Ensure we're seeing the XML catalog from the build system and not the host.
+# Otherwise, the build may fail generating the manpages.
+export XML_CATALOG_FILES="${STAGING_ETCDIR_NATIVE}/xml/catalog"
 PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
 PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
-- 
2.37.3


