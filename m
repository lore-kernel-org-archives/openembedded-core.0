Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930F8C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:35:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7401.1784266519020159238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=j216jPFm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE4D71A1039;
	Fri, 17 Jul 2026 05:35:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7439660361;
	Fri, 17 Jul 2026 05:35:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DCB911BD3D0A;
	Fri, 17 Jul 2026 07:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784266515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dsFZECD4ON7Jp5NWbNP4NVNylqwxWa7yNp6tmhadLYg=;
	b=j216jPFmiD5TVUVULyQPc6bEGM4B929ct/SJuVrFkILYTypPWptX+O0cTWqWfs6f+m/t6+
	Q4MBR+dgwDevUrm3uMhusBKxdB9NEqDPQO3+CeuBhvDFXMYpebtQG6wTTdIpIcBgxhvGd0
	YFsW5lgmDRmK5NPQXvXhaVLpUA3EfpKjA5mOgbmGKUkZfunck7YGf4zWDw5JpXESm/a6AK
	HIQHTX7jBSzwREX93dRboEC3IThcgYtCAwVCR6I/P/oB/acGqzZdrp7ck9eJJ+9wfmpBVm
	r1zPBH4uQzv8RrVG25xYXoij5sCKfk5AI/wrPITr8u88+UsJHnnjBADVAA7wfA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 07:35:13 +0200
Message-Id: <DK0LOWOXHOHF.T6NXM98XR1SO@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] gnutls: Enable p11-kit by default
Cc: <marex@nabladev.com>, "Fabio Estevam" <festevam@nabladev.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <festevam@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716122219.569673-1-festevam@gmail.com>
In-Reply-To: <20260716122219.569673-1-festevam@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241129

On Thu Jul 16, 2026 at 2:22 PM CEST, Fabio Estevam via lists.openembedded.o=
rg wrote:
> From: Fabio Estevam <festevam@nabladev.com>
>
> U-Boot 2026.07 enables the mkeficapsule tool by default. During its
> build, mkeficapsule links against libgnutls and requires PKCS#11
> symbols such as gnutls_pkcs11_init().
>
> Commit e9f12f64279c ("gnutls: Add p11-kit for native builds") enabled
> p11-kit only for gnutls-native. However, this is not sufficient to
> build u-boot-tools, which still fails to link mkeficapsule with
> undefined references to the PKCS#11 API.
>
> Enable p11-kit in the default PACKAGECONFIG so that the required
> symbols are available and u-boot-tools builds successfully.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---

Hi Fabio,

Thanks for your patch.

It looks like this is breaking the
minidebuginfo.Minidebuginfo.test_minidebuginfo_qemu selftest, beacause
of circular dependencies. It's possible the issue comes from the test
itself:

