Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE35AC44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 13:58:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6517.1784123931251669841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 06:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=trkqwngG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 29E804E40DE3
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:58:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDA876035C;
	Wed, 15 Jul 2026 13:58:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97FEC11BD2C30;
	Wed, 15 Jul 2026 15:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784123928; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eZero4mY0FXSWRVpZjwUUI1sgLpa33qQYDAJKwiLksk=;
	b=trkqwngG6HLeZFLIVKbcvUGiNre4zttAybCEGRyF6hb7mBrF7n5fm6ygXYIEL7iNln0cH0
	Kj3vVK2D3Yh+E8ig4pwj3f1/HC3DRY7mCJFpAb9r+KHvuOskjPgYSOP0iKhPHvA3rjwdRk
	sk83fwLryAc35b+hzLTGtLXRY7SWJmQPKJ5yxr8OfJM//vkS+dGG6f64Sq8Ygl69UjdNQ2
	bpwvKFHgTiSZN0EwI6zhhbaVDxTEBfeOWgfDlKHCPWRW/6QgPV6YNxn9UDIfSdV7RUCyFw
	YJWEXKbUOgbw0HB1hnPOFcmbq7HOW3uxVJEHTNI+kNMiZJafIxTVmQsntyXZuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 15:58:46 +0200
Message-Id: <DJZ75D2F3LYF.38E5Q51FTY2G3@bootlin.com>
Subject: Re: [OE-core][PATCH 00/22] Rework LICENSE to be SPDX License
 Expressions
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240958

On Tue Jul 14, 2026 at 8:31 PM CEST, Joshua Watt via lists.openembedded.org=
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
> them (see the HPND family of SPDX Licenses, or use the [1](SPDX License
> Match Website) ). In addition, the meaning of "Public Domain" can vary
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

Hi Joshua,

So We have some warnings as expected, but we also have two errors:

First, on the bbtests.BitbakeTests.test_non_gplv3 selftest:

2026-07-15 13:29:46,060 - oe-selftest - INFO - FAIL: bbtests.BitbakeTests.t=
est_non_gplv3 (subunit.RemotedTestCase)
...
ERROR: Nothing PROVIDES 'virtual/compilerlibs' (but /srv/pokybuild/yocto-wo=
rker/oe-selftest-debian/build/build-st-207485/meta-selftest/recipes-test/se=
lftest-ed/selftest-ed_1.20.2.bb DEPENDS on or otherwise requires it)
gcc-runtime PROVIDES virtual/compilerlibs but was skipped: it has incompati=
ble license(s): GPL-3.0-or-later GPL-3.0-or-later WITH GCC-exception-3.1
ERROR: Required build target 'selftest-ed' has no buildable providers.
Missing or unbuildable dependency chain was: ['selftest-ed', 'virtual/compi=
lerlibs']


But also on layerappend.LayerAppendTests.test_layer_appends:

ERROR: layerappendtest-1.0-r0 do_create_spdx: Error executing a python func=
tion in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_create_spdx(d)
     0003:
File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/classes/create-spdx-3.0.bbclass', lineno: 213, function: do_=
create_spdx
     0209:addtask do_create_recipe_spdx_setscene
     0210:
     0211:python do_create_spdx() {
     0212:    import oe.spdx30_tasks
 *** 0213:    oe.spdx30_tasks.create_spdx(d)
     0214:}
     0215:addtask do_create_spdx after \
     0216:    do_unpack \
     0217:    do_patch \
File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/lib/oe/spdx30_tasks.py', lineno: 825, function: create_spdx
     0821:            oe.spdx30.RelationshipType.hasDeclaredLicense,
     0822:            [oe.sbom30.get_element_link_id(recipe_spdx_license)],
     0823:        )
     0824:    else:
 *** 0825:        build_objset.new_relationship(
     0826:            source_files,
     0827:            oe.spdx30.RelationshipType.hasDeclaredLicense,
     0828:            None,
     0829:        )
File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/lib/oe/sbom30.py', lineno: 560, function: new_relationship
     0556:
     0557:        return ret
     0558:
     0559:    def new_relationship(self, from_, typ, to):
 *** 0560:        return self._new_relationship(oe.spdx30.Relationship, fro=
m_, typ, to)
     0561:
     0562:    def new_scoped_relationship(self, from_, typ, scope, to):
     0563:        return self._new_relationship(
     0564:            oe.spdx30.LifecycleScopedRelationship,
File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/lib/oe/sbom30.py', lineno: 529, function: _new_relationship
     0525:        spdxid_name=3D"relationship",
     0526:        **props,
     0527:    ):
     0528:        from_ =3D to_list(from_)
 *** 0529:        to =3D to_list(to)
     0530:
     0531:        if not from_:
     0532:            return []
     0533:
File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembe=
dded-core/meta/lib/oe/sbom30.py', lineno: 187, function: to_list
     0183:    if isinstance(l, set):
     0184:        l =3D sorted(list(l))
     0185:
     0186:    if not isinstance(l, (list, tuple)):
 *** 0187:        raise TypeError("Must be a list or tuple. Got %s" % type(=
l))
     0188:
     0189:    return l
     0190:
     0191:
Exception: TypeError: Must be a list or tuple. Got <class 'NoneType'>

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4285

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


