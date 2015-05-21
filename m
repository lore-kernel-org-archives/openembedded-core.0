Return-Path: <steffen.pankratz@elektrobit.com>
Received: from smtpgw1fi.elektrobit.com (smtpgw1fi.elektrobit.com
	[194.136.18.128])
	by mail.openembedded.org (Postfix) with ESMTP id 8A31572D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 13:48:37 +0000 (UTC)
Received: from encgw2fi.ebgroup.elektrobit.com ([172.16.0.99])
	by smtpgw1fi.elektrobit.com (8.14.4/8.14.4) with ESMTP id
	t4LDmb9K019575
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL) for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 16:48:37 +0300
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by encgw2fi.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 16:48:36 +0300 (EEST)
Received: from DEERES07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001]) by
	deeres07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001%11]) with
	mapi id 14.03.0181.006; Thu, 21 May 2015 15:48:36 +0200
From: <Steffen.Pankratz@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: Problem with module.bbclass
Thread-Index: AdCTzMb6lWgvz2ZQQiGBTLauA9LXVQ==
Date: Thu, 21 May 2015 13:48:34 +0000
Message-ID: <81B0EC78FE09F04E8E0FF9B9C2BF8A3649393797@deeres07.ebgroup.elektrobit.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.26.198]
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [172.16.0.202]);
	Thu, 21 May 2015 16:48:37 +0300 (EEST)
X-Virus-Scanned: at elektrobit.com
X-Scanned-By: MIMEDefang 2.76 on 172.16.0.202
Subject: Problem with module.bbclass
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
X-List-Received-Date: Thu, 21 May 2015 13:48:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am using http://git.openembedded.org/openembedded-core/tree/meta/classes/=
module.bbclass as a base for my recipe to compile a kernel module outside o=
f the kernel tree.

This is my recipe:

DESCRIPTION =3D "Nouveau kernel module"
SECTION =3D "kernel/modules"
LICENSE =3D "CLOSED" #fixme
PR =3D "r0"
SRC_URI =3D "git://github.com/Gnurou/nouveau;protocol=3Dhttps;branch=3Dstag=
ing"
SRCREV =3D "c256f9450c613cd5075fc8c4a407686925041487"
S =3D "${WORKDIR}/git/drm/nouveau"
inherit module

Naively, I hoped that would work out of the box. Of course it did not :) an=
d every compiler call resulted in an error message like this:

| make: *** [lib/nvif/notify.o] Error 1
| In file included from ./lib/include/nvif/os.h:32:0,
|                  from ./drm/nouveau/include/nvif/object.h:4,
|                  from ./drm/nouveau/include/nvif/device.h:4,
|                  from drm/nouveau/nvif/device.c:25:
| /home/vagrant/repos/tk1/build/tmp/sysroots/x86_64-linux/usr/lib/arm-poky-=
linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.9.2/include/stdint.h:9:26: fatal=
 error: stdint.h: No such file or directory
|  # include_next <stdint.h>
|                           ^
| compilation terminated.

I could resolve that issue by adding the following line to my recipe:

EXTRA_OEMAKE=3D'-C "${STAGING_KERNEL_DIR}"'

And another problem I had faced was that using:

S =3D "${WORKDIR}/git/drm/nouveau"

Compiled all kernel modules inside the kernel tree, instead only the nouvea=
u kernel module.

I could solve that as well and finally I ended up with:

EXTRA_OEMAKE=3D'-C "${STAGING_KERNEL_DIR}" M=3D"${S}"/drm/nouveau/'

Now, I am not sure if I am doing something wrong or if there maybe is a pro=
blem with module.bbclass.


--
Steffen Pankratz
Expert, Software Integration & Services

EB - Driving the Future of Software
Phone:  +49 9131 7701-6605
Fax: +49 9131 7701 6333
steffen.pankratz@elektrobit.com
http://automotive.elektrobit.com/
PGP-Key: http://keyserver.elektrobit.com/

Elektrobit Automotive GmbH, Am Wolfsmantel 46, 91058 Erlangen, Germany
Managing Directors Alexander Kocher, Gregor Zink
Register Court F=FCrth HRB 488



----------------------------------------------------------------
Please note: This e-mail may contain confidential information
intended solely for the addressee. If you have received this
e-mail in error, please do not disclose it to anyone, notify
the sender promptly, and delete the message from your system.
Thank you.


