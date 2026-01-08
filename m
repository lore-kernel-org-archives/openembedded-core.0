Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E73D185FA
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 13:46:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6655.1767879983707462528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 05:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GVhqx7vg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC46D4E41FFA;
	Thu,  8 Jan 2026 13:46:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88492606B6;
	Thu,  8 Jan 2026 13:46:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F02D1103C8869;
	Thu,  8 Jan 2026 14:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767879981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lYcQSF9QKGJ4Hah1q++2mbmW9vye2jQCQ5kdvvcSwOk=;
	b=GVhqx7vgX3c+IEM1L+zclm6GuMDUl92LqoIgpkZj0EKISmDVgrkEyvb4kG+fdpuVpl+o1a
	t3rkyICIL0ZaObqil2Zz+td3P6ps3P+VPTTMhGCrvVYoFFIMjlrnt77ZaXkNXIZS+V7vo5
	3rJg1TJn3MnjGrdDR218KmV6lYzH1fSaaVF9bUcdShzUF5uXPl07PoQ3CMC54lqpm9Po9A
	59rWaE8xSr7WIFu8fyGjFq14Jf1VhnCUyaoE41BV7T+IYp97h6wskPeOhC8qoYJ6t1/G5O
	LiFfSV1KUxMwH93ppkGaoQLLzCgaVvNOp2NKPd6XR9zR5/W734VLwSEtf1XJ/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 14:46:19 +0100
Message-Id: <DFJ95EJ6R69W.BY6P7OHL89NL@bootlin.com>
Subject: Re: [OE-core][PATCH] spdx: Add yocto PURLs
Cc: <stefano.tondo.ext@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260107232019.2649430-1-JPEWhacker@gmail.com>
In-Reply-To: <20260107232019.2649430-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 13:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229071

On Thu Jan 8, 2026 at 12:20 AM CET, Joshua Watt via lists.openembedded.org =
wrote:
> Adds code to add PURLs to packages based on the PURL specification for
> Yocto packages [1].
>
> The SPDX_PACKAGE_URL variable is renamed SPDX_PACKAGE_URLS to make it
> clear that it can now be a list of PURLs. SPDX_PACKAGE_URL is retained,
> but marked as deprecated.
>
> [1]: https://github.com/package-url/purl-spec/blob/main/types-doc/yocto-d=
efinition.md
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---

Hi Joshua,

Thanks for your patch.

> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -10,6 +10,7 @@ import json
>  import oe.packagedata
>  import re
>  import shutil
> +import urllib.parse
> =20
>  from pathlib import Path
>  from dataclasses import dataclass
> @@ -288,3 +289,14 @@ def get_compiled_sources(d):
>              types.add(ext)
>      bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)}=
 {str(types)}")
>      return sources, types
> +
> +
> +def purl_quote(s):
> +    return urllib.parse.quote(s, safe=3D"")
> +
> +
> +def get_base_purl(d):
> +    layername =3D d.getVar("FILE_LAYERNAME").lower()
> +    bpn =3D d.getVar("BPN").lower()
> +    pv =3D d.getVar("PV")
> +    return f"pkg:yocto/{purl_quote(layername)}/{purl_quote(bpn)}@{purl_q=
uote(pv)}"

It looks like sometimes, FILE_LAYERNAME is not defined during selftests:

2026-01-08 12:00:20,364 - oe-selftest - INFO - buildoptions.ImageOptionsTes=
ts.test_ccache_tool (subunit.RemotedTestCase)
2026-01-08 12:00:20,365 - oe-selftest - INFO -  ... FAIL
...
ERROR: Unable to read virtual:native:/srv/pokybuild/yocto-worker/oe-selftes=
t-debian/build/layers/openembedded-core/meta/recipes-devtools/ccache/ccache=
_4.12.2.bb
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake=
/lib/bb/data_smart.py", line 465, in expandWithRefs
    s =3D __expand_python_regexp__.sub(varparse.python_sub, s)
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake=
/lib/bb/data_smart.py", line 154, in python_sub
    value =3D utils.better_eval(codeobj, DataContext(self.d), {'d' : self.d=
})
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake=
/lib/bb/utils.py", line 489, in better_eval
    return eval(source, ctx, locals)
           ^^^^^^^^^^^^^^^^^^^^^^^^^
  File "Var <SPDX_PACKAGE_URLS>", line 1, in <module>
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oe/spdx_common.py", line 299, in get_base_purl
    layername =3D d.getVar("FILE_LAYERNAME").lower()
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'NoneType' object has no attribute 'lower'
...
2026-01-08 12:04:59,178 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
2026-01-08 12:04:59,179 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:06:05,604 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_atf_tee_fit_image (subunit.RemotedTestCase)
2026-01-08 12:06:05,604 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:06:58,169 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_fit_image (subunit.RemotedTestCase)
2026-01-08 12:06:58,169 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:07:40,880 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_uboot_fit_image_without_spl (subunit.RemotedTestCase)
2026-01-08 12:07:40,880 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:08:11,262 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_uboot_kernel_individual (subunit.RemotedTestCase)
2026-01-08 12:08:11,262 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:08:50,675 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_uboot_atf_tee_fit_image (subunit.RemotedTestCase)
2026-01-08 12:08:50,675 - oe-selftest - INFO -  ... FAIL
...
026-01-08 12:08:50,857 - oe-selftest - INFO - liboe.CopyTreeTests.test_copy=
_tree_xattr (subunit.RemotedTestCase)
2026-01-08 12:08:50,857 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:09:29,398 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_uboot_fit_image (subunit.RemotedTestCase)
2026-01-08 12:09:29,399 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:20:27,984 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image (subunit.RemotedTestCase)
2026-01-08 12:20:27,984 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:21:02,937 - oe-selftest - INFO - recipetool.RecipetoolCreateT=
ests.test_recipetool_create_go (subunit.RemotedTestCase)
2026-01-08 12:21:02,937 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:21:03,484 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_ext_dtb_dtbo (subunit.RemotedTestCase)
2026-01-08 12:21:03,484 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:21:34,129 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_sign_initramfs (subunit.RemotedTestCase)
2026-01-08 12:21:34,129 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:22:00,488 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_sign_initramfs_bundle (subunit.RemotedTestCase)
2026-01-08 12:22:00,489 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:22:23,908 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_get_compatible_from_dtb (subunit.RemotedTestCase)
2026-01-08 12:22:23,909 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:22:50,980 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_sign_fit_image_configurations (subunit.RemotedTestCase)
2026-01-08 12:22:50,980 - oe-selftest - INFO -  ... FAIL
...
2026-01-08 12:23:38,183 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_sign_fit_image_individual (subunit.RemotedTestCase)
2026-01-08 12:23:38,184 - oe-selftest - INFO -  ... FAIL

I did not copy the exact error for each test fail, but is is basically
the same every times.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2986
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2877
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3124

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


