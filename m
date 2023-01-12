Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B00C63797
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.45241.1673490814240706503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0OSxtiTe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id y1so18813515plb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvVDmXDGQd3/Zqp3TTs58kGDzQUhsmijnz6KCKfwZ4A=;
        b=0OSxtiTe4eQ0Mb6oFaQa0sI2ghWHnAB12NwpJQCB7x5O3m8K8k+Y9cQSjC1bSlv8tD
         bm4Ry6xfLl2MBWRB9n/xwtAfIeUQjgVJIvD0i8yiLKfQr0k6fM3Aj4QC4B//fKXGA2Vc
         lDTR+qNhXcSxxhowSo77SJEHFEZfAfoMwm/Uto7fLSwBh0eABaOi5RfD0xAwsc6Yo8kF
         2R5GsFnFluGmL9Tv68iNn5bOUVPdCJlKUZc4Xo3Tr84HT3nwE2HQW+IjVd0xKf+AWOq9
         r2oz9cgkjCpP+jsf5lsSiRGgrqsgq+KUxUg8Eps1q+kDKcaxLopsebw64NLJ4yzkOwF7
         dd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvVDmXDGQd3/Zqp3TTs58kGDzQUhsmijnz6KCKfwZ4A=;
        b=Fc8IcY0IYmE5I8dQ4LFu4i74r2GIby/fuvUYNxOmBpkNJ83XMHe1WJlpT6/9pk559Q
         pRSp4L5i5ZgrLkRNMdHUcANPkp4arbgg4cNyICkNrmPe9TmAQtWySQMjMqt+CXPOF05V
         auZfrRI/7CGty+jJcdBrlzWGNQ7v/fgCS8QmMyHxizU8IAK1YFL7zUmzxnNizcjCwcMF
         E1z1o+qJHWwe+fClJk/waQJgXiwfqvoW2fmQx4KwprxOKlng2CMNTG19EjUNimygmLTE
         PKnVgLNTK7J4oVFE10+fwnHRJKousQ3dXQqeVpTeG8WvSvNWole7ytay2BRvZOzkNGjK
         ivpQ==
X-Gm-Message-State: AFqh2kpl4AtbqIar0Si5sFMiBwiUFuUZed1lPDyYCen2mPodrJA5hbGt
	IqokphZ11aAROahJytdWwTrPmPrFZ/kgim2s0LI=
X-Google-Smtp-Source: AMrXdXsasuF6cm7coUwflbLddpWVMSavUzHCZNEgeJ/oV/mMAbY23ELFOeHbwo3z7RqydtxMG0CXGg==
X-Received: by 2002:a17:902:8688:b0:189:e7ea:9ff9 with SMTP id g8-20020a170902868800b00189e7ea9ff9mr65392340plo.42.1673490813343;
        Wed, 11 Jan 2023 18:33:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/11] base.bbclass: Fix way to check ccache path
Date: Wed, 11 Jan 2023 16:33:07 -1000
Message-Id: <5038a93d5e511c73f160bd9c284791be4931f1e9.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175779

From: Changqing Li <changqing.li@windriver.com>

The previous code had 2 issues:
1. make hosttools/ccache always link to host's ccache (/usr/bin/ccache)
even we have one buildtools
2. make hosttools/gcc etc, link to host's gcc event we have one
buildtools when keyword ccache in buildtools's path, eg:
/mnt/ccache/bin/buildtools

This patch is for fix above issues.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b7c81414cf252a7203d95703810a770184d7e4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index cb9da78ab6..b15c5839b6 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -132,7 +132,7 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
             # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
             # would return /usr/local/bin/ccache/gcc, but what we need is
             # /usr/bin/gcc, this code can check and fix that.
-            if "ccache" in srctool:
+            if os.path.islink(srctool) and os.path.basename(os.readlink(srctool)) == 'ccache':
                 srctool = bb.utils.which(path, tool, executable=True, direction=1)
             if srctool:
                 os.symlink(srctool, desttool)
-- 
2.25.1


