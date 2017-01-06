Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id E9DF96E668
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 12:40:17 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id c85so23576211wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 04:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=MJLoUMH7ud2KbaLgMwFyhsSYjHT74g959OAHR5I42P4=;
	b=trCjUarhOWApouAtFE20Lqgkpt+g0gEtBPB+EIsYEBXfPl8VLUQVuRoVYantKlVtOd
	uNyXzkb7GP58KKDvLxpVcfFXASY2/EF3jo8z+e2cireYeIX40h5E9Ac83fyuoR83sdav
	DtUWhM3vVUCLudc9vD3deuRpKimyB0ctB06jKrGfTFCPqov1EoEZO+b8R94xJcXNIXQ1
	0TnxhSG7Prg950X6qVP5wVXP0iXUTnq7OegRBydnrnvUkT8/D+Tan5ZBTiEyqzc7mVwU
	wW8e5KXUYqu2J/UlZiwNN7+36TWjDios0yUP+27oA7lLmQ4MdXrqPSkt4+SkmgCftAeM
	jJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MJLoUMH7ud2KbaLgMwFyhsSYjHT74g959OAHR5I42P4=;
	b=FFVi+giOP0y19gMLUDk+eDsFZIEOxJzR83xsCZRgcXbuYiGlDhPqN1EC2mVRMwIFbB
	w39lMqzqQc7pLgmlQb4SksQ3AHmwXyaV2QtUEprZcYHEwuq3shi3U5gYd3YQ5hhqRT78
	+8+mkpIjy6ugF7GgmF7j8ULecB9TwPmc+ciFZk6ZL4+xt9FMcof3PtdD8Vn2cksdoryp
	C6DUBrCSijJtIHt4PTx1ASqqYcEnVxGpNfhTV586XVJTLejquSCjOctiG6uZXUDCDMAh
	8xEjgcD1KHg+j8N6qOMNpZbWGqlipnrHweAk4OxBnDJWSSNCbpIKUAcneXDk7OG0wDjI
	ohBg==
X-Gm-Message-State: AIkVDXKC/GqPRF/Tx8yKcGsz39ZuoYp5O6gsYKnTZ9sMmB/mHuayXdOtDvvCGEk1NfzysdzF
X-Received: by 10.28.48.145 with SMTP id w139mr3695673wmw.113.1483706417459;
	Fri, 06 Jan 2017 04:40:17 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i132sm3182149wmf.14.2017.01.06.04.40.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Jan 2017 04:40:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2017 12:40:14 +0000
Message-Id: <1483706414-6903-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] selftest/devtool: update test to work with new mtd-utils
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
X-List-Received-Date: Fri, 06 Jan 2017 12:40:18 -0000

The new mtd-utils (version 2.0) has been autotooled so the test needs to touch
Makefile.am instead of Makefile.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index a3beefa..2512c69 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -688,7 +688,7 @@ class DevtoolTests(DevtoolBase):
         self._check_src_repo(tempdir)
         # Add a couple of commits
         # FIXME: this only tests adding, need to also test update and remove
-        result = runCmd('echo "# Additional line" >> Makefile', cwd=tempdir)
+        result = runCmd('echo "# Additional line" >> Makefile.am', cwd=tempdir)
         result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempdir)
         result = runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
         result = runCmd('git add devtool-new-file', cwd=tempdir)
@@ -825,7 +825,7 @@ class DevtoolTests(DevtoolBase):
         # Check git repo
         self._check_src_repo(tempsrcdir)
         # Add a commit
-        result = runCmd('echo "# Additional line" >> Makefile', cwd=tempsrcdir)
+        result = runCmd('echo "# Additional line" >> Makefile.am', cwd=tempsrcdir)
         result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
         self.add_command_to_tearDown('cd %s; rm -f %s/*.patch; git checkout .' % (os.path.dirname(recipefile), testrecipe))
         # Create a temporary layer
-- 
2.8.1


