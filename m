Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE764C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 12:13:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.6382.1652789629732189773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 05:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R1rSydHC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id j24so9234715wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 05:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ztbRree2T91NA+Mv7UMk3CCiSlxfMmYCy99oGcxeCMc=;
        b=R1rSydHC7bP6zlW+mUXcOeptQlOwcQjztLosNfJYG6g6XzvaMw5mQ3u6VtTn3XYxUJ
         HgpxoZRwL+EIIQrhPxUtk0MCqXOC7XwmiWx4IH7RAfEgvgI4h8YwZ5g7rz5eflP5LcgC
         oNNrsf8QtRErP6WcnvRAsCH80Uv/WU0touZ0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ztbRree2T91NA+Mv7UMk3CCiSlxfMmYCy99oGcxeCMc=;
        b=wcI3OeheXojgKtwcJivLwwJMn1cGPu9LrJslEWFFbz56wzKMhyFIOYg91mpj69ZGCN
         e4HiLvQKLEIjxKW0pVIOvfFpI5L8G5oqc1cVhSJsWSnPIrFkzdqKDVlXAcT2b85ZAu2e
         LhOQBWRngDLO07u/CC9fq89gQI0AfDYk3G26ZRzeBk7C+ocm8iOJaAgUpTlbfPT/vCEF
         nYiNzb4trBi3CpTQ2XOv4vk5yALR5sCr/q80ExLy18cTgQ3xxpOEP0Q8ndozIBFbhogM
         eEiLEPMV40nbXx9v6tAk7yPTMdaa+gPacJqNuJU4dYfMpyLxcOA9OKflAbJdnaDozjUn
         QQWA==
X-Gm-Message-State: AOAM53397Tnz3+P4fn48fiknVq3osxtXGPGHVfD0f9eJuFxi3caSs4Y3
	B2vtHrZXqTE6Zkrs+yQtFdbLOBumgO+mP0nR
X-Google-Smtp-Source: 
 ABdhPJzr+8tBgHyzY613YIX9o2DytyGeXNeH6i6ts4UAbq3x4PRd5/zbt1vLryz+lUF6MSqNFYWvXA==
X-Received: by 2002:a5d:55d1:0:b0:20d:841:2b36 with SMTP id
 i17-20020a5d55d1000000b0020d08412b36mr8695391wrw.64.1652789627756;
        Tue, 17 May 2022 05:13:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3c0b:65b:e679:a594])
        by smtp.gmail.com with ESMTPSA id
 u2-20020a05600c210200b003942a244f29sm1741685wml.2.2022.05.17.05.13.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 05:13:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Don't use indirect help2man-native dependencies
Date: Tue, 17 May 2022 13:13:46 +0100
Message-Id: <20220517121346.489277-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 12:13:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165732

Similarly to other tools such as pkgconfig and quilt, don't pull in
help2man-native unless there is a direct DEPENDS. This is generally good
for keeping the recipe sysroots leaner and cleaner and should fix some
issues with squashf-tools in particular.

This will mean any recipe with an indirect dependency will break so
missing recipe dependencies will need to be fixed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index a5d727ef5b52..076cba58d12d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -103,6 +103,7 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->quilt-native \
     ^(?!gtk-doc-native).*->xmlto-native \
     .*->gperf-native \
+    .*->help2man-native \
     .*->gtk-doc-native \
     .*->texinfo-native \
     .*->perlcross-native \
-- 
2.34.1


