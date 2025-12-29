Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2E5E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 13:13:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42901.1767014007055760423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 05:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nWEgvB5x;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 44170C1D71F;
	Mon, 29 Dec 2025 13:12:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5B1960725;
	Mon, 29 Dec 2025 13:13:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2755A113B04FC;
	Mon, 29 Dec 2025 14:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767014004; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xxiiHkM28DBU4nM6ScRxtF3simyTaVKJhUDwLOsKlRg=;
	b=nWEgvB5xNWTMWMpzOParWR34Ld3WyrP6x2JTVs82vYIgQZryAH1DOUceu65X/+e5g1Pe2f
	Q+bTM562j6qc1fyaoEFPFDfZpz8LZkPvlaI+rQh80ZeyzeacWjcfBHMeSQGl7hxEYqySrJ
	O/+CnNbDfByDUdQuch80cho4Z3nCruCRKqwIduEGeCOMo99J5Q46tduaY0j20mc8O0dk1U
	gugSWDJhoIO+ubvBAsy09iJqCTxyQ9yGX4bX7yuiQPSv48fdBUJb24fLCM+m8TwSC5b+gN
	HwigPtREFxhnRB5O1I3n+46o8u4JZoRGfLD7Go5nqva+iysmH4kfqSigF8NJAg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 14:13:22 +0100
Message-Id: <DFAQ6QDTDTS4.3M7RPQAK1GZP0@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 0/3] fragments: add a 'devtool-ide-sdk'
 fragment
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251228180935.2077478-1-adrian.freihofer@siemens.com>
In-Reply-To: <20251228180935.2077478-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 13:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228606

On Sun Dec 28, 2025 at 7:08 PM CET, Adrian Freihofer via lists.openembedded=
.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Changes in comparison to v1:
> - Drop the insecure root login part from the fragment description.
> - Add support for fragments in write_config.
> - Use the ide-sdk fragment in the ide_sdk selftest.
>
> Adrian Freihofer (3):
>   fragments: add a 'devtool-ide-sdk' fragment
>   oe-selftest: case: support fragments in write_config
>   oe-selftest: ide_sdk: use the ide-sdk fragment
>
>  .../conf/fragments/yocto/devtool-ide-sdk.conf | 26 +++++++++++++++++++
>  meta/lib/oeqa/selftest/case.py                |  9 ++++++-
>  meta/lib/oeqa/selftest/cases/devtool.py       |  8 +++---
>  meta/lib/oeqa/selftest/context.py             |  1 +
>  4 files changed, 38 insertions(+), 6 deletions(-)
>  create mode 100644 meta/conf/fragments/yocto/devtool-ide-sdk.conf

Hi Adrian,

Thanks for your patches.

It looks like it is breaking some test:

2025-12-29 09:09:18,661 - oe-selftest - INFO - gdbserver.GdbServerTest.test=
_gdb_server (subunit.RemotedTestCase)
2025-12-29 09:09:18,661 - oe-selftest - INFO -  ... ERROR
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/gdbserver.py", line 42, in test_gdb=
_server
    shutil.unpack_archive(filename, debugfs)
  File "/usr/lib64/python3.9/shutil.py", line 1278, in unpack_archive
    func(filename, extract_dir, **kwargs)
  File "/usr/lib64/python3.9/shutil.py", line 1199, in _unpack_tarfile
    tarobj =3D tarfile.open(filename)
  File "/usr/lib64/python3.9/tarfile.py", line 1848, in open
    return func(name, "r", fileobj, **kwargs)
  File "/usr/lib64/python3.9/tarfile.py", line 1912, in gzopen
    fileobj =3D GzipFile(name, mode + "b", compresslevel, fileobj)
  File "/usr/lib64/python3.9/gzip.py", line 173, in __init__
    fileobj =3D self.myfileobj =3D builtins.open(filename, mode or 'rb')
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yoc=
to-worker/oe-selftest-fedora/build/build-st-4140890/tmp/deploy/images/qemux=
86-64/core-image-minimal-qemux86-64.rootfs-dbg.tar.bz2'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2816
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2923
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3060

Can you have a look at what's wrong here?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


