Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBBF107BCF8
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 06:54:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5318.1773471254494227584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 23:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=InbLj162;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 637881A2E35;
	Sat, 14 Mar 2026 06:54:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A3EE6003C;
	Sat, 14 Mar 2026 06:54:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A038F10368512;
	Sat, 14 Mar 2026 07:54:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773471251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wj6XptU1lWkWC/S1oPheUS/tx1YdGSKO4FvG6s0NBuI=;
	b=InbLj162gQSqxFGAc1AuvZp7LVw4zRSmwv6MREb9peAGwBIeNhLLEtEuiK4ErB5a+No5LV
	wSkfEPdx/DLHwGoM3kmFqa5a4l3YvGQULVqU11hUHZfy/0zd/Y5eRAgEIaHsSFDWubHjpE
	xXfhNoW1wg3GkSd1/zLycCuqkF8NZlpVjok1sQDOVFMKjMxA5AqFIJGu9i21DWhnzol/za
	QBQWEVZNF3tpL95luSc2ho+GE5/x89CRefYeryAeoph8xdm8EoeDnLgJBu7BaPpKRrIDSP
	QhZ7fbHLPuUZBM4BeToubDIGwNtDsIIW0Zns0+k5OpMe0oRSsTB5uKz76e5E7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 07:54:08 +0100
Message-Id: <DH2B38CNQ2YI.2HLSQSBYYSU0S@bootlin.com>
To: <sundeep.kokkonda@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] rust: Enable parallel-frontend-threads
Cc: <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260313060226.2354003-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20260313060226.2354003-1-sundeep.kokkonda@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 06:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233071

On Fri Mar 13, 2026 at 7:02 AM CET, Sundeep KOKKONDA via lists.openembedded=
.org wrote:
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> Enabled the parallel-frontend-threads for faster compilation of rust code=
.
>
> Test Results:
> A few tests (bitbake rust) ran by with and without enabling this option.
> - Machine config: Intel(R) Xeon(R) CPU E5-4669 v3 @ 2.10GHz with 144 CPUs=
.
> - Avg. default build time (w/o this option) - 56m 50.104s
> - Avg. build time with this option - 49m 17.224s
> - Performance Difference - 7m 32.880s faster builds (=E2=89=88 13.3%)
>
> parallel-frontend-threads is limited to a max of 8 for best results.
> More info - https://blog.rust-lang.org/2023/11/09/parallel-rustc/
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---

Hi Sundeep,

It looks like this is causing some reproducibility issues:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/rust-dbg_1.94.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/rust_1.94.0-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/rust-dbg_1.94.0-r0_x86-64-v3.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/rust_1.94.0-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/rust-1.94.0-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/rust-dbg-1.94.0-r0.x86_64_v3.rpm

Diffoscope output is here:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260313-gl43mwtc/=
packages/diff-html/

Can you have a look at it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


