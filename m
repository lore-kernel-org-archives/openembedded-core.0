Received: from mailout-afstr39.mailout.artfiles.de (mailout-afstr39.mailout.artfiles.de [212.72.187.39])
 by mx.groups.io with SMTP id smtpd.web11.14487.1601469830550782396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 05:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: garz-fricke.com, ip: 212.72.187.39, mailfrom: norman.stetter@garz-fricke.com)
Received: from [176.95.71.124] (helo=mail.garz-fricke.com)
	auth=mx@garz-fricke.com
	by mailout.artfiles.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.86_2)
	id 1kNbSV-00022a-50; Wed, 30 Sep 2020 14:43:47 +0200
Received: from SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188]) by
 SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188%12]) with mapi id
 14.03.0487.000; Wed, 30 Sep 2020 14:43:46 +0200
From: "Norman" <norman.stetter@garz-fricke.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "steve@sakoman.com" <steve@sakoman.com>
Subject: [dunfell] [PATCH] sstate.bbclass: Check file ownership before doing 'touch -a'
Thread-Topic: [dunfell] [PATCH] sstate.bbclass: Check file ownership before
 doing  'touch -a'
Thread-Index: AdaXJw31lEEMeeOPQh+ZneoJMRKfAA==
Date: Wed, 30 Sep 2020 12:43:45 +0000
Message-ID: <A24DC035FE5F8F4BAE7F63FB1B07D7BC392FB009@SRV24.hamburg.garz-fricke.de>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.56.33]
x-esetresult: clean, is OK
x-esetid: 37303A29B687C86B6C7263
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 1e04c79c8bb89ccd238654da101ccb753816a9ba Mon Sep 17 00:00:00 2001
From: Norman Stetter <norman.stetter@garz-fricke.com>
Date: Fri, 25 Sep 2020 13:49:43 +0200
Subject: [dunfell] [PATCH] sstate.bbclass: Check file ownership before doin=
g
 'touch -a'

In contrast to 'touching' a file without parameters 'touch -a' can only be
performed by the file owner. In case of a shared sstate-cache served
locally (e.g. over NFS),  where the user running bitbake is not the
owner of sstate-cache files, even if he has write access on group level,
the sstate_unpack_package task will fail.
Checking if the file is owned by the user before attempting to run
'touch -a' on it solves this.

Signed-off-by: Norman Stetter <norman.stetter@garz-fricke.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1554e8bd40c640fd58daac18ecf7b458e754109)
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 375196ef21..66a96a7603 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -847,7 +847,7 @@ python sstate_report_unihash() {
 sstate_unpack_package () {
 	tar -xvzf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror
-	[ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a =
${SSTATE_PKG}.siginfo
+	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SS=
TATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
 	# Use "! -w ||" to return true for read only files
 	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
 	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-de=
reference ${SSTATE_PKG}.sig
--=20
2.17.1


