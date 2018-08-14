Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD357902D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 17:32:08 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id c14-v6so13071147wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/ojDLy8ns9osHem184QtcN4v7wWHz970V6NNcinPklM=;
	b=SNQEOFPhs00C5HEoOTwchADqwU1NNExSpEPIOT5lWySX8saFO0UsOWfScYWcFe57G4
	QH+zPEIZMHjnaKFq3Pm1VIjIqcSM8W9/oarD28bwjVl7/SQmVuU7ax/PBuXLcx6t6jQs
	vfNpO0f3lVQfCIJGH+C1pAFUbwNzEdyRLgkX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/ojDLy8ns9osHem184QtcN4v7wWHz970V6NNcinPklM=;
	b=Rg4FjnQope63wJdFpjXvoWf3hT70ddDwlyuMWam98wwL6gheh4tSJUkbRH433Mnnxx
	YZJP2wqpGZ9ZnNGg7DlpfSrwuUMOIKepDt9q99qEsG0KAyhvSn9gJM/9ki4I7UyZSKSP
	/Hz2/b0ghFQclPVl1R39EtdLr2LV0/C5UHEh4xkTGcEu75h8PjNgxxynqxQKo7AdSBj6
	8MEvxJx2Dt3M90m90s/p9hdakF2KsdiMw6QcnHCdlFnC5KZ4kzbONKAeWplpTucze4ar
	6aH7Pi3pCTNPO5smSOv87y8y7mDeCy3FsNnA38TUOS/8kJyPEvFVh6zlGm/Yo0h2Y4Gh
	LFdw==
X-Gm-Message-State: AOUpUlEGGFokrbHBuTnZHAFZyw1IBL3Wnr7axCC7CAX3k1ia1cJ9par/
	WyHKkhY0HDvlYdoldcrg5BiGf3YCxqQ=
X-Google-Smtp-Source: AA+uWPyS4iNpW/LSdR5O3xqWl1VOHTDqDYml2L4zb4v67X/ExHP0xZOx+8mNV0DpQ4p54ZxfIRR2+w==
X-Received: by 2002:a1c:838a:: with SMTP id
	f132-v6mr11792689wmd.127.1534267928831; 
	Tue, 14 Aug 2018 10:32:08 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm14519462wmt.30.2018.08.14.10.32.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 10:32:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 18:32:00 +0100
Message-Id: <20180814173201.6723-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
References: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/6] sstate/lib.oe.path: Ensure file sparseness is preserved
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
X-List-Received-Date: Tue, 14 Aug 2018 17:32:08 -0000

Files when restored from sstate were missing their sparseness. Fix up various
functions to preserve this and make things more deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 4 ++--
 meta/lib/oe/path.py         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a091c6e843e..1c166ff6745 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -721,9 +721,9 @@ sstate_create_package () {
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
         # Use pigz if available
-        OPT="-cz"
+        OPT="-czS"
         if [ -x "$(command -v pigz)" ]; then
-            OPT="-I pigz -c"
+            OPT="-I pigz -cS"
         fi
 
 	# Need to handle empty directories
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index be02218c31d..1e24d0586b6 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -86,7 +86,7 @@ def copytree(src, dst):
     # This way we also preserve hardlinks between files in the tree.
 
     bb.utils.mkdirhier(dst)
-    cmd = "tar --xattrs --xattrs-include='*' -cf - -C %s -p . | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
+    cmd = "tar --xattrs --xattrs-include='*' -cf - -S -C %s -p . | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 def copyhardlinktree(src, dst):
@@ -98,7 +98,7 @@ def copyhardlinktree(src, dst):
     if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
-        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
+        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
         source = ''
         if os.path.isdir(src):
-- 
2.17.1


