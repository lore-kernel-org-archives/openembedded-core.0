Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 29004601A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 21:13:47 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id t106so2750122qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nfzcO1Qy6BUJdeD2b2LySYfuluf/dkNkmOpK1OQmIpE=;
	b=xR9xV7ge7papzXJC28Y5Ow2OybLWIz8aNM5uBDYoLGSQmHQAJH6K9gXiVbRpAXUyOm
	gmQ41umQQlktht69MZiylGxP6wgHn6Sqi4cSwhGMiZ1v1DhpYmKDIKnOfvIOfvSXHLsd
	I6ztjIJcPIpDKx3gC8fsndEY1btGMZF+ZD2eUK8n+J3+k2OFL3F8Lo81QXS0qhdxBuYI
	iZ9ZAhalOzGHinwyJPgUA1x6Nkg2tW5+Sd6itr8CVZy/NNtgYMpeyeBafcttBOJfSq91
	u8l0wVhYTA6Pq7XDah3Nv3QaYEkGz35H81jTB/UHwjbBkGENAmhMVxOzxxAGUJsRlLkG
	Nb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nfzcO1Qy6BUJdeD2b2LySYfuluf/dkNkmOpK1OQmIpE=;
	b=Wo937IIfyFD+BT/+1AVYh/JCSRasF4yrSAA+H8ZfIiRle+Ws0ml+ae9hpFGv0FHSmo
	6aS08UhhQFrWYTLMXZSol87i+6bYKJe1QRvZBOzqnM11SYOo/qdBkBhQx0UQ6j3+IoEp
	hS4NGX38yVyUPzpeHzSGnBjNMG5taqs+wwnvTY2Pfs0CYH9Dt3m5m4d0NKQkfLV5c8q/
	vRsheONi8kBThIHXC+E8lkI7nfZBVJ4BmsTSm8eA2pqGfbDqFotEUqQXYtU8nca66vn2
	ZOviLB9AZbsapc+cNHqfEjPZGf/BW9ERlphvWIHzmDzXmcBjT9p0qjMjgk6TTP5zuTPJ
	L0nQ==
X-Gm-Message-State: ALyK8tIc4J425D2jCgbaSXDx/rKgmbBvA15CrHvxVAKNELgWdZjgltONa+nOjDX4lvPMAmpfxnKZ3WGia+tjUg==
X-Received: by 10.140.41.178 with SMTP id z47mr834606qgz.25.1466025228276;
	Wed, 15 Jun 2016 14:13:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Wed, 15 Jun 2016 14:13:18 -0700 (PDT)
In-Reply-To: <1465722154-29644-1-git-send-email-zhenhua.luo@nxp.com>
References: <1465722154-29644-1-git-send-email-zhenhua.luo@nxp.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jun 2016 14:13:18 -0700
Message-ID: <CAMKF1sqwzZTrW=4t-Qw=hYzES8zJsLKXua9cV=Cd8-KPetxUkQ@mail.gmail.com>
To: Zhenhua Luo <zhenhua.luo@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: fix the incorrect assembling for ppc wait instruction
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2016 21:13:49 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 12, 2016 at 2:02 AM, Zhenhua Luo <zhenhua.luo@nxp.com> wrote:
> The wait mnemonic for ppc targets is incorrectly assembled into 0x7c00003c due
> to duplicated address definition with waitasec instruction. The issue causes
> kernel boot calltrace for ppc targets when wait instruction is executed.
>
> Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.26.inc   |  1 +
>  ...ncorrect-assembling-for-ppc-wait-mnemonic.patch | 36 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
> index 6d535fc..6d77452 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.26.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
> @@ -34,6 +34,7 @@ SRC_URI = "\
>       file://0012-Add-support-for-Netlogic-XLP.patch \
>       file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
>       file://0014-Correct-nios2-_gp-address-computation.patch \
> +     file://0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
>  "
>  S  = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> new file mode 100644
> index 0000000..5aa5e31
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> @@ -0,0 +1,36 @@
> +From 78decbeb84fb60db4e549ad3e8eb34e030e96d39 Mon Sep 17 00:00:00 2001
> +From: Zhenhua Luo <zhenhua.luo@nxp.com>
> +Date: Sat, 11 Jun 2016 22:08:29 -0500
> +Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> +
> +Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
> +
> +Upstream-Status: Pending
> +---
> + opcodes/ppc-opc.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
> +index e8c92f6..a9de474 100644
> +--- a/opcodes/ppc-opc.c
> ++++ b/opcodes/ppc-opc.c
> +@@ -4777,7 +4777,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> + {"ldepx",     X(31,29),       X_MASK,      E500MC|PPCA2|PPCVLE, PPCNONE, {RT, RA0, RB}},
> +
> + {"waitasec",  X(31,30),       XRTRARB_MASK,POWER8,    POWER9,         {0}},
> +-{"wait",      X(31,30),       XWC_MASK,    POWER9,    PPCNONE,        {WC}},
> +
> + {"lwepx",     X(31,31),       X_MASK,      E500MC|PPCA2|PPCVLE, PPCNONE, {RT, RA0, RB}},
> +
> +@@ -4831,7 +4830,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
> +
> + {"waitrsv",   X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, PPCNONE,    {0}},
> + {"waitimpl",  X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, PPCNONE,    {0}},
> +-{"wait",      X(31,62),       XWC_MASK,    E500MC|PPCA2|PPCVLE, PPCNONE, {WC}},
> ++{"wait",      X(31,62),       XWC_MASK,    E500MC|PPCA2|PPCVLE|POWER9, PPCNONE, {WC}},

please submit it to binutils upstream too.

> +
> + {"dcbstep",   XRT(31,63,0),   XRT_MASK,    E500MC|PPCA2|PPCVLE, PPCNONE, {RA0, RB}},
> +
> +--
> +2.5.0
> +
> --
> 2.4.11
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

