Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id EEF22780D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 07:48:14 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id e127so87458368wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dxJGgRge1z6EhMtBMTF2xUD1LPCl4q046eiZ183y0hE=;
	b=N252nxlI5+kW0tY0k7bgwPmHaZQOwrjfiRP1I0h5pAXb9QweVXp/PbsRhiK+R3v5o9
	PXIRlQrAIpaXyj7IfjBBJh1afSzqwWpo8xJXj1tf4zqdAkAm0RSqNi4N9j9IiOZxs43U
	RlvGuBFmm4x+LxbeVS59KjanmAOEJ4z10PsSJpiCDqGiJUHjXMT0AB73n4Bf2p6XsyJ6
	AB4A/dO5eF/a0JLDJRjThqxTQaP5aT4/o6f6amfJYCXYIwYEnDP9s5P3toAppGCZisDR
	GQtTeHpZyiFrA5TkikKPhtmTG7/9CTj+z+GCTvae6xgjSvqhUVPqAomzHwSOPJgSPrD7
	UGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dxJGgRge1z6EhMtBMTF2xUD1LPCl4q046eiZ183y0hE=;
	b=gcwKvsFYKEmGKZkciiMYW9SaZoNqm1g/SUz4HJl80pYkIn9H7wb+prq8czANv4Xpnn
	r8HV80F5g5VAgdS/M5JRBp9SvonuUXDmExEfe93AZodnvlFNDpxZmcDsWP36CBrBNNla
	Jbn4OGQpq3MW6VFMrGfEjitybywkFGeNZF5nq8SursUtLaMWVIncUpIIiTGANKhNFzQH
	s72CdUITAiKJSk7EjM0e3Ciu/AqEqstGXyM20d3J4K1+VvKqSQyPADhfYMmQHbcm02qO
	U9Dz9CiaFvFlG0HLtmzAjbCRKPBvhsBFZuayg3K8y1B/bP0OzQfwkOx/5rURm9HZkcyO
	RjBw==
X-Gm-Message-State: AODbwcAPIkjKRBkgMgJJ5bSUkCRVCtzxGQaQXcqbyf1ltVBFR+yKUrpg
	kDldsZfppkXMMoxY
X-Received: by 10.28.158.11 with SMTP id h11mr754870wme.0.1496130495385;
	Tue, 30 May 2017 00:48:15 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e73sm25848753wmd.1.2017.05.30.00.48.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 00:48:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 07:48:13 +0200
Message-Id: <20170530054813.17234-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] package_manager: flush installed_pkgs file before oe-pkgdata-util uses it
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
X-List-Received-Date: Tue, 30 May 2017 07:48:15 -0000

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
2.13.0


