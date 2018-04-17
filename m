Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 67DB260053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 10:42:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3HAg9GX011033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 17 Apr 2018 11:42:10 +0100
Message-ID: <1523961729.18865.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2018 11:42:09 +0100
In-Reply-To: <20180416065014.29385-3-raj.khem@gmail.com>
References: <20180416065014.29385-1-raj.khem@gmail.com>
	<20180416065014.29385-3-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/4] gcc-runtime: Disable gcc version of libssp
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
X-List-Received-Date: Tue, 17 Apr 2018 10:42:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2018-04-15 at 23:50 -0700, Khem Raj wrote:
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 97365a21dc..b4e5539575 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -24,8 +24,10 @@ RUNTIMELIBITM_nios2 = ""
>  RUNTIMELIBITM_microblaze = ""
>  RUNTIMELIBITM_riscv32 = ""
>  RUNTIMELIBITM_riscv64 = ""
> +RUNTIMELIBSSP ?= ""
> +RUNTIMELIBSSP_mingw ?= "libssp"
>  
> -RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic
> ${RUNTIMELIBITM} \
> +RUNTIMETARGET = "libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'],
> 'libquadmath', '', d)} \
>  "
>  RUNTIMETARGET_append_x86 = " libmpx"

This last piece looks like you removed libssp for everywhere, glibc
included except mingw?

Is the source file you included in the new recipe the same as the one
in the gcc source but linked differently? If so, I'd be tempted to
build that gcc-runtime with a musl specific do_compile addition...

I assume this is post 2.5 material as its fairly invasive changes at
the tail end of a release...

Cheers,

Richard

