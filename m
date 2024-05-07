Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A0EC25B4F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 11:46:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.9481.1715082404613855114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 04:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lT1w1CKj;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59ece5e18bso155562266b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715082403; x=1715687203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb/HD8X57q4/zKrajzDDTirW/Am7nAjY/W0zVeVRmcA=;
        b=lT1w1CKjs9EC6yphX08jp4Pfs++tsXxskeCkjyL0vYr7xH2UYpxhpcXjQQpEMT6qOB
         GEEKW6q6ztNR0SvwQvRIAeUHvZsIr2Rii+k6VO5nLmjbjkWu39lv0/4zgDs4FYTrAvfP
         SvFOAaVk6mMozDGWzC0cWLIRHyCqhyGeyIxXM9Z+WiThVNGGPFm2EFrGhOQEf7XZTqt+
         YA8KRVHh58hPfVE9FK8tJT4KJrovRarjOJVObwRFCickvlM3pxST+zbYfUVHMR4URlv0
         90VeiY1yPeWyQ8SicwjXzNjVhTTQt1rsssdOJ0DSFGkjubRKRZhofBxSxleBu0o1qpzD
         m1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082403; x=1715687203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pb/HD8X57q4/zKrajzDDTirW/Am7nAjY/W0zVeVRmcA=;
        b=F4N3hCWARn4qexB4Ir5cU0M1iIE2jlbPZYoo+HqitFW5PT9pBIOqWdewDI9P/ypJsz
         Ae1PCoOoRvR8LVvFai00vGk8McyeO7rSQPTAYMTwFpmC7quW7ygEOGnws/Rdc8fSr3sY
         ibClt7Q0E4ChCp4GVhSwBnposagzL81IUUeoDKALnyf3rkpoVmx/4yCmUDPoLW2EMD1U
         J4giR6azGby5/MoCY2NF/z/QjSoVWndFFtTTp9H+TEsRV1+570fpG1hQAM20vOFr9fzw
         6Zv/meqhBpgx2yId5VfWmuEjdmQkFEle071FOkDFn/XuPpgNcJ3axXD+sDGTMmEWBPsC
         QPOg==
X-Gm-Message-State: AOJu0YxydX6Ez5OK2nUW7ByydKjsg8VRwMtDtj2Ige6qM6jNnQD+IMtz
	UiB6pBGMLLwJV6xnsMHHxcOemAYN0F6LhcDuQyCxo1XKgEmuUZVIAlI96w==
X-Google-Smtp-Source: AGHT+IGQ8yyxcwE6aIneN1dP1gLhVsBX34mDZqFuliP7FLaKVy2/q5BfcwwDPmQQwPNfgxkBx6UMOg==
X-Received: by 2002:a50:cd93:0:b0:568:9b13:77fe with SMTP id p19-20020a50cd93000000b005689b1377femr11827426edi.37.1715082402661;
        Tue, 07 May 2024 04:46:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm5268215edb.10.2024.05.07.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:46:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/9] bblayers/makesetup: raise exceptions when errors happen
Date: Tue,  7 May 2024 13:46:21 +0200
Message-Id: <20240507114629.2591882-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 11:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199084

From: Alexander Kanavin <alex@linutronix.de>

Otherwise the calling code can only issue a generic, unhelpful
erorr message, and it's difficult to tell what went wrong
if logger.error output is obscured or redirected.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/makesetup.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 99d59737602..8148b0d9ff4 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -48,8 +48,9 @@ class MakeSetupPlugin(LayerPlugin):
             if l_name == 'workspace':
                 continue
             if l_ismodified:
-                logger.error("Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l_name,path=l_path))
-                return
+                e = "Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l_name,path=l_path)
+                logger.error(e)
+                raise Exception(e)
             repo_path = oe.buildcfg.get_metadata_git_toplevel(l_path)
 
             if self._is_submodule(repo_path):
@@ -63,8 +64,9 @@ class MakeSetupPlugin(LayerPlugin):
                 if repo_path == destdir_repo:
                     repos[repo_path]['contains_this_file'] = True
                 if not repos[repo_path]['git-remote']['remotes'] and not repos[repo_path]['contains_this_file']:
-                    logger.error("Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path))
-                    return
+                    e = "Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path)
+                    logger.error(e)
+                    raise Exception(e)
 
         top_path = os.path.commonpath([os.path.dirname(r) for r in repos.keys()])
 
-- 
2.39.2


