Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4D3CEE339
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 16:20:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.984.1763482825869970201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 08:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fRq9Xabd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C346B4E4174B
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 16:20:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98E19606FE;
	Tue, 18 Nov 2025 16:20:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B6E710371DE5;
	Tue, 18 Nov 2025 17:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763482823; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fcLx+DuTbSP8Kbav5IWtDr4/fOVFrlOmF9/UTKKw3o0=;
	b=fRq9XabdY8imS9SEPrAqs0XmOf0skKhfGY0qUV07zaxmar/M19QYJ3htA3bSrCRZSZPyEb
	1lojqmA8KL7SrhJuH9WmRoRPi5wHwS3whE7BnLJNh1VLBI23PuAS2z+v4qbwkqxMcP2khc
	ufL/7kKbERs6pAU2wAdySnWZMY3BfZ4Ku6CpN/AiQcRpycQeFhHLNuIWlF3tsWzEs/Euui
	D/umGoF1Os4tkcs0VZ4aQDxkSO5aMPuIkscJVeqERQxRznbgtqGv5JKzGQMAi2BMOGI795
	H4H4QcbhzUw1LyQL1hIMiFMK7HPJVmHK8G1yD1mjtmy3refpt8A8pyH+bAcXDQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Nov 2025 17:20:21 +0100
Message-Id: <DEBYHKA0YZ79.3KN0T37ZVRDTG@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/2] insane.bbclass: check revision for
 every git URI
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <corentin.guillevic@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251117171223.919666-1-corentin.guillevic@smile.fr>
In-Reply-To: <20251117171223.919666-1-corentin.guillevic@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 16:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226530

On Mon Nov 17, 2025 at 6:12 PM CET, Corentin Guillevic via lists.openembedd=
ed.org wrote:
> Every git URI into SRC_URI variable should have a revision. However, if
> the revision is missing (SRCREV), BitBake will perform a query on the
> remote repository every time it parses a recipe.
>
> This check will raise an error if a git URI is not provided alongside a r=
evision.
>
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---

Hi Corentin,

Thanks for your patch.

It looks like this is braking a lot of seltests, with errors such as:

2025-11-18 10:16:22,997 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_binary (subunit.RemotedTestCase)
2025-11-18 10:16:22,998 - oe-selftest - INFO -  ... FAIL
...
Parsing recipes...ERROR: /srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/build-st-38423/workspace/recipes/recipetool/tmp-recipetool-oalz2197.bb: =
AUTOREV/SRCPV set too late for the fetcher to work properly, please set the=
 variables earlier in parsing. Erroring instead of later obtuse build failu=
res.
ERROR: Parsing halted due to errors, see error messages above

Summary: There were 2 ERROR messages, returning a non-zero exit code.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/scripts/recipetool", line 111, in <module>
    ret =3D main()
          ^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/scripts/recipetool", line 100, in main
    ret =3D args.func(args)
          ^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/scripts/lib/recipetool/create.py", line 525, in create_recipe
    checksums, ftmpdir =3D scriptutils.fetch_url(tinfoil, fetchuri, srcrev,=
 srctree, logger, preserve_tmp=3Dargs.keep_temp)
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/scripts/lib/scriptutils.py", line 202, in fetch_url
    tinfoil.parse_recipes()
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake=
/lib/bb/tinfoil.py", line 585, in parse_recipes
    self.run_actions(config_params)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake=
/lib/bb/tinfoil.py", line 568, in run_actions
    raise TinfoilUIException(ret)
bb.tinfoil.TinfoilUIException: 1
ERROR: Command 'recipetool --color=3Dauto create --devtool -o /tmp/devtoolo=
rdsanap 'file:///tmp/devtoolqa1ao0e11u/tst-bin.tar.gz'  -x /srv/pokybuild/y=
octo-worker/oe-selftest-debian/build/build-st-38423/workspace/sources/devto=
olsrcka3994q2 -N tst-bin -b' failed

This is just one error, there is about 24 of them on each builds:
2025-11-18 16:02:59,746 - oe-selftest - INFO - oe-selftest - FAIL - Require=
d tests failed (successes=3D609, skipped=3D12, failures=3D24, errors=3D0)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2713
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2849
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2607

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


