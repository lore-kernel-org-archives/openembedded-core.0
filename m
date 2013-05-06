Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UZHMJ-0007fW-8p
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 11:05:25 +0200
Received: from mail143-ch1-R.bigfish.com (10.43.68.229) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Mon, 6 May 2013 08:47:23 +0000
Received: from mail143-ch1 (localhost [127.0.0.1])	by
	mail143-ch1-R.bigfish.com (Postfix) with ESMTP id A824A1E01E6	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2013 08:47:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzzz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fhbe9i1155h)
Received: from mail143-ch1 (localhost.localdomain [127.0.0.1]) by mail143-ch1
	(MessageSwitch) id 1367830042238198_11627;
	Mon,  6 May 2013 08:47:22 +0000 (UTC)
Received: from CH1EHSMHS010.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.251])	by mail143-ch1.bigfish.com (Postfix) with ESMTP id
	37F5E3E006C	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2013 08:47:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS010.bigfish.com
	(10.43.70.10) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 6 May 2013 08:47:22 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.123]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Mon, 6 May 2013 08:47:21 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: /usr/lib/perl5 conflict in sysroot folder
Thread-Index: Ac5KNlGfAF1r8KMLRFSN1YVbdsx+yw==
Date: Mon, 6 May 2013 08:47:21 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A014FF00B@039-SN2MPN1-023.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>, Luo,
	Zhenhua-B19537 <B19537@freescale.com>,
	Yu Zongchun-B40527 <B40527@freescale.com>
Subject: /usr/lib/perl5 conflict in sysroot folder
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 09:05:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Recently I met a /usr/lib/perl5 conflict error, following is the details, i=
s there any idea to solve such kind of issue?

When perl is built, the output includes /usr/lib/perl folder and /usr/lib/p=
erl5 symbol link, libhugetlbfs also produces /usr/lib/perl5 folder, there m=
ight be conflict when doing populate_sysroot, DEPENDS =3D "perl" can be add=
ed into libhugetlbfs recipe to bypass the issue, but the perl5 symbol link =
is not available anymore, this should be an incorrect method. Meanwhile, ev=
en if above way is used, same error will appear if perl is rebuilt due to p=
erl5 folder of libhugetlbfs exists and perl5 symbol link can't be created.=
=20

Error log:=20
ERROR: Error executing a python function in /home/yocto/workspace/sdk-devel=
/poky/meta/recipes-devtools/perl/perl_5.14.3.bb:
CalledProcessError: Command 'tar -cf - -C /home/yocto/workspace/sdk-devel/b=
uild_t4240qds_release/tmp/work/ppce6500-fsl_networking-linux/perl/5.14.3-r1=
/sysroot-destdir -ps . | tar -xf - -C /home/yocto/workspace/sdk-devel/build=
_t4240qds_release/tmp/sysroots/t4240qds' returned non-zero exit status 2 wi=
th output tar: ./usr/lib/perl5: Cannot create symlink to `perl': File exist=
s
tar: Exiting with failure status due to previous errors


Best Regards,

Zhenhua



