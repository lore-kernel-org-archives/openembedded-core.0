Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FBCC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 09:25:56 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.27554.1701854747587368494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 01:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LNLIVAu1;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso4624213e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 01:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701854746; x=1702459546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdQf7MBjw7yQh04tCQTUlbrgxh1H/tLReRcl04gyWv8=;
        b=LNLIVAu1JdaFzHh6j85VxlcMF/aXdki9ffSP/Yo8qfqzaXGKzTpqv/gLbOL3p1evt3
         r/Bs28XTuZKvr0eukBf88NOgXe/3gR7EokY1I3tP2IXqEXWJTBcrfh6XTbDJsYStRawW
         xdpVFg9IyN8WWL7BM/c8gDNGv4b7wLIQ3Y+isSfv6VGmq3hcrUi6rcNIR2FYA1+UDM0j
         wX10z2CCtFxUBDjtJLDZUdMsfBpmVaDP2/Yu5ALzYg8g+DnFYBiJ2LYkMIHUo95zcQA2
         iy/14O/DuDK42/o5niF0sTaepLpj1pW5hjxYP73uQ0w2sc65jMeeJ8PBv6RJkUL1LRTW
         LtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701854746; x=1702459546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdQf7MBjw7yQh04tCQTUlbrgxh1H/tLReRcl04gyWv8=;
        b=lu5QqOLk8G71aaW+sEwYOZFrPzz/Jw5JMxF4UdRs+PEqyun7Nw5R91dZzFpaulNLQY
         PXvkPO/SXr9n2KNbRIEs0fBPX3Oq1erudEPJoJ3dU9Abzi+s4+SXumPSyCDr8ER9P2Ha
         yonTevtTQkORoQAS3pQYC9Nm4mdJg3HkNyaTQcG/YOeq9QmGvmm27suVrla2GAquqVjn
         vkHWnEbrSeZekklTLnjKrAA2HEWeoO6xZPtWotLCwy/Da9oyiODKtRJ8IKTh14GvVfhI
         n8gGWn3XpWDoiOKafyW3hFN5RkxpmC/HuIczr5/Es0LDYNyuY+mqg5za8hhyiP6KTC4u
         HSig==
X-Gm-Message-State: AOJu0YyaP5UAJsgr6h4R4UEswcPe2qtD0nqZlKbtPLxoXeXUMtdn/pIj
	KrbdpS0TlBUqzIuW+x7Cod3necG1vjE=
X-Google-Smtp-Source: AGHT+IG7Ixz9NlPj0cjzezwG7DZzJQI439dLp8xGiuW0ATq6OgSIUXZ1dQaNQKv+vRKRHhIV1qA79g==
X-Received: by 2002:a05:6512:360b:b0:50b:e6aa:d0aa with SMTP id f11-20020a056512360b00b0050be6aad0aamr351264lfs.52.1701854745474;
        Wed, 06 Dec 2023 01:25:45 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id oz23-20020a170906cd1700b009ff77c2e1dasm7890114ejb.167.2023.12.06.01.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:25:44 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH] scripts/oe-setup-layers: add option to skip revs in json
Date: Wed,  6 Dec 2023 10:25:36 +0100
Message-Id: <20231206092536.2874022-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 09:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191879

Current script implementation uses revisions recorded in JSON file to
replicate previously recorded setup. While this is useful for complete
layer setup reproducibility, this does not allow the setup "upgrade" where
this script can be used to use remote branch information and latest HEAD,
have the setup restored, and then saved using updated revisions.

Add new '--skip-revs' parameter which can be used to obtain the updated
layer setup.

Following set of operations could be executed to achieve this:
1. Restore initial layer setup using remote branch HEAD instead of recorded
   revisions by specifying --skip-revs.
2. After layer setup is created, JSON file containing updated revisions is
   retrieved via `bitbake-layers create-layers-setup`
3. Updated JSON file can be checked in to bootstrap repository and used
   later without '--skip-revs' to replicated updated setup.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 scripts/oe-setup-layers | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 6d49688a32..a4941450d3 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -69,6 +69,13 @@ def _do_checkout(args, json):
         remotes = r_remote['remotes']
 
         print('\nSetting up source {}, revision {}, branch {}'.format(r_name, desc, branch))
+        if args['skip_revs']:
+            if branch and (branch != 'HEAD'):
+                print('\nSkip revision option used, remote {} branch {} HEAD will be used instead of {}'.format(r_name, branch, rev))
+                rev = branch
+            else:
+                print('\nBranch info is missing in json, --skip-revs option is not used')
+
         if not _is_repo_git_repo(repodir):
             cmd = 'git init -q {}'.format(repodir)
             print("Running '{}'".format(cmd))
@@ -108,6 +115,7 @@ except subprocess.CalledProcessError as e:
 
 parser.add_argument('--destdir', default=defaultdest, help='Where to check out the layers (default is {defaultdest}).'.format(defaultdest=defaultdest))
 parser.add_argument('--jsondata', default=__file__+".json", help='File containing the layer data in json format (default is {defaultjson}).'.format(defaultjson=__file__+".json"))
+parser.add_argument('--skip-revs', action='store_true', help='Skip revisions recorded in json manifest, and use latest revision on branch to restore setup')
 
 args = parser.parse_args()
 
-- 
2.34.1


