Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161BDC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:37:08 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.12502.1639409827040618486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kTUoGzBq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so13635254pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=W5KST1QOknlgRdpk5Dxewss6keYaHyEHBw4cKnKMxcU=;
        b=kTUoGzBqPrShcqxENUpatE9yvp+3GjtS3jYo1f4sgF0+JxFsIT5VcGoU8XyiyxsgpW
         bQ6Hdusn+8woY/J/+qGz9RGQRryGmb2E75jxnz9J52PcjbjavpTbLNj/wTcjS6H6KZ3E
         aGkMESmW7828/J+4le3iBv4BQ8J36LWJtN13S4Ii9YFri56tnV83mBduGDlEb6b9M+pZ
         NHiS5inUuyA89LJ12siEzu/J1LO/d3xpXvjmD7ZtsNSNVFUeaCErjXP/H4fHAabX+XC8
         WVngGGPd378OaGusXnlINZnKbSs+4PcbI+MQ4HCjSMcXYdAfSdxNLEpIUT2CfLGbku4p
         zZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W5KST1QOknlgRdpk5Dxewss6keYaHyEHBw4cKnKMxcU=;
        b=R3qoxQ/SkXoZpW4+bUk560R47+j2m66TuSrbuYWy8SLhSTXJ8cB3L7o9pIVE7ADvzj
         Gb8gciEA7kYB+bv9TfRwbOgapcuaXJM8SqPBK5mWXzcVclW7b4rn5o9Tg66ApYjKr+bE
         tx0ARvDjWpY8l9KzsMffbaJjP50Vg1FfS1GOuaBeiLrjGQhQVOlamsPZUl18qs9GAMhj
         QABSeGMC2fRLSshLTw7Kh0nikWZhPMhf6V7oTrewnjmHM8KUyTav8geR4yRGgz7ZGKf9
         GM/KpUbT0TBPRUMIXZFG/YpIR2n7jru0NuzGt5gUpv0yGr25bHzZrVvF4cxXvcpx1vfE
         WbSQ==
X-Gm-Message-State: AOAM533Mi3ubXWt7ZtzwHJ6nsnHcpAT41k4Dxf8e/7d8ELIDzJuud7kJ
	ogg4UbfMKVljbQn8CJ+AElo23gREJROb3tQQ
X-Google-Smtp-Source: 
 ABdhPJzyv+LW9lnJqwe4R5elRZ+aOKS4jRmP0X2yK3HCUmRSZYkCmckJuKg9sfIYmDbLXq++uSMyfA==
X-Received: by 2002:a17:90b:4f83:: with SMTP id
 qe3mr44907125pjb.56.1639409825951;
        Mon, 13 Dec 2021 07:37:05 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y28sm12850297pfa.208.2021.12.13.07.37.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:37:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/10] recipetool: Set master branch only as
 fallback
Date: Mon, 13 Dec 2021 05:36:26 -1000
Message-Id: 
 <2bc6deb34aee7542d7086c24b166083c562a6a01.1639409496.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639409496.git.steve@sakoman.com>
References: <cover.1639409496.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:37:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159651

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
sets the branch= parameter too early to master and thereby breaks the
-B/--srcbranch option.

ERROR: branch= parameter and -B/--srcbranch option cannot both be specified - use one or the other

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34ece8030e7a6a100b5e3e7b94e6c786c0e199a6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/create.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 116bdfd697..5b6ac12a92 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -389,9 +389,6 @@ def reformat_git_uri(uri):
                 parms.update({('protocol', 'ssh')})
         elif (scheme == "http" or scheme == 'https' or scheme == 'ssh') and not ('protocol' in parms):
             parms.update({('protocol', scheme)})
-        # We assume 'master' branch if not set
-        if not 'branch' in parms:
-            parms.update({('branch', 'master')})
         # Always append 'git://'
         fUrl = bb.fetch2.encodeurl(('git', host, path, user, pswd, parms))
         return fUrl
@@ -481,6 +478,9 @@ def create_recipe(args):
             storeTagName = params['tag']
             params['nobranch'] = '1'
             del params['tag']
+        # Assume 'master' branch if not set
+        if scheme in ['git', 'gitsm'] and 'branch' not in params and 'nobranch' not in params:
+            params['branch'] = 'master'
         fetchuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
 
         tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
@@ -530,10 +530,9 @@ def create_recipe(args):
             # Remove HEAD reference point and drop remote prefix
             get_branch = [x.split('/', 1)[1] for x in get_branch if not x.startswith('origin/HEAD')]
             if 'master' in get_branch:
-                # If it is master, we do not need to append 'branch=master' as this is default.
                 # Even with the case where get_branch has multiple objects, if 'master' is one
                 # of them, we should default take from 'master'
-                srcbranch = ''
+                srcbranch = 'master'
             elif len(get_branch) == 1:
                 # If 'master' isn't in get_branch and get_branch contains only ONE object, then store result into 'srcbranch'
                 srcbranch = get_branch[0]
@@ -546,8 +545,8 @@ def create_recipe(args):
         # Since we might have a value in srcbranch, we need to
         # recontruct the srcuri to include 'branch' in params.
         scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(srcuri)
-        if srcbranch:
-            params['branch'] = srcbranch
+        if scheme in ['git', 'gitsm']:
+            params['branch'] = srcbranch or 'master'
 
         if storeTagName and scheme in ['git', 'gitsm']:
             # Check srcrev using tag and check validity of the tag
@@ -606,7 +605,7 @@ def create_recipe(args):
                     splitline = line.split()
                     if len(splitline) > 1:
                         if splitline[0] == 'origin' and scriptutils.is_src_url(splitline[1]):
-                            srcuri = reformat_git_uri(splitline[1])
+                            srcuri = reformat_git_uri(splitline[1]) + ';branch=master'
                             srcsubdir = 'git'
                             break
 
-- 
2.25.1


