Return-Path: <prvs=025898840=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 May 2019 07:08:16 UTC
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC4B7DFA1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 07:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1557385698; x=1588921698;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=yiLFtRr61mw7MYn+Bq1GWgWIFXTykx18Z2/EIdl0x7U=;
	b=pIzLbtg+L1FlGYYoWoa0GuiErMCQvQ8SEyncixLDq+ebvujQoTdZO6sW
	+eQCBowdiaWULf6AjoU6+TRSsdUvTQzyjoxIYKLBBhEKzQ+08cqs0WGxn
	k1FdxH9nfBcWXvTWY4KvweCHUGq5/No3L1nec4Ew6dnUgBrqMd2jp3UUd M=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 09 May 2019 09:00:58 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw6.muc with ESMTP/TLS;
	09 May 2019 09:00:56 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb5.muc with ESMTP/TLS; 09 May 2019 09:00:56 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Thu, 9 May 2019 09:00:56 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Thu, 9 May 2019 09:00:56 +0200
From: <Mikko.Rapeli@bmw.de>
To: <mark.hatle@windriver.com>
Thread-Topic: [OE-core] [PATCH 2/2] openssh: usable sshd depends on rngd from
	rng-tools
Thread-Index: AQHVBaGpALdn5Btobk+wHBWkPPApHaZhIdoAgAAETgCAABiwAIAA/kMA
Date: Thu, 9 May 2019 07:00:56 +0000
Message-ID: <20190509070056.GF3459@hiutale>
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
	<1557321969-28686-2-git-send-email-mikko.rapeli@bmw.de>
	<20190508140708.GC25917@localhost> <20190508142232.GC3459@hiutale>
	<ed9aeb09-d0cd-1b47-ee98-acdef03cb53b@windriver.com>
In-Reply-To: <ed9aeb09-d0cd-1b47-ee98-acdef03cb53b@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.33]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, bunk@stusta.de
Subject: Re: [PATCH 2/2] openssh: usable sshd depends on rngd from rng-tools
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
X-List-Received-Date: Thu, 09 May 2019 07:08:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1BE149A8EF0FF4892FBD9ED465897F0@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2019 at 06:50:54PM +0300, Mark Hatle wrote:
> On 5/8/19 5:22 PM, Mikko.Rapeli@bmw.de wrote:
> > On Wed, May 08, 2019 at 05:07:08PM +0300, Adrian Bunk wrote:
> >> On Wed, May 08, 2019 at 04:26:09PM +0300, Mikko Rapeli wrote:
> >>> Since openssl 1.1.1 and openssh which uses it, sshd
> >>> startup is delayed. The delays range from few seconds
> >>> to minutes and even to hours. The delays are visible
> >>> in host keys generation and when sshd process is started
> >>> in response to incoming TCP connection but is failing
> >>> to provide SSH version string and clients or tests time out.
> >>>
> >>> In all cases traces show that sshd is waiting for getentropy()
> >>> system call to return from Linux kernel, which returns only
> >>> after kernel side random number pool is initialized. The pool
> >>> is initialized via various entropy source which may be
> >>> missing on embedded development boards or via rngd from
> >>> rng-tools package from userspace. HW random number generation
> >>> and kernel support help but rngd is till needed to feed that data
> >>> back to the Linux kernel.
> >>>
> >>> Example from an NXP imx8 board shows that kernel random number pool
> >>> initialization can take over 400 seconds without rngd,
> >>> and with rngd it is initialized at around 4 seconds after boot.
> >>> The completion of initialization is visible in kernel dmesg with line
> >>> "random: crng init done".
> >>> ...
> >>> --- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> >>> +++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> >>> @@ -148,6 +148,7 @@ FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
> >>> =20
> >>>  RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> >>>  RDEPENDS_${PN}-sshd +=3D "${PN}-keygen ${@bb.utils.contains('DISTRO_=
FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> >>> +RDEPENDS_${PN}-sshd +=3D "rng-tools"
> >>> ...
> >>
> >> This should only be an RRECOMMENDS so that people can opt out of it.
> >>
> >> E.g. CONFIG_RANDOM_TRUST_CPU in the kernel can solve the same=20
> >> problem without using rng-tools on some platforms.
> >=20
> > I think this is a stronger dependency than just RRECOMMENDS. We build
> > images and disable recommends but we care that sshd starts as fast as i=
n
> > sumo and earlier yocto releases for testing etc purposes.
>=20
> I agree with Adrian here.  It should be a recommend.  The system works wi=
thout
> this, and there are valid use-cases without rngd existing on the system. =
 (In
> fact I have a couple of customers that would rather the system stall wait=
ing for
> 'real' entropy then use the values from rngd.)

Ok, at least I tried.

I can send a v2 with RRECOMMENDS instead though it is useless for me
since enabling recommends causes images to explode in size, complexity,
licensing with GPLv3 components etc.

> Note the warning on this page:  https://wiki.archlinux.org/index.php/Rng-=
tools
>=20
> In a lot of cases, this dependency on urandom on an embedded target witho=
ut even
> a clock or entropy sources results in the system having effectively the s=
ame
> entropy each time it starts up -- even with rngd.  So you get a false sen=
se of
> security.
>=20
> Once you have a hardware (or other) rng source, the tool can be useful to
> increase the amount of entropy available however... but it all starts wit=
h
> having a reasonable starting source.
>=20
> In your case, if using rngd has the entropy your device requires, based o=
n your
> system configuration (and you do not want recommends), then I think it's
> reasonable that you need to manually include it as an image dependency.

Yes, this lack of entropy on embedded devices is understood but in my case
rngd is the one reading /dev/hwrnd and pushing that back to kernel...

-Mikko=

