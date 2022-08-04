Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFB0C25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 23:31:05 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.1031.1659655861613948122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 16:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=A8E9j2dp;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id CFC5720FFD82; Thu,  4 Aug 2022 16:31:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CFC5720FFD82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1659655860;
	bh=efbDpvcxUK3T1+3aRBPOaAaad99FxAXuKEVsmV3Oa0c=;
	h=From:To:Subject:Date:From;
	b=A8E9j2dpOypljpw4OA4SilTkSurJiTO0625j7RD7ruFRQGe4rdndyPg22kBwtOB2R
	 UGFdhB1uS+LHHMsDuYI97s18z97UC+IdwB04UsAjhJyzlPDRdpq6DQNDJI5n87hl1O
	 2aNT2W6pTIpWQmn0yNi0UF4i3A7s+GR7wT57YK7Y=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] relocate_sdk.py: ensure interpreter size error causes
 relocation to fail
Date: Thu,  4 Aug 2022 16:30:59 -0700
Message-Id: 
 <1659655859-25919-1-git-send-email-paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 23:31:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168878

From: Paul Eggleton <paul.eggleton@microsoft.com>

If there is insufficent space to change the interpreter, we were
printing an error here but the overall script did not return an error
code, and thus the SDK installation appeared to succeed - but some of
the binaries will not be in a working state. Allow the relocation to
proceed (so we still get a full list of the failures) but error out at
the end so that the installation is halted.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 scripts/relocate_sdk.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 4ed8bfc..8a72872 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -104,11 +104,12 @@ def change_interpreter(elf_file_name):
             if (len(new_dl_path) >= p_filesz):
                 print("ERROR: could not relocate %s, interp size = %i and %i is needed." \
                     % (elf_file_name, p_memsz, len(new_dl_path) + 1))
-                break
+                return False
             dl_path = new_dl_path + b("\0") * (p_filesz - len(new_dl_path))
             f.seek(p_offset)
             f.write(dl_path)
             break
+    return True
 
 def change_dl_sysdirs(elf_file_name):
     if arch == 32:
@@ -222,6 +223,7 @@ else:
 
 executables_list = sys.argv[3:]
 
+errors = False
 for e in executables_list:
     perms = os.stat(e)[stat.ST_MODE]
     if os.access(e, os.W_OK|os.R_OK):
@@ -247,7 +249,8 @@ for e in executables_list:
         arch = get_arch()
         if arch:
             parse_elf_header()
-            change_interpreter(e)
+            if not change_interpreter(e):
+                errors = True
             change_dl_sysdirs(e)
 
     """ change permissions back """
@@ -260,3 +263,6 @@ for e in executables_list:
         print("New file size for %s is different. Looks like a relocation error!", e)
         sys.exit(-1)
 
+if errors:
+    print("Relocation of one or more executables failed.")
+    sys.exit(-1)
-- 
1.8.3.1


