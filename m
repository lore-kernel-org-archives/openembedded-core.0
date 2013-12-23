Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE3160D74
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 13:38:38 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bz8so6199384wib.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 05:38:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WABp8FXEkWg5+9tm7Udhg0Myp0rPVlWPW0cuxBsdio0=;
	b=CnoZ//66+MrkghaZNRQrbDhxsxTRqGb19Xp+ymc4yTU0JMM2D5A1WtvOmPS+wKCdlS
	gTbARYRFy6Y8TQKezGWOLyP/hqBsP2ovLwd0buldy/mq42CFavDxPQn1V6ML7ac5V/4o
	4aM60YmAhB8xvk6EkArNvS9q6yAu/NQJ5NNtAYYvMvUcVKGJlIgwK2O8rFfw0j61yUfb
	55fi8Vv4IXpTIZ5py0mWs9gWgm8bS1ZI1Ar+SEDk+flRFCAyn0+IqtdqWKijXEpCGQMj
	HGfMEboV3GPbZCtx7dB9oZUnzhKyXnCWF9cM898kmo4zCBiW+Y/zVQ0nWT6mWpN8jjAF
	Q2GA==
X-Gm-Message-State: ALoCoQlAfClfX44BA5q4IzxaLSdGmlhI7i2PsoXJJLbXuUpkyOM3VVSI6QZQi1CzEMP5ZQ7QBEPa
X-Received: by 10.181.12.6 with SMTP id em6mr18797201wid.49.1387805918798;
	Mon, 23 Dec 2013 05:38:38 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id x4sm30867081wif.0.2013.12.23.05.38.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Dec 2013 05:38:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 13:38:34 +0000
Message-Id: <1387805914-15341-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] e2fsprogs: silence debugfs
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
X-List-Received-Date: Mon, 23 Dec 2013 13:38:39 -0000

debugfs echos the commands when it is executing a script, but as the scripts
used at rootfs time are long this massively inflates the do_rootfs log.

Comment out the echo so that the rootfs isn't 20K lines longer than it needs to
be.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../e2fsprogs/e2fsprogs-1.42.8/quiet-debugfs.patch  |   19 +++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/quiet-debugfs.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/quiet-debugfs.patch
new file mode 100644
index 0000000..830e9d5
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/quiet-debugfs.patch
@@ -0,0 +1,19 @@
+When executing a script don't echo every command, as we do this for entire
+filesystems at rootfs time.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
+index 5590295..ac57292 100644
+--- a/debugfs/debugfs.c
++++ b/debugfs/debugfs.c
+@@ -2378,7 +2378,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+ 		cp = strchr(buf, '\r');
+ 		if (cp)
+ 			*cp = 0;
+-		printf("debugfs: %s\n", buf);
++		/*printf("debugfs: %s\n", buf);*/
+ 		retval = ss_execute_line(ss_idx, buf);
+ 		if (retval) {
+ 			ss_perror(ss_idx, retval, buf);
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index 22ad925..6175ce7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://acinclude.m4 \
             file://debugfs-extent-header.patch \
             file://populate-extfs.sh \
             file://e2fsprogs-fix-tests-f_extent_oobounds.patch \
+            file://quiet-debugfs.patch \
 "
 
 SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"
-- 
1.7.10.4


