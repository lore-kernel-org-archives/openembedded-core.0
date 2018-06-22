Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id EFC1574AB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 15:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A14B09C31C1;
	Fri, 22 Jun 2018 11:45:21 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 7qC9jrMSH6uM; Fri, 22 Jun 2018 11:45:21 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0506C9C32E3;
	Fri, 22 Jun 2018 11:45:21 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 9vfrg1N9v0qA; Fri, 22 Jun 2018 11:45:20 -0400 (EDT)
Received: from workotop.localdomain (unknown [192.168.50.174])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D84399C31C1;
	Fri, 22 Jun 2018 11:45:20 -0400 (EDT)
Date: Fri, 22 Jun 2018 11:45:20 -0400
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20180622154520.rugqmqcdc2oelxt2@workotop.localdomain>
References: <20180621203549.6187-1-damien.riegel@savoirfairelinux.com>
	<CABcZANm1c9Ydbn3eQMErpkd3LmmOvVkQqh7AHkRcLqnHPmH1Kw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANm1c9Ydbn3eQMErpkd3LmmOvVkQqh7AHkRcLqnHPmH1Kw@mail.gmail.com>
User-Agent: NeoMutt/20180512
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: quote SYSTEMD_SERVICE in prerm and postinst
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
X-List-Received-Date: Fri, 22 Jun 2018 15:45:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 08:32:14AM -0700, Christopher Larson wrote:
> Have you tried something like this? Might need to shift it to a def'd p=
ython function to
> ensure shlex gets imported, though.
>=20
> systemctl $OPTS disable ${@' '.join(shlex.quote(s) for s in d.getVar
> ('SYSTEMD_SERVICE').split()}

Cool, looks way cleaner. I'll give it a try and send a v2 with that if I
can make it work.

Thanks,
--=20
Damien

> On Thu, Jun 21, 2018 at 1:36 PM Damien Riegel <[1]damien.riegel@savoirf=
airelinux.com>
> wrote:
>=20
>     Systemd mount configuration file must have a name that match the mo=
unt
>     point directory they control. So for instance, if a mount file cont=
ains
>=20
>     =A0 =A0 [Mount]
>     =A0 =A0 ...
>     =A0 =A0 Where=3D/mnt/my-data
>=20
>     The file must be named `mnt-my\x2ddata.mount`, or systemd will refu=
se to
>     honour it.
>=20
>     If this config file contains an [Install] section, it will silently=
 fail
>     because the unit file is not quoted when systemctl is called. To fi=
x
>     that, quote `${SYSTEMD_SERVICE}` in prerm and postinst hooks.
>=20
>     Signed-off-by: Damien Riegel <[2]damien.riegel@savoirfairelinux.com=
>
>     ---
>     =A0meta/classes/systemd.bbclass | 8 ++++----
>     =A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
>     diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bb=
class
>     index 1b134322fb..589e73c855 100644
>     --- a/meta/classes/systemd.bbclass
>     +++ b/meta/classes/systemd.bbclass
>     @@ -34,10 +34,10 @@ if type systemctl >/dev/null 2>/dev/null; then
>     =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 systemctl daemon-reload
>     =A0 =A0 =A0 =A0 fi
>=20
>     -=A0 =A0 =A0 =A0systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SE=
RVICE}
>     +=A0 =A0 =A0 =A0systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} "${SYSTEMD_S=
ERVICE}"
>=20
>     =A0 =A0 =A0 =A0 if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" =3D "enabl=
e" ]; then
>     -=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemctl --no-block restart ${SYST=
EMD_SERVICE}
>     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemctl --no-block restart "${SYS=
TEMD_SERVICE}"
>     =A0 =A0 =A0 =A0 fi
>     =A0fi
>     =A0}
>     @@ -51,10 +51,10 @@ fi
>=20
>     =A0if type systemctl >/dev/null 2>/dev/null; then
>     =A0 =A0 =A0 =A0 if [ -z "$D" ]; then
>     -=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemctl stop ${SYSTEMD_SERVICE}
>     +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemctl stop "${SYSTEMD_SERVICE}"
>     =A0 =A0 =A0 =A0 fi
>=20
>     -=A0 =A0 =A0 =A0systemctl $OPTS disable ${SYSTEMD_SERVICE}
>     +=A0 =A0 =A0 =A0systemctl $OPTS disable "${SYSTEMD_SERVICE}"
>     =A0fi
>     =A0}
>=20
>     --
>     2.17.1
>=20
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     [3]Openembedded-core@lists.openembedded.org
>     [4]http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>=20
> References:
>=20
> [1] mailto:damien.riegel@savoirfairelinux.com
> [2] mailto:damien.riegel@savoirfairelinux.com
> [3] mailto:Openembedded-core@lists.openembedded.org
> [4] http://lists.openembedded.org/mailman/listinfo/openembedded-core

