Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302B2CD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 18:37:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.35433.1694975854149349624
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 11:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MsknBxiQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40479f8325fso28696235e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694975852; x=1695580652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qWtIObu4QU/xjDz9Z+CqkSCILJ/Gua7Zt2jnMjk6NW0=;
        b=MsknBxiQM1zeh0O6KMFs4yLknIeuamZ3gkjOZsCiIvrAY3QZohtIbOY1xZ+dqFZow+
         xhqXkpHnhr4YAKrG86cqzL6BTzCYPFqxxOB1Nwngb5LxwWpVCcTWRzBeb7xP//CxAQGF
         CdZ2ko88qeq5MQ8sCzdnlRMNdCcjZqeAVqOlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694975852; x=1695580652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWtIObu4QU/xjDz9Z+CqkSCILJ/Gua7Zt2jnMjk6NW0=;
        b=w6mV/kvp2stt3iL40VplS6wwTjClXftBkQr6eMgDHaI7Ey14wu6Q1Ee/eY3F5puVtU
         FNoy+c30cDcJ0htvw9qcObxACNkG+p6zltuT/uI4FWRH0rPOC1KoRqMAOuu2QeWLj3OU
         Jyi33aVkbNttdkrHusLD05nW9uXwISDNIzbXX1UO2q3t8TilGH/2YNbay5ckwhDuYO7w
         1/BwBSBjf9jp0OngcYSKsMgI5fwM5rLgmq4LgSD9Tx0uPVcx/6vkob0oxh8zbpwYW/9u
         uSe51jkSHZeZxKyiOh02IFjURhQbJx4LUNuQX/TCS6/R4qzNUuBIRYvaNUW3JDyjXAFi
         0D/g==
X-Gm-Message-State: AOJu0Yw5Fd43Xb2Q5wStGdjLI6IeZ1811cpWNRI+/2AnnUB+fqZ+i+cO
	OHmMyLyVPPf8dzqJ/fH6IJPvwi1OgXrcN6KgV1E=
X-Google-Smtp-Source: AGHT+IHF8ZE28OTqxMKwlwHX6HoDxEvqD4ngKbWyWQy4B0CB7dAf5ETj+5AGQjTu+UIRuxTWKa8pkA==
X-Received: by 2002:a05:600c:2491:b0:403:149:1507 with SMTP id 17-20020a05600c249100b0040301491507mr6151504wms.33.1694975852124;
        Sun, 17 Sep 2023 11:37:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bff2:f038:1163:aa6c])
        by smtp.gmail.com with ESMTPSA id t9-20020a7bc3c9000000b003fe23b10fdfsm13150988wmj.36.2023.09.17.11.37.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 11:37:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] recipetool/devtool: Ensure server knows about changed files
Date: Sun, 17 Sep 2023 19:37:29 +0100
Message-Id: <20230917183730.571417-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 18:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187814

Bitbake has changed to require notification when metadata changes in the middle of tinfoil
sessions. Add the required function calls at the places metadata is changed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/standard.py  | 1 +
 scripts/lib/devtool/upgrade.py   | 1 +
 scripts/lib/recipetool/append.py | 3 ++-
 scripts/lib/recipetool/create.py | 1 +
 scripts/lib/recipetool/setvar.py | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 88a6ecd4219..d53fb810071 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -587,6 +587,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         preservestampfile = os.path.join(sstate_manifests, 'preserve-stamps')
         with open(preservestampfile, 'w') as f:
             f.write(d.getVar('STAMP'))
+        tinfoil.modified_files()
         try:
             if is_kernel_yocto:
                 # We need to generate the kernel config
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index e015a85982c..487308912f7 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -429,6 +429,7 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
         newvalues["LIC_FILES_CHKSUM"] = newlicchksum
         _add_license_diff_to_recipe(fullpath, license_diff)
 
+    tinfoil.modified_files()
     try:
         rd = tinfoil.parse_recipe_file(fullpath, False)
     except bb.tinfoil.TinfoilCommandFailed as e:
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 88ed8c5f018..9dbb1cc4b5a 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -300,6 +300,7 @@ def appendfile(args):
                     perms = '0755'
             install = {args.newfile: (args.targetpath, perms)}
         oe.recipeutils.bbappend_recipe(rd, args.destlayer, {args.newfile: sourcepath}, install, wildcardver=args.wildcard_version, machine=args.machine)
+        tinfoil.modified_files()
         return 0
     else:
         if alternative_pns:
@@ -355,7 +356,7 @@ def appendsrc(args, files, rd, extralines=None):
         copyfiles[newfile] = srcfile
 
     oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines)
-
+    tinfoil.modified_files()
 
 def appendsrcfiles(parser, args):
     recipedata = _parse_recipe(args.recipe, tinfoil)
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index f9dda3c2f96..143bc63e9da 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -901,6 +901,7 @@ def create_recipe(args):
                 f.write('%s\n' % line)
                 lastline = line
         log_info_cond('Recipe %s has been created; further editing may be required to make it fully functional' % outfile, args.devtool)
+        tinfoil.modified_files()
 
     if tempsrc:
         if args.keep_temp:
diff --git a/scripts/lib/recipetool/setvar.py b/scripts/lib/recipetool/setvar.py
index f8e2ee75fbe..b5ad335cae1 100644
--- a/scripts/lib/recipetool/setvar.py
+++ b/scripts/lib/recipetool/setvar.py
@@ -49,6 +49,7 @@ def setvar(args):
         for patch in patches:
             for line in patch:
                 sys.stdout.write(line)
+    tinfoil.modified_files()
     return 0
 
 
-- 
2.39.2


