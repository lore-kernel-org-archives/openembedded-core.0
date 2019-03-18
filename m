Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 8292F7C4DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:08:26 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 5BD9C1A3734;
	Mon, 18 Mar 2019 13:08:27 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id UpMO0HrC-Aav; Mon, 18 Mar 2019 13:08:26 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id D8FB31A3730;
	Mon, 18 Mar 2019 13:08:26 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com D8FB31A3730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552928906;
	bh=Ct6x0eJ1L8GgL90NWYNcevS747SLm/TaMBcOTzWHyWo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=KsbnZQWFSdlExF029iBUqOeX7tZSXAEJ7nvO9LRyMKkGT/vtvG8RQXEXx9F7azapw
	LdXS8PXoX2Yr21FL9a++Z/BTRUhk602ZCsqfh+vkN/ftPmlpbOwr9wjahHgnQvm9Gr
	VXm/0kGo0rh3RftaZAIupty4IAVWTwoTjx8RNSS/qn/03GhdVZ3pZ9B7W4v0WNkTkQ
	fLsBYOUJq3z4dfRQ7s8PLWjowffffb3B7lduXRPjwNcQIDEKO+j9OYU5pC/PGfZF0h
	CouqYyU2slwFHme3bF26o4S4MSt+e/WXidFPAtH91RSQdOCmePnL1gh/pq8xA3MhIC
	14iW0pnAWo4Zg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id g7Yj7KKz95AT; Mon, 18 Mar 2019 13:08:26 -0400 (EDT)
Received: from joraj-alpa (192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id B9CA11A3726;
	Mon, 18 Mar 2019 13:08:26 -0400 (EDT)
Date: Mon, 18 Mar 2019 13:08:26 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190318170826.GC25848@joraj-alpa>
References: <20190318165803.10375-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190318165803.10375-1-raj.khem@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] lttng: Enable on musl and riscv
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
X-List-Received-Date: Mon, 18 Mar 2019 17:08:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

This looks good, still please take some moment to read this thread from musl
mailing list regarding lttng-ust usage of _SC_NPROCESSORS_CONF. For now I would
maintain the disabling of lttng-ust when musl is used. I should have CC'ed you,
I forgot.

The modification for riscv64 seems good to me. We do support lttng-* for
riscv64 [2] on debian.

[1] https://www.openwall.com/lists/musl/2019/03/15/5
[2] https://packages.debian.org/sid/utils/lttng-tools


On Mon, Mar 18, 2019 at 09:58:01AM -0700, Khem Raj wrote:
> Latest version compiles on musl as well as on risv64 now
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb | 2 +-
>  meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb   | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
> index 086254d3d3..15e75e51c9 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
>  
>  inherit module
>  
> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
>  
>  #https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
>  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> index 151e35e3c3..d544f8e206 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> @@ -26,9 +26,7 @@ PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig
>  PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
>  PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
>  PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
> -PACKAGECONFIG_remove_libc-musl = "lttng-ust"
>  PACKAGECONFIG_remove_arc = "lttng-ust"
> -PACKAGECONFIG_remove_riscv64 = "lttng-ust"
>  
>  SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>             file://x32.patch \
> -- 
> 2.21.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jonathan Rajotte-Julien
EfficiOS

