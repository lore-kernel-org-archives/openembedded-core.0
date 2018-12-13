Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E16776D494
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:02 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id a14so1654451plm.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hD3ZX8c8O/qpx/QNm7B3wB6xy02vrM+pOXKYGNGxwec=;
	b=pCxgzCsil1Hiim9Uq06VWY4aWhwEcHiECoEihoZqSXoIBvNqsiuYMCkExxlrbUKRv8
	qvqTHBA0fVAU3lPmyaq2p90n5X9G0UX0Ls1cIRd1FYryTJwJehDD11U6Yp0iwl93hOTI
	dwjoNME9NtAl1IfMS9vTtMIY/l8FnbGCn1OE8zcWR9RdQCxVF219HtOX+6H6BdyTGz1Y
	O0s0doS7Ji7EKMyWGU4pN23SGt0KIHHAnsV8swaFAE/NT5qLKVdFkNlyIytFzQHXFoGo
	E+NqS8SvVDvh+Oh3GvR4v3oCVfmMWb0uz0/Qcrx5ZgT/EdYRUjEX9gkphTnv34M17FyC
	C2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hD3ZX8c8O/qpx/QNm7B3wB6xy02vrM+pOXKYGNGxwec=;
	b=i04NyYe6JLKu2KZQBihGqEFobHM+xQ0vpBhtWfufXPN46GWXAXZWyG0wHzUn+E/YBk
	TO/GLjOVXWLcBGfVMJ/EsilYn7zXR+P9veNkR+pp94lVKroxVulcawm5H+Zo4LwYrp2p
	lz2iWPVr6BI8vNbcxuV4b/0O2PkiAvAWUPT83hrJYMmuFORTWvSsaWroz41d93x5biky
	A1vYW7tSi7FXU2YBbDjYDwIZ1QzxI31cZ9jwhnBwChvDvZ87NwUmKNuN7kfvHse8xahM
	t8WEkr5xAX3S/qG/1yhZAew2ctHHGWInWXGnVmFjqnOYZUus3j4XuPddJ4qpkDOMdsyu
	GtTQ==
X-Gm-Message-State: AA+aEWb1FOY7PrScUwGh30MZahAwENfPWG3eaw3LwOOM+uc54WlMS4eh
	HsaNti/5DhIElZTJSkYdemfgnRfD
X-Google-Smtp-Source: AFSGD/Xv9YlzEu9FbBA+QyeqYXcxiQxHxq5DXQV7hXUfYLWPVzhdMXLfv8kRN28UPdBWQzV7dcq3cg==
X-Received: by 2002:a17:902:720c:: with SMTP id
	ba12mr431239plb.79.1544737143870; 
	Thu, 13 Dec 2018 13:39:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:10 -0800
Message-Id: <b515971cb7f8c8aca821c4ba282067a9f5ea1b6a.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 02/45] scripts/runqemu: Tidy up lock handling code
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:03 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Various tweaks:
- Balance up the aquire/release functions
- Use debug messge for both acquiring and release message for consistency in logs
- Use None instead of an empty string
- Reset the value of the field if we don't have the lock any more

(From OE-Core rev: d3c052e6ccd81d544b23a3bee80ba00cafaedbbd)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c9a351e..a83c8a6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -218,7 +218,7 @@ class BaseConfig(object):
         self.tcpserial_portnum = ''
         self.custombiosdir = ''
         self.lock = ''
-        self.lock_descriptor = ''
+        self.lock_descriptor = None
         self.bitbake_e = ''
         self.snapshot = False
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
@@ -252,13 +252,17 @@ class BaseConfig(object):
                 logger.info(msg)
             if self.lock_descriptor:
                 self.lock_descriptor.close()
+                self.lock_descriptor = None
             return False
         return True
 
     def release_lock(self):
-        fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
-        self.lock_descriptor.close()
-        os.remove(self.lock)
+        if self.lock_descriptor:
+            logger.debug("Releasing lockfile for tap device '%s'" % self.tap)
+            fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
+            self.lock_descriptor.close()
+            os.remove(self.lock)
+            self.lock_descriptor = None
 
     def get(self, key):
         if key in self.d:
@@ -1232,9 +1236,7 @@ class BaseConfig(object):
             cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.bindir_native)
             logger.debug('Running %s' % cmd)
             subprocess.check_call(cmd, shell=True)
-        if self.lock_descriptor:
-            logger.info("Releasing lockfile for tap device '%s'" % self.tap)
-            self.release_lock()
+        self.release_lock()
 
         if self.nfs_running:
             logger.info("Shutting down the userspace NFS server...")
-- 
2.7.4


