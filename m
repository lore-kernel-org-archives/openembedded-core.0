Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2913C433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 18:03:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9659.1632593035775734240
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 11:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DSAiMu8y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id d6so37402521wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 11:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTk/YBkzuh9HO6A8bbv8DmirbOVNTK1eFE+0TK7ZyMY=;
        b=DSAiMu8yqk0kGhOyhFELWgtFpCAXs2YMf7cJy9NOT8eKTg9r5pIDlnRc7do1e2Rbky
         M0Bvge9Mg2ikiW6+HrAGf9Rb/bYNb66DphH9gikORkQcMXI2GFkkkr3QcnX0PHsgboXv
         G7LwZotoRGXBao7X3lU4HpZXMGI8FzAVohetg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTk/YBkzuh9HO6A8bbv8DmirbOVNTK1eFE+0TK7ZyMY=;
        b=M7DRWxf4jGRJ3S743tLoUfveSw8K+HY10BaT6A1c/Kb60IROGz0dtBHaHhENxEiFaR
         5pUPSRBy2NeJtoerwgIN9rI88+Y55rXcBMJiAXvYsq2TDh+X8wl1325Qd6id52l1PUJV
         mLBzz1tsBmszkfnjE4mmTffNXHywnqNA9aPBkQhhM+yHvh6bITYz6T9xPFDvSFP5eJrn
         nTxP61Horf6ejmegALNOzQsmDRabbA6DtmGQBuGlFrDCOJYHAUdc2oDejgwaOEPULlr+
         eDN/fHG2dSfmk+030EuN1wXvmBLseuiF84Zy9o8kel4EPahMKSczG/cMxM7vyGhZljPW
         LYYw==
X-Gm-Message-State: AOAM533eGYHQln6KbIF/hOiSL0DQfeyH/U34++D9Dh1SPQ/B2J96/7xC
	hQCNr16R1Zru0mS+E9Vpi7B/CoJOQ4Xz5CIQ
X-Google-Smtp-Source: 
 ABdhPJxk8EkrS0f4Zt45Bt8ysR0f9h1E6iBqPsXPiHb7tPN/CbW+7Gu5r/R16K0cd7Ua0R0WtcqWFg==
X-Received: by 2002:a1c:8087:: with SMTP id b129mr7152418wmd.87.1632593033967;
        Sat, 25 Sep 2021 11:03:53 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2185:dd9d:1e31:557d])
        by smtp.gmail.com with ESMTPSA id 8sm4831978wmj.18.2021.09.25.11.03.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 11:03:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/buildproject: Ensure temp directories are cleaned up
Date: Sat, 25 Sep 2021 19:03:52 +0100
Message-Id: <20210925180353.1987944-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 18:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156356

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/buildproject.py | 3 +++
 meta/lib/oeqa/utils/targetbuild.py  | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index e6d80cc8dc1..dfb96618680 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -18,6 +18,7 @@ class BuildProject(metaclass=ABCMeta):
     def __init__(self, uri, foldername=None, tmpdir=None, dl_dir=None):
         self.uri = uri
         self.archive = os.path.basename(uri)
+        self.tempdirobj = None
         if not tmpdir:
             self.tempdirobj = tempfile.TemporaryDirectory(prefix='buildproject-')
             tmpdir = self.tempdirobj.name
@@ -57,6 +58,8 @@ class BuildProject(metaclass=ABCMeta):
         return self._run('cd %s; make install %s' % (self.targetdir, install_args))
 
     def clean(self):
+        if self.tempdirobj:
+            self.tempdirobj.cleanup()
         if not self.needclean:
              return
         self._run('rm -rf %s' % self.targetdir)
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 1055810ca33..09738add1d9 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -19,6 +19,7 @@ class BuildProject(metaclass=ABCMeta):
         self.d = d
         self.uri = uri
         self.archive = os.path.basename(uri)
+        self.tempdirobj = None
         if not tmpdir:
             tmpdir = self.d.getVar('WORKDIR')
             if not tmpdir:
@@ -71,9 +72,10 @@ class BuildProject(metaclass=ABCMeta):
         return self._run('cd %s; make install %s' % (self.targetdir, install_args))
 
     def clean(self):
+        if self.tempdirobj:
+            self.tempdirobj.cleanup()
         self._run('rm -rf %s' % self.targetdir)
         subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
-        pass
 
 class TargetBuildProject(BuildProject):
 
-- 
2.32.0


