Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EAAE748F7
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:01:05 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.62173.1696176062428712960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RrQybxze;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c5ff5f858dso91441755ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176061; x=1696780861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eICPl3v7tyC09LBfpBpEhmANHlOVF5nUIEcFxoguCf4=;
        b=RrQybxzeCv5xwwISAR2iIkG7sim0XH5Vhklwp0VyNktfgIVW42Rl1ZL7hXmbyStWtF
         yUb2oueYRv4WfG2vV+UbhFY5TtGhJ+LLqd7tKQaAugQMXABRCFEEkm4FmsmxtkfxKnt4
         H5Ixvz3HHLJINKFuO6Ag/nhHSNFRXkSOiL6Wc6muR7RojU7a9H4kssqK3ZzTEtlgQk3u
         KJH4vP9CeZpWGqqLVwk2c3b6/jkJaMTPLIZcQsGeAXeZwlgAF/clMZMy4S9QkGXHDBGh
         Ge7bgfAHyFXqTKF8+hqR/5NFKJXPbUzxQfPXwEDiQHqOB4GUeoXXzRcRlV7/Gpy+t3w0
         YTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176061; x=1696780861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eICPl3v7tyC09LBfpBpEhmANHlOVF5nUIEcFxoguCf4=;
        b=Kwre9S/PO7RL2coljkgP7MiquMKeNdshT/vUlBUa/izGwk5q2k5kEzhaYcgJsjrg7G
         yBiXyu/xut/FkDg8nOQmSJZY/iMeShKyGKxnjjRwuYBH7HHBhMaNFn1NP/FkGe34iDJb
         nFN6USpLioVKD87Nji8pL8RpFt0Ad2nhGjkACgX8KphuwymQ/BOGZu44ECBOIPcYm/TQ
         4mwpVfr8LjSRiIMqEzFTCvjmENifc26ywhpSN3Kspmh018f3qJH59436T8Hhk2wsS+QH
         Bt0MwYpMgLITHh4+UjuO8QOsB4xJNl2tullBBIwMb1vfNV0enyUco+dRzRCcmjnY2lJ6
         RQ3Q==
X-Gm-Message-State: AOJu0YwNz9R2sNLfLHCg5cEXFLs9XYl/BGGhMyqVCPYoz/2F3PrG9/z9
	sM9UcbStlHBnpy3vLHumTuGo2gvdwehYhR8VRIKddg==
X-Google-Smtp-Source: AGHT+IH+AX8z3+4w279fSsqLY5xroxHzOz4XtN6iRBWC6T/IVN2IjKjy3IjNO1Bp//qjDc5wRHX/Kw==
X-Received: by 2002:a17:903:456:b0:1c3:8230:30d8 with SMTP id iw22-20020a170903045600b001c3823030d8mr7755806plb.38.1696176061422;
        Sun, 01 Oct 2023 09:01:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.01.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:01:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/23] oe-depends-dot: improve '-w' behavior
Date: Sun,  1 Oct 2023 06:00:10 -1000
Message-Id: <275410d3cc78acb66e9c7a6d529a58ac38581c8d.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188512

From: Chen Qi <Qi.Chen@windriver.com>

The '-w' option is not giving very helpful information. For example,
if we add 'spice' to IMAGE_INSTALL, bitbake -g core-image-minimal,
and then run `oe-depends-dot -k nspr -w task-depends.dot', the result is:

  $ oe-depends-dot -k nspr -w task-depends.dot
  Because: core-image-minimal nss
  core-image-minimal -> nss -> nspr

The result is not showing the full dependency chain which brings in nspr.
With this patch, the result is:

  $ oe-depends-dot -k nspr -w task-depends.dot
  Because: core-image-minimal nss libcacard spice
  core-image-minimal -> spice -> libcacard -> nss -> nspr

This patch also fixes a typo in help message: recipe-depends.dot -> task-depends.dot.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 222302810c472c8eb2efceaa757a253dcac5618f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-depends-dot | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index 1c2d51c6ec..d02ee455f6 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -14,7 +14,7 @@ import re
 class Dot(object):
     def __init__(self):
         parser = argparse.ArgumentParser(
-            description="Analyse recipe-depends.dot generated by bitbake -g",
+            description="Analyse task-depends.dot generated by bitbake -g",
             formatter_class=argparse.RawDescriptionHelpFormatter)
         parser.add_argument("dotfile",
             help = "Specify the dotfile", nargs = 1, action='store', default='')
@@ -159,9 +159,14 @@ Reduce the .dot file packages only, no tasks:
 
         reverse_deps = []
         if self.args.why:
-            for k, v in depends.items():
-                if self.args.key in v and not k in reverse_deps:
-                    reverse_deps.append(k)
+            key_list = [self.args.key]
+            current_key = self.args.key
+            while (len(key_list) != 0):
+                current_key = key_list.pop()
+                for k, v in depends.items():
+                    if current_key in v and not k in reverse_deps:
+                        reverse_deps.append(k)
+                        key_list.append(k)
             print('Because: %s' % ' '.join(reverse_deps))
             Dot.print_dep_chains(self.args.key, reverse_deps, depends)
 
-- 
2.34.1


