Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EA3CCA487
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:19 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.4021.1657773372698509795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Selh9SfB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso1478204pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BJdXiu3Ouq0W1bQeMo8zWzdxkmLKLQlm4X6y5OdCSXA=;
        b=Selh9SfBztaY5M7IWCFkEiHlzaOhXI0VcA0ItDc+Uq4YgRuJliDbcf1hoisj3XzwST
         GRlfYKaUkmCLg9Dsw+eN5C7qVGstShsHL1HEo2QRYylga6+oapY3pAIH5c7o+ICy5x84
         kJWpfkCfsy+PBTC1OKwIf3Zx5OIHVuC89WfJ+UGidHsP95zKUlp5+7hZ2/xdpNe4JmEE
         UkyKkvwj9FiCoCztvnzF92zUuDrQhV+LA5ziJqIsRXXE1OkqZTIHooA04ium9NVO72ZS
         REN/CYfWLFkNlElqu8MbLins1OH8M1xnJynZUwkoZlmRcb9bXev7ZipouUKVM/vCt+9X
         jx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJdXiu3Ouq0W1bQeMo8zWzdxkmLKLQlm4X6y5OdCSXA=;
        b=1PUiXMQ4nsfsiFjXKisySPEsxGi13td4/QM93NDFH+kvOy8Ziw2bN9UbWm7Z8GRs/O
         WU/P0DFwoUcT6q+E82X88ewqtlHHeE6AAGE3ulChbQ8KCfPHF0ggfDTFLWFNyjvPPBkc
         KQya4dJnZqlZmhp6To4VvoDt8RApDfGPsmoD9ecgsyDVnzF/WxfJCW5JTSwvfoZ9+adL
         fzxKt8+y8o9cBe+0f1mTxbhpz/WsBtcFKND97GIdleX0IAHFjBVv/kEu1JDTLe5ooh1e
         DtkibxBNye0EMYXIGbg8LIGtdxZKFgFRfJ7wKJV8z3UMUVfQdNoIkppBh3vqBgr3/5sI
         IgJA==
X-Gm-Message-State: AJIora83uZ0CCIsA8MVMcewFz9skEpVRUxeGNBKmoN4fjJyDJBSLF784
	LFuXBc7Y5CH9Z/SXnyWVNIWnROjqysumAME0
X-Google-Smtp-Source: 
 AGRyM1tm8Zc7H/v8sskXkFv0gR30msr5kbTo187ZAg96jYpi09raXKv4m2hvTg8Ik49CFLhgGDiH2w==
X-Received: by 2002:a17:90b:1d8f:b0:1f0:270a:b556 with SMTP id
 pf15-20020a17090b1d8f00b001f0270ab556mr7792855pjb.192.1657773371474;
        Wed, 13 Jul 2022 21:36:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/27] qemu: Avoid accidental librdmacm linkage
Date: Wed, 13 Jul 2022 18:35:23 -1000
Message-Id: 
 <84390c353d8fee55ae0eeb6a698e45d350f8141b.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid accidentally linking to the rdma library from the host by
adding a PACKAGECONFIG for the option. This was found on new
Fedora 36 autobuilder workers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a0f3cb225e4d5471155abbcd05d09bd6bf1620f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index edfd5bf86c..189e0d3f9e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -200,6 +200,7 @@ PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
+PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.25.1