2026-07-16 16:32:31,930 - oe-selftest - INFO - minidebuginfo.Minidebuginfo.=
test_minidebuginfo_qemu (subunit.RemotedTestCase)
2026-07-16 16:32:31,931 - oe-selftest - INFO -  ... FAIL
...
Initialising tasks...ERROR: 2129 unbuildable tasks were found.
These are usually caused by circular dependencies and any circular dependen=
cy chains found will be printed below. Increase the debug level to see a li=
st of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
  Task /srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/recipes-core/systemd/systemd_261.bb:do_create_spdx (dependen=
t Tasks ['systemd_261.bb:do_deploy_source_date_epoch', 'ninja_1.13.2.bb:do_=
create_spdx', 'meson_1.11.2.bb:do_create_spdx', 'patch_2.8.bb:do_populate_s=
ysroot', 'shadow-sysroot_4.6.bb:do_create_spdx', 'glibc_2.43.bb:do_create_s=
pdx', 'systemd_261.bb:do_unpack', 'gcc-runtime_16.1.bb:do_create_spdx', 'ut=
il-linux_2.42.2.bb:do_create_spdx', 'base-files_3.0.14.bb:do_create_spdx', =
'shared-mime-info_2.5.1.bb:do_create_spdx', 'bash-completion_2.17.0.bb:do_c=
reate_spdx', 'systemd_261.bb:do_populate_sysroot', 'perl_5.42.2.bb:do_creat=
e_spdx', 'python3-jinja2_3.1.6.bb:do_create_spdx', 'gperf_3.3.bb:do_create_=
spdx', 'zstd_1.5.7.bb:do_create_spdx', 'gettext_1.0.bb:do_create_spdx', 'py=
thon3_3.14.6.bb:do_create_spdx', 'acl_2.4.0.bb:do_create_spdx', 'elfutils_0=
.195.bb:do_create_spdx', 'libxkbcommon_1.13.2.bb:do_create_spdx', 'systemd_=
261.bb:do_create_recipe_spdx', 'systemd_261.bb:do_patch', 'pkgconf_3.0.3.bb=
:do_create_spdx', 'kmod_34.2.bb:do_create_spdx', 'opkg-utils_0.7.0.bb:do_cr=
eate_spdx', 'shadow_4.19.4.bb:do_create_spdx', 'shadow_4.19.4.bb:do_create_=
spdx', 'qemu-native_11.0.2.bb:do_create_spdx', 'libcap_2.78.bb:do_create_sp=
dx', 'systemd_261.bb:do_packagedata', 'base-passwd_3.6.8.bb:do_create_spdx'=
, 'gcc-cross_16.1.bb:do_create_spdx', 'libseccomp_2.6.0.bb:do_create_spdx',=
 'systemd_261.bb:do_package', 'quilt-native_0.69.bb:do_populate_sysroot'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_create_spdx (de=
pendent Tasks ['ninja_1.13.2.bb:do_create_spdx', 'meson_1.11.2.bb:do_create=
_spdx', 'patch_2.8.bb:do_populate_sysroot', 'glibc_2.43.bb:do_create_spdx',=
 'p11-kit_0.26.4.bb:do_populate_sysroot', 'systemd_261.bb:do_create_spdx', =
'bash-completion_2.17.0.bb:do_create_spdx', 'p11-kit_0.26.4.bb:do_packageda=
ta', 'libffi_3.7.1.bb:do_create_spdx', 'p11-kit_0.26.4.bb:do_deploy_source_=
date_epoch', 'gettext_1.0.bb:do_create_spdx', 'python3_3.14.6.bb:do_create_=
spdx', 'gtk-doc_1.36.1.bb:do_create_spdx', 'p11-kit_0.26.4.bb:do_create_rec=
ipe_spdx', 'pkgconf_3.0.3.bb:do_create_spdx', 'libtasn1_4.21.0.bb:do_create=
_spdx', 'quilt-native_0.69.bb:do_populate_sysroot', 'p11-kit_0.26.4.bb:do_p=
atch', 'p11-kit_0.26.4.bb:do_package', 'qemu-native_11.0.2.bb:do_create_spd=
x', 'p11-kit_0.26.4.bb:do_unpack', 'gcc-cross_16.1.bb:do_create_spdx', 'gcc=
-runtime_16.1.bb:do_create_spdx', 'libtasn1_4.21.0.bb:do_create_spdx'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_create_spdx (depe=
ndent Tasks ['texinfo-dummy-native.bb:do_create_spdx', 'patch_2.8.bb:do_pop=
ulate_sysroot', 'glibc_2.43.bb:do_create_spdx', 'gnutls_3.8.13.bb:do_patch'=
, 'gnutls_3.8.13.bb:do_deploy_source_date_epoch', 'libunistring_1.4.2.bb:do=
_create_spdx', 'libtool-cross_2.5.4.bb:do_create_spdx', 'libidn2_2.3.8.bb:d=
o_create_spdx', 'gnutls_3.8.13.bb:do_unpack', 'libtool-native_2.5.4.bb:do_c=
reate_spdx', 'gnutls_3.8.13.bb:do_package', 'gettext_1.0.bb:do_create_spdx'=
, 'nettle_4.0.bb:do_create_spdx', 'gtk-doc_1.36.1.bb:do_create_spdx', 'gnut=
ls_3.8.13.bb:do_packagedata', 'pkgconf_3.0.3.bb:do_create_spdx', 'p11-kit_0=
.26.4.bb:do_create_spdx', 'quilt-native_0.69.bb:do_populate_sysroot', 'gnut=
ls_3.8.13.bb:do_populate_sysroot', 'gnutls_3.8.13.bb:do_create_recipe_spdx'=
, 'gmp_6.3.0.bb:do_create_spdx', 'autoconf_2.73.bb:do_create_spdx', 'automa=
ke_1.18.1.bb:do_create_spdx', 'gcc-cross_16.1.bb:do_create_spdx', 'libsecco=
mp_2.6.0.bb:do_create_spdx', 'gcc-runtime_16.1.bb:do_create_spdx', 'libtasn=
1_4.21.0.bb:do_create_spdx'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb:do_crea=
te_spdx (dependent Tasks ['patch_2.8.bb:do_populate_sysroot', 'curl_8.21.0.=
bb:do_create_spdx', 'glibc_2.43.bb:do_create_spdx', 'gnutls_3.8.13.bb:do_cr=
eate_spdx', 'libmicrohttpd_1.0.6.bb:do_deploy_source_date_epoch', 'libtool-=
cross_2.5.4.bb:do_create_spdx', 'libmicrohttpd_1.0.6.bb:do_patch', 'libtool=
-native_2.5.4.bb:do_create_spdx', 'gettext_1.0.bb:do_create_spdx', 'libmicr=
ohttpd_1.0.6.bb:do_package', 'file_5.48.bb:do_create_spdx', 'libmicrohttpd_=
1.0.6.bb:do_unpack', 'pkgconf_3.0.3.bb:do_create_spdx', 'libmicrohttpd_1.0.=
6.bb:do_packagedata', 'autoconf_2.73.bb:do_create_spdx', 'libgcrypt_1.12.2.=
bb:do_create_spdx', 'libmicrohttpd_1.0.6.bb:do_create_recipe_spdx', 'automa=
ke_1.18.1.bb:do_create_spdx', 'gcc-cross_16.1.bb:do_create_spdx', 'gcc-runt=
ime_16.1.bb:do_create_spdx', 'quilt-native_0.69.bb:do_populate_sysroot', 'l=
ibmicrohttpd_1.0.6.bb:do_populate_sysroot'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_create_spdx (=
dependent Tasks ['patch_2.8.bb:do_populate_sysroot', 'curl_8.21.0.bb:do_cre=
ate_spdx', 'glibc_2.43.bb:do_create_spdx', 'elfutils_0.195.bb:do_packagedat=
a', 'libtool-cross_2.5.4.bb:do_create_spdx', 'elfutils_0.195.bb:do_unpack',=
 'elfutils_0.195.bb:do_package', 'libtool-native_2.5.4.bb:do_create_spdx', =
'xz_5.8.3.bb:do_create_spdx', 'elfutils_0.195.bb:do_populate_sysroot', 'elf=
utils_0.195.bb:do_create_recipe_spdx', 'gettext_1.0.bb:do_create_spdx', 'el=
futils_0.195.bb:do_deploy_source_date_epoch', 'pkgconf_3.0.3.bb:do_create_s=
pdx', 'libmicrohttpd_1.0.6.bb:do_create_spdx', 'elfutils_0.195.bb:do_patch'=
, 'zlib_1.3.2.bb:do_create_spdx', 'autoconf_2.73.bb:do_create_spdx', 'sqlit=
e3_3.53.3.bb:do_create_spdx', 'json-c_0.19.bb:do_create_spdx', 'automake_1.=
18.1.bb:do_create_spdx', 'gcc-cross_16.1.bb:do_create_spdx', 'libarchive_3.=
8.8.bb:do_create_spdx', 'gcc-runtime_16.1.bb:do_create_spdx', 'quilt-native=
_0.69.bb:do_populate_sysroot'])

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4112
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4347
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4293

I also note some failing ptests:

Failed ptests:
{'gnutls': ['pkcs11-cert-import-url-exts',
            'pkcs11-cert-import-url4-exts',
            'pkcs11-get-exts',
            'pkcs11-get-raw-issuer-exts',
            'pkcs11-import-url-privkey',
            'pkcs11-import-url-privkey-caps',
            'pkcs11-mechanisms',
            'pkcs11-obj-get-pk-algorithm',
            'pkcs11-obj-raw',
            'pkcs11-privkey-always-auth',
            'pkcs11-privkey-export',
            'pkcs11-privkey-fork',
            'pkcs11-privkey-fork-reinit',
            'pkcs11-privkey-pthread',
            'pkcs11-privkey-safenet-always-auth',
            'pkcs11-token-raw']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1930
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4028
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4042

Can you have a look at the issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


