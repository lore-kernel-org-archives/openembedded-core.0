Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A8ED2F032
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 14:00:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11369.1769522396021901577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Xx3YvElH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9B97AC211C0
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 13:59:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8066C606F5;
	Tue, 27 Jan 2026 13:59:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E5C5119A8647;
	Tue, 27 Jan 2026 14:59:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769522393; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uln43mBr+LhLx8PXwEPoUQLgsGCvO1bpkjov98EBMEI=;
	b=Xx3YvElH6OxxLuLBPeVCfh0E6Jp/hBG3GOQK4uKSDyhbdhqIkwJG4e5NX52izf2V7n16Cf
	M0j+6oE+DT+3OvUwQbAVeNHUvQ9tQPJQRInuLqe4pwxRIxTPzfYdiqJQqE0w9iK8G61/ZH
	MsiZJmIKZuRgUoEEXdlHTIjuCCypkiDfohDdm+cvBIm5JHsrmy7cF0/aWFhdwIHTA2Bpas
	e2aP+TvgsXTF47bqbQJgeOHAkLYmz/QfPlUUrhUWsdSySCcLj1dPJfywBGOsXA0w3TnjsM
	xux2wXhf4qJPa08r8lM3BI/PAEDejJ8w4rWYbm51IZIrrNy2/Lcl2nBzaExP0A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 14:59:51 +0100
Message-Id: <DFZFC4DZCGPP.23B0TOYETVJI8@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 1/2] oe-setup-layers: support inline URI
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <corentin.guillevic@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260123172613.3305069-1-corentin.guillevic@smile.fr>
In-Reply-To: <20260123172613.3305069-1-corentin.guillevic@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 14:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230044

On Fri Jan 23, 2026 at 6:26 PM CET, Corentin Guillevic via lists.openembedd=
ed.org wrote:
> Most of the time, when we describe a remote, the layer data (also used by
> the script bitbake-setup) looks like this:
>
> "bitbake": {
>     "git-remote": {
>         "remotes": {
>             "origin": {
>                 "uri": "https://git.openembedded.org/bitbake"
>             }
>         },
>         ...
>     }
> }
>
> i.e. an URI with the common name 'origin'. Alternatively, we could simpli=
fy this, by
> using a shorter structure with the property 'uri' only:
>
> "bitbake": {
>     "git-remote": {
>         "uri": "https://git.openembedded.org/bitbake
>
> ",
>         ...
>     }
> }
>
> These properties can be used together.
>
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---

Hi Corentin,

Thanks for the new version.

It's been some time, so I have a doubt now: does this path have any
dependency on another series? So far I have this failing selftest:

2026-01-27 09:30:15,277 - oe-selftest - INFO - bblayers.BitbakeLayers.test_=
validate_examplelayersjson (subunit.RemotedTestCase)
2026-01-27 09:30:15,282 - oe-selftest - INFO -  ... FAIL
...
2026-01-27 09:30:15,282 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/bblayers.py", line 163, in test_val=
idate_examplelayersjson
    self.validate_layersjson(json)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/bblayers.py", line 159, in validate=
_layersjson
    self.validate_json(json, "layers.schema.json")
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/bblayers.py", line 152, in validate=
_json
    result =3D runCmd(
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/build-st-845522/tmp/work/x86_64-linux/python3-jsonschema-native/4.26.0/r=
ecipe-sysroot-native/usr/bin/nativepython3 /srv/pokybuild/yocto-worker/oe-s=
elftest-debian/build/build-st-845522/tmp/work/x86_64-linux/python3-jsonsche=
ma-native/4.26.0/recipe-sysroot-native/usr/bin/jsonschema -i /srv/pokybuild=
/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/files/=
layers.example.json --base-uri file:///srv/pokybuild/yocto-worker/oe-selfte=
st-debian/build/layers/bitbake/bin/../setup-schema/ /srv/pokybuild/yocto-wo=
rker/oe-selftest-debian/build/layers/bitbake/bin/../setup-schema/layers.sch=
ema.json' returned non-zero exit status 1:
/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-845522/tmp/wo=
rk/x86_64-linux/python3-jsonschema-native/4.26.0/recipe-sysroot-native/usr/=
bin/jsonschema:5: DeprecationWarning: The jsonschema CLI is deprecated and =
will be removed in a future version. Please use check-jsonschema instead, w=
hich can be installed from https://pypi.org/project/check-jsonschema/
  from jsonschema.cli import main
{'branch': 'master', 'describe': '', 'uri': 'https://github.com/kanavin/met=
a-alex', 'rev': '05b25605fb8b2399e4706d7323828676bf0da0b5'}: Additional pro=
perties are not allowed ('uri' was unexpected)
{'branch': 'master', 'describe': '15.0-hardknott-3.3-310-g0a96edae', 'uri':=
 'git://git.yoctoproject.org/meta-intel', 'rev': '0a96edae609a3f48befac36af=
82cf1eed6786b4a'}: Additional properties are not allowed ('uri' was unexpec=
ted)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3102
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2998

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


