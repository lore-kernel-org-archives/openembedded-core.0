Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id B67FE746A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 19:12:28 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id i5-v6so3669246plt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+41lvvBzSP7hRJIhymsShxxwBuWb+6tswMqL37hjpXI=;
	b=AziaRwyl39BBcXT1vBOEsX6FH/qLf2xdvsxxN+DrVk9fg6S0D8seJp3LT0V0KLEAIK
	+vqQ6UX0K9uHEsUDGO4EXy/nKayyirjycjhPU8Jb6+4g/rRydrZAl1fTrYt+kfpRA+ak
	B4RhnrNZ3mys6d18vY7+7n5Z5C4I7R3sZI50Slypm5ETv/NfNWb5zsXhkjySCyqpR2bB
	mPVa9jzeUmN8XHmGxIw0NpixcQZQC9yA8DdkjcoZGKVAp1TViCeuQ8HxuAnq7rjmzSvk
	+e5EXZ3pB4pt7xws/6hRtcFfIFXFI2valORT8ZFjXS7s/dq196tpciNjYZfb8z/Cps5H
	OVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+41lvvBzSP7hRJIhymsShxxwBuWb+6tswMqL37hjpXI=;
	b=c9xOrNqbend2o9djgAT6pHj9zlJ87yj/Gz+4xU+CyTg5XglLd7fygr67xzjdwRy6lp
	j4B7vPV3UCGd88zGMsCLsccFw7U/MQ7TXflBFjMA3t8fvzKC9mScmmGzIA/2VJjOxpdV
	SOqGCqBx2p+iR1mvfsWIeyIOwd93E0ejB2REVIGLCoHzYnKHzXjLNqBHahmr3qhbMVLr
	ILC+ztHWO3Bsm7Z9yk3RmaHsyyhIdH1w9RYRVKFxV9UgbE9FbUegNL8auzVB7d8qCe33
	FdCF4NHq66NwOOS7/Hlxx/Cpk5w/iGfHhKN0nYUzeRNnJNqYql+fjdwttx/xqfkIXnkR
	71kQ==
X-Gm-Message-State: ALKqPweUoXiBTP33LaCReSIEUPc6kJiTJQJFghTms2nda4/5c+zadgUl
	6rGAz7o4bzM1er7tB1PUY6jHYA==
X-Google-Smtp-Source: AB8JxZqWvL1D85DFtk5NQwjffNopfOus4IVsKZ7Pb7g1KKzOxPWBlDSOMLvnoDODVVOGxCaMhfMAPg==
X-Received: by 2002:a17:902:43a4:: with SMTP id
	j33-v6mr3916916pld.118.1527275549176; 
	Fri, 25 May 2018 12:12:29 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a4-v6sm54447252pfj.19.2018.05.25.12.12.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 12:12:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 12:12:20 -0700
Message-Id: <1527275541-6450-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527275541-6450-1-git-send-email-armccurdy@gmail.com>
References: <1527275541-6450-1-git-send-email-armccurdy@gmail.com>
Subject: [pyro][PATCH 2/3] package.bbclass: Add '-b' option to file call in isELF
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
X-List-Received-Date: Fri, 25 May 2018 19:12:28 -0000

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
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 meta/classes/staging.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 77bbe76..fbf93aa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -898,7 +898,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
+        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path)
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 984051d..bff0437 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -84,7 +84,7 @@ python sysroot_strip () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file -b \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-- 
1.9.1


