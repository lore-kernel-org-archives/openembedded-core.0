Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358C5CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 14:16:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.14608.1757427390676194980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 07:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bvinVE72;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F39AFC6B39C
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Sep 2025 14:16:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98D6360630;
	Tue,  9 Sep 2025 14:16:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3DAF102F2868;
	Tue,  9 Sep 2025 16:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757427387; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gduHB03tTD10prTuGmjZ2mzPfXS3Ba2B+nydWsEDfZQ=;
	b=bvinVE72JQyYpssBUTpPEX7ixxK7rw2BhOjP5i7aAnyyiIsVmdr4OMcNAf4mlIFQnpa4Uy
	6Pxq4RxWuVYsFnpKF07Dc1p8GdWc9JyXiAcwM64GEPWhRES3esN/uXXx79ER/qYERsJM5J
	jq6NTI76gAbMGgazZQ0dA6REmlMswRZRXtcK3965gv1pcILFKFtjVEuCzZ94gbLU6Hjudv
	yl1SysESKHmtz0gfuGToXfAmyr/nvcxLhAFP7VbhYNkOPeHKrho2tjAl5A1QUOYysccDYE
	AKOwhFY0XOUQpgVYzR8YolVeRNX8Gkj5aof8fsd/9tJVdSGeynPBw+bBgbQlmA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 16:16:19 +0200
Message-Id: <DCOC0GHAATJU.2COUF7546LC27@bootlin.com>
Subject: Re: [OE-core][PATCH v2] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Haixiao.Yan.CN@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250905123421.3940634-1-haixiao.yan.cn@windriver.com>
In-Reply-To: <20250905123421.3940634-1-haixiao.yan.cn@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 14:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223113

On Fri Sep 5, 2025 at 2:34 PM CEST, Haixiao (CN) via lists.openembedded.org=
 Yan wrote:
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> When Bash runs with 'set -u' (nounset), accessing an unset variable
> directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound variable"
> error. As a result, the fallback logic to set SSL_CERT_FILE/SSL_CERT_DIR
> is never triggered and the script aborts.
>
> The current code assumes these variables may be unset or empty, but does
> not guard against 'set -u'. This breaks builds in stricter shell
> environments or when users explicitly enable 'set -u'.
>
> Fix this by using parameter expansion with a default value, e.g.
> "${SSL_CERT_FILE:-}", so that unset variables are treated as empty
> strings. This preserves the intended logic (respect host env first, then
> CAFILE/CAPATH, then buildtools defaults) and makes the script robust
> under 'set -u'.
>
> Note: environment.d-curl.sh, environment.d-python3-requests.sh,
> and environment.d-git.sh have the same issue and should be fixed
> similarly.
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---

Hi Haixiao,

Thanks for your patch.

It looks like this is leading to failed SDK installations in some cases,
as some other variables are undefined:

ERROR: core-image-sato-1.0-r0 do_testsdkext: Couldn't install the extensibl=
e SDK:
Poky (Yocto Project Reference Distro) Extensible SDK installer version 5.2.=
99+snapshot
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
You are about to install the SDK to "/srv/pokybuild/yocto-worker/qemuarm64-=
armhost/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0/tests=
dkext". Proceed [Y/n]? Y
Extracting SDK................................................done
Setting it up...
Extracting buildtools...
Preparing build system...


Contents of preparing_build_system.log:
sh: 17: /srv/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/=
qemuarm64-poky-linux/core-image-sato/1.0/testsdkext/layers/build/oe-init-bu=
ild-env: BASH_SOURCE: parameter not set

https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/2375
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/2346
https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2197


SDK testing environment: x86_64-pokysdk-linux
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/buildtools/build/meta/lib/oeqa/buildtoo=
ls/cases/build.py", line 21, in test_libc
    self._run('. %s/oe-init-build-env %s' % (corebase, testdir))
  File "/srv/pokybuild/yocto-worker/buildtools/build/meta/lib/oeqa/sdk/case=
.py", line 17, in _run
    return subprocess.check_output(". %s > /dev/null; %s;" % \
  File "/usr/lib64/python3.9/subprocess.py", line 424, in check_output
    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,
  File "/usr/lib64/python3.9/subprocess.py", line 528, in run
    raise CalledProcessError(retcode, process.args,
oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-l=
inux/buildtools-tarball/1.0/testimage-sdk/environment-setup-x86_64-pokysdk-=
linux > /dev/null; . /srv/pokybuild/yocto-worker/buildtools/build/oe-init-b=
uild-env /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64=
-nativesdk-pokysdk-linux/buildtools-tarball/1.0/testimage-sdk/bitbake-build=
-vbmlrryg;' returned non-zero exit status 1.
Standard Output: /srv/pokybuild/yocto-worker/buildtools/build/oe-init-build=
-env: line 29: BBSERVER: unbound variable

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/2371


Can you fix these failures please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


