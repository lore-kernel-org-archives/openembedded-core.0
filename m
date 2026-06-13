Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149CDCD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:09:33 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86841.1781334569158815789
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZhiELjh/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4908b92904fso18714655e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 00:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781334567; x=1781939367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=asbKud6BzZs2UzPnvDFQPWBoBGt8or+HHo3E/BbFx1Q=;
        b=ZhiELjh/K+mU4KLR298IWYFAD008uia6RMf3TGURJel2QMvrtlDwbDoVuV1DdCf/Ea
         RoVKG86BeFtofpVe3jqQ144DnwZ3YSGcfqFqijESVHEzckHMdPGQXO+TX2P7jkwXY/j9
         NJX8SaScRUrBzT+T04Du4NwoW09HLnQGQoaYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781334567; x=1781939367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asbKud6BzZs2UzPnvDFQPWBoBGt8or+HHo3E/BbFx1Q=;
        b=XYXEP66u4D3WQ5sFIBJxQ2PFwobEbL9ttoun6xpr8liFDBTHgGckaLfPgRed90Cgmo
         7yTMlrbvCD3CT1lwUPSTHxC2URmefBKLlnI4HhDdOIuF2lTQBOU2S0Th8Hk42vgqzvte
         U6omUkW6LNJ5c+KE43fC/t+z+ZLmwr+jwhKuQswKGiNo9dyFkiEKnssj4QjiSR9yc3R6
         q+yxCpYXNHu9+s5hLHYYxy/LGHwXLKCIxNfniEQ8Dd5la30RCOoLILrj/tIrUWUElF25
         kR3ZCkMQ80NmgoiYNA9nEtN1aTXFbZgajdavDCSSmRTxMZwQfNXushtRdRS4osfCc+m4
         xNSw==
X-Gm-Message-State: AOJu0Ywq6Ii1fozwixHQIjYrcxEtWBkXAu8rE/qP2WSJVzsQsjBgjD4R
	rPWAMwrE28zcF6piCiWGw94aJaYEYcCn1VEQQNz5oFzguNNdwvBxs1NDfgTDdkuhHJCayqfsmE2
	TVpse
X-Gm-Gg: Acq92OFznbSc13iwXIAJIatx5wVk7BGNzyN/iyy0HyFaKxc2b93ZeQWFQkvRp7tcadb
	tBAbBiapflWojSKIwfL56uEQElERX/SHgwDnE/5ExzIhvLT66I+qwhPgrMQcx3E1WtN93BjEhGk
	er60WC2PKp/Iy5XQwy/EOoK8akLtQK/1mVGTprmHzpHptl7s/jRg74ggXDqkhLWM7H58ZYv243z
	zliSmuWI35T6s29mQMPLhJzkaWgsn6DeNOd27jGXkkXUNJrGI8lkDtHk5YqD1Q2pLhvyRVcJeys
	sGfi2CwVpQ9RyrTMdw10wV2gTHarcPt8qWyqT/VQf9tsD0+etdBaf8DKJa5mJqMUBiG9Rv1k2Pj
	t50gkhhdrQLG1FAaKeRunKpvJ+dLh7Sdacw5ukO82NcyzmIq2P6EhVN4WZd9Ueafu33kPAZI9b1
	2qymol43B8kqxvtvC8eo6Vk18l65tBhnmb/ahpQp00ovhYMNyfRVVajwp0PBAcYdY=
X-Received: by 2002:a05:600c:4743:b0:492:1e36:bafd with SMTP id 5b1f17b1804b1-4921e36bb83mr45852495e9.37.1781334567020;
        Sat, 13 Jun 2026 00:09:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4437:5798:e78b:2888])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edc23sm50366165e9.2.2026.06.13.00.09.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 00:09:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Update minimum git version to 2.22.0
Date: Sat, 13 Jun 2026 08:09:25 +0100
Message-ID: <20260613070925.2902075-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 07:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238651

I suspect we use functionality from newer versions of git than is documented.
Update to 2.22.0 as the minimum version as we are about to use
"git branch --show-current" which is in that version.

2.22.0 was released in 2019 and all our supported distros are well beyond
this version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 3142ff61f20..bdfa7f059d2 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -568,11 +568,9 @@ def check_tar_version(sanity_data):
 
     return None
 
-# We use git parameters and functionality only found in 1.7.8 or later
-# The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see #6162 
-# The git fetcher also had workarounds for git < 1.7.9.2 which we've dropped
+# We use git branch --show-current which was introduced in 2.22.0
 def check_git_version(sanity_data):
-    git_minimum_version = "1.8.3.1"
+    git_minimum_version = "2.22.0"
     import subprocess
     try:
         result = subprocess.check_output(["git", "--version"], stderr=subprocess.DEVNULL).decode('utf-8')
@@ -580,7 +578,7 @@ def check_git_version(sanity_data):
         return "Unable to execute git --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[2]
     if bb.utils.vercmp_string_op(version, git_minimum_version, "<"):
-        return ("Your version of git is older than %s and has bugs which will break builds. "
+        return ("Your version of git is older than %s and is missing functionality we use. "
             "Please install a newer version of git.\n" % git_minimum_version)
     return None
 

