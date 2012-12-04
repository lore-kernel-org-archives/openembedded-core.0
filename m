Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfhaX-0000lD-84
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 02:46:21 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1371848eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SR8uCNnxWHWOHtMxiZ96b8uNqRbBKPpVVbPpJShtjKY=;
	b=xuU8GVfRPbppsL3fb21Rr4ouY9ylmv1WaOi8h9mL7lX3dSx8bog8xR8yhhq5pMCSvV
	YMITxvbcAZYkSWGqZCKP7VUl6cwT2BE1HlNNTd601eJvsjQbjqIW9L60c0tJHnLOxr4h
	tR1hA5UqfREzCLNtFqYsuI+RZzxBPFSbV7RdQYTXR7lv/XkWjIxMBCLor3zD0gJe5BxG
	3vM9nxPvouprU/pFsVXjig3jtsNR+6g/UMsFR7UytQ+8OWRAt20AKpNKKgl7RZBpUYUU
	fFsbr9L8JIMkzrzLM6qj7g7ytt7cLaaVM3CT8Az2QT90mbxbeNsCPt3GIjlMB5ly84mx
	7NDA==
Received: by 10.14.0.133 with SMTP id 5mr16834616eeb.29.1354584721674;
	Mon, 03 Dec 2012 17:32:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i49sm8048362eem.6.2012.12.03.17.32.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:32:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:31:15 +0100
Message-Id: <8e7d8383609d7cfb2c2681d6890a248b841d9898.1354584580.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/6] sstate.bbclass: fix detection of owners matching sstate files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 01:46:21 -0000

* without this patch:
  Python 2.7.3
  >>> sstate_search_cmd = "grep -rl /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime-reverse/vim-common /OE/jansa-test/shr-core/tmp-eglibc/sstate-control --exclude=master.list | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'"
  >>> cmd_array = sstate_search_cmd.split(' ')
  >>> search_output = subprocess.Popen(cmd_array, stdout=subprocess.PIPE).communicate()[0]
  grep: |: No such file or directory
  grep: sed: No such file or directory

* Adding shell=True and using cmd string instead of array makes it work:
  >>> search_output = subprocess.Popen(sstate_search_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0]
  >>> print search_output
  manifest-armv7a-vfp-neon-gvim.package
  manifest-armv7a-vfp-neon-vim-tiny.package
  manifest-armv7a-vfp-neon-vim.package

  But still isn't 100% reliable, I guess it's caused by some other package
  being removed from sstate while grep is already running.
  So sometimes grep can show error on STDERR
  >>> search_output = subprocess.Popen(sstate_search_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0]
  grep: /OE/jansa-test/shr-core/tmp-eglibc/sstate-control/manifest-armv7a-vfp-neon-systemtap.package: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 967ae9b..832b39e 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -169,8 +169,7 @@ def sstate_install(ss, d):
             if realmatch:
                 match.append(f)
                 sstate_search_cmd = "grep -rl %s %s --exclude=master.list | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
-                cmd_array = sstate_search_cmd.split(' ')
-                search_output = subprocess.Popen(cmd_array, stdout=subprocess.PIPE).communicate()[0]
+                search_output = subprocess.Popen(sstate_search_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0]
                 if search_output != "":
                     match.append("Matched in %s" % search_output.rstrip())
     if match:
-- 
1.8.0



