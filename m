Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EF91960214
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 13:40:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48R3952b2tz1v;
	Mon, 24 Feb 2020 14:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582551625;
	bh=bTXcayNjaSkQr0QvWLkbGZvKRDwr8qoWEYNm2or+xMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pi8oGpU2tQi/1k3RZXDxqp+cEw429x4zeOvHrHwfepRwAqVUSxwLY2d9zW4kn+zjk
	HP9lFTYJPFAAI9QxX8YWUgipVtFMxcmt8flC9cujTkD7y8XfG2OChm1e1IJhMV7Mbp
	OiW/i+ajifb6T/eS4Adi88SSW2A/5/R0Unx2LcG7eFvsQ4jgnla5j4dZJAGEFERiKI
	tn0DT3tpggpMEuYduIKJPRmEv+/CIvBePmfCCUCBsy2wGG4Ao+Lt96wnk14qRI4smC
	y8iGw7y51oPr1YfxN0aAJ5OfLdBu6gdv9l+DoGYfiieKUQJPMHJ3I9hr2meWOWdGh3
	9/qUwXpm7Gcy3d22nfqUyxVcWKoASj3shok0EEDOjyduGG4g0G0eGP8O/CXz8mDjtx
	aKCIQSGcEvCmpNW0t2dO4ZDWb7/DrBUx2LSNu7CSIygW0qbvmW/JR971gr7mZ22cRL
	+zdjdX9DxKHf6EQyNaV9vnUw5u+tWXtGWZC0uFCh3UwkS02F2jZFeNOp0J4wnGNY5h
	QtZshDblqF2fZsa8siKGjMjVJ0izKPPuqi9cAMMDBbNn2js+wvLXpBqmsEWipLEd0B
	VYtdYo1rTSTUjMT3Moh913YgvRyBDG9edEBiVb6rsqtFpFKhjttxxDrzDW5y1VTyqn
	luvJX6ejSJTrg/uy4O4dqHUM=
Date: Mon, 24 Feb 2020 15:40:22 +0200
From: Adrian Bunk <bunk@stusta.de>
To: =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>
Message-ID: <20200224134022.GB27036@localhost>
References: <20200224125955.26771-1-git@andred.net>
MIME-Version: 1.0
In-Reply-To: <20200224125955.26771-1-git@andred.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 13:40:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 24, 2020 at 12:59:55PM +0000, André Draszik wrote:
> The number of threads used, and the amount of memory allowed
> to be used, should not affect sstate signatures, as they
> don't affect the result.

Unfortunately they can affect the result.

> Otherwise, it becomes impossible to re-use sstate from
> automated builders on developer's machines (as the former
> might execute bitbake with certain constraints different
> compared to developer's machines).
>...
> -XZ_DEFAULTS ?= "--memlimit=50% --threads=${@oe.utils.cpu_count()}"
>...

Threaded compression can result in slightly worse compression
than single-threaded compression.

With memlimit the problem is actually the opposite way,
and worse than what you were trying to fix:

When a developer hits memlimit during compression, the documented
behavour of xz is to scale down the compression level.

I assume 50% wrongly gives the same sstate signature no matter how
much RAM is installed on the local machine?

cu
Adrian

