Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5B3D12D50
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 12:13:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13642.1764764030079466134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 04:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PQEDW62t;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4C07DC13577
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 12:13:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95F1560706;
	Wed,  3 Dec 2025 12:13:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2167211920429;
	Wed,  3 Dec 2025 13:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764764027; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q4C02SjYAGs6OnZZm9uwP9OXiWcW1GpjQ9B0MgzvUp8=;
	b=PQEDW62txp/nBTJi3bCTzvX966tZuGB0ONvxpe2h7dsuO/efkUqi0SeOhruBWbyv/JqCGA
	iYTJZPnsXAt1hlg2rN5+26styXXi/YF0VpHAPJer9E86huUDeuDELSD4sTvNMPjI6ui2Mg
	/8r3BAd85WmoYWWSIeCjb5HHFWEf8TJAnPwrpw4cV6owS34NpojCtmc1S6EPFO3Y2wdsb0
	LUjiXnSEiNqe7dC6tGboBiePgZ3UHigMVEXQDspOYortnGFyV/ml5yNfDtBgQuBIqDL48Z
	WBKekJgr+h0MUD2auZCG/EyNPs1gq+OcWt5nBpUlVUjQJmzs4xTpQY91r1yZIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 13:13:43 +0100
Message-Id: <DEOKMWAUSBXZ.3H75N1QP1X7EH@bootlin.com>
Subject: Re: [OE-core][PATCH] gnutls: upgrade 3.8.10 -> 3.8.11
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251126233410.1243674-1-peter.marko@siemens.com>
In-Reply-To: <20251126233410.1243674-1-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 12:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227220

On Thu Nov 27, 2025 at 12:34 AM CET, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Release information: [1]
> Includes fix for CVE-2025-9820.
>
> Refresh patches.
>
> [1] https://lists.gnupg.org/pipermail/gnutls-help/2025-November/004906.ht=
ml
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---

Hi Peter,

Thanks for your patch.

It looks like we got some build issues, at least when building native:

ERROR: gnutls-native-3.8.11-r0 do_compile: Execution of '/srv/pokybuild/yoc=
to-worker/qemux86-tc/build/build-st-2982165/tmp/work/x86_64-linux/gnutls-na=
tive/3.8.11/temp/run.do_compile.1834094' failed with exit code 1
...
| In file included from ../../sources/gnutls-3.8.11/lib/audit.h:22,
|                  from ../../sources/gnutls-3.8.11/lib/audit.c:26:
| ../../sources/gnutls-3.8.11/lib/crau/crau.h:255:23: error: missing binary=
 operator before token "("
|   255 |     __has_c_attribute (__maybe_unused__)
|       |                       ^

https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2721
https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/2632

Can you have a look at what's going on?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


