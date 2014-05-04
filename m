Return-Path: <sstncr@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8DDCE60897
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 May 2014 17:41:38 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so4668429eek.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 10:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+BNNfnVd0E5l41jSt5E014L06znZCGoXqDnnCZ7OJlA=;
	b=p5jLde9/1144It9c7c6AQrqQBo0hjHibkBtMWKW2wW1Uc+ZUFbxpJre3F+NpjNjWh6
	tTl94QHNa5WIyd5M8/phcQyzmTCgYZEloZhiUkDAo9SZnM1kc71d9FY/CWKip15St/1T
	1x/F/oHHIVipAjupJOPBqEldr8JXLj7yUgP9wIKpTvuBGK59grTpfxljG4g7BpjNU9O8
	Om5jAwd+GD8vyhIuLlc3vBA2zrz38fUhRar3MCjrvuXGrUg/A0NTUBDqYY9XYnRoYS15
	ecAPOEXuIH6AHnNtyLXxqgLuJx6Q4RRpnqJN3g9RwteRMac6aoxE1I3B5zBMfn7adYtq
	Q8CA==
X-Received: by 10.14.215.9 with SMTP id d9mr26612760eep.64.1399225299740;
	Sun, 04 May 2014 10:41:39 -0700 (PDT)
Received: from localhost.localdomain (5-12-85-239.residential.rdsnet.ro.
	[5.12.85.239])
	by mx.google.com with ESMTPSA id w6sm9765154eej.7.2014.05.04.10.41.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 10:41:39 -0700 (PDT)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 May 2014 20:41:14 +0300
Message-Id: <1399225274-10139-1-git-send-email-sstncr@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] scripts/cleanup-workdir: fix after binutils-cross name change
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
X-List-Received-Date: Sun, 04 May 2014 17:41:42 -0000

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 scripts/cleanup-workdir | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 25fef97..cffac59 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -49,9 +49,10 @@ def run_command(cmd):
 
 def get_cur_arch_dirs(workdir, arch_dirs):
     pattern = workdir + '/(.*?)/'
-
+    tunearch = run_command("bitbake -e | grep ^TUNE_ARCH=")
+    tunearch = tunearch.split('"')[1]
     # select thest 5 packages to get the dirs of current arch
-    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk', 'nativesdk-autoconf']
+    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk-' + tunearch, 'nativesdk-autoconf']
 
     for pkg in pkgs:
         cmd = "bitbake -e " + pkg + " | grep ^IMAGE_ROOTFS="
-- 
1.9.0


