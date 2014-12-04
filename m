Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E42B565D59
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 13:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 490F92E39B;
	Thu,  4 Dec 2014 14:35:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id KpucwtNqyl05; Thu,  4 Dec 2014 14:34:59 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 7DDD82E386;
	Thu,  4 Dec 2014 14:34:59 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 5AA5111C0;
	Thu,  4 Dec 2014 14:34:59 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 49CFA462;
	Thu,  4 Dec 2014 14:34:59 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 47A7B3E2BA;
	Thu,  4 Dec 2014 14:34:59 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Thu, 4 Dec 2014 14:34:59 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Dec 2014 14:34:58 +0100
Thread-Topic: [OE-core] Why is systemd installed to / (was: [yocto] Export
	bitbake variables between recipes)
Thread-Index: AdAPEGe2mQu11IfzT+OlupF3a117HgAsgHYQ
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7ACF18D45D8@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7ACF18D3E7B@xmail3.se.axis.com>
	<547E08A9.2090500@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7ACF18D42B6@xmail3.se.axis.com>
	<547F305A.5060305@windriver.com>
In-Reply-To: <547F305A.5060305@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: Why is systemd installed to / (was: [yocto] Export bitbake variables between recipes)
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
X-List-Received-Date: Thu, 04 Dec 2014 13:35:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: den 3 december 2014 16:47
> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Why is systemd installed to / (was: [yocto]
> Export bitbake variables between recipes)
>=20
> On 12/3/14, 9:36 AM, Peter Kjellerstedt wrote:
> >>> Can anyone please explain why OE-core installs systemd to /=20
> >>> rather than /usr? Because I have traced the recipe all the=20
> >>> way back to its introduction in OE classic, and I cannot=20
> >>> find any rationale for this odd decision. And it is extra=20
> >>> weird given the systemd authors' agenda that everything=20
> >>> should be in /usr (and /etc)...
> >>
> >> It's only strange compared to Fedora.  We're not Fedora.. and=20
> >> I've got systems that need to boot from a small '/' before=20
> >> mounting '/usr'.
> >
> > Speaking of Fedora, would an official image feature, e.g.,=20
> > "unified-fs", be acceptable for OE-Core that sets up the file=20
> > system with /bin, /sbin and /lib* as links to their /usr=20
> > counterparts? That would alleviate our problems with the=20
> > differences in how systemd is installed.
>=20
> The system permits developers to set the paths for the various pieces.
> To get a Fedora like unified filesystem, you could do something like:
>=20
> * provide your own fs-perms.txt:

I had not noticed fs-perms.txt before. And it seems easy enough=20
to extend via the FILESYSTEMS_PERMS_TABLES variable. :)

> /usr/bin	link	${base_bindir}
> /usr/sbin	link	${base_sbindir}
> /usr/lib	link	${base_libdir}
>=20
> Then in your local.conf:
>=20
> bindir =3D "${base_bindir}"
> sbindir =3D "${base_sbindir}"
> libdir =3D "${base_libdir}"

I think you mean the opposite, i.e., that /bin should be a=20
link to ${bindir} and ${base_bindir} should be set to ${bindir},=20
but I get your point.

> This will result in /usr/bin, sbin and lib being linked to /bin,=20
> /sbin, /lib -- and all of the package produced for your=20
> configuration will only reference '/'.
>=20
> This isn't that unusual of a configuration from what I've been told.

Which is why I think it warrants an official distro feature (an=20
image feature, as I originally suggested, will of course not do=20
if it is done the way you suggest since the packages' contents=20
are modified). That way people would not have to invent the wheel=20
over and over again (and somehow find out that there is such a=20
thing as fs-perms.txt which up until now had eluded me).

> --Mark

//Peter


