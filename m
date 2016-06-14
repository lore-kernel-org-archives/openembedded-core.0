Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4AA6010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 07:59:48 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id k204so110458398wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3U3mFg4S24QQQV6vhw0/RDqxkCxnTvgsVxAeFt5P3qM=;
	b=OGnZGeqI9uSbwIze3pbOemtCdHscMR9akUZv8qGPa/CxfLnrhPEfbFGhKB926o5Otl
	DK9a4VpjoNxOHX3L+aVkF1S9iHB/aZ1uZHHphiQDDNjHXjvWLBwjSIFrP4HBcdrnMk1M
	YHwIkETePK7+EROjv5EnVrlrx9eyBOZ1cjLKeMBf0HCymZ6GUAmQr+n3fHV8RAuW5yh8
	ClIzaqLV3aIj0MjYydMLgDFsWkFONsXFX6bFHjqsW0dzTXLRWN9myCIImY7f7jcbdus/
	uT9dT9mDWg0fI/ocGaTqFTWHGsygcOgwY1M+zCHmDyV1TnWQuHZiIbeJ43TLc+aHrg2t
	qlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3U3mFg4S24QQQV6vhw0/RDqxkCxnTvgsVxAeFt5P3qM=;
	b=gz5e0AHo3gBxLtckeWyY5dHDzLgP+Cs1IWrhnB1lUPUugGmd6OtRLf9gIy2RmBrIke
	N/PyP+GDQKfIbBANmMRSA3yljmneXrFqGbnwRCJ16TZTGVAtJ2yCDc42b5fOs9MMnCGF
	i6sEtxzvfyLTngEjP2a0lbtUPUQ2JnRdjJEUdeDTznr1wUCqoBn+jymmXN9B8+3tm0v5
	OpK+GQE3Vk71UFfefEKHbO0uJM0bIm8MmigkMWB8SrcEUqcQ1ZsinNtK7M1KkfqO1S8f
	PdKIIuJ0udfIN5ee/iFjDS6aySLtInYFzpRQRnCQv84wFxqBFfR7ZNqqKLlPi2MKiY1S
	n5Ng==
X-Gm-Message-State: ALyK8tKgoUrvUOXmbjgREx1H5KZhDg8K7CkjnsBQj+cAZUHyqykIiwyTkK4chX7N6tYJ1yNz
X-Received: by 10.194.134.164 with SMTP id pl4mr5493153wjb.113.1465891188644; 
	Tue, 14 Jun 2016 00:59:48 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e133sm2730425wma.6.2016.06.14.00.59.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 00:59:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 08:59:36 +0100
Message-Id: <1465891179-20779-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/4] classes/image: don't chdir when creating symlinks
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
X-List-Received-Date: Tue, 14 Jun 2016 07:59:49 -0000

There's no need to chdir() when creating image symlinks, and using chdir()
changes the state for future tasks.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 65ce6bb..bd6d0b5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -519,14 +519,13 @@ python create_symlinks() {
     taskname = d.getVar("BB_CURRENTTASK", True)
     subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
     imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix', True) or d.expand("${IMAGE_NAME_SUFFIX}.")
-    os.chdir(deploy_dir)
 
     if not link_name:
         return
     for type in subimages:
-        dst = deploy_dir + "/" + link_name + "." + type
+        dst = os.path.join(deploy_dir, link_name + "." + type)
         src = img_name + imgsuffix + type
-        if os.path.exists(src):
+        if os.path.exists(os.path.join(deploy_dir, src)):
             bb.note("Creating symlink: %s -> %s" % (dst, src))
             if os.path.islink(dst):
                 if d.getVar('RM_OLD_IMAGE', True) == "1" and \
-- 
2.8.0.rc3


