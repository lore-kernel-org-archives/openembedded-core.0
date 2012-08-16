Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T1qkk-0007ej-8a
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 05:28:10 +0200
Received: by pbcwy7 with SMTP id wy7so997495pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 20:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=X1WNJC5oko3ay9whwzFxuAy9sN7mkxN+MFYGvOTzy2Y=;
	b=mTsRJJUd9P+pM8/oLMXsZX3ahorOVMWznOn1iTYf84mXZpdzolKTsGLtPwHMX/hSp2
	4Ra+UxX4sQ0zs9PVCGeTzatpeN2e2oPqXD7/ckmX5r7ELa2tfMK8oz+KIJrwWyO+selI
	q8oxYhFStd3POtyz8Xo7qIluSqyDubLEY8lRgInC3Kp0nSfbtLKzQCisiLZbk/vln9QS
	Wd8ncQVzm1eTDZjD+Wu2WDdicA2vlGeaDEuV+W7fuB3dlMWUqS7NRcpvG4ZofzYvaqAL
	755uGwcE9u8T/fYY9Hp3K2gFCrXWknzFFYcphgDGKVCTqeQ5T01MRWByoCEMKrLplStD
	j7BQ==
Received: by 10.68.217.99 with SMTP id ox3mr249438pbc.47.1345086972108;
	Wed, 15 Aug 2012 20:16:12 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rg5sm1669730pbc.61.2012.08.15.20.16.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 20:16:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2012 20:15:46 -0700
Message-Id: <1345086946-3715-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] chrpath.bbclass: Account for case when ORIGIN is in RPATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 03:28:10 -0000

This fixes a case when RPATH embedded in program have one of
its path already relative to ORIGIN. We were losing that path
if such a path existed. This patch appends it to the new edited
rpath being created when we see it.

so RPATH like below

(RPATH)              Library rpath:
[$ORIGIN/../lib/amd64/jli:$ORIGIN/../jre/lib/amd64/jli]

would end up being empty

but after this patch its kept intact

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/chrpath.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 10b5ca0..861d369 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -48,8 +48,9 @@ def process_dir (directory, d):
             rpaths = curr_rpath.split(":")
             new_rpaths = []
             for rpath in rpaths:
-                # If rpath is already dynamic continue
+                # If rpath is already dynamic copy it to new_rpath and continue
                 if rpath.find("$ORIGIN") != -1:
+                    new_rpaths.append("%s" % (rpath.strip()))
                     continue
                 # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
                 # base_prefix shared root
-- 
1.7.9.5



