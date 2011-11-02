Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLYG7-0006Tf-Ff for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 11:41:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA2AZFC6014077;
	Wed, 2 Nov 2011 10:35:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12716-07; Wed,  2 Nov 2011 10:35:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA2AZ6X8014071
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 2 Nov 2011 10:35:07 GMT
Message-ID: <1320230106.20107.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
Date: Wed, 02 Nov 2011 10:35:06 +0000
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6D836780D9E@shsmsx502.ccr.corp.intel.com>
References: <cover.1320134607.git.dexuan.cui@intel.com>
	<ac7b821f266e932e267a4d62af83586ba3261a98.1320134607.git.dexuan.cui@intel.com>
	<1320142868.13918.0.camel@ted>
	<1865303E0DED764181A9D882DEF65FB6D836780D9E@shsmsx502.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bash: make job control really work
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
X-List-Received-Date: Wed, 02 Nov 2011 10:41:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-02 at 15:10 +0800, Cui, Dexuan wrote:
> Richard Purdie wrote on 2011-11-01:
> > On Tue, 2011-11-01 at 16:05 +0800, Dexuan Cui wrote:
> >> It turns out 9393ff833f44570fd5f500bc9de6c72db94b0296 didn't really
> >> fix the bug.
> >> 
> >> This patch is made and tested after I read the link below
> >> http://www.mail-archive.com/bug-bash@gnu.org/msg03107.html
> >> 
> >> [YOCTO #487]
> >> 
> >> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> >> ---
> >>  meta/recipes-extended/bash/bash.inc    |    1 +
> >>  meta/recipes-extended/bash/bash_4.2.bb |    2 +-
> >>  2 files changed, 2 insertions(+), 1 deletions(-)
> >> diff --git a/meta/recipes-extended/bash/bash.inc
> >> b/meta/recipes-extended/bash/bash.inc
> >> index d55e517..d495538 100644
> >> --- a/meta/recipes-extended/bash/bash.inc
> >> +++ b/meta/recipes-extended/bash/bash.inc
> >> @@ -23,6 +23,7 @@ ALTERNATIVE_LINK = "${base_bindir}/sh"
> >>  ALTERNATIVE_PRIORITY = "100"
> >>  
> >>  do_configure () { +	export bash_cv_job_control_missing=present
> >>  	gnu-configize 	oe_runconf }
> > 
> > This really should go into the common site files...
> Hi Richard,
> I found we do define the variable:
> meta/site/common-linux:33:bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
> but looks autoconf doesn't realize the variable has been assigned the value 'present'?
> I think this is because of the below do_configure in bash.inc -- looks autoreconf is skipped?
> do_configure () {
>     gnu-configize
>     oe_runconf
> }
> Why do we need a customized do_configure to replace autotools_do_configure?
> 
> Later, after I added
> do_configure_prepend () {
>     autoreconf -f -i -s
> }
> The generated config.log does show bash_cv_job_control_missing is assigned with 'present'.
> (BTW, common-linux also introduces many other variables -- would this be safe? Actually here I only need to introduce bash_cv_job_control_missing.)
> 
> However, finally, do_compile got a strange failure:
> | shell.c: In function 'shell_reinitialize':
> | shell.c:1742:20: error: 'PPROMPT' undeclared (first use in this function)
> | shell.c:1742:20: note: each undeclared identifier is reported only once for each function it appears in
> | shell.c:1743:22: error: 'SPROMPT' undeclared (first use in this function)
> 
> Could you please give some suggestions?

This is why its a really bad idea for recipes to have their own
configure rather than using our core one :/.

I had a go at this problem myself and it took a bit of figuring out. The
problem is that bash ships "config.h.in" but autoheader overwrites it.
This removes the start/end includes from config.h or config-bot.h and
config-top.h. We can do something like this:

export AUTOHEADER = "true"

do_configure_prepend () {
       if [ ! -e acinclude.m4 ]; then
               cat aclocal.m4 > acinclude.m4
       fi
}
 
instead of the current do_configure override. The _prepend ensures the
bash specific macros are preserved and the export AUTOHEADER stops
autoheader from running at all.

Could you test those changes against bash 4.x and bash 3.x (replacing
the current do_configure in bash.inc) and then if that works send a
patch please?

Cheers,

Richard





