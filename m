Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D7EC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 13:24:48 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.22471.1706880281628110419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 05:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JjVWOoNN;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55fc9a581f8so1948384a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 05:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706880280; x=1707485080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkGzuz2TCFbSU4kQcJwS1pV2sPPXwZ1mHjR8NOuPwuo=;
        b=JjVWOoNNCGLBTDzxf7uYXqdkib28/vBVdioxOJGtmNr2rvUtKxGa3nwgCk67aVLCLQ
         +4QyYcoUDFUuUVm7Y1v8kXhFCmRj/dUxftPWWXrjJiO+8Elv8HsYx67sNuB2HWcNmmLr
         n5j4TioRmmiI13Q1tWKEIjRxPIXyL6I0J+gz6ZDpt4yYb3j5GS3Q6ogxo00ARTPa2KBs
         blkXcRAOR450t+LxI1ik/mMx+o584jbZNqOxhPg+sTJYzn4i2Onyk+nAShwo8TVMMjaX
         8zO9XnG02LkQ07pmPzG9QZP7qEM5Vyz3RIlB8yFb+sjaoRkcBrpnh4KXAS58bHk0xHK0
         a73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706880280; x=1707485080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkGzuz2TCFbSU4kQcJwS1pV2sPPXwZ1mHjR8NOuPwuo=;
        b=K+wQ0GmJMMwUwiQh71UuM6XFbqvY5lVdwU9dOSn4Jrxqmi4pA2m4zYlm2GY5tUZ+lA
         KOF/ufhWvm/23oeeA6CAr29K4cirKPfptH6LogsnKU/UQjPQHGK3UPWt0WDiN9SKTCRP
         mJjqRa+djygRndnIpfMNPBr2XXhToe52AlZFXIeWXzF2xn0un+BJxcHDVEFniTiSbzNY
         ws2qz46tmwCSU53jciFRNWrWo4YHJDq/f+M+SLVcmgbmpBNB9PpkUi6ZGohbh8JNC0MG
         SFstXJLus/b5ag7DqteT7sK9lkx/9nmqWXrHLW3aRcK8IG8oj1jlMZ7EoGli7evGsmch
         3a/A==
X-Gm-Message-State: AOJu0YxCag2VmYaCNNjOBDCdqgLNOTo+ZIleXL0CgpWR4xIo8vyQMzAG
	skBwRxXWBNUWwbe0s0qT74KDDvIXJgYdyQY+zPnV2e2Kg+jTo06ibsHitEgT
X-Google-Smtp-Source: AGHT+IGHxqchNZyeJZv7UMP+jORaRmZzU3PdyxEu7/jFjdKRzm0jyzWkLGI8idLN6p/KpmC/F6mnFA==
X-Received: by 2002:a17:907:9502:b0:a36:cd96:4b34 with SMTP id ew2-20020a170907950200b00a36cd964b34mr1297564ejc.54.1706880279573;
        Fri, 02 Feb 2024 05:24:39 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dr4-20020a170907720400b00a317ca8b422sm880666ejc.92.2024.02.02.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 05:24:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 2/2] package_rpm: add RPMBUILD_EXTRA_PARAMS variable
Date: Fri,  2 Feb 2024 14:24:34 +0100
Message-ID: <20240202132434.1787053-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202132434.1787053-1-martin.jansa@gmail.com>
References: <20240202132434.1787053-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 13:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194796

* e.g. for DISTROs which define extra user-defined fields with
  PACKAGE_ADD_METADATA/PACKAGE_ADD_METADATA_RPM
  as undefined fields in packagedata are fatal error for rpmbuild:
  "error: line 9: Unknown tag: Author: Unspecified"
  as shown in:
  http://errors.yoctoproject.org/Errors/Details/751706/
  with "Author" field added with:

  PACKAGE_CLASSES = "package_rpm"
  PACKAGE_ADD_AUTHOR_METADATA = "test-author"
  PACKAGE_ADD_METADATA = "Author: ${PACKAGE_ADD_AUTHOR_METADATA}"

  to fix rpm build you can use:
  RPMBUILD_EXTRA_PARAMS = " --define '_Author Author'"
  keep in mind that this doesn't cause this Author field to be
  added in .rpm, it just avoids the BUILDSPEC failure.

  and for ipk build:
  OPKG_MAKE_INDEX_EXTRA_PARAMS = "-f"

  alternatively you can avoid additional packagedata fields ending
  in the package manager (if you use them only with buildhistory
  or packagedata) with:
  PACKAGE_ADD_METADATA_RPM = ""
  PACKAGE_ADD_METADATA_IPK = ""
  PACKAGE_ADD_METADATA_DEP = ""

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 819ee50278..f932d2c928 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -683,6 +683,7 @@ python do_package_rpm () {
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
+    rpmbuild_extra_params = d.getVar('RPMBUILD_EXTRA_PARAMS')
 
     # Too many places in dnf stack assume that arch-independent packages are "noarch".
     # Let's not fight against this.
@@ -724,6 +725,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_weak_usergroup_deps 1'"
     cmd = cmd + " --define '_passwd_path " + "/completely/bogus/path" + "'"
     cmd = cmd + " --define '_group_path " + "/completely/bogus/path" + "'"
+    cmd = cmd + rpmbuild_extra_params
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
         cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_RPMOUTDIR') + "'"
-- 
2.43.0


