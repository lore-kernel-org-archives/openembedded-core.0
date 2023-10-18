Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C02CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 06:40:14 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.275750.1697611211959584877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 23:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qt0Dw-0005NA-MT; Wed, 18 Oct 2023 08:40:08 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qt0Dv-002UeU-QX; Wed, 18 Oct 2023 08:40:07 +0200
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1qt0Dv-00GPLi-HS; Wed, 18 Oct 2023 08:40:07 +0200
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <20231017132647.352938-2-lukas.funke-oss@weidmueller.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Vyacheslav Yurkov
 <uvv.mail@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, Lukas Funke
 <lukas.funke@weidmueller.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH v2 1/4] classes: go-vendor: Add go-vendor class
Date: Wed, 18 Oct 2023 08:36:24 +0200
In-reply-to: <20231017132647.352938-2-lukas.funke-oss@weidmueller.com>
Message-ID: <6rbkcwigc8.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 06:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189369

Hi Lukas,

just two small typos I stumbled over.

On Tue, Oct 17 2023 at 15:26 +0200, "Lukas Funke" <lukas.funke-oss@weidmuel=
ler.com> wrote:
> From: Lukas Funke <lukas.funke@weidmueller.com>
>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> ---
>  meta/classes/go-vendor.bbclass | 135 +++++++++++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 meta/classes/go-vendor.bbclass
>
> diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbcl=
ass
> new file mode 100644
> index 0000000000..13f1b8b2be
> --- /dev/null
> +++ b/meta/classes/go-vendor.bbclass
> @@ -0,0 +1,135 @@
> +#
> +# Copyright 2023 (C) Weidmueller GmbH & Co KG
> +# Author: Lukas Funke <lukas.funke@weidmueller.com>
> +#
> +# Handle Go vendor support for offline builds
> +#
> +# When importing Go modules, Go downloads the imported module using

s/imported module/imported modules/

> +# a network (proxy) connection ahead of the compile stage. This contradi=
cts
> +# the yocto build concept of fetching every source ahead of build-time
> +# and supporting offline builds.
> +#
> +# To support offline builds, we use Go 'vendoring': module dependencies =
are
> +# downloaded during the fetch-phase and unpacked into the modules 'vendo=
r'
> +# folder. Additinally a manifest file is generated for the 'vendor' fold=
er

s/Additinally/Additionally/

Best regards
Ulrich


> +#
> +
> +inherit go-mod
> +
> +def go_src_uri(repo, version, path=3DNone, subdir=3DNone, \
> +                vcs=3D'git', replaces=3DNone, pathmajor=3DNone):
> +
> +    destsuffix =3D "git/src/import/vendor.fetch"
> +    go_module_path =3D repo if not path else path
> +
> +    src_uri =3D "{}://{}" \
> +              ";name=3D{}" \
> +              "".format(vcs, repo, \
> +                        go_module_path.replace('/', '.'))
> +
> +    src_uri +=3D ";destsuffix=3D{}/{}@{}".format(destsuffix, \
> +                                                go_module_path, \
> +                                                version)
> +
> +    if vcs =3D=3D "git":
> +        src_uri +=3D ";nobranch=3D1;protocol=3Dhttps"
> +    if replaces:
> +        src_uri +=3D ";go_module_replacement=3D{}".format(replaces)
> +    if subdir:
> +        src_uri +=3D ";go_subdir=3D{}".format(subdir)
> +    if pathmajor:
> +        src_uri +=3D ";go_pathmajor=3D{}".format(pathmajor)
> +
> +    return src_uri
> +
> +
> +python do_go_vendor() {
> +    import shutil
> +
> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
> +
> +    if len(src_uri) =3D=3D 0:
> +        bb.error("SRC_URI is empty")
> +        return
> +
> +    default_destsuffix =3D "git/src/import/vendor.fetch"
> +    fetcher =3D bb.fetch2.Fetch(src_uri, d)
> +    go_import =3D d.getVar('GO_IMPORT')
> +    source_dir =3D d.getVar('S')
> +
> +    vendor_dir =3D os.path.join(source_dir, *['src', go_import, 'vendor'=
])
> +    import_dir =3D os.path.join(source_dir, *['src', 'import', 'vendor.f=
etch'])
> +
> +    bb.utils.mkdirhier(vendor_dir)
> +    modules =3D {}
> +
> +    for url in fetcher.urls:
> +        srcuri =3D fetcher.ud[url].host + fetcher.ud[url].path
> +
> +        # Skip main module for which the recipe is actually created
> +        if srcuri =3D=3D go_import:
> +            continue
> +
> +        # Skip local files
> +        if fetcher.ud[url].type =3D=3D 'file':
> +            continue
> +
> +        destsuffix =3D fetcher.ud[url].parm.get('destsuffix')
> +        # We derive the module path / version in the following manner (e=
xmaple):
> +        #
> +        # destsuffix =3D git/src/import/vendor.fetch/github.com/foo/bar@=
v1.2.3
> +        # p =3D github.com/foo/bar@v1.2.3
> +        # path =3D github.com/foo/bar
> +        # version =3D v1.2.3
> +
> +        p =3D destsuffix[len(default_destsuffix)+1:]
> +        path, version =3D p.split('@')
> +
> +        subdir =3D fetcher.ud[url].parm.get('go_subdir')
> +        subdir =3D "" if not subdir else subdir
> +
> +        pathMajor =3D fetcher.ud[url].parm.get('go_pathmajor')
> +        pathMajor =3D "" if not pathMajor else pathMajor
> +
> +        base =3D path[:-(len(subdir)+len(pathMajor))-1]
> +        r =3D fetcher.ud[url].parm.get('go_module_replacement')
> +
> +        if not path in modules and not r:
> +            modules[path] =3D   {
> +                                "version": version,
> +                                "src": os.path.join(import_dir, *[p, sub=
dir]),
> +                                "subdir": subdir,
> +                                "pathMajor": pathMajor,
> +                              }
> +
> +    for module_key in sorted(modules):
> +
> +        # only take the version which is explicitly listed
> +        # as a dependency in the go.mod
> +        module =3D modules[module_key]
> +        src =3D module['src']
> +
> +        # If the module is released at major version 2 or higher, the mo=
dule
> +        # path must end with a major version suffix like /v2.
> +        # This may or may not be part of the subdirectory name
> +        #
> +        # https://go.dev/ref/mod#modules-overview
> +        srcMajorVersion =3D os.path.join(src, module['pathMajor'].strip(=
'/'))
> +        if os.path.exists(srcMajorVersion):
> +            src =3D srcMajorVersion
> +        dst =3D os.path.join(vendor_dir, module_key)
> +        if os.path.exists(dst):
> +            shutil.rmtree(dst)
> +
> +        bb.debug(1, "cp %s --> %s" % (src, dst))
> +        shutil.copytree(src, dst, symlinks=3DTrue, \
> +            ignore=3Dshutil.ignore_patterns(".git", \
> +                                            "vendor", \
> +                                            "*.md", \
> +                                            "*._test.go"))
> +    # Copy vendor manifest
> +    bb.debug(1, "cp %s --> %s" % (os.path.join(d.getVar('WORKDIR'), "mod=
ules.txt"), vendor_dir))
> +    shutil.copy2(os.path.join(d.getVar('WORKDIR'), "modules.txt"), vendo=
r_dir)
> +}
> +
> +addtask go_vendor before do_populate_lic after do_unpack
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

