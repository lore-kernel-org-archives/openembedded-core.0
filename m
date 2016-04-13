Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3972D60119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 11:22:18 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n3so71755298wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wtaL3mK6jabTEUYDSTa+FWZggfPeP/A2ohP4PjDHoc8=;
	b=uutE/QBLghYVN5Zo7sYKN6vaSg696MUS2gSQS7/8Lv9XPWWnCv9JHJSIbEb+8vyxO3
	x/q40d7nXF5x18c3glXejfSoL9DHFU8+qqtat509z1Xti9H3MJxDw9DCEUa3jmvCgphg
	6a8hbirpERB5Zgr6EwLZxKloPxg3ZSfA8A4zm6tUwBjYqF9O7I5msShACN4AkvdeCXF8
	k6ZslTvtDB08DyuQZqS1UfGr6b26QmPACiOv9b+cSw0N+U/J+nZiVEP6xlcGyLgUL5e0
	EE0yVh5GjVqEfxqlADAvFCvuNpihMM22Iye4FwdL5EGO9EQr3SL0OGo1ybS6sa8lvRoq
	5drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wtaL3mK6jabTEUYDSTa+FWZggfPeP/A2ohP4PjDHoc8=;
	b=OdDfaioTFMQ6O+gsr/tpjlS+9l9KdIMDd2oPHXGgznOzVjPgE8LiXVqWAzG+6TiPop
	pM6seanvZvyAF65DZ6ASLTS5CqwDE5RQzpAoU0T65kwuPTTmq1izI7s+KsaSKS4hVHyN
	XnARoeJ99rkfrFm72DBAvRBuGo0Ju/J/esqi2AiFZ0DwlWSJ2V4AzFzEsgscpqYyH9Np
	fm8xG48WW1YS4LYS+qqZkYW90qpRdLsMKSqKQQ8j+udM/+1wtn7n3Je2XD80/N726ZAs
	07RIBePx4j97yZCp8w0MufwMVg2QCAKlEqMED29h/K8kyYullcmzo9IasVVuCe93Xet2
	aCug==
X-Gm-Message-State: AOPr4FW4cMqgfZT/YTE78RhQ7NUT7D6xokHb1NoXkSCj79pzjmnZA9jZ+8kxDClZotrPZVOM
X-Received: by 10.194.21.131 with SMTP id v3mr9121460wje.132.1460546538599;
	Wed, 13 Apr 2016 04:22:18 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	w2sm17978671wjg.42.2016.04.13.04.22.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 04:22:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2016 12:22:16 +0100
Message-Id: <1460546536-30603-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] rootfs-postcommands: handle broken links when writing manifest
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
X-List-Received-Date: Wed, 13 Apr 2016 11:22:21 -0000

If the manifest link is broken then os.path.exists() returns False so the link
isn't removed, resulting in the os.symlink() call failing as the file already
exists.  Prevent this by using os.path.lexists to check that the symlink itself
exists, not the target.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 56e810f..95d28af 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -225,7 +225,7 @@ python write_image_manifest () {
 
     if os.path.exists(manifest_name):
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
-        if os.path.exists(manifest_link):
+        if os.path.lexists(manifest_link):
             if d.getVar('RM_OLD_IMAGE', True) == "1" and \
                     os.path.exists(os.path.realpath(manifest_link)):
                 os.remove(os.path.realpath(manifest_link))
@@ -275,5 +275,3 @@ rootfs_check_host_user_contaminated () {
 rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
-
-
-- 
2.8.0.rc3


