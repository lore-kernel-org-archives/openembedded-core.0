Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 567 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Dec 2014 18:37:22 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 4037D601A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 18:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 209912E322;
	Tue,  2 Dec 2014 19:27:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Lo4lEd0oqIfc; Tue,  2 Dec 2014 19:27:48 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id A0B0C2E07C;
	Tue,  2 Dec 2014 19:27:48 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 7CE15F8C;
	Tue,  2 Dec 2014 19:27:48 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 701F7F42;
	Tue,  2 Dec 2014 19:27:48 +0100 (CET)
Received: from xmail4.se.axis.com (xmail4.se.axis.com [10.0.5.46])
	by thoth.se.axis.com (Postfix) with ESMTP id 6C712342A8;
	Tue,  2 Dec 2014 19:27:48 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail4.se.axis.com
	([fe80::2dfa:6a3a:302a:d4e8%14]) with mapi;
	Tue, 2 Dec 2014 19:27:48 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Fabrice Coulon <fabrice@axis.com>,
	"OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 2 Dec 2014 19:27:46 +0100
Thread-Topic: Why is systemd installed to / (was: [yocto] Export bitbake
	variables between recipes)
Thread-Index: AdAOXapqwVhRF1POQG+rIjr6/rDPMw==
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7ACF18D3E7B@xmail3.se.axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: Henning Heinold <heinold@inf.fu-berlin.de>,
	"Koen Kooi \(koen@dominion.thruhere.net\)" <koen@dominion.thruhere.net>
Subject: Why is systemd installed to / (was: [yocto] Export bitbake variables between recipes)
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
X-List-Received-Date: Tue, 02 Dec 2014 18:37:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[ I am moving this discussion to the OE-core list as I believe=20
  that is where it belongs. ]

> -----Original Message-----
> From: yocto-bounces@yoctoproject.org [mailto:yocto-
> bounces@yoctoproject.org] On Behalf Of Paul Eggleton
> Sent: den 2 december 2014 15:07
> To: Fabrice Coulon
> Cc: yocto@yoctoproject.org
> Subject: Re: [yocto] Export bitbake variables between recipes
>=20
> Hi Fabrice,
>=20
> On Tuesday 02 December 2014 14:07:40 Fabrice Coulon wrote:
> > Is it possible to export one bitbake variable from one recipe=20
> > and make it available from inside another recipe? For example:=20
> > we want to export from our systemd_%.bbappend where the=20
> > systemctl command has been installed, in order to, from another=20
> > recipe depending on systemd, refer to the absolute path where=20
> > systemctl was installed. Any ideas or suggestions on how to do
> > that?
>=20
> There's no mechanism to do this, no. The only way for this kind of
> thing to work is for it to be specified at the configuration level=20
> (e.g. ${bindir} points to the subdirectory /usr/bin and this variable=20
> would be used both when choosing where the executable should be=20
> installed and finding it later - this would typically be how this=20
> kind of problem would be solved since it would be unusual to have=20
> systemctl installed somewhere other than ${bindir}).

Actually, since the systemd recipe in Poky is configured in an=20
extremely weird way (using --with-rootprefix=3D${base_prefix} and=20
--with-rootlib=3D${base_libdir}), systemctl actually ends up in=20
${base_bindir} rather than ${bindir}. And this is the whole reason=20
for our troubles since everything else we had prior to switching=20
to Poky expected systemd to be installed in /usr...

Can anyone please explain why OE-core installs systemd to / rather=20
than /usr? Because I have traced the recipe all the way back to its=20
introduction in OE classic, and I cannot find any rationale for=20
this odd decision. And it is extra weird given the systemd authors'=20
agenda that everything should be in /usr (and /etc)...

> (Another alternative is pkg-config, but I don't think that really
> applies in this situation.)

Nope.

> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

//Peter



