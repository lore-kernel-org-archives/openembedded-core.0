Return-Path: <martyn.welch@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739F6C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 08:22:16 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web09.9832.1635409335560158725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 01:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: collabora.com, ip: 46.235.227.227, mailfrom: martyn.welch@collabora.com)
Received: from [IPv6:2a00:23c6:c31a:b300:ee2f:9265:f233:6c40] (unknown
 [IPv6:2a00:23c6:c31a:b300:ee2f:9265:f233:6c40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C0E521F44D1B;
	Thu, 28 Oct 2021 09:22:13 +0100 (BST)
Message-ID: <d21db240f21e6b2f3b9752784ea4d448caf16044.camel@collabora.com>
Subject: Re: [OE-core] [PATCHv2 2/2] insane.bbclass: Add a check for
 directories that are expected to be empty
From: Martyn Welch <martyn.welch@collabora.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Oct 2021 09:22:11 +0100
In-Reply-To: <20211027180522.19680-2-pkj@axis.com>
References: <20211027180522.19680-1-pkj@axis.com>
	 <20211027180522.19680-2-pkj@axis.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0-2 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 08:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157579

On Wed, 2021-10-27 at 20:05 +0200, Peter Kjellerstedt wrote:
> The empty-dirs QA check verifies that all directories specified in
> QA_EMPTY_DIRS are empty. It is possible to specify why a directory is
> expected to be empty by defining QA_EMPTY_DIRS_RECOMMENDATION:<path>,
> which will then be included in the error message if the directory is
> not empty. If it is not specified for a directory, then "but it is
> expected to be empty" will be used.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> PATCHv2: No changes.
>=20
> =C2=A0meta/classes/insane.bbclass=C2=A0 | 33 ++++++++++++++++++++++++++=
++++++-
> =C2=A0meta/conf/documentation.conf |=C2=A0 2 ++
> =C2=A02 files changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/insane.bbclass
> b/meta/classes/insane.bbclass
> index 1e2f1b768a..1675adf6ac 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -37,7 +37,7 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files
> arch pkgconfig la \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 configure-gettext perllocalpod shebang-size \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 already-stripped installed-vs-shipped ldflags compile-
> host-path \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 install-host-path pn-overrides unknown-configure-option
> \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 use=
less-rpaths rpaths staticdev \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 use=
less-rpaths rpaths staticdev empty-dirs \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
> =C2=A0# Add usrmerge QA check based on distro feature
> =C2=A0ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'usrmerge', ' usrmerge', '', d)}"
> @@ -50,6 +50,21 @@ ALL_QA =3D "${WARN_QA} ${ERROR_QA}"
> =C2=A0
> =C2=A0UNKNOWN_CONFIGURE_WHITELIST ?=3D "--enable-nls --disable-nls --
> disable-silent-rules --disable-dependency-tracking --with-libtool-
> sysroot --disable-static"
> =C2=A0
> +# This is a list of directories that are expected to be empty.
> +QA_EMPTY_DIRS ?=3D " \
> +=C2=A0=C2=A0=C2=A0 /dev/pts \
> +=C2=A0=C2=A0=C2=A0 /media \
> +=C2=A0=C2=A0=C2=A0 /proc \
> +=C2=A0=C2=A0=C2=A0 /run \
> +=C2=A0=C2=A0=C2=A0 /tmp \
> +=C2=A0=C2=A0=C2=A0 ${localstatedir}/run \
> +=C2=A0=C2=A0=C2=A0 ${localstatedir}/volatile \
> +"
> +# It is possible to specify why a directory is expected to be empty
> by defining
> +# QA_EMPTY_DIRS_RECOMMENDATION:<path>, which will then be included
> in the error
> +# message if the directory is not empty. If it is not specified for
> a directory,
> +# then "but it is expected to be empty" will be used.
> +

One thing I've just noticed is that this is more strictly limited to
ensuring certain directories are empty, rather than ensuring certain
paths (which may include the existance of an empty directory or a
file). Could this be modified to allow wildcard entries, as with the
proposal I originally submitted?

> =C2=A0def package_qa_clean_path(path, d, pkg=3DNone):
> =C2=A0=C2=A0=C2=A0=C2=A0 """
> =C2=A0=C2=A0=C2=A0=C2=A0 Remove redundant paths from the path for displ=
ay.=C2=A0 If pkg isn't
> set then
> @@ -885,6 +900,22 @@ def package_qa_check_unlisted_pkg_lics(package,
> d, messages):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 "listed in LICENSE" % (package, '
> '.join(unlisted)))
> =C2=A0=C2=A0=C2=A0=C2=A0 return False
> =C2=A0
> +QAPKGTEST[empty-dirs] =3D "package_qa_check_empty_dirs"
> +def package_qa_check_empty_dirs(pkg, d, messages):
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 Check for the existence of files in directories tha=
t are
> expected to be
> +=C2=A0=C2=A0=C2=A0 empty.
> +=C2=A0=C2=A0=C2=A0 """
> +
> +=C2=A0=C2=A0=C2=A0 pkgd =3D oe.path.join(d.getVar('PKGDEST'), pkg)
> +=C2=A0=C2=A0=C2=A0 for dir in (d.getVar('QA_EMPTY_DIRS') or "").split(=
):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 empty_dir =3D oe.path.join(=
pkgd, dir)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.exists(empty_dir=
) and os.listdir(empty_dir):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rec=
ommendation =3D
> (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "but it is expected to be empty")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg=
 =3D "%s installs files in %s, %s" % (pkg, dir,
> recommendation)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe.=
qa.add_message(messages, "empty-dirs", msg)
> +
> =C2=A0def package_qa_check_encoding(keys, encode, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 def check_encoding(key, enc):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sane =3D True
> diff --git a/meta/conf/documentation.conf
> b/meta/conf/documentation.conf
> index 80ad8e10d5..45cd01374a 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -345,6 +345,8 @@ PYPI_SRC_URI[doc] =3D "The URI to use to fetch from
> pypi, default uses pythonhoste
> =C2=A0
> =C2=A0#Q
> =C2=A0
> +QA_EMPTY_DIRS[doc] =3D "A list of directories that are expected to be
> empty."
> +QA_EMPTY_DIRS_RECOMMENDATION[doc] =3D "This specifies a recommendation
> for a directory why it must be empty, which will be included in the
> error message if the directory is not empty."
> =C2=A0QMAKE_PROFILES[doc] =3D "Specifies your own subset of .pro files =
to be
> built for use with qmake."
> =C2=A0
> =C2=A0#R
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157564):
> https://lists.openembedded.org/g/openembedded-core/message/157564
> Mute This Topic: https://lists.openembedded.org/mt/86634477/6512429
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> martyn.welch@collabora.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


