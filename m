Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40196C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.20378.1637901385961327114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AOqGoBCr;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id z6so7698948pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9PrJrr3c+TBhFhopQ++ZBR2myX+Dlbd493gXKv1r1dI=;
        b=AOqGoBCrWFdQRP6ec8a8Ms3oNuyPJIzWFBI2FXlgc8kwbGXlgwzt5+8gmeNmjktFcy
         MK2WnzzwpmLJBDYo6j+3wCY8i5fmQy93u/mtET9aKIJ5Vhv7mka8xhX7pRuDLsLPU17j
         hXRMrpUWgXJoQa541NjMzw5VuzI6PZN+mBNnSG7dpueHE6xfB8ZzhRZQSXZO+x2jshQd
         jjZ0tVgXQrWt8zLMabnELL08p/ZS2D/yXhn1hDgHy5fDSOOvDegWQV+zA5XJGR6UbeJa
         qbwrXHFjnqDP17EDEuNqRUacgTZ0WrWuacaJ9SvEo+rPEPHA+ogU1CNc32gBo9HIsDT1
         Gx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9PrJrr3c+TBhFhopQ++ZBR2myX+Dlbd493gXKv1r1dI=;
        b=Hbd9qgcyEpuE0UpZ9NlzPblGWtNF/K0XePy9sfxviK9BQMY+B9c5RmACAH2VvJzj/w
         UKMhi9eK7FeAL3rihwooejGElw1H93kKiBqaNfXPIDE83CemAHEieteVWwTL/R80lNUy
         zVx7e6wEmqAs6wwOF601Z1GsDdjSMlQsfkgpqL4VK0fYgFklkDRq74Ok4I3u7q29nRO+
         nLIUdHujP6iL7GL0+LYQH2FnuKcmtrzARE+vMmhS4kIWIqMRu1h2IQ+J2TjhJ3y4Bh0G
         Z6cV2X2qDm1PisEqw8baY8r4GsQ79HLyBRE35kNWhKsOejN05tRj6H2B0ry4L0ZQUqwk
         ejnA==
X-Gm-Message-State: AOAM533vp46MWiT/FclLh2OwShbBhT402w9cobxyQ1tY5PpuePiEZB6i
	9ms2m1/AdRe6NciRTLzjIkZrWrDmNoQ=
X-Google-Smtp-Source: 
 ABdhPJzGNoyv+suwVRPYX4pitWLoSXuGa4Aq5U7WFSWh9e+uqm9SXVOX96rz3WqfJuMDXqbs9jgpAQ==
X-Received: by 2002:aa7:9575:0:b0:49f:ddab:dcdb with SMTP id
 x21-20020aa79575000000b0049fddabdcdbmr18639402pfq.13.1637901385234;
        Thu, 25 Nov 2021 20:36:25 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 13/26] btrfs-tools: use setuptools3-base not distutils
Date: Thu, 25 Nov 2021 20:35:52 -0800
Message-Id: 
 <41ea76d033252833f99ff490a7d7baa9e7a89d25.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158809

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb
index 399ba17e3ed..45872e4a972 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG[crypto-libsodium] = "--with-crypto=libsodium,,libsodium"
 PACKAGECONFIG[crypto-libkcapi] = "--with-crypto=libkcapi,,libkcapi"
 
 inherit autotools-brokensep pkgconfig manpages
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'distutils3-base', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3-base', '', d)}
 
 CLEANBROKEN = "1"
 
-- 
2.30.2


