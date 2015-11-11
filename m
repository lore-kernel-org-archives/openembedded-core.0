Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.visioncatalog.com [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 558CD770CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 15:47:44 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id B6C0DA0018D;
	Wed, 11 Nov 2015 16:48:07 +0100 (CET)
Received: from lws-christ ([172.16.11.123])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015111116474270-22548 ;
	Wed, 11 Nov 2015 16:47:42 +0100 
Date: Wed, 11 Nov 2015 16:47:37 +0100
From: Stefan Christ <s.christ@phytec.de>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <20151111154737.GB2391@lws-christ>
References: <1444724953-43197-1-git-send-email-s.christ@phytec.de>
	<561D7E75.2050901@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <561D7E75.2050901@collabora.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 11.11.2015 16:47:42,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 11.11.2015 16:47:42
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: fix networking setup when ipv6 modules are missing
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
X-List-Received-Date: Wed, 11 Nov 2015 15:47:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> I've queued this change in my joshuagl/fido-next branch[1].

When will this patch/branch be merged into the openembedded-core's fido bra=
nch?
Is there any schedule for that?

Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
	Stefan Christ

On Tue, Oct 13, 2015 at 10:58:13PM +0100, Joshua Lock wrote:
> On 13/10/15 09:29, Stefan Christ wrote:
> >If the ipv6 kernel modules are missing, e.g. /lib/modules/<version>
> >doesn't match the runnig kernel, networkd doesn't bring up the
> >interfaces correctly. Backport fix from systemd version v220.
> >
> >Signed-off-by: Stefan Christ <s.christ@phytec.de>
> >---
> >Hi,
> >
> >this patch is only for the fido branch. The current master uses the syst=
emd
> >version v225 which already fixes the problem.
> >
> >Kind regards
> >	Stefan
>=20
> Thanks Stefan,
>=20
> I've queued this change in my joshuagl/fido-next branch[1].
>=20
> Regards,
>=20
> Joshua
>=20
> 1. http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Djoshua=
gl/fido-next
>=20
> >
> >---
> >  ...-fix-IFF=5FUP-when-ipv6-support-is-disabled.patch | 78 ++++++++++++=
++++++++++
> >  meta/recipes-core/systemd/systemd=5F219.bb           |  1 +
> >  2 files changed, 79 insertions(+)
> >  create mode 100644 meta/recipes-core/systemd/systemd/0016-networkd-fix=
-IFF=5FUP-when-ipv6-support-is-disabled.patch
> >
> >diff --git a/meta/recipes-core/systemd/systemd/0016-networkd-fix-IFF=5FU=
P-when-ipv6-support-is-disabled.patch b/meta/recipes-core/systemd/systemd/0=
016-networkd-fix-IFF=5FUP-when-ipv6-support-is-disabled.patch
> >new file mode 100644
> >index 0000000..72f9a91
> >--- /dev/null
> >+++ b/meta/recipes-core/systemd/systemd/0016-networkd-fix-IFF=5FUP-when-=
ipv6-support-is-disabled.patch
> >@@ -0,0 +1,78 @@
> >+From b1362f4f60f192aa62effd9c19e0d98b68050f5a Mon Sep 17 00:00:00 2001
> >+From: Tom Gundersen <teg@jklm.no>
> >+Date: Tue, 8 Sep 2015 12:53:46 +0200
> >+Subject: [PATCH] networkd: fix IFF=5FUP when ipv6 support is disabled
> >+
> >+Passing ipv6 options (even when they should be noops) caused IFF=5FUP to
> >+fail when ipv6 was supported.
> >+
> >+Fixes: https://bugs.freedesktop.org/show=5Fbug.cgi?id=3D90103
> >+
> >+(Backport from v220 to v219)
> >+Signed-off-by: Stefan Christ <s.christ@phytec.de>
> >+---
> >+ src/network/networkd-link.c | 43 +++++++++++++++++++++++--------------=
------
> >+ 1 file changed, 23 insertions(+), 20 deletions(-)
> >+
> >+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
> >+index f716e82..1aa1550 100644
> >+--- a/src/network/networkd-link.c
> >++++ b/src/network/networkd-link.c
> >+@@ -1104,31 +1104,34 @@ static int link=5Fup(Link *link) {
> >+                 return r;
> >+         }
> >+
> >+-        r =3D sd=5Frtnl=5Fmessage=5Fopen=5Fcontainer(req, AF=5FINET6);
> >+-        if (r < 0) {
> >+-                log=5Flink=5Ferror(link, "Could not open AF=5FINET6 co=
ntainer: %s", strerror(-r));
> >+-                return r;
> >+-        }
> >+-
> >+-        ipv6ll=5Fmode =3D link=5Fipv6ll=5Fenabled(link) ? IN6=5FADDR=
=5FGEN=5FMODE=5FEUI64 : IN6=5FADDR=5FGEN=5FMODE=5FNONE;
> >+-        r =3D sd=5Frtnl=5Fmessage=5Fappend=5Fu8(req, IFLA=5FINET6=5FAD=
DR=5FGEN=5FMODE, ipv6ll=5Fmode);
> >+-        if (r < 0) {
> >+-                log=5Flink=5Ferror(link, "Could not append IFLA=5FINET=
6=5FADDR=5FGEN=5FMODE: %s", strerror(-r));
> >+-                return r;
> >+-        }
> >++        if (socket=5Fipv6=5Fis=5Fsupported()) {
> >++                /* if the kernel lacks ipv6 support setting IFF=5FUP f=
ails if any ipv6 options are passed */
> >++                r =3D sd=5Frtnl=5Fmessage=5Fopen=5Fcontainer(req, AF=
=5FINET6);
> >++                if (r < 0) {
> >++                        log=5Flink=5Ferror(link, "Could not open AF=5F=
INET6 container: %s", strerror(-r));
> >++                        return r;
> >++                }
> >+
> >+-        if (!in=5Faddr=5Fis=5Fnull(AF=5FINET6, &link->network->ipv6=5F=
token)) {
> >+-                r =3D sd=5Frtnl=5Fmessage=5Fappend=5Fin6=5Faddr(req, I=
FLA=5FINET6=5FTOKEN, &link->network->ipv6=5Ftoken.in6);
> >++                ipv6ll=5Fmode =3D link=5Fipv6ll=5Fenabled(link) ? IN6=
=5FADDR=5FGEN=5FMODE=5FEUI64 : IN6=5FADDR=5FGEN=5FMODE=5FNONE;
> >++                r =3D sd=5Frtnl=5Fmessage=5Fappend=5Fu8(req, IFLA=5FIN=
ET6=5FADDR=5FGEN=5FMODE, ipv6ll=5Fmode);
> >+                 if (r < 0) {
> >+-                        log=5Flink=5Ferror(link, "Could not append IFL=
A=5FINET6=5FTOKEN: %s", strerror(-r));
> >++                        log=5Flink=5Ferror(link, "Could not append IFL=
A=5FINET6=5FADDR=5FGEN=5FMODE: %s", strerror(-r));
> >+                         return r;
> >+                 }
> >+-        }
> >+
> >+-        r =3D sd=5Frtnl=5Fmessage=5Fclose=5Fcontainer(req);
> >+-        if (r < 0) {
> >+-                log=5Flink=5Ferror(link, "Could not close AF=5FINET6 c=
ontainer: %s", strerror(-r));
> >+-                return r;
> >++                if (!in=5Faddr=5Fis=5Fnull(AF=5FINET6, &link->network-=
>ipv6=5Ftoken)) {
> >++                        r =3D sd=5Frtnl=5Fmessage=5Fappend=5Fin6=5Fadd=
r(req, IFLA=5FINET6=5FTOKEN, &link->network->ipv6=5Ftoken.in6);
> >++                        if (r < 0) {
> >++                                log=5Flink=5Ferror(link, "Could not ap=
pend IFLA=5FINET6=5FTOKEN: %s", strerror(-r));
> >++                                return r;
> >++                        }
> >++                }
> >++
> >++                r =3D sd=5Frtnl=5Fmessage=5Fclose=5Fcontainer(req);
> >++                if (r < 0) {
> >++                        log=5Flink=5Ferror(link, "Could not close AF=
=5FINET6 container: %s", strerror(-r));
> >++                        return r;
> >++                }
> >+         }
> >+
> >+         r =3D sd=5Frtnl=5Fmessage=5Fclose=5Fcontainer(req);
> >+--
> >+1.9.1
> >+
> >diff --git a/meta/recipes-core/systemd/systemd=5F219.bb b/meta/recipes-c=
ore/systemd/systemd=5F219.bb
> >index b972dd4..e531c04 100644
> >--- a/meta/recipes-core/systemd/systemd=5F219.bb
> >+++ b/meta/recipes-core/systemd/systemd=5F219.bb
> >@@ -43,6 +43,7 @@ SRC=5FURI =3D "git://github.com/systemd/systemd-stable=
;branch=3Dv219-stable;protocol=3Dg
> >             file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-=
as-th.patch \
> >             file://0014-Revert-rules-remove-firmware-loading-rules.patc=
h \
> >             file://0015-Revert-udev-remove-userspace-firmware-loading-s=
uppor.patch \
> >+           file://0016-networkd-fix-IFF=5FUP-when-ipv6-support-is-disab=
led.patch \
> >             file://tmpfiles-pam.patch \
> >             file://0001-Revert-core-mount-add-dependencies-to-dynamical=
ly-mo.patch \
> >             file://touchscreen.rules \
> >
>=20
> --=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

