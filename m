Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B79E66886
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 09:05:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57450.1766307950605329354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 01:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=at6C3SkV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E1D24E41D09
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 09:05:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73D0860725;
	Sun, 21 Dec 2025 09:05:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A4F410371164;
	Sun, 21 Dec 2025 10:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766307946; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3E6eKmujJmiU2aZPeFvTmXVAFNd43X4+ywCZ1y9bwyo=;
	b=at6C3SkVAEJj0yU44T9gBh5Y2ZeL+HOiBGw/7s6sIkkcCIjB9id9Wa0DWHq9d68jujf44O
	/egG0Gh1cKQLHmy8mdzB3cMW30riVCSN3UIbBjl0Pl/uHz03btbVYHKG6kFKm99SrGuxQt
	fmiJUodaH1E2hefRZWlM4Pkub9iwdItK+m9p6s1umlBrAJKqAPbboiMbve42pSR+DcPLNi
	fBCSmKciSSrtkrZGWO5IZd4eSe6X70JC5jN+55BIaCviZIku/NzJX1hBqsTUQPI1j98NZK
	LH6ZTNlT0qqF+khoxd5LgC8maWFzN8L6FzcYQYXaznl4QMotRju+yMlhH5GMzA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Dec 2025 10:05:45 +0100
Message-Id: <DF3RWS2MGAXC.2OYHJPZRGZM9Y@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <corentin.guillevic@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 2/2] meta/files/layers.schema.json: use URI
 shortcut for some remotes
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251219161311.2293512-1-corentin.guillevic@smile.fr>
 <20251219161311.2293512-2-corentin.guillevic@smile.fr>
In-Reply-To: <20251219161311.2293512-2-corentin.guillevic@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 09:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228252

On Fri Dec 19, 2025 at 5:13 PM CET, Corentin Guillevic via lists.openembedd=
ed.org wrote:
> Among the three sources, only two have a single remote. So we can replace
> their entire structure 'remote' -> 'origin' -> 'uri' with a shorter one
> (property 'uri' only).
>
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---

Hi Corentin,

It looks like this is breaking some selftest:

025-12-19 13:57:11,641 - oe-selftest - INFO - bblayers.BitbakeLayers.test_v=
alidate_examplelayersjson (subunit.RemotedTestCase)
2025-12-19 13:57:11,642 - oe-selftest - INFO -  ... FAIL

Stderr:
2025-12-19 13:53:18,059 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/=
conf/local.conf
2025-12-19 13:53:18,059 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
2025-12-19 13:57:11,642 - oe-selftest - INFO - 6: 13/38 66/653 (0.30s) (0 f=
ailed) (bblayers.BitbakeLayers.test_validate_examplelayersjson)
2025-12-19 13:57:11,642 - oe-selftest - INFO - testtools.testresult.real._S=
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
             ^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/build-st-917910/tmp/work/x86_64-linux/python3-jsonschema-native/4.25.1/r=
ecipe-sysroot-native/usr/bin/nativepython3 /srv/pokybuild/yocto-worker/oe-s=
elftest-debian/build/build-st-917910/tmp/work/x86_64-linux/python3-jsonsche=
ma-native/4.25.1/recipe-sysroot-native/usr/bin/jsonschema -i /srv/pokybuild=
/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/files/=
layers.example.json --base-uri file:///srv/pokybuild/yocto-worker/oe-selfte=
st-debian/build/layers/bitbake/bin/../setup-schema/ /srv/pokybuild/yocto-wo=
rker/oe-selftest-debian/build/layers/bitbake/bin/../setup-schema/layers.sch=
ema.json' returned non-zero exit status 1:
/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/tmp/wo=
rk/x86_64-linux/python3-jsonschema-native/4.25.1/recipe-sysroot-native/usr/=
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

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2867
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2762
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3003

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


