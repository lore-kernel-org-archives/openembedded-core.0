Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 11AF775F3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 22:54:35 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so192592890pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 15:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SKdfh3c/vlHiV9AIr6doeNYOHf4N2KsOsWqRrto9oDE=;
	b=R3rzNZTDLXOELKy6n1EiBWkyQINoDsxNOdD2SKerpdEKHrfn2iajY+qs9Jbjv9bLu9
	zR0rcooxygNh9Psec246+cs4u1jtn8+Q6qMAen3+Ewbd90rR6onUIyZICIx5mT49GteA
	bnVSUA8W6GZbeU+RvEeGKyV9b9gITuY/1pTkaifSwtf3AUCAAHk4kI3aRzpADn0ZUMm1
	fZi3q91aF9ZbhnMvdr34CTDWbV6IXH1IBri+qhIIerHuPBWln+mMw7BBxAw6t1xBj7jP
	nnW8Y3NN1RowCQdIN9cgG5WGyCIYCmel8ofwGamVWTgRcEvDJV80M8rM+qzm+CMsP8AQ
	exGA==
X-Received: by 10.68.227.227 with SMTP id sd3mr9275721pbc.116.1442357675353;
	Tue, 15 Sep 2015 15:54:35 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ch3sm24014395pbb.18.2015.09.15.15.54.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 15:54:34 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 15:56:33 -0700
Message-Id: <1442357793-20405-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] devshell: symlink $TOPDIR to $WORKDIR/topdir
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
X-List-Received-Date: Tue, 15 Sep 2015 22:54:36 -0000

From: Christopher Larson <chris_larson@mentor.com>

It's quite common to need to copy files out of the devshell back to your
layers, but most of the variables referring to such paths are not exported
(and in some cases, should not be, as it'll affect buildsystems we run, e.g.
TOPDIR/BUILDDIR). To resolve this while still making it easier to get files
out of the devshell, create a ${WORKDIR}/topdir symlink to ${TOPDIR}, removing
it after exiting the devshell.

[YOCTO #7670]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/devshell.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 4451436..e2c200c 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -12,7 +12,10 @@ python do_devshell () {
             d.appendVar("OE_TERMINAL_EXPORTS", " " + k[0])
        d.delVarFlag("do_devshell", "fakeroot")
 
+    topdir_link = os.path.join(d.getVar('WORKDIR', True), 'topdir')
+    os.symlink(d.getVar('TOPDIR', True), topdir_link)
     oe_terminal(d.getVar('DEVSHELL', True), 'OpenEmbedded Developer Shell', d)
+    os.unlink(topdir_link)
 }
 
 addtask devshell after do_patch
-- 
2.2.1


