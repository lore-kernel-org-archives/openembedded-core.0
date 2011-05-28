Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQEbc-00061m-3q for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 10:10:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4S87UoF011914;
	Sat, 28 May 2011 09:07:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11736-03; Sat, 28 May 2011 09:07:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4S87DFQ011908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 28 May 2011 09:07:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yu Ke <ke.yu@intel.com>
In-Reply-To: <4DE07DE3.1090303@intel.com>
References: <cover.1306530446.git.sgw@linux.intel.com>
	<8046a9b60d086b3f82c0733ecbf24785066625e4.1306530446.git.sgw@linux.intel.com>
	<1306531463.3120.124.camel@lenovo.internal.reciva.com>
	<1306534987.27470.307.camel@rex>  <4DE07DE3.1090303@intel.com>
Date: Sat, 28 May 2011 09:07:05 +0100
Message-ID: <1306570025.27470.320.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xserver: force to use libdl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 May 2011 08:10:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-28 at 12:45 +0800, Yu Ke wrote:
> The marco in question is in xorg-server-1.10.1/configure.ac
> "
> AC_CHECK_FUNC([dlopen], [],
>      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
> AC_SUBST(DLOPEN_LIBS)
> "
> 
> Ideally, the dlopen test should fail since dlopen is not available in 
> libc, and then DLOPEN_LIBS="-ldl" is executed. In this case, the later 
> build will correctly link libdl. qemux86 fall into this case.
> 
> But in ppc case, the dlopen test unfortunately pass, and DLOPEN_LIBS 
> become "", which caused later linker error of unresolved dlopen 
> reference. but I did not yet understand why ppc is so special.
> 
> For detail, I've attached two config.log, one for ppc, one for qemux86.
> in ppc,
> configure:15235: checking for dlopen
> configure:15235: result: yes

Thanks. If you look at config.log you'll see this near the top:

| #modphp 
| ac_cv_c_bigendian_php=${ac_cv_c_bigendian_php=yes}
| ac_cv_sizeof_ptrdiff_t=${ac_cv_sizeof_ptrdiff_t=4}
| ac_cv_func_dlopen=${ac_cv_func_dlopen=yes}
| lt_cv_dlopen_self=${lt_cv_dlopen_self=yes}

and then if you look at the configure script for the xserver you'll see
${ac_cv_func_dlopen} being set to yes is likely triggering the bad
result.

These are coming from the powerpc site files:

richard@rex:poky/meta/site$ grep dlopen * -r
powerpc-common:ac_cv_func_dlopen=${ac_cv_func_dlopen=yes}
powerpc-common:lt_cv_dlopen_self=${lt_cv_dlopen_self=yes}

and I suspect if you remove those two lines, things will work a lot
better!

Only powerpc has the broken site file which is why only powerpc is
affected.

Cheers,

Richard



