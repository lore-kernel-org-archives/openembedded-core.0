Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEC6C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 16:34:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.660.1784306092023169070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 09:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V34aiRET;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AFE1E4E40E20
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 16:34:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77CE960361;
	Fri, 17 Jul 2026 16:34:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB0C911BD0B36;
	Fri, 17 Jul 2026 18:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784306088; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J8cWGi47DCpkYT+jXLTWYwDin1OIk8+6A2TvGLmbTU4=;
	b=V34aiRETKkJ/1nm0KAqhLgFt0JeNX3oCl4PAyZAWOhO0wilAMtpQoQIy3BjMojunkdmaF/
	Eidx2F336vWx3K+QTwNYW2R5T3RmQ1rbYbfMy/I2roPtjwT5A1HBFi+FzFTswrK6gyq4IV
	3WR1r/ujh7nRbbBEoNy9c4jbAuHOGrhunrrRMgRQwNXKYg1R/dc1dFyOQh8woUwg1IY+r8
	HGHm+QyRFWpX8VgYJSWs7jELhos1xuxTIhySTTAcuk3zkA+t11UMf9a4W8CYYOdl5CEzEt
	DjTt/CvxFwe22xt0cT0o95ohdSTeKybxnUf85QCax7JCimXxdleV6PbzcLmh0w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 18:34:46 +0200
Message-Id: <DK0ZPVXMPKPY.2MGH4LE6B96SB@bootlin.com>
Subject: Re: [OE-core][PATCH v2 00/25] Rework LICENSE to be SPDX License
 Expressions
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 16:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241218

On Wed Jul 15, 2026 at 6:44 PM CEST, Joshua Watt via lists.openembedded.org=
 wrote:
> Reworks the way that the LICENSE variable is used so that it uses valid
> SPDX License Expressions instead of the custom expressions that were
> used previously (which are based on Python syntax). This includes
> support for the SPDX "WITH" operator which allows a license exception to
> be attached to a license identifier.
>
> The old licenses expressions are still allowed, and will still be
> correctly parsed, however a warning will be issued that indicates the
> new license string that should be used.
>
> Most layers should be able to use the newly-revised
> scripts/contrib/convert-spdx-licenses.py script to do the majority of
> the conversion work, although some manual work may still be required if
> conditional or complex LICENSE expressions are encountered.
>
> SPDX License Expressions require that all licenses listed are either a
> known identifier (e.g. "GPL-2.0-or-later") or start with the prefix
> "LicenseRef-" which indicates a custom license. When converting from old
> expressions to new one this will need to be followed (the suggested new
> license in the warning and the conversion script will automatically add
> this prefix for any unrecognized license identifiers). This will most
> commonly be the case for NO_GENERIC_LICENSE files; for a good example of
> what needs to be done here see the changes to the linux-firmware recipe.
> When adding new LicenseRef- licenses to a recipe, the actual license
> name should be prefixed with the name of the recipe (e.g.
> "LicenseRef-myrecipe-mylicense") to prevent conflicts when merging
> multiple license documents together (e.g. in an image).
>
> SPDX also introduces the "WITH" operator to add an exception to a
> license instead of using a bespoke identifier to combine the two, as was
> done with the legacy license expressions. Because of this, the logic for
> dealing with the INCOMPATIBLE_LICENSE family of variables has changed
> slightly. The main difference is that INCOMPATIBLE_LICENSE will now
> match the LHS of a "WITH" expression (where as previously this was
> "ignored" since it was a bespoke license ID). In order to allow a
> license that would normally be rejected, but can be allowed with an
> exception, specifically allowed exceptions can be added to the
> INCOMPATIBLE_LICENSE_EXCEPTIONS variable (keep in mind, EXCEPTIONS here
> means "exceptions to INCOMPATIBLE_LICENSES", not specifically SPDX
> License Exceptions). If an SPDX exception is present here, any license
> that has that exception will be allowed, even if it would normally match
> INCOMPATIBLE_LICENSE. For example, to disallow all GPLv3 except for
> those with the GCC exception, use:
>
>     INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0*"
>     INCOMPATIBLE_LICENSE_EXCEPTIONS =3D "GCC-exception-3.1" # This new li=
ne is required
>
>
> Additionally, "PD" ("Public Domain") is not allowed as a generic license
> identifier. Aside from "PD" not being a valid SPDX License Identifier,
> most "Public Domain" licenses do have some sort of text associated with
> them (see the HPND family of SPDX Licenses, or use the (SPDX License
> Match Website)[1] ). In addition, the meaning of "Public Domain" can vary
> by jurisdiction, so the actual text with a LicenseRef- or a SPDX License
> Identifier needs to be used instead.
>
> Finally, "CLOSED" is also no longer allowed as a license expression
> (since it is not a valid SPDX License Identifier). Instead use a
> LicenseRef- to point to a file that contains the actual license text
> (usually something like "Copyright <name>, all rights reserved")
>
> [1]: https://tools.spdx.org/app/check_license/
>
> V2: Fix errors found while testing
>
> Joshua Watt (25):
>   scripts/pull-spdx-licenses.py: Add exceptions
>   Add SPDX License Exceptions
>   Add SPDX license library
>   Parse LICENSE as SPDX Expression
>   linux-firmware: Convert to SPDX license strings
>   meta-selftest: Add NO_GENERIC_LICENSE
>   convert-spdx-licenses: Convert to valid SPDX expressions
>   gcc-common.inc: Remove LICENSE
>   gcc: Update license
>   xz: Replace deprecated SPDX identifier
>   autoconf-archive: Replace deprecated SPDX identifier
>   gnu-config: Replace deprecated SPDX identifier
>   libglvnd: Replace deprecated SPDX identifier
>   flac: Replace deprecated SPDX identifier
>   libgit2: Replace deprecated SPDX identifier
>   Fix up licenses
>   lib: oe: license: Rework package licenses matching
>   classes/go-mod-update-modules: Switch to SPDX license
>   license: Remove tidy_licenses()
>   meta-selftest: Change license on test recipes
>   Convert licenses to SPDX expressions
>   meta-selftest: libxpm: Fix license
>   lib: oe: sbom30: Handle None in Relationship
>   oeqa: selftest: bbtest: Fix license exception
>   scripts/contrib: Add reuse-get-license.py
>

