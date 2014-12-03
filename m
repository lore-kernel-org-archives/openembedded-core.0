Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59EEA65C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 15:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 91D80180C5;
	Wed,  3 Dec 2014 16:36:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id lQkkX98FfWeh; Wed,  3 Dec 2014 16:36:22 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id F0ADD180A3;
	Wed,  3 Dec 2014 16:36:21 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D08D4E6F;
	Wed,  3 Dec 2014 16:36:21 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id C4276A26;
	Wed,  3 Dec 2014 16:36:21 +0100 (CET)
Received: from xmail4.se.axis.com (xmail4.se.axis.com [10.0.5.46])
	by seth.se.axis.com (Postfix) with ESMTP id C28023E278;
	Wed,  3 Dec 2014 16:36:21 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail4.se.axis.com
	([fe80::2dfa:6a3a:302a:d4e8%14]) with mapi;
	Wed, 3 Dec 2014 16:36:22 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 3 Dec 2014 16:36:18 +0100
Thread-Topic: [OE-core] Why is systemd installed to / (was: [yocto] Export
	bitbake variables between recipes)
Thread-Index: AdAOYCjjQbAEExsqSTK0wiokoM+J4AAqWl+A
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7ACF18D42B6@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7ACF18D3E7B@xmail3.se.axis.com>
	<547E08A9.2090500@windriver.com>
In-Reply-To: <547E08A9.2090500@windriver.com>
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
X-List-Received-Date: Wed, 03 Dec 2014 15:36:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: den 2 december 2014 19:45
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Why is systemd installed to / (was: [yocto]
> Export bitbake variables between recipes)
>=20
> On 12/2/14, 12:27 PM, Peter Kjellerstedt wrote:
> > [ I am moving this discussion to the OE-core list as I believe
> >    that is where it belongs. ]
> >
> >> -----Original Message-----
> >> From: yocto-bounces@yoctoproject.org [mailto:yocto-
> >> bounces@yoctoproject.org] On Behalf Of Paul Eggleton
> >> Sent: den 2 december 2014 15:07
> >> To: Fabrice Coulon
> >> Cc: yocto@yoctoproject.org
> >> Subject: Re: [yocto] Export bitbake variables between recipes
> >>
> >> Hi Fabrice,
> >>
> >> On Tuesday 02 December 2014 14:07:40 Fabrice Coulon wrote:
> >>> Is it possible to export one bitbake variable from one recipe
> >>> and make it available from inside another recipe? For example:
> >>> we want to export from our systemd_%.bbappend where the
> >>> systemctl command has been installed, in order to, from another
> >>> recipe depending on systemd, refer to the absolute path where
> >>> systemctl was installed. Any ideas or suggestions on how to do
> >>> that?
> >>
> >> There's no mechanism to do this, no. The only way for this kind of
> >> thing to work is for it to be specified at the configuration level
> >> (e.g. ${bindir} points to the subdirectory /usr/bin and this variable
> >> would be used both when choosing where the executable should be
> >> installed and finding it later - this would typically be how this
> >> kind of problem would be solved since it would be unusual to have
> >> systemctl installed somewhere other than ${bindir}).
> >
> > Actually, since the systemd recipe in Poky is configured in an
> > extremely weird way (using --with-rootprefix=3D${base_prefix} and
> > --with-rootlib=3D${base_libdir}), systemctl actually ends up in
> > ${base_bindir} rather than ${bindir}. And this is the whole reason
> > for our troubles since everything else we had prior to switching
> > to Poky expected systemd to be installed in /usr...
>=20
> Because we support the split between / and /usr for embedded systems
> with multiple partitions/disks.

Hmm, ok.

> If you set it to /usr, then technically you are violating the FHS, as
> you now require /usr in order to boot the system.

Ok. We have never split / and /usr in our products so that thought=20
did not occur to me.

> What programs are expecting these things in a specific path?  Why
> aren't they either using the PATH, or using a similar configuration=20
> mechanism via the recipes?

In the specific case it was a systemd unit file that wants to do=20
ExecStartPost=3D/usr/bin/systemctl kill --signal HUP rsyslog.service
and since paths in unit files must be absolute this caused problems=20
for us when building with Poky since then systemctl is in /bin, but=20
when building with our old build system it is in /usr/bin...

Now it is no major problem to fix the specific unit file, because we=20
can just do ExecStartPost=3D/bin/sh -c "systemctl kill ...", but the=20
difference between our two build systems has caused us quite a lot =20
of extra work.

> > Can anyone please explain why OE-core installs systemd to / rather
> > than /usr? Because I have traced the recipe all the way back to its
> > introduction in OE classic, and I cannot find any rationale for
> > this odd decision. And it is extra weird given the systemd authors'
> > agenda that everything should be in /usr (and /etc)...
>=20
> It's only strange compared to Fedora.  We're not Fedora.. and I've=20
> got systems that need to boot from a small '/' before mounting '/usr'.

Speaking of Fedora, would an official image feature, e.g., "unified-fs",=20
be acceptable for OE-Core that sets up the file system with /bin, /sbin=20
and /lib* as links to their /usr counterparts? That would alleviate our=20
problems with the differences in how systemd is installed.

> (In prior discussions we've made the decision to not fix every library
> or application, but there is a warning you can enable that will show=20
> you what libraries and applications live in '/' but have obvious=20
> linkage to '/usr'.)
>=20
> >> (Another alternative is pkg-config, but I don't think that really
> >> applies in this situation.)
> >
> > Nope.
> >
> >> Cheers,
> >> Paul
> >>
> >> --
> >>
> >> Paul Eggleton
> >> Intel Open Source Technology Centre
> >
> > //Peter

//Peter


