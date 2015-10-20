Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D069476AE2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:40:38 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so44642386wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 12:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rucddo+3u2vvoy5GYEBt3CL4u2rqFSEs46+fekRcfFI=;
	b=gXPjIQsgodPx9e4bZlUX9fhvq1WWxyvGnfBuWxukf4qkTcB4l9/DlI+OBrAJZIHsM1
	XKIKkkgsI0+yslAZh4d3kYPfjYoiTvoi2q0Xxhs2q3hvvqS6X2qWjjGQwF3X3kyodRBN
	JZmGigZ4+h5zerIa15cBP9nHp5Pfac6eqVOm+IccEQ/488TZj/tfyT/8F+MvxeZn4Zht
	v4RZw0JUp9a1gCwNcAmRKGEMXeKJGlpEmuCcMcD2MmBhGiaatXLPAUq9t80xOWfeSkGv
	B943EPotu/NwWtDoOj71v5nW/67Iwe4w3zD1uKkEVUK1fCs1LRnTkNl6wsZD8bX1Wl3m
	XkdA==
X-Gm-Message-State: ALoCoQleHtwDmviQzg6+OLqI6xbBLTUJpbSFO5Gw5OAixJ21l5TFSb3BSeHulxKHUWEOIyPO/pix
X-Received: by 10.194.240.4 with SMTP id vw4mr6193672wjc.89.1445370038330;
	Tue, 20 Oct 2015 12:40:38 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	gd11sm257966wic.20.2015.10.20.12.40.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 12:40:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 20:32:57 +0100
Message-Id: <1445369579-14839-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] lib/oe/rootfs: tell intercepts where the native sysroot is
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
X-List-Received-Date: Tue, 20 Oct 2015 19:40:39 -0000

Some intercepts may want to access files in the native sysroot that are not on
$PATH (such as something in $libexecdir) but any use of STAGING_DIR_NATIVE in
the postinst that calls the intercept will be "baked" into the package, so if
sstate is reused it will use paths that may not exist.

Solve this by exporting the location of the native sysroot in the environment so
the postinst and intercept can use an environment variable instead of a bitbake
variable.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/rootfs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4e81263..ff29083 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -278,6 +278,7 @@ class Rootfs(object):
 
         bb.note("Running intercept scripts:")
         os.environ['D'] = self.image_rootfs
+        os.environ['STAGING_DIR_NATIVE'] = self.d.getVar('STAGING_DIR_NATIVE', True)
         for script in os.listdir(intercepts_dir):
             script_full = os.path.join(intercepts_dir, script)
 
-- 
2.1.4


