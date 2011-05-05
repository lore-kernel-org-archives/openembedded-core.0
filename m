Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHv6z-0005KP-LJ for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 11:44:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p459g42c009634;
	Thu, 5 May 2011 10:42:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09453-04; Thu,  5 May 2011 10:42:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p459fsuf009628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 May 2011 10:41:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BANLkTi=y+rFFeojpoX_OB2uoswF373P_Ww@mail.gmail.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
	<1303981290.21461.39.camel@rex>
	<BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>
	<1304424898.21461.107.camel@rex>
	<20110503180447.GB5436@sakrah.homelinux.org>
	<1304462379.21461.144.camel@rex>
	<BANLkTi=y+rFFeojpoX_OB2uoswF373P_Ww@mail.gmail.com>
Date: Thu, 05 May 2011 10:41:53 +0100
Message-ID: <1304588513.20791.15.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Thu, 05 May 2011 09:44:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-04 at 18:07 -0700, Khem Raj wrote:
> a build from scratch revealed few more issues with this patch too.
> 
> 1. We have to only remove gettext from dependencies if its a target
> package for all other it still it needed otherwise all native and
> cross tools start failing to build
>  e.g. binutils-cross this can be easily solved by a patch
> 
> iff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index 6f79e5e..cc39204 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -1,5 +1,5 @@
>  def gettext_dependencies(d):
> -    if d.getVar('USE_NLS', True) == 'no':
> +    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d,
> 'native', 'nativesdk', 'cross')
>          return ""
>      if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not
> oe.utils.inherits(d, 'cross-canadian')
>          return ""

This looks reasonable, its still much clearer what is happening and why
compared to the original version...

> second problem is that EXTRA_OECONF when recipes override it instead
> of += or appending etc.
> then --enable|--disable-nls that we added via gettext_oeconf() is lost
> as a result some packages complain about config.rpath
> when USE_NLS is set to no the reason is their configure is missing the
> argument --disable-nls this works ok
> for eglibc based targets since default is to enable-nls if nothing is
> specified but uclibc fails. As a testcase try to preprocess
> utils-linux
> recipe and check the contents of EXTRA_OECONF

I suspect we can fix this with:

-EXTRA_OECONF += "${@gettext_oeconf(d)}"
+EXTRA_OECONF_append = " ${@gettext_oeconf(d)}"

?

Cheers,

Richard



