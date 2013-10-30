Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9DB6AE37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 03:45:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9U3jMM6017811
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Oct 2013 20:45:22 -0700 (PDT)
Received: from [147.11.116.58] (147.11.116.58) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 29 Oct 2013 20:45:22 -0700
Message-ID: <527080D2.2020301@windriver.com>
Date: Tue, 29 Oct 2013 20:45:22 -0700
From: Yang Shi <yang.shi@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: <b28495@freescale.com>, <openembedded-core@lists.openembedded.org>
References: <1381479105-21972-1-git-send-email-b28495@freescale.com>
In-Reply-To: <1381479105-21972-1-git-send-email-b28495@freescale.com>
Subject: Re: [PATCH 1/2] perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for powerpc64
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
X-List-Received-Date: Wed, 30 Oct 2013 03:45:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2013 1:11 AM, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>
> PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
> prevents 64-bit userland from seeing this definition, instead defaulting
> to u64 == long in userspace.
> Perf want LL64, flag __SANE_USERSPACE_TYPES__ to get int-ll64.h.
>
> Fix the below issue:
> | tests/attr.c:71:4: error: format '%llu' expects argument of type 'long
> long unsigned int', but argument 6 has type '__u64' [-Werror=format=]
> | tests/attr.c:80:7: error: format '%llu' expects argument of type 'long
> long unsigned int', but argument 4 has type '__u64' [-Werror=format=]
> |        attr->type, attr->config, fd) < 0) {
> |        ^
>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>   meta/recipes-kernel/perf/perf.bb |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 269069f..d27e535 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -89,6 +89,12 @@ EXTRA_OEMAKE += "\
>   	'infodir=${@oe.path.relative(prefix, infodir)}' \
>   "
>   
> +# PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
> +# prevents 64-bit userland from seeing this definition, instead defaulting
> +# to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
> +# int-ll64.h included.
> +EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'

This override perf CFLAGS incorrectly.

kernel commit e3541ec75219819d3235f80125a1a75d798ff6e1 can solve this 
build issue.

Yang

> +
>   PARALLEL_MAKE = ""
>   
>   do_compile() {


