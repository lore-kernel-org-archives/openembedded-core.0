Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.204.23])
 by mx.groups.io with SMTP id smtpd.web12.6441.1628067244641405605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 01:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de header.s=key2 header.b=lzzVwaRh;
 spf=pass (domain: extraklein.de, ip: 194.59.204.23, mailfrom: matthias@extraklein.de)
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4GflsR1DRrz44yh
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 10:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1628067243;
	bh=gVOQbSsZqIHRnALLfMpV9qBnD3tTue/IUEPo1H63wTc=;
	h=From:To:Cc:Subject:Date:From;
	b=lzzVwaRhJOfWORfMYI0r6xpTGh5LAyTO8r/108/D5P3XED/EFatFrxclruQSIwPY0
	 s0zdiuVuskiDSzqCl72M4cMzinTifGK+NyuXTyDchrDbOBgaVSrc3qp5rugVM6jEGK
	 Xh0NGc1IhkEtzjDTjvkLv+//I9LI0aYZBWiNhN4+T+z/hm9pCA3kk0Usle9wDXTZMt
	 W1eCgJi+/YrDcHHFN8tEpezMKdSyGCVdUgLFw2RUKBltEsT/dNnPoZrgZ4TMxWVysA
	 g8v6w0oOZLoh6ONSVqgQpEbpoXsX/uUky3mDLI6l0ohuyBZoHnPtLAhJ3r9oSxXTsj
	 fR9goAUrpU1mw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4GflsR0rNNz7tGF
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 10:54:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=6.31 tests=[ALL_TRUSTED=-1,
	BAYES_00=-1.9, SPF_PASS=-0.001, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4GflsQ3tDsz8tsf
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 10:54:02 +0200 (CEST)
Received: from localhost (ip-88-152-245-240.hsi03.unitymediagroup.de [88.152.245.240])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id A3C421401D6;
	Wed,  4 Aug 2021 10:53:59 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 88.152.245.240) smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: "Matthias Klein" <matthias@extraklein.de>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [OE-core][PATCH] runqemu: decouple bios and kernel options
Date: Wed,  4 Aug 2021 10:53:55 +0200
Message-Id: <20210804085355.1951-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <162806723991.14992.14025482637875465520@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: Ij3iDNPtyMP84eBItn3DAmmpHrR5EpC3r7S6zZrjPMNdD+esWEY=
Content-Transfer-Encoding: quoted-printable

This will allow the use of a bios (e.g. U-Boot) in combination with
a WIC file (from which U-Boot loads the kernel).

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 scripts/runqemu | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 9c92eec030..0976273eb0 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1443,12 +1443,14 @@ class BaseConfig(object):
             kernel_opts =3D "-kernel %s -append '%s %s %s %s'" % (self.k=
ernel, self.kernel_cmdline,
                                                                 self.ker=
nel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
                                                                 self.boo=
tparams)
-            if self.bios:
-                kernel_opts +=3D " -bios %s" % self.bios
             if self.dtb:
                 kernel_opts +=3D " -dtb %s" % self.dtb
         else:
             kernel_opts =3D ""
+
+        if self.bios:
+            self.qemu_opt +=3D " -bios %s" % self.bios
+
         cmd =3D "%s %s" % (self.qemu_opt, kernel_opts)
         cmds =3D shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
--=20
2.30.2

