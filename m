Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB4E77B39
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 16:56:42 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z50so3074440qtj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 09:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=w4QYnjpPmNzB4xDJGe13O9JRW1q1TjmtTGdtewsDs38=;
	b=dzsmFj7cMh8X50v8ug634kW98lHBYJWVyzlCdVE+x/iDzFci84Fs3yNkLCir4h15GU
	dqRouqYIbVimmuSIqg+2VrOYbIEEXU8nWCF5lRkbDl/zdFqqp+pkIltE4CeTMrXH8Xhq
	LWyLvmLaiIHRb/Bxwr4GGH6vigsdbPDwJJRGUuGgvq1LNTvVpTV3BYFkINa2g/A6YsAO
	QKpuPAj9xTdTXmXAxOky1w+rfQQzk8DZw1zF4euVR5JWOzgYtFcL4fXv9FHicmfuLBqo
	gUtH0+zOrdRlDTcombwFN26U7Yl5yf7MbDft8RStnmQJVQamvyKdSfUP4+ER/Vy2DSWH
	kfMQ==
X-Gm-Message-State: AMCzsaXUvnInHDSU+5098r+MJjDR3TjuzQw3qWI3ACwgM3301ZqENiqA
	agsJTVOC7Onpx83HMR3syXEMMQ==
X-Google-Smtp-Source: AOwi7QCr5Fl6qF6caI7MT17DKXL/cKamxYdCh3F9b9K5ShisHQbyjYHAccALVRCh6ykDd+CFJbNYRg==
X-Received: by 10.237.61.221 with SMTP id j29mr20378902qtf.282.1506963403348; 
	Mon, 02 Oct 2017 09:56:43 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	n20sm7407987qtc.72.2017.10.02.09.56.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Oct 2017 09:56:40 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 02 Oct 2017 13:56:32 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 Oct 2017 13:56:31 -0300
Message-Id: <20171002165631.12423-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 16:56:42 -0000

When we wish to use the package feed for local development, it does
not uses GPG signed feeds by default but dnf uses package signature
check. We need to configure the GPG signature check out so it works
out of box.

With this patch, installing non-signed packages works:

$: dnf install <package>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- Fix typo.

Changes in v4:
- Rework code.

Changes in v3:
- Check if package signing is disabled prior disabling it

Changes in v2:
- Improve commit log

 meta/lib/oe/package_manager.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 658c964277..6afe81583a 100644
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
+        if self.d.getVar('RPM_SIGN_PACKAGES') == '0':
+            gpg_opts += 'gpgcheck=0\n'
 
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
         remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
-- 
2.14.2


