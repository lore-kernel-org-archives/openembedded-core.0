Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1AC77BBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 06:53:00 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id l13so55210938lfl.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jun 2017 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YAHNuOTgsR1If3webNe57fGnCzWQhQfGPcnmp/mrViY=;
	b=0v68mT7qXUzzNGumOWBilOmfzyA6Ymgcet73yEGTgQykFpk0QhQsQurYaCOpl3AYFa
	z1DOHY7zk2w86rotJqSpWN3SBeOQMCPJBuUsCcQV/Vu4gT84NWsEdVi6RDZIcZdSsnFn
	5Ag1VXHVz14rTJnt5pOnPPladtvSGouFSreoMl+EEovvk0AAoPjnnUUQwuaizR9mD0n+
	dj5e+fWq/SZJzHWOxTk5LeurK6PF7GPK6bB905VkPWR/fUi4KhaHBTCmRXDEBuVXttwT
	FZxTTN8H6fxCdCVAQacXKV6Yo8hhIZlRHksIDlt2HfGlx5S/KYiDD+1Bfn5IWgKNljYe
	YHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YAHNuOTgsR1If3webNe57fGnCzWQhQfGPcnmp/mrViY=;
	b=VMBibsf5gBbECTKW6OYiDPAFqk9BTJ4+zawjZMJtyAGIk4byWyW2asdFC5R1dYowYK
	HFI+S/zxKvaUXjl104spVQ2Z/56k237B+zxUG4VH+cHUrAQGMIlR8hy9x2a+Mf+tHPoZ
	PXwRLfcgYncrvAlWljOLJfbBKB7Dsd/tOvjT7WRzPA8qvQIEVoxVjBTAmW6smqUgjZnU
	XIyWl7yCPwenSMVy6AkjfFrlC6ukitX1URv/odi7Tt7D9g7o+f0KEgLty77nytLHYksY
	B8egkmZRFBgG3r4VjldQDjPuCA8v+zCdIyTni3kHlUp0RymAymKdL4k1TZaBdDmQfs/k
	UAhQ==
X-Gm-Message-State: AKS2vOyoa2wLN5g3ORPtaO1nWVwHneVa0rzX3+EjGoKzMGyYb4HFuQD9
	gvuAcZfL9vMs/mwQWbHmWQ==
X-Received: by 10.25.99.21 with SMTP id x21mr6931050lfb.61.1498459980934;
	Sun, 25 Jun 2017 23:53:00 -0700 (PDT)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	136sm1910015ljf.29.2017.06.25.23.53.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Jun 2017 23:53:00 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 08:52:54 +0200
Message-Id: <25c15eb7fc3af2ec38a63ed73ae710e1e2172dad.1498459830.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1498459830.git.anders@chargestorm.se>
References: <cover.1498459830.git.anders@chargestorm.se>
Subject: [pyro][PATCH 1/1] package_manager: flush installed_pkgs file before oe-pkgdata-util uses it
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
X-List-Received-Date: Mon, 26 Jun 2017 06:53:00 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* since this commit:
  commit f5a1013ffa9815f22e13989e2bcb83f966e7ce2c
  Author: Ross Burton <ross.burton@intel.com>
  Date:   Tue Apr 18 16:19:12 2017 +0100

    package_manager: don't race on a file when installing complementary
    packages

  the file isn't closed before oe-pkgdata-util uses it and this
  temporary file might look empty to oe-pkgdata-util, because it
  wasn't flushed yet. Which resulted in almost empty debugfs tarballs
  and no locale packages in regular rootfs.
* without this change:
  124K May 30 07:41 core-image-full-cmdline-raspberrypi3-64-20170530054003-dbg.rootfs.tar.gz
* with this change:
  173M May 30 07:29 core-image-full-cmdline-raspberrypi3-64-20170530052715-dbg.rootfs.tar.gz

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 877d38db08aa7060d16405443cf70539c559fe82)
Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/lib/oe/package_manager.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f1b65bdbbc..2795dd3823 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -399,6 +399,7 @@ class PackageManager(object, metaclass=ABCMeta):
             pkgs = self.list_installed()
             output = oe.utils.format_pkg_list(pkgs, "arch")
             installed_pkgs.write(output)
+            installed_pkgs.flush()
 
             cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
                    "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs.name,
-- 
2.13.1


