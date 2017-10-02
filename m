Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED8471DD7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 14:18:24 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d13so6730299qta.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 07:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=qYFC8+N0BIHbibe0OByj+qArCHpmduCWr8Z1xqGFOKc=;
	b=T/PSYyLwq5A7NFNqJIlavCeg3pP1OS0yWXcN6nQIetkHf9C3GnG8fK/+CuRfjM9unI
	aFCKL723ec/kGTXZ3hwD2C/10g70BzaNhpD3C01ZsP9UaOHY85jVXq5js8NH82WynkGm
	7wvhmDLsPAGr65BNUgHmAe58DyLd1aT+QdXZAXP/7/6VqL+aVmWaai+VGNtFtIhcvE4x
	4x0SvigVZRONaG0di1TmPemopYC0zj639inLrE7OvP9PlabltMHJ/0+rzaZbDzSWMRJL
	mNQzxhxdfSoZ9x1QZ9Ow1ziSGYDlK/zotosmqUrGOAP9tN0NpLkdF7UOLE0pDYdI5xWR
	KtWA==
X-Gm-Message-State: AMCzsaUbqngwTPZ1+7ugA0c18laYqQjMaOsCZthyTRyF0L36K7UUpG/a
	Dpu20lpd3QGKmdp+PWQZa0OSlg==
X-Google-Smtp-Source: AOwi7QBEGML1CYKA+k09LcBUT1xSjM77hlIrHC3hpwSz4mGCySu8RV0g85sP0zEiA856YoIs2i9+AA==
X-Received: by 10.237.58.7 with SMTP id n7mr19442251qte.205.1506953905511;
	Mon, 02 Oct 2017 07:18:25 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 16sm7166236qtw.38.2017.10.02.07.18.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Oct 2017 07:18:24 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 02 Oct 2017 11:18:15 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 Oct 2017 11:18:14 -0300
Message-Id: <20171002141814.29709-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 14:18:25 -0000

When we wish to use the package feed for local development, it does
not uses GPG signed feeds by default but dnf uses package signature
check. We need to configure the GPG signature check out so it works
out of box.

With this patch, installing non-signed packages works:

$: dnf install <package>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Improve commit log

 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 658c964277..260244eaa0 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -552,7 +552,7 @@ class RpmPM(PackageManager):
             gpg_opts = 'repo_gpgcheck=1\n'
             gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
         else:
-            gpg_opts = ''
+            gpg_opts = 'gpgcheck=0\n'
 
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
         remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
-- 
2.14.2


