Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id D08D860F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 10:34:44 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so2643149ead.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HTjfM1QNozKLBC6s2O+L0vH0Qrwee2V+xEHHFCBjyc0=;
	b=F7yx9q0DUGiVpSF2LnEdqf/gD/R+gsYJBAJOkQlNxnBRUs9rhO0Ht9uyZ93R1cWo3u
	5770C7Ao0YdeZL3K8wzssDHApqPEq/8JZKsUXeQiUP0uu9UIGh/vzaDn/ez5mx6KWutH
	h+Ek21cofpR4/J8eEhR7bSuCD4C9oVTpUvlkG0b4eqs3/mRhw/N979/zq8ZjYBxlpdaP
	ZKGnciQKTsEe4EU2/Jb72vcB4VAckA2s06iU8dFdRG8a/DSrkQrm+BaT8IzjxzTK0Uu/
	3/vrzC4/FTd/Q5jxS4fwXidy67pyZZGLeI2zzVQEL3tYQcHpX9bRWOS5hf/zewfpZOaI
	jqRw==
X-Received: by 10.14.42.3 with SMTP id i3mr211928eeb.95.1379414086234;
	Tue, 17 Sep 2013 03:34:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm49661901eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 03:34:45 -0700 (PDT)
Date: Tue, 17 Sep 2013 12:36:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Message-ID: <20130917103621.GB7313@jama>
References: <1379408174-6732-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1379408174-6732-1-git-send-email-ming.liu@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH] vsftpd: change default secure_chroot_dir
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
X-List-Received-Date: Tue, 17 Sep 2013 10:34:45 -0000
X-Groupsio-MsgNum: 45130
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline

--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 04:56:14PM +0800, Ming Liu wrote:
> Change default value of secure_chroot_dir to /var/run/vsftpd/empty, add
> volatiles entry for it, to ensure it won't fail to start with error:
> "500 OOPS: vsftpd: not found: directory given in 'secure_chroot_dir':/var=
/share/empty"
>=20
> This shows up in both standalone mode or started by xined.

This belongs to openembedded-devel ML with [meta-networking] tag in
subject.

>=20
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  .../vsftpd/files/change-secure_chroot_dir.patch    | 55 ++++++++++++++++=
++++++
>  .../vsftpd/files/volatiles.99_vsftpd               |  1 +
>  .../recipes-daemons/vsftpd/vsftpd_3.0.0.bb         |  6 ++-
>  3 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-daemons/vsftpd/files/change-s=
ecure_chroot_dir.patch
>  create mode 100644 meta-networking/recipes-daemons/vsftpd/files/volatile=
s.99_vsftpd
>=20
> diff --git a/meta-networking/recipes-daemons/vsftpd/files/change-secure_c=
hroot_dir.patch b/meta-networking/recipes-daemons/vsftpd/files/change-secur=
e_chroot_dir.patch
> new file mode 100644
> index 0000000..5f2860e
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_d=
ir.patch
> @@ -0,0 +1,55 @@
> +vsftpd: change default value of secure_chroot_dir
> +
> +Upstream-Status: Pending
> +
> +Change secure_chroot_dir pointing to a volatile directory.
> +
> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> +---
> + INSTALL       |    6 +++---
> + tunables.c    |    2 +-
> + vsftpd.conf.5 |    2 +-
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff -urpN a/INSTALL b/INSTALL
> +--- a/INSTALL	2013-09-13 10:23:57.504972397 +0800
> ++++ b/INSTALL	2013-09-13 10:25:25.664971779 +0800
> +@@ -27,11 +27,11 @@ user in case it does not already exist.=20
> + [root@localhost root]# useradd nobody
> + useradd: user nobody exists
> +=20
> +-2b) vsftpd needs the (empty) directory /usr/share/empty in the default
> ++2b) vsftpd needs the (empty) directory /var/run/vsftpd/empty in the def=
ault
> + configuration. Add this directory in case it does not already exist. e.=
g.:
> +=20
> +-[root@localhost root]# mkdir /usr/share/empty/
> +-mkdir: cannot create directory `/usr/share/empty': File exists
> ++[root@localhost root]# mkdir /var/run/vsftpd/empty/
> ++mkdir: cannot create directory `/var/run/vsftpd/empty': File exists
> +=20
> + 2c) For anonymous FTP, you will need the user "ftp" to exist, and have a
> + valid home directory (which is NOT owned or writable by the user "ftp").
> +diff -urpN a/tunables.c b/tunables.c
> +--- a/tunables.c	2013-09-13 10:26:29.554972817 +0800
> ++++ b/tunables.c	2013-09-13 10:27:18.104972210 +0800
> +@@ -254,7 +254,7 @@ tunables_load_defaults()
> +   /* -rw------- */
> +   tunable_chown_upload_mode =3D 0600;
> +=20
> +-  install_str_setting("/usr/share/empty", &tunable_secure_chroot_dir);
> ++  install_str_setting("/var/run/vsftpd/empty", &tunable_secure_chroot_d=
ir);
> +   install_str_setting("ftp", &tunable_ftp_username);
> +   install_str_setting("root", &tunable_chown_username);
> +   install_str_setting("/var/log/xferlog", &tunable_xferlog_file);
> +diff -urpN a/vsftpd.conf.5 b/vsftpd.conf.5
> +--- a/vsftpd.conf.5	2013-09-13 10:09:33.774972462 +0800
> ++++ b/vsftpd.conf.5	2013-09-13 10:10:41.914971989 +0800
> +@@ -969,7 +969,7 @@ This option should be the name of a dire
> + directory should not be writable by the ftp user. This directory is used
> + as a secure chroot() jail at times vsftpd does not require filesystem a=
ccess.
> +=20
> +-Default: /usr/share/empty
> ++Default: /var/run/vsftpd/empty
> + .TP
> + .B ssl_ciphers
> + This option can be used to select which SSL ciphers vsftpd will allow f=
or
> diff --git a/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vs=
ftpd b/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd
> new file mode 100644
> index 0000000..8a602ba
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd
> @@ -0,0 +1 @@
> +d root root 0755 /var/run/vsftpd/empty none
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/met=
a-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> index 2c3e009..49d5d2a 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> @@ -14,6 +14,8 @@ SRC_URI =3D "https://security.appspot.com/downloads/vsf=
tpd-${PV}.tar.gz \
>             file://vsftpd.conf \
>             file://vsftpd.user_list \
>             file://vsftpd.ftpusers \
> +           file://change-secure_chroot_dir.patch \
> +           file://volatiles.99_vsftpd \
>  "
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47b1=
271 \
> @@ -40,7 +42,7 @@ LDFLAGS_append =3D" -lcrypt -lcap"
>  do_configure() {
>      # Fix hardcoded /usr, /etc, /var mess.
>      cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${localstat=
edir}:g \
> -    |sed s:\"${prefix}/share/empty:\"${localstatedir}/share/empty:g |sed=
 s:\"/etc:\"${sysconfdir}:g > tunables.c.new
> +    |sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new
>      mv tunables.c.new tunables.c
>  }
> =20
> @@ -57,6 +59,8 @@ do_install() {
>      install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
>      install -d ${D}${sysconfdir}/init.d/
>      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
> +    install -d ${D}/${sysconfdir}/default/volatiles
> +    install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/def=
ault/volatiles/99_vsftpd
> =20
>      install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
>      install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
> --=20
> 1.8.3.3
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI4MKUACgkQN1Ujt2V2gByhGQCggaP580hTcUT7hlY1jCanmxRk
uEQAni5o6nnm1fenEGj3+L67p44Zmolf
=WQEk
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
