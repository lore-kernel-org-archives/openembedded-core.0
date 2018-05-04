Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 934C174B7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 19:31:38 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f20so9393167pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wkAwyK/6UFpkxredOCkitKmefxfx8EagHYyMJ5PJqgM=;
	b=YFJWJJ9V77pmgvRo6iYLTyRQm+0QendFE9wC3jPHTsqxvCjkzPguh/nY3YmuFSx3R0
	OZvNRhQg8hlbUhfMrfZJkkJAHxGP6yEor6++nwTFyen5gtMTe/O2do/JtcrtkenrvxL3
	Bz5aYjJmSrIZ8qzN5fXst/akQDQyCk2TTy3HS6q8S5l7qaAgAOBhQbVyStwUd8CI3DV5
	NW3XpzxX28tPIorneWsbZhJCM5RwlnnclJFRx5T5lohjkCqE2zFR0d+Kxq3E/U3tdxsf
	Sfl0wSpvxXmbhIGWcULPJaqKhs0xly5Cxj7O5KvEM64wFH6e599GS3lbFHQ+FB7iS/Tw
	RGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wkAwyK/6UFpkxredOCkitKmefxfx8EagHYyMJ5PJqgM=;
	b=KgWBS41RGPWMoalq+SBVLxjyWGDaxRDaWLg2Wf3WWhhTTBvKu6P8mEeEw361jB6VCp
	/mrTKxaqf7KBEEZF+aPvvbCdwaRElQL1oBTFXZ992CLyvQyi//D4NJSxVH/n7x+ATb+2
	WM65dNPGhjFxv9I2n8CfZfJBQIV2SaVSUA9+8qfji43pHjEoExIE/hHmNPdxrX8JH87I
	RERBMjM9iGrEF+DkJxWq+8g94QPWEK6DB7rl47Ms0K0kU37eRFg9euyeuf02bvmxKxSJ
	QOhCYyvw1ihEGJcNy0HD+IhYGT5IjEs/1yBbnfUXuHTCS9N+hOeMTy+P0XE5mnQXkmFb
	0bYw==
X-Gm-Message-State: ALQs6tBO4IDFWyR3oxaIhTa2+dK4V8mJeuZdhCfLAOrEUh+/3n1DeRLE
	FVk8pq8Tz0M4ZhLOV+uwrVAJMg==
X-Google-Smtp-Source: AB8JxZox0Hfpg0p9jbNC+Owvp39ow1e4T0h2utH/Qx/xkbOubbFKkfw6uRC+3zlAImZSzjOoV8USjg==
X-Received: by 2002:a17:902:b286:: with SMTP id
	u6-v6mr29275182plr.68.1525462299423; 
	Fri, 04 May 2018 12:31:39 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	g207sm32105371pfb.18.2018.05.04.12.31.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 12:31:38 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 12:31:30 -0700
Message-Id: <1525462293-28047-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [rocko][PATCH 1/4] Revert "package.bbclass: Add '-b' option to file call in isELF"
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
X-List-Received-Date: Fri, 04 May 2018 19:31:38 -0000

This reverts commit 46ddc11a8be79515b4ab9f9f7568c3d624ac72fe.

The change is good in master but became subtly broken during the
backport to rocko. Either the path passed to file should be quoted
using double quotes (with any " chars in the path being escaped) or
the path should be quoted using single quotes (and then any " chars
in the path should NOT be escaped). Escaping " chars and using single
quotes will cause problems for filenames containing " chars.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 meta/lib/oe/package.py       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cee64f3..2053d46 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -901,7 +901,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 599fca6..1e5c3aa 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -73,7 +73,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     def is_elf(path):
         exec_type = 0
         ret, result = oe.utils.getstatusoutput(
-            "file -b \"%s\"" % path.replace("\"", "\\\""))
+            "file \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-- 
1.9.1