Hi Joshua,

Thanks for the v2. It looks like now we have
layerappend.LayerAppendTests.test_layer_appends failing:

2026-07-17 13:41:58,606 - oe-selftest - INFO - layerappend.LayerAppendTests=
.test_layer_appends (subunit.RemotedTestCase)
2026-07-17 13:41:58,613 - oe-selftest - INFO -  ... FAIL
...
ERROR: layerappendtest-1.0-r0 do_package_qa: Error executing a python funct=
ion in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_package_qa(d)
     0003:
File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/classes-global/insane.bbclass', lineno: 1116, function: do_p=
ackage_qa
     1112:python do_package_qa () {
     1113:    import oe.packagedata
     1114:
     1115:    # Check for obsolete license references in main LICENSE (pack=
ages are checked below for any changes)
 *** 1116:    main_licenses =3D oe.license.list_licenses(d.getVar('LICENSE'=
), d)
     1117:    obsolete =3D set(oe.license.obsolete_license_list()) & main_l=
icenses
     1118:    if obsolete:
     1119:        oe.qa.handle_error("obsolete-license", "Recipe LICENSE in=
cludes obsolete licenses %s" % ' '.join(obsolete), d)
     1120:
File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/lib/oe/license.py', lineno: 238, function: list_licenses
     0234:
     0235:        for child in node.children:
     0236:            walk_license(child)
     0237:
 *** 0238:    walk_license(parse_legacy_license(d, licensestr))
     0239:    return set(licenses)
     0240:
     0241:def return_spdx(d, license):
     0242:    """
File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/lib/oe/license.py', lineno: 235, function: walk_license
     0231:        nonlocal licenses
     0232:        if isinstance(node, oe.spdx_license.Identifier):
     0233:            licenses.append(node.ident)
     0234:
 *** 0235:        for child in node.children:
     0236:            walk_license(child)
     0237:
     0238:    walk_license(parse_legacy_license(d, licensestr))
     0239:    return set(licenses)
Exception: AttributeError: 'NoneType' object has no attribute 'children'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4302
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4122

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


