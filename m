Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB24CC4321E
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 03:39:19 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.3999.1666150755091938323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 20:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cfOwiMic;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id y10so10605562qvo.11
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 20:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQa90ydJEvdvNGjf77+jhZKwTDvj0f7IOB+rMCpYhbE=;
        b=cfOwiMicLPdH5y0PwmDJ0qChtcYztNqnUORRV+PqqUpcCP11NBNk98TmNA6LmGzavp
         FVEcN1twy50Zq8cHjN/VIiApDpqU0zTt6asQLTNdkJIPdFmegOlrj2oWz+fZU+L8lkEl
         B7SM9rArNMIekDIYlvJzBkSchy42DSYz6rO6y3tnsiSrJruwAOcG/IVYXYUsGshmxiCv
         fec/HFkgzkuq6U7Llj16GIoSxTnGs0N4W1bEZKQG/2eHOq48Ec43x1+L90R/OmfqUmGf
         jMTjJXuVyydEV4DMF4taRbtVgGWgRcGZCM1VKPBIu7uZ9eq2NwMAAGdWcFmvx7u7q2yI
         0plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQa90ydJEvdvNGjf77+jhZKwTDvj0f7IOB+rMCpYhbE=;
        b=s24JMd9ftOVdgj6R/k2h+8HXwp+fGNDwJKVL1ld9+7lw8Ncg4tIE89xesgA3O/6Wad
         8PyIlNqiSYPkucLS8EEzLtrNl+PqrOyo3K/JsaeUXnWwRspF+iNHcmzzqise2l202yTu
         j/TtfJrz70M15yHJ0HnxO3q43YDbB/YDJB3YEmNTyadXwJBEkqNlSeSFQ7f4NYjtjw5R
         r+Sbp26qjWkluycMPTozAW+XozRNY3iPbEW4c7FoLg1lbhSZRpxeeHcDWO6ItkqhU1ap
         Vx0PDeMbNIyvTpt8JERelAiWdA4atH3nLZsQ26c7CODhYh1FCQrf8RvD5agQoRC9BFS/
         /vHQ==
X-Gm-Message-State: ACrzQf1+RmCtzC0e7zcWiJvbJhmJbaYl8Fo5xdLIBSeOwBJ8TZqNEO4p
	LdqO4Acjr6p0tVBqcJe1pqI=
X-Google-Smtp-Source: AMsMyM69GVcd0hqJ8srBi+i11u5UI6wU7Tp03R8vWe0ovF8M0pVVo2iY3pQYOpJv2Pt5RxlNPVJGFg==
X-Received: by 2002:a05:6214:202d:b0:4b3:d5a5:3d69 with SMTP id 13-20020a056214202d00b004b3d5a53d69mr5101433qvf.88.1666150754019;
        Tue, 18 Oct 2022 20:39:14 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id t16-20020a37ea10000000b006ecc5f5635dsm3793946qkj.113.2022.10.18.20.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 20:39:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] kern-tools: fix relative path processing
Date: Tue, 18 Oct 2022 23:39:09 -0400
Message-Id: <00d1b34b5d92325ea31564c0f7f4a5876f2e2edc.1666150638.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1666150638.git.bruce.ashfield@gmail.com>
References: <cover.1666150638.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 03:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171951

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The previous fix for processing of paths with relative components, broke
uses cases that were a mix of patches and configuration fragments.

Updating the SRCREV to include a simplied fix for relative paths, and
a cleanup patch from Jose:

[
  Author: Jose Quaresma <quaresma.jose@gmail.com>
  Date:   Thu Sep 29 16:37:23 2022 +0000

      scc: only look for error in scc_output_file if it has valid content

      When process_file function fails the output of the processed script is show to
      the user, some parsing is performed as well to look for common errors so we
      can point to the right input file.

      This can only be done when the scc_output_file have some valid content
      otherwise it will show invalid messages to the user.

      Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
      Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

  Author: Bruce Ashfield <bruce.ashfield@gmail.com>
  Date:   Wed Oct 5 19:13:33 2022 +0000

      spp: ensure that prefix check uses absolute paths

      The previous fix for this issue was too broad, and impacted
      all calls to the prefix check and removal. With this change,
      we only expand the input on scc/spp operations that may
      execute with relative paths.

      Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index dea7b65a7c..07d7daf5fb 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "ba600ef61a85966596126a6e8d936971905e8749"
+SRCREV = "6a4752ebbe7d242c02b3c74a5772926edd243626"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.19.1


