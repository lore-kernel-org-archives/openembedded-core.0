Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597ACC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 12:36:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.62193.1672749358311311834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 04:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RwQgG2pZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t15so20430042wro.9
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 04:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag+2kNgZNXFQEdOa3VoOTW+KT4PY2dNeWJ65CEaqVQQ=;
        b=RwQgG2pZiMWJOcmQHXO4GiJfSdB4VLjQ+djYoL8+yT/yotNEwEQ7lzbZhjwRLJW1w4
         SKYPQuWZ+ulIHSbDBA8Jfyx/+9ToAb7RxepZrcrluaq4PXUHXh6ceMlfHaB+L7I1ii+V
         iW70/ii28Xh+mExh8GTg4wLFt/LoOcdR8xjWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag+2kNgZNXFQEdOa3VoOTW+KT4PY2dNeWJ65CEaqVQQ=;
        b=0CPNAmURSFGKVrbxdq+zr2QuOfvdSFxRXuZg6yeSAri4iLkaRY0bPSaYEXYdVPpjtA
         tqw8IEcCfxMBF93ongvNWVKXQj1wW//2nb8qjrWKZ1SbBNWCaLAfzhUNXo+EJU/fjHKU
         QnpZuf1vGJeH/fIelwXwrCTyWUsqDHBcH+bLG8zd6POLHPBO/5w343S13nGqnQVGfuRG
         hqSVf2ANAc3E6GZr16ILtDJ1YEvhTdtzmIiPxBq7cGh6RIpkF3MClhef0EyvjvRpwD2d
         qlfs0nOUaMNYaI/NMrGPaQnPg62irEzEFj0kCOt9hKcjsbsVK++VezxTOhw2orQmDCbf
         rbIQ==
X-Gm-Message-State: AFqh2kqgAwIdus4dUw52nd5bDpCJFTl9AHYJLOZD6fQEEA1lvcEDS/Q+
	GMKI/L946YcnJVJQTmdWOQKHxDCbSt58W+KV
X-Google-Smtp-Source: AMrXdXv7qVTfSgDGnDyzArEyRVh1ydF8t6B1XKqdNErQW+wA2sAvQ+7ov7WpCFx+8lIVHnKxEAdsew==
X-Received: by 2002:a5d:6e0c:0:b0:27d:a1ea:dcfa with SMTP id h12-20020a5d6e0c000000b0027da1eadcfamr18197204wrz.19.1672749356264;
        Tue, 03 Jan 2023 04:35:56 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d934:7269:d594:9ac2])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c4f9400b003d9b351de26sm9680772wmq.9.2023.01.03.04.35.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 04:35:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Update to use mickledore as the layer series name
Date: Tue,  3 Jan 2023 12:35:55 +0000
Message-Id: <20230103123555.1111132-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 12:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175343

OE-Core has changes which do need careful evaluation for compatibilty,
such as the addpylib directive. Move the core later names to mickledore
so layers can mark their compatibility as such.

Also increase the version number for core. If we do make further changes
that need layer changes, we'll update the version again so layers can mark
compatibility within the series.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index 889c056eb65..2eeea0444b9 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -11,4 +11,4 @@ BBFILE_PRIORITY_selftest = "5"
 
 addpylib ${LAYERDIR}/lib oeqa
 
-LAYERSERIES_COMPAT_selftest = "kirkstone langdale"
+LAYERSERIES_COMPAT_selftest = "mickledore"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index 1704a753a08..564ae265019 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "kirkstone langdale"
+LAYERSERIES_COMPAT_skeleton = "mickledore"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index e41ada5d35d..948ded667e8 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "langdale"
+LAYERSERIES_CORENAMES = "mickledore"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_core = "14"
-LAYERSERIES_COMPAT_core = "kirkstone langdale"
+LAYERVERSION_core = "15"
+LAYERSERIES_COMPAT_core = "mickledore"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
2.37.2


