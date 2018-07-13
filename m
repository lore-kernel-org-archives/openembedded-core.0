Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 398AF748D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 09:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8F03831E2A8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 11:14:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id N6MxoylOJtSK
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 11:14:32 +0200 (CEST)
Received: from t460p (p57A61AF4.dip0.t-ipconnect.de [87.166.26.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 9598631E2584
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 11:14:32 +0200 (CEST)
Date: Fri, 13 Jul 2018 11:14:31 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180713111431.242e1496@t460p>
In-Reply-To: <C2A454FDE6C23F41BD5011E2458C46C9F2ED1D8F@ALA-MBD.corp.ad.wrs.com>
References: <20180711060118.30193-1-Haiqing.Bai@windriver.com>
	<20180711104111.722b3643@t460p>
	<7f9f423d-07ca-2085-c0fc-c9a51ee53d62@windriver.com>
	<C2A454FDE6C23F41BD5011E2458C46C9F2ED1D8F@ALA-MBD.corp.ad.wrs.com>
MIME-Version: 1.0
Subject: Re: [PATCH] iproute2: create symbol link '/bin/ip' to '/sbin/ip.iproute2'
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
X-List-Received-Date: Fri, 13 Jul 2018 09:14:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Jul 2018 02:06:41 +0000
"Bai, Haiqing" <Haiqing.Bai@windriver.com> wrote:

> Yes,  you are right.
>=20
> The reasons that why not fix ifupdown like below:
> 1.  Some packages assume 'iproute' is their default dependency, not only =
'ifupdown'.
>=20
> 2. Of course,  the source code of 'ifupdown' is very ugly,  not only  C c=
ode but also configure files used lots of shell command with absolute path:

[...]

> 3.  I have checked all the shell commands used in the current version ,  =
except "/bin/ip",   other commands' path are right  and same to the path in=
 our rootfs.=20

I just noticed that Debian and Ubuntu install ip to /bin and create a symli=
nk from /sbin/ip to /bin/ip. How do other distributions like Fedora handle =
it?

Where does busybox install it to?

If ip gets provided by both iproute2 and busybox, will there be conflicts? =
If the new symlink doesn't get handled by update-alternatives, /bin/ip migh=
t point to iproute2 and /sbin/ip to busybox at the same time.

I think that the ip binary should be moved to /bin and the symlink in /sbin=
 should be handled by update-alternatives, too, for both busybox and iprout=
e2.

Regards,
Andreas


>=20
> B,R
> Haiqing Bai =20
>=20
> -----Original Message-----
> From: MacLeod, Randy=20
> Sent: 2018=E5=B9=B47=E6=9C=8813=E6=97=A5 4:19
> To: Andreas Oberritter; openembedded-core@lists.openembedded.org; Bai, Ha=
iqing
> Subject: Re: [OE-core] [PATCH] iproute2: create symbol link '/bin/ip' to =
'/sbin/ip.iproute2'
>=20
> On 07/11/2018 04:41 AM, Andreas Oberritter wrote:
> > On Wed, 11 Jul 2018 14:01:17 +0800
> > Haiqing Bai <Haiqing.Bai@windriver.com> wrote:
> >  =20
> >> Some applications which depend on iproute/iproute2 need to
> >> run '/sbin/ip.iproute2' through the symbol link '/bin/ip'
> >> e.g ifupdown. =20
> >=20
> > Update-alternatives is supposed to create this link already. =20
>=20
> I assume that update-alternatives is creating
>     /sbin/ip -> /sbin/ip.iproute2
> but for some reason ipupdown is looking for
>     /bin/ip
>=20
> Is that right Haiqing ?
>=20
> Why not fix ifupdown?
>=20
> ../Randy
>=20
> >  =20
> >>
> >> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> >> ---
> >>   meta/recipes-connectivity/iproute2/iproute2.inc | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/re=
cipes-connectivity/iproute2/iproute2.inc
> >> index 4fbfec6f08..71d04a1021 100644
> >> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> >> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> >> @@ -29,6 +29,8 @@ do_configure_append () {
> >>   do_install () {
> >>       oe_runmake DESTDIR=3D${D} install
> >>       mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
> >> +    install -d ${D}${base_bindir}
> >> +    ln -s ${base_sbindir}/ip.iproute2 ${D}${base_bindir}/ip
> >>       install -d ${D}${datadir}
> >>       mv ${D}/share/* ${D}${datadir}/ || true
> >>       rm ${D}/share -rf || true =20
> >  =20
>=20
>=20


