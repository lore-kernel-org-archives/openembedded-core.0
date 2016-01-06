Return-Path: <matt@madison.systems>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2C96D731FB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 12:22:30 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id e65so185248108pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 04:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=81jitiI8tXmlS1mxr+DowLpLVo33Zy2ei5BqtYEb44k=;
	b=zoXI5yOWbOP9ttWxFEcYnvBom+zsncd9dobclGHUsvwaM0I6POPHnTDlyCpzHfCwRj
	ZMX4dKUvzxPU5z2HIXBn6zWn+0b/JfMKQn1kP7cVFJv2ZGWLGMXM5sZnGyI5hSEArHP9
	bZELrnJSjvoic/Qsul25xgJvkWBch5VQdzLT6MV75v09rHhnoJcudON+oxXwirCuk2ly
	XN/CdzdMdwrfw6o3Dzt9S//t4+jktxe9N1+WNBKU73bNXErFGXSE87kh+6eCgXz7V/8H
	4iFcRnJF8Qy0ju35wgX08Gsvcx+OlUrHIjHZZng/msQmacFZMaQpP9gv5ciUcq1EPUJz
	19Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=81jitiI8tXmlS1mxr+DowLpLVo33Zy2ei5BqtYEb44k=;
	b=ViK/Fjr8GpwlbvWo6Ou47bW3t5YZ9dxmf19LXd7W97rUVlOoszJxssfssRGy09nre3
	c8AaUQdRnsXYqlJKTp5K7r5grDml9dIsqPLieSsR3+9pjS+dfyemDwsLrqhiTD57vtQD
	xwVhc3lFK4IUJqQ6Y9M0hdURoce/vAa+OPHGBuTu0vk/rp/opCce5x32H0/MDpcnjn9p
	Sa2O06/nbCNPSKaVq/3rMk54t5PBN35LaZJ2qjhZBvPCTa579PFkRU+y3Gz2uNTyoNWx
	E3FxVNnSXZuM1raecY6E/TwGwiOFrGluJpLawamgyC1kJnr/dHmk3y3GFlEkac1ibytf
	jsPw==
X-Gm-Message-State: ALoCoQkXqVnYhFB0kxWf9j0OSUMh2X34RjbEvC05bQJTFYG+AI8jeAdw9Vt8tfjet82ag2Mp/WbEvlUK0vNbSpg7EJc5es/GZg==
X-Received: by 10.98.65.2 with SMTP id o2mr85428631pfa.113.1452082951380;
	Wed, 06 Jan 2016 04:22:31 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93])
	by smtp.gmail.com with ESMTPSA id c5sm1479817pfj.89.2016.01.06.04.22.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jan 2016 04:22:30 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 04:21:36 -0800
Message-Id: <1452082896-3261-5-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452082896-3261-1-git-send-email-matt@madison.systems>
References: <1452082896-3261-1-git-send-email-matt@madison.systems>
MIME-Version: 1.0
Subject: [PATCH v3 4/4] DpkgRootfs: Fix logcheck_error false-positive when use multilib
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
X-List-Received-Date: Wed, 06 Jan 2016 12:22:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linux.intel.com>

Rootfs with dpkg was failing due to false-positive in logcheck_error
because current logic of DpkgPM handles missing dependencies failure
using apt-get -f install [1][2].

This support was broken due to addition of logcheck and don't take into
account dpkgpm cases, in order to fix add an attr for specify expected
errors regex'es by package manager.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oe/rootfs.py#n659
[2] http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oe/package_manager.py#n2038

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/lib/oe/rootfs.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a2af332..f677d03 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -63,6 +63,15 @@ class Rootfs(object):
                 if 'log_check' in line:
                     continue
 
+                if hasattr(self, 'log_check_expected_errors_regexes'):
+                    m = None
+                    for ee in self.log_check_expected_errors_regexes:
+                        m = re.search(ee, line)
+                        if m:
+                            break
+                    if m:
+                        continue
+
                 m = r.search(line)
                 if m:
                     found_error = 1
@@ -623,6 +632,10 @@ class DpkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir):
         super(DpkgRootfs, self).__init__(d)
         self.log_check_regex = '^E:'
+        self.log_check_expected_errors_regexes = \
+        [
+            "^E: Unmet dependencies."
+        ]
 
         bb.utils.remove(self.image_rootfs, True)
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
-- 
2.5.0


