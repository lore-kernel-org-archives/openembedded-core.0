Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 592 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Sep 2018 15:21:13 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE4971BF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 15:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1309931C74F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 17:11:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id oKtqTd2QomJm
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 17:11:19 +0200 (CEST)
Received: from t460p (p4FD0F5EB.dip0.t-ipconnect.de [79.208.245.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E5E5931C74EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 17:11:18 +0200 (CEST)
Date: Wed, 19 Sep 2018 17:11:13 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180919171113.21fecc56@t460p>
In-Reply-To: <20180919064135.30249-1-urs.fassler@bbv.ch>
References: <20180919064135.30249-1-urs.fassler@bbv.ch>
MIME-Version: 1.0
Subject: Re: [PATCH] openssh: resolve install conflict with openssh-sftp-server-dev
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
X-List-Received-Date: Wed, 19 Sep 2018 15:21:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


On Wed, 19 Sep 2018 08:41:35 +0200
Urs F=C3=A4ssler <urs.fassler@bbv.ch> wrote:

> Image generation fails with the configuration:
>   EXTRA_IMAGE_FEATURES =3D "ssh-server-dropbear eclipse-debug dev-pkgs"
> This is due the dependency eclipse-debug -> openssh-sftp-server ->
> openssh-dev -> openssh. openssh can not be installed since it conflicts
> with dropbear.

That's odd. Why does openssh-sftp-server depend on openssh-dev? Does openss=
h-dev contain a file which it shouldn't, e.g. a dynamically loaded module/p=
lug-in?

Regards,
Andreas

>=20
> By adding the package openssh-sftp-server-dev we have no dependency to
> openssh-dev nor openssh.
>=20
> Signed-off-by: Urs F=C3=A4ssler <urs.fassler@bbv.ch>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_7.8p1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_7.8p1.bb
> index f4b295f2df..2782cdb2ad 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
> @@ -132,7 +132,7 @@ do_install_ptest () {
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
> =20
> -PACKAGES =3D+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${=
PN}-misc ${PN}-sftp-server"
> +PACKAGES =3D+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${=
PN}-misc ${PN}-sftp-server ${PN}-sftp-server-dev"
>  FILES_${PN}-scp =3D "${bindir}/scp.${BPN}"
>  FILES_${PN}-ssh =3D "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
>  FILES_${PN}-sshd =3D "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${system=
d_unitdir}/system"
> @@ -146,6 +146,7 @@ FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
>  RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>  RDEPENDS_${PN}-sshd +=3D "${PN}-keygen ${@bb.utils.contains('DISTRO_FEAT=
URES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
>  RDEPENDS_${PN}-ptest +=3D "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
> +RDEPENDS_${PN}-sftp-server-dev +=3D "${PN}-sftp-server"
> =20
>  RPROVIDES_${PN}-ssh =3D "ssh"
>  RPROVIDES_${PN}-sshd =3D "sshd"


