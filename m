Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 078D86ED56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 19:33:01 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id uo5so15750410pbc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/2KqEcxfwWJne3n4nUGh18yPP8be1ir/z1Tx/yo+EAc=;
	b=QezpMaxoMzUTzbWqb9iF5mNcPsdXz2I1Ht7SI51ZCvrF8+xPG+gMYr6mzJYxRBKi15
	r2ZzsZA99CA2F9q8mj4r24CdEA+d6+OvST4HZPLkXOWMhj6y0vrnzUhsOEWV1TnFnnNe
	o8rDchqP8Eb3wPZqGPV88xPSMx8lev6y0aEIpANvmEZwdvATsllZDHJDn/aF8272MJzM
	7uX3qC7U9nP0CmBnpg7OojYIyzlEnCVj0oNbtNQYeLFT43c5MprCINQthpFG75sEXV28
	VqFspkrZtGzpi+1JA4qOxtxHFPSBbwhoiwWUDyjMVDW84bLqQL5LCg3AhhJcaq7lAEW4
	cPpg==
X-Received: by 10.66.129.133 with SMTP id nw5mr28113216pab.98.1392665582330;
	Mon, 17 Feb 2014 11:33:02 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	nm5sm48339985pbc.29.2014.02.17.11.33.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 11:33:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 11:34:15 -0800
Message-Id: <af841644dfc682e9774287331ef39c3cd1ede978.1392665521.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
References: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
In-Reply-To: <cover.1392665521.git.raj.khem@gmail.com>
References: <cover.1392665521.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] rootfs.py: Check for LDCONFIGDEPEND being empty string
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
X-List-Received-Date: Mon, 17 Feb 2014 19:33:01 -0000

We override LDCONFIGDEPEND to be empty string for uclibc
however the current check is for it being None as a result
the function is still executed but ldconfig-native is not
built as dependency for rootfs when building with uclibc

Fixes errors like below

File:
'/home/kraj/work/angstrom-repo/sources/openembedded-core/meta/lib/oe/rootfs.py',
lineno: 191, function: _run_ldconfig
     0187:    def _run_ldconfig(self):
     0188:        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
     0189:            bb.note("Executing: ldconfig -r" +
self.image_rootfs + "-c new -v")
     0190:            self._exec_shell_cmd(['ldconfig', '-r',
self.image_rootfs, '-c',
 *** 0191:                                  'new', '-v'])

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/rootfs.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d149ca3..3bcb812 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -185,7 +185,7 @@ class Rootfs(object):
                         self._handle_intercept_failure(registered_pkgs)
 
     def _run_ldconfig(self):
-        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
+        if self.d.getVar('LDCONFIGDEPEND', True) != "":
             bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c new -v")
             self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
                                   'new', '-v'])
-- 
1.7.10.4


