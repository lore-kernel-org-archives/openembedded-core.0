Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75502C00140
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:35 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.50629.1660877011766583774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=u2/J0flT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id m2so3042739pls.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=s/T3RS6Sh7B48nOCcQ023Bz9GN/Zh5uJbdIRe0J2cx4=;
        b=u2/J0flTInn2RpbI9Z9eqwGGB+ywvHpJXE7Sn6fjMfdZc9t38T2Ok9sesKAn+ue/Ov
         TF2AMHWzu1WbavgjlILfeEOjWDACJ4v0vFZs4xtOhamMusKS1LDUaikBtme/peHBFQ0M
         ZVd0ZnNEqRy/SlxVGjQrZF/HNFLnMjzRJQd0F46CWVMqvIQXmTIQUR9scR3URdT5Rgid
         /C+nAc6gh49rcQRR5tD4tyI0KdWz1zw69WJaMU7z+mL6mSQ0fIvJOdaucBfbU9C+O0wp
         SrKGCrjvZ/KDkS3H/gADwG+ipel1anyjZm34pkI6cspHLd+S1cYte6sIrhns5TB4m1JP
         CK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=s/T3RS6Sh7B48nOCcQ023Bz9GN/Zh5uJbdIRe0J2cx4=;
        b=G4YSxlEuu7E9qtlYsD4/PO6OUIXjKcNa+4svQ3Eik01OhYFZUZCrLz0gC6jkoB36Yn
         dKXe7ohI0ny6IriqIuJ0M3bBxr7DgCeZdVGLhL9AozXP89UTOypneoQ+2kta/az/F7qN
         dd5vRJNXsEy1Wv65Wu0a9qggqWpr/xjYvboAvEvO8wBxI6sa9qnE7DIkra6wUin67KjO
         4WZR3oxiDZf4B9sSLqeFGCK1dZXfhcdErlEBRM9Mg1h1SiomeF4N/r+P9br5cxkPGcUq
         zj4ZlW3BHvVk7/8KUiQl1uKxIHeF6Sl9tBJU0Deq6V3SPoT8MdmrtOf1StIvrk4V57Gp
         56hw==
X-Gm-Message-State: ACgBeo04yfdDBoliUzTonu68Ye0TWLXRzo5ranO2AmXW5plKxeU/nfOe
	X8RzlIQK8AC2tXeKAx4YU7dKTHJKvzDWLtDC
X-Google-Smtp-Source: 
 AA6agR4OkftkeiViamnCWagGZtZZRZNxvWRAxAIRyTTCVv1AgaNyXI0GvTZp6WYuptzuKw4iKHnYXw==
X-Received: by 2002:a17:90b:1b45:b0:1f5:753d:82bc with SMTP id
 nv5-20020a17090b1b4500b001f5753d82bcmr11643742pjb.68.1660877010800;
        Thu, 18 Aug 2022 19:43:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/26] devtool: error out when workspace is using
 old override syntax
Date: Thu, 18 Aug 2022 16:42:33 -1000
Message-Id: 
 <3aee3425956020166d99ec085e35e21b3daf625f.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169554

From: Roland Hieber <rhi@pengutronix.de>

When the workspace bbappends are still using the old override syntax
with EXTERNALSRC_pn-*, externalsrc_re will not match, and pn will never
be assigned, leading to a nondescript UnboundLocalError being raised on
the user's terminal. Try to detect that situation and give the user a
hint how to solve it.

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d42ea8e849cf2df3708406418b961168268b316a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/devtool | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index af4811b922..20d785c7f7 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -104,6 +104,7 @@ def read_workspace():
     for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.bbappend')):
         with open(fn, 'r') as f:
             pnvalues = {}
+            pn = None
             for line in f:
                 res = externalsrc_re.match(line.rstrip())
                 if res:
@@ -123,6 +124,9 @@ def read_workspace():
                 elif line.startswith('# srctreebase: '):
                     pnvalues['srctreebase'] = line.split(':', 1)[1].strip()
             if pnvalues:
+                if not pn:
+                    raise DevtoolError("Found *.bbappend in %s, but could not determine EXTERNALSRC:pn-*. "
+                            "Maybe still using old syntax?" % config.workspace_path)
                 if not pnvalues.get('srctreebase', None):
                     pnvalues['srctreebase'] = pnvalues['srctree']
                 logger.debug('Found recipe %s' % pnvalues)
@@ -314,10 +318,10 @@ def main():
 
     args = parser.parse_args(unparsed_args, namespace=global_args)
 
-    if not getattr(args, 'no_workspace', False):
-        read_workspace()
-
     try:
+        if not getattr(args, 'no_workspace', False):
+            read_workspace()
+
         ret = args.func(args, config, basepath, workspace)
     except DevtoolError as err:
         if str(err):
-- 
2.25.1


