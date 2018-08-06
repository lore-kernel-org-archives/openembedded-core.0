Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0FB74C1A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 09:40:36 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id d189-v6so21017051oib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A8oOiazAZ4o7G+uTc2MLQFJNbbYAdb3b3LimYjuDlgk=;
	b=jeZwgWmeirptzMbF6HIV3ghID+ek9ye3FCWYeoaJzcECV8xQHQ2leB9kSv0EN7qhHF
	uQnB+EkoIHGC17f5ix5ixlX5FOU/1/bmdvOc9l94EEn7wYrbp3RvPyUDiPCfBk/5KSDC
	3/9NDWsFlrVwSHGHRIR06brUTXrgrG0xmPaE2ktslY81keS4P+60yJ6rWHHaVTS28oVn
	P91QcvQGcRKgeSM/yoa7izfgDYmdR2ar8WzsWtFxnoZC/V5Fm520iCzBDBwsUxVpsHls
	SJ1ULm1U5vlbVoI3vaA2PRXXft6/Kq08I1J+EM0U/lBC3p76eWo4/GrO9I7R7uf23Kaq
	EhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A8oOiazAZ4o7G+uTc2MLQFJNbbYAdb3b3LimYjuDlgk=;
	b=ZvfA7n9MsLH/wgFo8ZujgrC+VmHwgHYI3snACuMSca6rYoP2UGIBctdgZAC7JHu74X
	J1tpnPrMTEJwL4cfkt7Vce9xhoRGdwYR1vmj8z6eQVaMm6raQ5ul0LrDY9mdHKTtRpeJ
	Tv8XeBH0Er5uXNqV5x2U1QNthcIWkl4Gx4DLyELXUA6ljVZ9QbtEHVtnbrf9cXSrM6E7
	q4KiRCfCE5ds8xuO5fNu+j/zf0fOA21H/34xrv9UyxDJtaNsJWmJxUt3Zz87SnSgrGF+
	JXfN0FhAyOElA9RbjL6Km2CUO1/cy1CrPbNGTZSf9fvRDyDLBsSljeQ+zjznsRtsR7Hg
	u7aA==
X-Gm-Message-State: AOUpUlG7IXVm3gmWeREiMKIFBIIHRgC14Ab6nHgloqDPrFgvxtoZOzRe
	vTaAFAizq2AuQ8g5AGqEKpv0ohv6PnQ3RCtOJBlDpA==
X-Google-Smtp-Source: AAOMgpevx/n89caco4SOBAKuGWnGJ7HgCGIsUHX5eeIHnwYd+wlcQqKuauIe7GmcUISg0slU0oLZiXQLsgOQV+YLmgg=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr14551502oih.102.1533548437411; 
	Mon, 06 Aug 2018 02:40:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 02:40:16 -0700 (PDT)
In-Reply-To: <20180805195531.14449-1-raj.khem@gmail.com>
References: <20180805195531.14449-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2018 10:40:16 +0100
Message-ID: <CAJTo0LZxCmBsX3VE6Pg1pYGbp6ujyM4GASTqqcP-RZr_iMmFFA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] strace: Fix build with glibc 2.28
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
X-List-Received-Date: Mon, 06 Aug 2018 09:40:36 -0000
Content-Type: text/plain; charset="UTF-8"

On 5 August 2018 at 20:55, Khem Raj <raj.khem@gmail.com> wrote:
> +++ b/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
> @@ -0,0 +1,41 @@
> +From bba1b0085f2a2c83839647fee48628ee054aceb7 Mon Sep 17 00:00:00 2001
> +From: "Dmitry V. Levin" <ldv@altlinux.org>
> +Date: Sun, 15 Jul 2018 22:14:29 +0000
> +Subject: [PATCH] tests: fix build with fresh glibc
> +
> +Workaround additional incompatibility between <sys/stat.h> and
> +<asm/stat.h> introduced by glibc-2.27.9000-566-gfd70af4.
> +
> +* tests/xstatx.c (statx, statx_timestamp): Redefine before the inclusion
> +of <sys/stat.h> to avoid conflicts between definitions provided by the
> +linux kernel headers and the GNU libc.
> +---
> +Upstream-Status: Backport [https://gitlab.com/strace/strace/commit/3dbffb7]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

Hopefully these patches don't last long but if you put the SOB/US
above the scissors then devtool's refresh won't delete them.

Ross

