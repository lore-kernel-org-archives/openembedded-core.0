Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 60D16778BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 16:50:15 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a43so2135471qta.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 09:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=UFevkNXATToniG4mtyY314srp2GH1pSJI7USrnKgGJ8=;
	b=ECTPnoIx1T8kfhr7NmVQAmji1x/MXZ5ApY2UNqkcvkJFoMzrXygKLmo4Bq16DAUI61
	ibWgjEdR8uloaT+vNCV7UyrzsPW/dQ0hRNhT0B52MY7FkQ/VGHggUQ1J4t62T+Pb//Ra
	UNXmBgKvktGXrPcs1xdSRTD7vsUm7vSiGPhZAJU7McC5OBt3Gz80HoWi2y9IMhtbcjDU
	qxHkWruz/P0ytqZZjTe0G41+7BxV33E53xo/hkt490BBjQ3dC33tSfB5WWzpGKT4wQG0
	rhc/9+XDU/mcS0Qh2gXjvZoAN6z4k1sdKDMdKsSAqFULY62oSXDZLFguGo9EKMEVJNWH
	GBVA==
X-Gm-Message-State: AMCzsaVLfSzOz7RHbwPK6VLwhqbVn+IyNFzkIkMJ7Zcm4lgTJpD+Uh9B
	v5VEnD8RLhS4839PtczCHk05/Q==
X-Google-Smtp-Source: AOwi7QB5rrPHWnAQZAwPs9q8jNiqB9dWd6GFRQP9OPXAEcLoMMDckKv4QCE8CzEAkjv13DJG18mufA==
X-Received: by 10.237.33.253 with SMTP id m58mr9926306qtc.142.1506963016856;
	Mon, 02 Oct 2017 09:50:16 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id i1sm1256979qta.19.2017.10.02.09.50.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Oct 2017 09:50:16 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 02 Oct 2017 13:50:08 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 Oct 2017 13:50:07 -0300
Message-Id: <20171002165007.11605-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 16:50:16 -0000

When we wish to use the package feed for local development, it does
not uses GPG signed feeds by default but dnf uses package signature
check. We need to configure the GPG signature check out so it works
out of box.

With this patch, installing non-signed packages works:

$: dnf install <package>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
- Rework code.

Changes in v3:
- Check if package signing is disabled prior disabling it

Changes in v2:
- Improve commit log

 meta/lib/oe/package_manager.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 658c964277..6e26c1b200 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -548,11 +548,13 @@ class RpmPM(PackageManager):
         if feed_uris == "":
             return
 
+        gpg_opts = ''
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            gpg_opts = 'repo_gpgcheck=1\n'
+            gpg_opts += 'repo_gpgcheck=1\n'
             gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
-        else:
-            gpg_opts = ''
+
+        if: self.d.getVar('RPM_SIGN_PACKAGES') == '0':
+            gpg_opts += 'gpgcheck=0\n'
 
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
         remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
-- 
2.14.2


