Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91493C54EB4
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:36 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.34100.1674440548033292861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1x2bnV7K;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id w2so7729961pfc.11
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/H5Xlm9gGwxSkdWN+IOKnneyW90GPw8Al2FdBlzfII=;
        b=1x2bnV7KP42V+LvdI40CIJFBMjGnVzcy1OUFNob6sZvzIsKrl0RB2c/qJntdHDuKYh
         Bi1qLPYN43O1Xr+Vi5G7kvD7WqGzKhf8acDSz00jojLdcEgNZedI8wLEQ/bxxcz4CbDS
         WuTjhVvV4VXtsUcCB0TLCGhwgzOzwOm6uFL5qJ9blquKECXsNgd+5f6Jb++pn+dRqpTk
         TSjsIJ61GTfMybIKMSrSRp+zpZMUDcs4cqcFqEVVIFGSPZ9adexl7rE8ZiYSTkhsxWB6
         W7bZDKVC8OfA8V0kYL/XFk6zZLeOUG/ZrxGyAe8Y+thSV3MO847KjyMB6TDuKqTWg5Qt
         JgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/H5Xlm9gGwxSkdWN+IOKnneyW90GPw8Al2FdBlzfII=;
        b=5cUE57zcDhsaHwo9e3KSQEQmus2XA2mUicWnAIOxGCh0QgeUyyhSFVuQ//1erp1AUc
         FO83nOw+MSoMVLxuhICHA9HnC/vjLNN1k3ZK9jmlQ0KQRCRNVWP5BgXHyboiEX3J7Nrt
         6khEM66DASSaauzeNfI+TKjuSy9iOZKSCTudTPqXwDB1S8s89JZiLl/rMDkSUeb+0xE2
         hf5YVV/kTmcSqjgdqtBozR4uxO4ZhaKxM1QdJ9SWh8K/MyIaGELV1sGJuAWPEXFQoOsV
         q1EK+SXcgAoUUqHYASB65/Jpe9/5r9YNHbz3A50mDwI2RZufON0L0pTWjO5YKadKkYI0
         i9+w==
X-Gm-Message-State: AFqh2krPGfpb59FTpEbulgEJmD6yB4JiAiOAe6/cz+RWlinOx7DSQgMG
	3Jw2klmakXSwLf4SV9hr2Q0Ci0MXN/Nh9q9XeJI=
X-Google-Smtp-Source: AMrXdXtq5teezfFnpoOZM4KeLTKWgqJllqauYSSeFmoH+mlVFf8g9AkUpRx/65En4oQuALneDaQMcA==
X-Received: by 2002:a05:6a00:2191:b0:581:19ed:78b9 with SMTP id h17-20020a056a00219100b0058119ed78b9mr30917020pfi.2.1674440547125;
        Sun, 22 Jan 2023 18:22:27 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/32] busybox: rm temporary files if do_compile was interrupted
Date: Sun, 22 Jan 2023 16:21:16 -1000
Message-Id: <a1cd0c804b974ae100cfe8cb34ddd400e3c8206b.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176286

From: Antonin Godard <antoningodard@pm.me>

To avoid working with undeterministic config files, remove all the
temporary files to start from scratch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74cd440c4e3df0ed3b81cf5c60a3f92e0dd3fe6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index dff4a5dec9..62dc839245 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -154,6 +154,9 @@ do_compile() {
 	cp include/autoconf.h.orig include/autoconf.h
 
 	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
+		# Guard againt interrupted do_compile: clean temporary files.
+		rm -f .config.app.suid .config.app.nosuid .config.disable.apps .config.nonapps
+
 		# split the .config into two parts, and make two busybox binaries
 		oe_runmake busybox.cfg.suid
 		oe_runmake busybox.cfg.nosuid
-- 
2.25.1


