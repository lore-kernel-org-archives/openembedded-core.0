Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S3OCA-0002Os-No
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 09:50:34 +0100
Received: by wera1 with SMTP id a1so925227wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 00:42:04 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.99.164 as permitted sender)
	client-ip=10.180.99.164; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.99.164 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.99.164])
	by 10.180.99.164 with SMTP id er4mr2969663wib.11.1330677724285
	(num_hops = 1); Fri, 02 Mar 2012 00:42:04 -0800 (PST)
Received: by 10.180.99.164 with SMTP id er4mr2377227wib.11.1330677724228;
	Fri, 02 Mar 2012 00:42:04 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df3sm1985519wib.1.2012.03.02.00.42.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 00:42:03 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <faf86eef0c803de04cb1a23041cce959a34ecee5.1330670625.git.liezhi.yang@windriver.com>
Date: Fri, 2 Mar 2012 09:42:03 +0100
Message-Id: <3F8819B5-BFD1-4A1B-AB0E-B54829635281@dominion.thruhere.net>
References: <cover.1330670625.git.liezhi.yang@windriver.com>
	<faf86eef0c803de04cb1a23041cce959a34ecee5.1330670625.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnbxA5CzqgjbF4x+fgDagIB9L9nW4TYfnnp3a3gpEcPC575GUic2xdE2CfQW5rc6Kqfk4gb
Subject: Re: [PATCH 1/1] Fix libpam's chmod
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
X-List-Received-Date: Fri, 02 Mar 2012 08:50:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mrt. 2012, om 08:02 heeft Robert Yang het volgende geschreven:

> The libpam's has an error when generating the rootfs:
>=20
> chmod: cannot access `/usr/sbin/unix_chkpwd': No such file or =
directory
>=20
> This is because the following code in libpam_1.1.5.bb:
>=20
> pkg_postinst_pam-plugin-unix () {
>    # below is necessary to allow unix_chkpwd get user info from shadow =
file
>    # on lsb images
>    chmod 4755 ${sbindir}/unix_chkpwd
> }
>=20
> This is to set the setuid permission for unix_chkpwd (the lsb test
> requires this), but it lacks a "${D}", and we can do this in the =
install
> stage.
>=20
> [YOCTO #2049]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> meta/recipes-extended/pam/libpam_1.1.5.bb |    7 ++-----
> 1 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb =
b/meta/recipes-extended/pam/libpam_1.1.5.bb
> index 283f477..8cddca9 100644
> --- a/meta/recipes-extended/pam/libpam_1.1.5.bb
> +++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
> @@ -85,10 +85,7 @@ do_install() {
>=20
> 	install -d ${D}${sysconfdir}/pam.d/    =20
> 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
> -}
>=20
> -pkg_postinst_pam-plugin-unix () {
> -    # below is necessary to allow unix_chkpwd get user info from =
shadow file
> -    # on lsb images
> -    chmod 4755 ${sbindir}/unix_chkpwd
> +    # The lsb requires unix_chkpwd has setuid permission
> +    chmod 4755 ${D}${sbindir}/unix_chkpwd

MIssing PR bump

regards,

Koen=


