Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=AM1EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S2V9v-00074L-41
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 23:04:35 +0100
Received: from mail46-am1-R.bigfish.com (10.3.201.238) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.23; Tue, 28 Feb 2012 21:41:02 +0000
Received: from mail46-am1 (localhost [127.0.0.1])	by mail46-am1-R.bigfish.com
	(Postfix) with ESMTP id 44A8D1804E5;
	Tue, 28 Feb 2012 21:41:02 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202hzzz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail46-am1 (localhost.localdomain [127.0.0.1]) by mail46-am1
	(MessageSwitch) id 1330465260287738_9034;
	Tue, 28 Feb 2012 21:41:00 +0000 (UTC)
Received: from AM1EHSMHS017.bigfish.com (unknown [10.3.201.250])	by
	mail46-am1.bigfish.com (Postfix) with ESMTP id 3D4CA340A4D;
	Tue, 28 Feb 2012 21:41:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS017.bigfish.com
	(10.3.207.155) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 28 Feb 2012 21:41:00 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Tue, 28 Feb 2012 15:40:58 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: qemu.inc do_install question / qemu-targets.inc
Thread-Index: AQHM9mGnEKMMtdYuIkej4ugsDzRb8g==
Date: Tue, 28 Feb 2012 21:40:57 +0000
Message-ID: <CAEsOVNfTjTNi_nBy=Fd98JURMMLAwvcpQs=zbxihMKeRgn_ehA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Yoder Stuart-B08248 <B08248@freescale.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: qemu.inc do_install question / qemu-targets.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 22:04:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <71FA0DB74847644EAF2F2ADA4B9DA17F@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

All,

I'm wanting to remove this:

diff --git a/meta/recipes-devtools/qemu/qemu.inc
b/meta/recipes-devtools/qemu/qemu.inc
index 58049b9..3be46f2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -49,13 +49,6 @@ do_configure() {
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x
${S}/target-i386/beginend_funcs.s
 }

-do_install () {
-       export STRIP=3D"true"
-       autotools_do_install
-       install -d ${D}${datadir}/qemu
-       install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
-}
-

Can anyone comment why it's there? Can we move it up a level to a
specific recipe? We don't want to include this powerpc_rom.bin..
should we just fork our qemu recipe instead?

Also, can we make this change? I don't think we want ppc-linux-user on
our ppc-softmmu target.

diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc
b/meta/recipes-devtools/qemu/qemu-targe
index 550a7fe..8423aa1 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -6,7 +6,7 @@ def get_qemu_target_list(d):
     import bb
     archs =3D bb.data.getVar('QEMU_TARGETS', d, True).split()
     targets =3D ""
-    for arch in ['mips64', 'mips64el', 'ppcemb']:
+    for arch in ['mips64', 'mips64el', 'ppcemb', 'ppc']:
         if arch in archs:
             targets +=3D arch + "-softmmu,"
            archs.remove(arch)

-M=



