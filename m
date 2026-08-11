Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E631CC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 12:58:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53818.1786453097558237631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 05:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U7/oq1Pd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 769861A1570
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 12:58:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44D5C6033C;
	Tue, 11 Aug 2026 12:58:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F13D11C48B40;
	Tue, 11 Aug 2026 14:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786453090; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ua4paA8kDVplsQOpviEKAqw8CNmeK5l3lilXP3BDB4s=;
	b=U7/oq1PdNUWsQhuH7y95EQwgFaIexHUKMZxLMcOULwWYgZYSqaHQeFmU1EYwMsoXDTyjv5
	ZV/OCiSZ0cuZ+C9O+2v9XDo1JO4zRGjNx0tVPhcfDtHO0i1oqurXLebrj7bZ0Clfc1ZGyR
	5Jy4ni5bn+cjNEoRAlyRl0xUsfaKZSE5OegTjJu8YYOYpljCAOd+TWgd30gjMTwgD1PWp/
	yFt0CliMsUSaa+v45k0mR/YhVcL1HD0AXhlF2q7SiLlAjEviA7mJiBLSENyIR/ky5ynTOF
	mOXZ3lqUJXV97alm1yM696vb7N1f1Xb2AfOhX7zQT0ym1jBfjDV1t5NaAbyfuQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 14:58:08 +0200
Message-Id: <DKM4RNDHJJQ3.13B6BZNOT7ZRM@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 3/4] u-boot-tools: fix pylibfdt build with
 swig 4.5.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811111120.17612-1-jaipaul.cheernam@est.tech>
 <20260811111120.17612-4-jaipaul.cheernam@est.tech>
In-Reply-To: <20260811111120.17612-4-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 12:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243198

On Tue Aug 11, 2026 at 1:11 PM CEST, Jaipaul Cheernam wrote:
> SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
> from its runtime. Backport the dtc upstream fix to u-boot's bundled
> pylibfdt/libfdt.i to replace them with Python 3 equivalents.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for your patch.

Can you confirm this is based on today master? The u-boot patch fails to
apply on my side:

ERROR: u-boot-tools-1_2026.07-r0 do_patch: Applying patch '/srv/pokybuild/y=
octo-worker/musl-qemux86-64/build/layers/openembedded-core/meta/recipes-bsp=
/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.pat=
ch' on target directory '/srv/pokybuild/yocto-worker/musl-qemux86-64/build/=
build/tmp/work/x86-64-v3-poky-linux-musl/u-boot-tools/2026.07/sources/u-boo=
t-tools-2026.07'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/musl-qemux86-64/build=
/build/tmp/work/x86-64-v3-poky-linux-musl/u-boot-tools/2026.07/recipe-sysro=
ot-native/etc/quiltrc push', 1, "stdout: Applying patch 0001-pylibfdt-Repla=
ce-removed-SWIG-Python-2-compatibility.patch
can't find file to patch at input line 33
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 32378d7b4383a79d13da9005035600d8f0c8c29d Mon Sep 17 00:00:00 2001
|From: Jitka Plesnikova <jplesnik@redhat.com>
|Date: Tue, 29 Jul 2026 05:55:56 +0000
|Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility mac=
ros
|
|SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
|from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
|them with their Python 3 C API equivalents:
|
|- PyString_FromString -> PyUnicode_FromString
|- PyString_AsString -> PyBytes_AsString
|- PyInt_AsLong -> PyLong_AsLong
|
|The replacements are safe since the macros were already aliased to
|these exact functions in SWIG's Python 3 code path.
|
|Signed-off-by: Jitka Plesnikova <jplesnik@redhat.com>
|Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
|Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
|(cherry picked from commit 5008d1d6a356b8d0a78060da2e1021507d529cff)
|
|Upstream-Status: Backport [https://github.com/dgibson/dtc/commit/5008d1d6a=
356b8d0a78060da2e1021507d529cff]
|
|Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
|---
| scripts/dtc/pylibfdt/libfdt.i | 6 +++---
| 1 file changed, 3 insertions(+), 3 deletions(-)
|
|diff --git a/scripts/dtc/pylibfdt/libfdt.i b/scripts/dtc/pylibfdt/libfdt.i
|index 1f9c0471..b1cb9873 100644
|--- a/scripts/dtc/pylibfdt/libfdt.i
|+++ b/scripts/dtc/pylibfdt/libfdt.i
--------------------------
No file to patch.  Skipping patch.
2 out of 2 hunks ignored
Patch 0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch does =
not apply (enforce with -f)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4216
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4423

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


