Return-Path: <Mattias.Waldo@saabgroup.com>
Received: from weald2.air.saab.se (weald2.air.saab.se [146.75.247.197])
	by mail.openembedded.org (Postfix) with ESMTP id 08A7073189
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 09:20:43 +0000 (UTC)
Received: from mailhub2.air.saab.se ([136.163.213.5])
	by weald2.air.saab.se (8.14.4/8.14.4) with ESMTP id u7P9Kglk002613
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 11:20:42 +0200
Received: from CORPAPPL840.corp.saab.se (corpappl840.corp.saab.se
	[136.163.113.240])
	by mailhub2.air.saab.se (8.13.8/8.13.8) with ESMTP id u7P9KYc8024134
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 11:20:34 +0200
Received: from CORPAPPL846.corp.saab.se (136.163.113.246) by
	CORPAPPL840.corp.saab.se (136.163.113.240) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Thu, 25 Aug 2016 11:20:34 +0200
Received: from CORPAPPL846.corp.saab.se ([136.163.113.246]) by
	corpappl846.corp.saab.se ([136.163.113.246]) with mapi id
	15.00.1178.000; Thu, 25 Aug 2016 11:20:34 +0200
From: Waldo Mattias <Mattias.Waldo@saabgroup.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2] kernel.bbclass: include signing keys when
	copying  files required for module builds
Thread-Index: AQHR/rGjvecpzbMBck+8SzOTiJ0Tlw==
Date: Thu, 25 Aug 2016 09:20:33 +0000
Message-ID: <1472116833486.43456@saabgroup.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [136.163.113.190]
MIME-Version: 1.0
X-Saab-MailScanner-Information: Please contact the ISP for more information
X-Saab-MailScanner-ID: u7P9KYc8024134
X-Saab-MailScanner: Found to be clean
X-Saab-MailScanner-SpamCheck: not spam (whitelisted),
	SpamAssassin (not cached, score=1, required 5, PB_NE_FROMS 1.00)
X-Saab-MailScanner-From: mattias.waldo@saabgroup.com
X-Saab-MailScanner-Watermark: 1472721634.6144@RTom2u8shveq4zkLJQGxRg
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
	(weald2.air.saab.se [136.163.212.4]);
	Thu, 25 Aug 2016 11:20:42 +0200 (CEST)
Subject: [PATCH v2] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Thu, 25 Aug 2016 09:20:44 -0000
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
-- =0A=
2.9.3=0A=
=0A=
=0A=

