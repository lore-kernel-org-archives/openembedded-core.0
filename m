Return-Path: <Mattias.Waldo@saabgroup.com>
X-Greylist: delayed 11291 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Aug 2016 17:18:42 UTC
Received: from weald2.air.saab.se (weald2.air.saab.se [146.75.247.197])
	by mail.openembedded.org (Postfix) with ESMTP id B75BC77265
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 17:18:42 +0000 (UTC)
Received: from mailhub1.air.saab.se ([136.163.213.4])
	by weald2.air.saab.se (8.14.4/8.14.4) with ESMTP id u7CEAUOq031702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 16:10:30 +0200
Received: from corpappl845.corp.saab.se (corpappl845.corp.saab.se
	[136.163.113.245])
	by mailhub1.air.saab.se (8.13.8/8.13.8) with ESMTP id u7CEAL8p031505
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 16:10:21 +0200
Received: from CORPAPPL846.corp.saab.se (136.163.113.246) by
	corpappl845.corp.saab.se (136.163.113.245) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Fri, 12 Aug 2016 16:10:20 +0200
Received: from CORPAPPL846.corp.saab.se ([136.163.113.246]) by
	corpappl846.corp.saab.se ([136.163.113.246]) with mapi id
	15.00.1178.000; Fri, 12 Aug 2016 16:10:20 +0200
From: Waldo Mattias <Mattias.Waldo@saabgroup.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] kernel.bbclass: include signing keys when
	copying files  required for module builds
Thread-Index: AQHR9KCINU43y46eW0aC47RpFxgJ9g==
Date: Fri, 12 Aug 2016 14:10:20 +0000
Message-ID: <1471011020888.78139@saabgroup.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [136.163.113.239]
MIME-Version: 1.0
X-Saab-MailScanner-Information: Please contact the ISP for more information
X-Saab-MailScanner-ID: u7CEAL8p031505
X-Saab-MailScanner: Found to be clean
X-Saab-MailScanner-SpamCheck: not spam (whitelisted),
	SpamAssassin (not cached, score=0.5, required 5, BAYES_00 -0.50,
	PB_NE_FROMS 1.00)
X-Saab-MailScanner-From: mattias.waldo@saabgroup.com
X-Saab-MailScanner-Watermark: 1471615822.7842@86UDao+/2+LMLLj7mfgDmA
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
	(weald2.air.saab.se [136.163.212.4]);
	Fri, 12 Aug 2016 16:10:30 +0200 (CEST)
Subject: [PATCH] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Fri, 12 Aug 2016 17:18:44 -0000
Content-Language: sv-SE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The absence of certs/signing_key.* in $kerneldir made signing of=0A=
out-of-tree kernel modules fail (silently). Add copying of these files=0A=
during the shared_workdir task.=0A=
=0A=
Signed-off-by: Mattias Waldo <mattias.waldo@saabgroup.com>=0A=
---=0A=
 meta/classes/kernel.bbclass | 2 ++=0A=
 1 file changed, 2 insertions(+)=0A=
=0A=
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass=0A=
index 6e3e81e..2bfd65c 100644=0A=
--- a/meta/classes/kernel.bbclass=0A=
+++ b/meta/classes/kernel.bbclass=0A=
@@ -295,6 +295,8 @@ do_shared_workdir () {=0A=
        cp .config $kerneldir/=0A=
        mkdir -p $kerneldir/include/config=0A=
        cp include/config/kernel.release $kerneldir/include/config/kernel.r=
elease=0A=
+       mkdir -p $kerneldir/certs=0A=
+       cp certs/signing_key.* $kerneldir/certs=0A=
=0A=
        # We can also copy over all the generated files and avoid special c=
ases=0A=
        # like version.h, but we've opted to keep this small until file cre=
ep starts=0A=
--=0A=
2.9.2=0A=
=0A=
=0A=
=0A=
=0A=

