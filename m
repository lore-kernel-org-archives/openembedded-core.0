Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QS4Qc-0008L5-Kj for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 11:42:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p529d0jv030822
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 10:39:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30599-04 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 10:38:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p529cq4N030816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 10:38:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110602063130.GG3281@jama.jama.net>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<ddcfd950f58f85e00b0ea094534f27ccf1315152.1306958862.git.otavio@ossystems.com.br>
	<1306960406.3119.6.camel@lenovo.internal.reciva.com>
	<BANLkTinyA0PAq3bQRTi2zCrWKKOVypytqg@mail.gmail.com>
	<1306961600.3119.15.camel@lenovo.internal.reciva.com>
	<BANLkTimvA2gMHB=zmZmLqz+CdyAsR3dmXg@mail.gmail.com>
	<4DE6B299.2060507@linux.intel.com>
	<20110601215232.GE3281@jama.jama.net>
	<4DE6BAE6.3040406@linux.intel.com>
	<20110602063130.GG3281@jama.jama.net>
Date: Thu, 02 Jun 2011 10:38:33 +0100
Message-ID: <1307007513.27470.473.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] gnutls: link against 'dl' library
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
X-List-Received-Date: Thu, 02 Jun 2011 09:42:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 08:31 +0200, Martin Jansa wrote:
> what do you have in configlog for LIBDL?
> 
> here it's all empty
> LIBDL=''
> LIBDL_PREFIX=''
> LTLIBDL=''
> 
> if I add 
> +             --with-libdl-prefix=${STAGING_DIR_HOST}${prefix} \
> +             --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
> to EXTRA_OE_CONF (we already have couple of --with-*-prefix there) it's
> found correctly (and this is at least better workarround then forcing
> -ldl directly to LDFLAGS):
> LIBDL='/OE/shr-core/tmp/sysroots/om-gta02/usr/lib/libdl.so'
> LIBDL_PREFIX='/OE/shr-core/tmp/sysroots/om-gta02/usr'
> LTLIBDL='-L/OE/shr-core/tmp/sysroots/om-gta02/usr/lib -ldl'
> 
> same problem is with libpthread..
> 
> maybe their m4/lib-link.m4 does something wrong in
> AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
> [
>   AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
>   AC_REQUIRE([AC_LIB_RPATH])

I just looked at the code in lib/configure and concluded that its just
luck whether it figures out the correct values or does something really
nasty. Its poking about ${libdir} for this stuff so you end up with
something like the following combinations:

a) 64 bit system with 64 bit libs in /usr/lib64 and no 32 bit libs:
     Finds no -ldl

   Something else may or may not link it indirectly so the build may or 
   may not work.

b) 64 bit system with 64 bit libs in /usr/lib64 and 32 bit libs in /usr/lib, building for 32 bit:
     Finds a -ldl which "works".

   Things appear to work.

c) Other variations


The correct fix would appear to be to set the paths specifically using
the options Martin mentions above.

Cheers,

Richard



