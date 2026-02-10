Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A14EA8130
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:33:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22263.1770737606846519992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 07:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cb5QudTQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C3A111A0D4B
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:33:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9ACDC606BD;
	Tue, 10 Feb 2026 15:33:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C0C710B920E4;
	Tue, 10 Feb 2026 16:33:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770737604; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vFcYkq06dbpvZjAoJY6TUPl+w5peKvcJnUX+Z9dep7k=;
	b=cb5QudTQPlKP9EcFZbx0vcXphcqvHnYKSA93FDWIRCdKF3vbnNha8sdwwkT71ObQkOJszA
	glOIjN3GWNtBkge5Sk8FIpjubtvHjv6220e+y79eZflWQdaWJXn3FyPHdJ0bRfdT7LIqSl
	ApmXNmwvGOlWtEv7/PTWWfyeUdmnKZnfmq1qowG+FnV3WaA+8+TTwH/Cn6biEzveJa6ymW
	ovRgNqtdlCN19AAqohtjcunM+edgoRCYK5rYtk9gfj1foJIy8o6SEpUBYk5x4ieV4dSYSk
	X08C2/5YlvWlUB56uhDx6+qwoxSZtwwhF0n4NbLS/KQPWfuTFvDLVYXhrfSDJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:33:22 +0100
Message-Id: <DGBE3COW47Z0.2VS4GOSGLUYML@bootlin.com>
Subject: Re: [OE-core][master][PATCH] python3-pip: Backport fix
 CVE-2026-1703
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260209212506.51439-1-adarsh.jagadish.kamini@est.tech>
 <DGBAHPIIQHXZ.1LY6EAM6X7Y2P@bootlin.com>
In-Reply-To: <DGBAHPIIQHXZ.1LY6EAM6X7Y2P@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230911

On Tue Feb 10, 2026 at 1:44 PM CET, Mathieu Dubois-Briand wrote:
> On Mon Feb 9, 2026 at 10:24 PM CET, Adarsh Jagadish Kamini wrote:
>> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>>
>> Include the patch linked in the NVD report: https://github.com/pypa/pip/=
commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>>
>> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>> ---
>
> Hi Adarsh,
>
> Thanks for your patch.
>
>> --- a/meta/recipes-devtools/python/python3-pip_24.0.bb
>> +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
>> @@ -31,7 +31,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52b=
af95163b597008bb46db68030 \
>> =20
>>  inherit pypi python_setuptools_build_meta
>> =20
>> -SRC_URI +=3D "file://no_shebang_mangling.patch"
>> +SRC_URI +=3D "file://no_shebang_mangling.patch \
>> +            file://CVE-2026-1703.patch \"
>
> There is an extra backslash before the ending quote.
>
> Thanks,
> Mathieu

Also, it looks like the patch itself does not apply cleanly:

ERROR: python3-pip-native-25.3-r0 do_patch: Applying patch '/srv/pokybuild/=
yocto-worker/buildtools/build/layers/openembedded-core/meta/recipes-devtool=
s/python/python3-pip/CVE-2026-1703.patch' on target directory '/srv/pokybui=
ld/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/python3-pip-na=
tive/25.3/sources/pip-25.3'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/buildtools/build/buil=
d/tmp/work/x86_64-linux/python3-pip-native/25.3/recipe-sysroot-native/etc/q=
uiltrc push', 0, "stdout: Applying patch CVE-2026-1703.patch
patching file news/+1ee322a1.bugfix.rst
patching file src/pip/_internal/utils/unpacking.py
Hunk #1 succeeded at 83 (offset 2 lines).
can't find file to patch at input line 44
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_un=
packing.py
|index 1f0b59dbd..724ca0be8 100644
|--- a/tests/unit/test_utils_unpacking.py
|+++ b/tests/unit/test_utils_unpacking.py
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch CVE-2026-1703.patch does not apply (enforce with -f)

stderr: ")

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/3192

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


