Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
 by mx.groups.io with SMTP id smtpd.web11.2843.1593681788149207819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 02:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=H+7k3H3O;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.16, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1593681785; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TRGorNWoiTHdBP1GYjiiHZ+SQRrxH8KfddFTJzE+k1cXwUGyYYZrx9VSle2AdhtIKYXc5RvIXRVsiNtl/tOEmOyKC6RxXcixV3juEv+O1JOaUxJQvw2mJP8vS1yplvekXnwyOOfxA9rh+ZJFRLGkvZ1VVbHKDliT7wJceetQAy8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1593681785; h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=EhxOCE6Q9J4ip94mCuXAs8yRwWnywJo5Q5YAslYrcB4=; 
	b=UYub0cgm+dfdLV4CYrqpUEmbDTTgrnXNB+Cb2/5p+gXYiymgpO9eNtMrayTuAmeRWEcoaOuekNnvP3kDRedLsYvaEYR+zlEnTCT8T8AYCc9MJlgkscX+ApbBEUXbkbt+fYyA/OqHgBsmq2pmG5Y12ezHjeIpIm410+mUmIDB4y4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl> header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1593681785;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EhxOCE6Q9J4ip94mCuXAs8yRwWnywJo5Q5YAslYrcB4=;
	b=H+7k3H3OHaqqkIbTxvLMwm0hAqnYWmrbFfRidS4Gfqd+YSYpr8qr2c/C6lNpAyab
	Wl+dprOakWCFWTapMaJV0B8UVMiC6qho/I4pBQbArSsBtqI1XgBKrVU1/VsEJvpxqhj
	6puKhiHxEGY4C8mpVmzUSj+Mg6sfwor91OwxPbxM=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1593681784964270.14483366371655; Thu, 2 Jul 2020 02:23:04 -0700 (PDT)
Date: Thu, 02 Jul 2020 11:23:04 +0200
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <1730ed63083.c34975ae810908.118444735701489935@ertelnet.rybnik.pl>
In-Reply-To: 
Subject: [PATCH] rootfs: do not let ldconfig to create symlinks
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Adds -X option to ldconfig to not create symlinks
as part of the ldconfig cache creation process.

It is much better to keep all needed symlinks as part of
of the package then let ldconfig do the job.

In the case symlink was created by ldconfig and later on the
package got removed the dangling link will remain on the
filesystem. Not to mention that such a symlink is orphaned
(e.g. rpm -qf <file-path> will not show the package the symlink
is part of).

It also align the behaviour with libc-musl where the ldconfig
is not invoked by default.

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 meta/lib/oe/rootfs.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a0ac33ada6..0e05f1f75e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -297,9 +297,9 @@ class Rootfs(object, metaclass=ABCMeta):

     def _run_ldconfig(self):
         if self.d.getVar('LDCONFIGDEPEND'):
-            bb.note("Executing: ldconfig -r " + self.image_rootfs + " -c new -v")
+            bb.note("Executing: ldconfig -r " + self.image_rootfs + " -c new -v -X")
             self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
-                                  'new', '-v'])
+                                  'new', '-v', '-X'])

     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=True):
--
2.25.4

