Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTiuJ-0005ll-MK for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 00:40:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAONY9kr032117;
	Thu, 24 Nov 2011 23:34:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31842-03; Thu, 24 Nov 2011 23:34:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAONY1ao032111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Nov 2011 23:34:02 GMT
Message-ID: <1322177647.10928.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
Date: Thu, 24 Nov 2011 23:34:07 +0000
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6E81DE44122@shsmsx502.ccr.corp.intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
	<d4724b4050931ff51499a8808287f04b0091e93e.1322128489.git.dexuan.cui@intel.com>
	<1322133692.24143.10.camel@ted>
	<1865303E0DED764181A9D882DEF65FB6E81DE4410E@shsmsx502.ccr.corp.intel.com>
	<1322151795.10928.4.camel@ted>
	<1865303E0DED764181A9D882DEF65FB6E81DE44122@shsmsx502.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] gcc-package-target.inc: add the symbol link /lib/cpp
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
X-List-Received-Date: Thu, 24 Nov 2011 23:40:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-25 at 07:09 +0800, Cui, Dexuan wrote:
> Richard Purdie wrote on 2011-11-25:
> > On Thu, 2011-11-24 at 23:37 +0800, Cui, Dexuan wrote:
> >> Richard Purdie wrote on 2011-11-24:
> >>> On Thu, 2011-11-24 at 18:08 +0800, Dexuan Cui wrote:
> >>>> --- a/meta/recipes-devtools/gcc/gcc-package-target.inc
> >>>> +++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
> >>>> @@ -122,6 +122,8 @@ do_install () {
> >>>>  	ln -sf ${TARGET_PREFIX}g++ g++
> >>>>  	ln -sf ${TARGET_PREFIX}gcc gcc
> >>>>  	ln -sf ${TARGET_PREFIX}cpp cpp
> >>>> +	install -d ${D}${base_libdir}
> >>>> +	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${base_libdir}/cpp
> >>>>  	ln -sf g++ c++
> >>>>  	ln -sf gcc cc
> >>> 
> >>> Why do we need this change?
> >> When I was trying self-hosted-image, eglibc's do_install failed in the
> >> target: ERROR: cannot stat bootparam_prot.h: the cause is: rpcgen
> >> doesn't work properly: rpcgen can't exec /lib/cpp since it doesn't
> >> exist.
> >> 
> >> According to
> >> http://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/lib.html,
> > "if a C preprocessor is installed, /lib/cpp must be a reference to it,
> > for historical reasons. The usual placement of this binary is /usr/bin/cpp".
> >> 
> >> Typical distros, like Ubuntu, openSuSE, Fedora, RHEL, all comply with
> >> the rule.
> >> 
> >> Actually in meta/recipes-devtools/gcc/gcc-package-target.inc, we do
> >> try to
> > package ${base_libdir}/cpp:
> >>  FILES_cpp = "\
> >>   ${bindir}/${TARGET_PREFIX}cpp \
> >>   ${base_libdir}/cpp \
> >>   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
> >> But unluckily we didn't to create a symbol link in do_install. This
> >> patch
> > adds the symbol link.
> > 
> > Ok, this sounds great. Put this in the commit message though please!
> Hi RP,
> Please use the new commit(the only change is the updated commit message):
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=dcui/self-hosted-v2&id=f6001f0b12cb561f5e08d3a5b0d61ab5fa924f40

Thanks, I've merged this patch to master.

Cheers,

Richard



