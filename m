Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDB7C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 14:54:35 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.73475.1698591269561971761
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 07:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mmdD/ix2;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-41c157bbd30so25157351cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698591268; x=1699196068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rtk0RRAfaCx602kQzttTa5gTshxaLFXb8WF7Vni98Wc=;
        b=mmdD/ix2xUJDYH1xKehiuE7bohL43OtqRNKIC+oFhSkxnbHUBf519l7FV0PkqRuLq7
         Jz9fhw3PYwcPTUcC6j9jh24nOO7F8v0DGO7m10ssujlI8CJyVJtLA9ZOyocMoFc/aAxS
         m3xm1yyFH9+GPYtmVBm6/WSFDDuXe9BAfcYMiULMZT+2CdPkhDTB2kezmFX7QWWOlEse
         uar6CYuTJjLSfRXtwviJfUjqNWIIS8ziLcyj+4AHHDJj4YTt6PFRm4Ay3yU/w6KKEhVz
         cT+kjnz1uZOnPlOcoZr0RcDNIpXEXd5KqiiUzeXwdUFGSBNQI7oQ1Yl2F9UqEhFbQIk/
         NHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698591268; x=1699196068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rtk0RRAfaCx602kQzttTa5gTshxaLFXb8WF7Vni98Wc=;
        b=U7qjfELl2IYzswJvFd4e5Ziw1VPshKAv+uo4isH2chDh3skuNhcNE8BQ96rG9rI8Hp
         ZzOLJy7CWQNickq0RjpRY55xCm6O5ilXXjB4SkLTFXZQIb5r9zeLDkHQSu/eeAf9YTJW
         Or/OyNE6vZD+Ee/ZsJqlxxHLeIN3x2+sHdWgAx9Eeu06s5EEjfTMSgZsnZntmLwZLIp7
         8zxr3iMndeaOCyVABhi2wBbEeWttq12L5woc8UBWiVabOQdh1aL22mrt3X0Zaqc3yYq3
         Q+bF9fyXoYlW4W3Vn9ssHW4uIWib1LsfyHlgAGT1nVPzO1OPlWxcE7OC5NpVuvdTemdY
         VG/g==
X-Gm-Message-State: AOJu0YxmQxh4jc4WlI+3AVtJvH+tev7RG2Xn7a7lW1ZhC/W/LV9WlmiE
	ptpkWnpfeayHxw2vQVnuUznQavsjVLGKYNi7vn08Xw==
X-Google-Smtp-Source: AGHT+IEMyn20tIRYzfFmlr+heNISE7o+68ozN9tjoWjLrtDd35rYHSBRtDJUDWjhLKtcXliNf7/6sQ==
X-Received: by 2002:ac8:7e96:0:b0:41e:4968:12e4 with SMTP id w22-20020ac87e96000000b0041e496812e4mr9067814qtj.39.1698591268194;
        Sun, 29 Oct 2023 07:54:28 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id r21-20020ac85215000000b00417fa0cd77esm2616814qtn.80.2023.10.29.07.54.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 07:54:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: shorten test result outputs
Date: Sun, 29 Oct 2023 10:54:26 -0400
Message-ID: <20231029145426.212694-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 14:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189776

Some test result lines in TestMbox and TestPatch are still too long to
avoid being flagged by the mailer script. Clean them up by removing
redundant information, so that they are all under the length limit of
220 characters.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_mbox.py  | 14 +++++++-------
 meta/lib/patchtest/tests/test_patch.py |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 95002c9e2a6..2449564d0f2 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -100,7 +100,7 @@ class TestMbox(base.Base):
             self.skip("Skipping merge test since patch is not intended for master branch. Target detected is %s" % PatchTestInput.repo.branch)
         if not PatchTestInput.repo.ismerged:
             commithash, author, date, shortlog = headlog()
-            self.fail('Series does not apply on top of target branch. Rebase your series and ensure the target is correct',
+            self.fail('Series does not apply on top of target branch %s' % PatchTestInput.repo.branch,
                       data=[('Targeted branch', '%s (currently at %s)' % (PatchTestInput.repo.branch, commithash))])
 
     def test_target_mailing_list(self):
@@ -114,7 +114,7 @@ class TestMbox(base.Base):
         for commit in TestMbox.commits:
             match = project_regex.search_string(commit.subject)
             if match:
-                self.fail('Series sent to the wrong mailing list. Check the project\'s README (%s) and send the patch to the indicated list' % match.group('project'),
+                self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
                           commit=commit)
 
         for patch in self.patchset:
@@ -122,7 +122,7 @@ class TestMbox(base.Base):
             base_path = folders[0]
             for project in [self.bitbake, self.doc, self.oe, self.poky]:
                 if base_path in  project.paths:
-                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
+                    self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
                               data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
                                     ('Patch\'s path:', patch.path)])
 
@@ -130,18 +130,18 @@ class TestMbox(base.Base):
             if base_path.startswith('scripts'):
                 for poky_file in self.poky_scripts:
                     if patch.path.startswith(poky_file):
-                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists. Send the series again to the correct mailing list (ML)',
+                        self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
                                   data=[('Suggested ML', '%s [%s]' % (self.poky.listemail, self.poky.gitrepo)),('Patch\'s path:', patch.path)])
 
     def test_mbox_format(self):
         if self.unidiff_parse_error:
-            self.fail('Series cannot be parsed correctly due to malformed diff lines. Create the series again using git-format-patch and ensure it can be applied using git am',
+            self.fail('Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am',
                       data=[('Diff line',self.unidiff_parse_error)])
 
     def test_commit_message_presence(self):
         for commit in TestMbox.commits:
             if not commit.commit_message.strip():
-                self.fail('Mbox is missing a descriptive commit message. Please include a commit message on your patch explaining the change', commit=commit)
+                self.fail('Please include a commit message on your patch explaining the change', commit=commit)
 
     def test_cve_presence_in_commit_message(self):
         if self.unidiff_parse_error:
@@ -161,7 +161,7 @@ class TestMbox(base.Base):
             if not self.patch_prog.search_string(commit.payload):
                 self.skip("No CVE tag in added patch, so not needed in mbox")
             elif not self.prog.search_string(commit.payload):
-                self.fail('Missing or incorrectly formatted CVE tag in mbox. Correct or include the CVE tag in the mbox with format: "CVE: CVE-YYYY-XXXX"',
+                self.fail('A CVE tag should be provided in the commit message with format: "CVE: CVE-YYYY-XXXX"',
                           commit=commit)
 
     def test_bugzilla_entry_format(self):
diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index b6904b185f1..65d0f930b05 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -50,7 +50,7 @@ class TestPatch(base.Base):
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
             if not self.upstream_status_regex.search_string(payload):
-                self.fail('Added patch file is missing Upstream-Status in the header. Add Upstream-Status: <Valid status> to the header',
+                self.fail('Added patch file is missing Upstream-Status: <Valid status> in the commit message',
                           data=[('Standard format', self.standard_format), ('Valid status', self.valid_status)])
             for line in payload.splitlines():
                 if self.patchmetadata_regex.match(line):
@@ -87,7 +87,7 @@ class TestPatch(base.Base):
                 if TestPatch.prog.search_string(payload):
                     break
             else:
-                self.fail('A patch file has been added, but does not have a Signed-off-by tag. Sign off the added patch file (%s)' % newpatch.path)
+                self.fail('A patch file has been added without a Signed-off-by tag. Sign off the added patch file (%s)' % newpatch.path)
 
     def test_cve_tag_format(self):
         for commit in TestPatch.commits:
-- 
2.41.0


