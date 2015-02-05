Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 00E4972E6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:36 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so2411896pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RD8AGMIczgvWwxLauWwvQ+y+/b83qRkFvwp/H3t4/Ww=;
	b=B+/wq8R8e/0fpt0JpRHZQa63TU2uICM2AZNvhaO4HmJmoM9wW30VWCGw1WxttEN9hE
	hxtnC1tSwrDR/F7W3XsVrwCGxyWCPsZHPyTJ5ynPGqo7AlCM+1LnnI5CuHiYt4NP/kO9
	5Kf5hfHLAxyt56bclq1ulVoo5VDei6PFxovuZPDQmCYPWwZ9FkrwWRD6eNvmvvck8IDt
	VWkcE1OhAqMdjNC3a6BXGc8CldEzcAE8OZfKvZy/V94qI9sVGBEbTgfVH7UcL0KVJlI6
	0Mo1dGEXBQ+2xZYpjcqx12kuf7nX8FbELPWwJ9eoxuenhTL9h7NXjkiHo8IQF0Aw4tWx
	dL+A==
X-Received: by 10.70.140.44 with SMTP id rd12mr6926406pdb.64.1423152338169;
	Thu, 05 Feb 2015 08:05:38 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:50 -0800
Message-Id: <35de9eaaa8cebe6b1c7d187ec3732e4ce2122e48.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 42/61] bitbake: siggen: Ensure taskdata default functions exist in base class
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:39 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The get/set_taskdata functions are now part of the API of the class,
ensure they exist in the base class definition so the noop handler
works.

[YOCTO #7233]

(Bitbake rev: 9b5b1bd7d77e3f5886f6c557d3b750de1f6d6025)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 bitbake/lib/bb/siggen.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index ef683ba..e77be6a 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -62,6 +62,13 @@ class SignatureGenerator(object):
     def dump_sigs(self, dataCache, options):
         return
 
+    def get_taskdata(self):
+       return (self.runtaskdeps, self.taskhash, self.file_checksum_values)
+
+    def set_taskdata(self, data):
+        self.runtaskdeps, self.taskhash, self.file_checksum_values = data
+
+
 class SignatureGeneratorBasic(SignatureGenerator):
     """
     """
@@ -198,12 +205,6 @@ class SignatureGeneratorBasic(SignatureGenerator):
         #d.setVar("BB_TASKHASH_task-%s" % task, taskhash[task])
         return h
 
-    def get_taskdata(self):
-       return (self.runtaskdeps, self.taskhash, self.file_checksum_values)
-
-    def set_taskdata(self, data):
-        self.runtaskdeps, self.taskhash, self.file_checksum_values = data
-
     def dump_sigtask(self, fn, task, stampbase, runtime):
         k = fn + "." + task
         if runtime == "customfile":
-- 
1.9.1


