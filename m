Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWByR-0007av-9c
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 20:34:55 +0200
Received: by wye20 with SMTP id 20so3878662wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 11:31:30 -0700 (PDT)
Received: by 10.216.230.215 with SMTP id j65mr5201761weq.24.1307989890747;
	Mon, 13 Jun 2011 11:31:30 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w62sm3069405wec.18.2011.06.13.11.31.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 11:31:30 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 13 Jun 2011 20:31:27 +0200
Message-Id: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: Where is atom-pc.conf hiding?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 13 Jun 2011 18:34:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Khem was asking if I could reproduce the recent x86 breakage he was =
seeing[1] and I ran into another bug:

koen@dominion:/OE/tentacle/sources/meta-intel$ git blame =
meta-n450/conf/machine/n450.conf  | grep atom
158f88d7 (Saul Wold   2011-01-03 15:33:52 -0800  6) require =
conf/machine/atom-pc.conf

koen@dominion:/OE/tentacle/sources/meta-intel$ !find
find . -name "atom-pc.conf"
koen@dominion:/OE/tentacle/sources/meta-intel$=20

So let's drop down a level and try other layers:

koen@dominion:/OE/tentacle/sources/meta-intel$ cd ..
koen@dominion:/OE/tentacle/sources$ ls -1 | grep meta
meta-angstrom/
meta-efikamx/
meta-intel/
meta-nslu2/
meta-openembedded/
meta-openpandora/
meta-shr/
meta-smartphone/
meta-texasinstruments/
meta-xilinx/
koen@dominion:/OE/tentacle/sources$ find . -name "atom-pc.conf"
koen@dominion:/OE/tentacle/sources$=20

Still nothing. So where is it hiding?

regards,

Koen

[1] The bugs:

20:22 <khem> MACHINE=3D4 bitbake console-image
20:22 <khem> try any nonexisting machine
20:22 <khem> no error nothing

and:

20:23 <khem> so any x86 arch in angstrom is not parsable=20
20:23 <khem> and it seems to be culminating from various factors
20:24 <khem> if I remove inheriting rm_work it starts to work
20:24 <khem> if I remove BASE_PACKAGE_ARCH =3D "all" from =
allarch.bbclass it starts to work



