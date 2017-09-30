Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B47D672F5D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 18:07:03 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 47so3101575qts.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 11:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=8kY4cPUZLjfiSXzEWMNf2SRiD/7INhr0V1fYm7fmW1M=;
	b=aE1CWHxyRARz8qJ49YP3gFylxyQJf1rXTKLVtdePTWQaKl87Hx7m9BXnAw9lroC16G
	s29K/dvcInWYXe/IC8NNND1C4I1GHFHrSrCw33O4+PK4/Iz7IQoiBnf7zE6Oll7FgdeO
	/QvhfjmrfSg4s74wNtE67I1jWJZlj2GoIlkZVms1dtfSwLE8gveA5i3PF/q2PNauaIUA
	keMGJ7lj44/HgEuo303f7vu351NNEnfuYGuD2l1IFYzab2gHt9aOgzDI532fUd+GHlpp
	INsNZ15qJ0NWoUhX+utpMS3lsSVqk16f6YHjSIk6r4vAQwwkEheVI2IVZE1dAJD295XJ
	ZngQ==
X-Gm-Message-State: AMCzsaUIQ0pZMk0EeQd9hmttOossJgrkg7Coc6DqdBMaqcZ5DrO75Tii
	rmY6PQccQ+kf5mK0J+cGQx40Iw==
X-Google-Smtp-Source: AOwi7QDav3aezuuWJVqeanghlWuqHQ0WYUbaCzZ+BmoPi7HPqNELSaTnwNTnuQEnwgSMOhnbNE7ocQ==
X-Received: by 10.200.4.158 with SMTP id s30mr11993781qtg.311.1506794824324;
	Sat, 30 Sep 2017 11:07:04 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	x55sm4638611qth.91.2017.09.30.11.07.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Sep 2017 11:07:03 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sat, 30 Sep 2017 15:06:55 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Sep 2017 15:06:54 -0300
Message-Id: <20170930180655.25134-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] lib/oe/package_manager.py (rpm): Signature check is enabled by default
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
X-List-Received-Date: Sat, 30 Sep 2017 18:07:03 -0000

The dnf has GPG signature check enabled by default. It has been confimed using:

,----
| root@qemux86-64:~# grep gpgcheck /etc/dnf/dnf.conf
| gpgcheck=1
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/lib/oe/package_manager.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 658c964277..1501291657 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -549,7 +549,6 @@ class RpmPM(PackageManager):
             return
 
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            gpg_opts = 'repo_gpgcheck=1\n'
             gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
         else:
             gpg_opts = ''
-- 
2.14.2


