Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1A374D59
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 19:31:42 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q22so18181665pff.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 12:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DiyZBrp3BSwKtsL8sFxKVsGIaw9/hqo4wy6URgnqd/E=;
	b=JlYjP4g+E9cNSHYvzFPbZiGUQmWmo1ZhAIpps0R4j4o+3XivoP02SmYUViA285oxX+
	En9OoDtEiK+79MX8+F76aQs8MKVjE9rBkCaYHpxAkpulwimY7EFncsBpNPK7l/otF0EH
	nREym1f3LMRHw1PRWoDscRV90zjbNfCkb62nco4Jt/yG6DHPyD3gxN+wr4yHDlJG+3Q6
	elCip73LzFPvQhN7i9czBstqdIVA72LbYma6DQCaeLSml1E/+z1QNvUm+tZdh1ws0DP5
	JuT+aDuYwPBuHjX5vZyJ+poFLxAKpvppH3H4LAf/YeDL2IoHq6ZZe6WijaR8txGJQpnx
	++iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DiyZBrp3BSwKtsL8sFxKVsGIaw9/hqo4wy6URgnqd/E=;
	b=IWIkd46yTjhrtzTgvFj29UnyiNaclvJlRfzG9/9GxKqwXIekX3f16/qwUjkwgdDCix
	AFAj0xI2/aQnn3gh9ofBJDKDHxNkPU0/Py1XrM7rpQN9f3VNWRyQn076ZFtSNZ2RQNFY
	qYbWuD3/TnDKv59AfZ1D+u6pjem6izc1A+Hm7uwiobCsiiHikHP/NltUSO8qX0SImFph
	mC6SpqIWvUGa/BKIwkYeE1XuuIvaFkMdVVpKXfT4p6WRe6zFNPVBq3iSY1ov1aTVHxeC
	dUYlXmywbBcuMklIjMVwVCbwLCJHWtv2CJDuNB+UKuU+MBpdJMTn9V7ZlBHPRIisvC/D
	01KQ==
X-Gm-Message-State: ALQs6tB9lnWn9sD9arOOif5WBOmxIdd/daFYCx1lZxkjhqtU8js7Ktal
	r5xq7p8Uco1rcrImympzoXiOig==
X-Google-Smtp-Source: AB8JxZogFgvp9XZRZOcR1zHMN18ouXMKXOxZyogR0YtRvC+e0rD7KvIZwLU7Ba/Ca4An9QuLRBvBSg==
X-Received: by 2002:a17:902:ab93:: with SMTP id
	f19-v6mr28461739plr.392.1525462303716; 
	Fri, 04 May 2018 12:31:43 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	g207sm32105371pfb.18.2018.05.04.12.31.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 12:31:43 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 12:31:32 -0700
Message-Id: <1525462293-28047-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525462293-28047-1-git-send-email-armccurdy@gmail.com>
References: <1525462293-28047-1-git-send-email-armccurdy@gmail.com>
Subject: [rocko][PATCH 3/4] package.bbclass: Add '-b' option to file call in isELF
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2018 19:31:43 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The isELF function works by running:

   result = file <pathname>
   if 'ELF' in result

By default 'file' will prepend the result with the path name of the file
that is being checked.  This usually works fine, such as:

$ file /home/foo/openembedded-core/meta/classes/package.bbclass
/home/foo/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines

However, if the path includes 'ELF', ELF will end up in the result, and then
the check will return positive.

$ file /home/ELF/openembedded-core/meta/classes/package.bbclass
/home/ELF/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines

This will then result in the isELF coming back true, and possibly causing the
checks that use isELF, such as the 'is it already stripped' check, to do the
incorrect thing.

Adding the '-b' option to file will result in the path being omitted in the
result:

$ file /home/ELF/openembedded-core/meta/classes/package.bbclass
Python script, ASCII text executable, with very long lines

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 5a324e9b2cf6378f8eaa4e394f9cb36d4e2680ac)
---
 meta/classes/package.bbclass | 2 +-
 meta/lib/oe/package.py       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e68299e..2a5d8a5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -901,7 +901,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
+        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path)
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1e5c3aa..599fca6 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -73,7 +73,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     def is_elf(path):
         exec_type = 0
         ret, result = oe.utils.getstatusoutput(
-            "file \"%s\"" % path.replace("\"", "\\\""))
+            "file -b \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-- 
1.9.1


