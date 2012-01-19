Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RnoAF-0003XC-Fo for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:20:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0J9CWSf030624
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 09:12:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29679-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 09:12:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0J9COW2030618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 09:12:26 GMT
Message-ID: <1326964344.2511.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 09:12:24 +0000
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FCA9A7E@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326714004.git.lianhao.lu@intel.com>
	<2588490b8b8424c96da2824c604929baeb1c5c16.1326714004.git.lianhao.lu@intel.com>
	<1326733174.2933.3.camel@ted>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCA9A7E@SHSMSX102.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gcc-common.inc: Added shared source support for basichash.
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
X-List-Received-Date: Thu, 19 Jan 2012 09:20:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-17 at 03:05 +0000, Lu, Lianhao wrote:
> Richard Purdie wrote on 2012-01-17:
> > On Mon, 2012-01-16 at 19:43 +0800, Lianhao Lu wrote:
> >> [YOCTO #1555]
> >> Adding new mechanism to allow multiple gcc related recipes sharing the
> >> same src directory when using the basichash as the signature handler.
> >> 
> >> Using the same stamp file for multiple gcc related recipes to share the
> >> same src directory is no longer working when using the basichash
> >> signature.
> >> 
> >> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> >> ---
> >>  meta/recipes-devtools/gcc/gcc-common.inc |   56 ++++++++++++++++++++++++++++++
> >>  1 files changed, 56 insertions(+), 0 deletions(-)
> > 
> > Can you please check if this can be fixed by:
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > index d014980..3a82720 100644
> > --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > @@ -77,6 +77,9 @@ do_headerfix () {
> > 
> >  addtask headerfix after do_unpack before do_patch
> > +CROSS_TARGET_SYS_DIR[vardepsexclude] = "PN"
> > +CROSS_TARGET_SYS_DIR[vardepvalue] = "1"
> > +
> >  do_configure_prepend () {
> >         # teach gcc to find correct target includedir when checking libc ssp support
> >         mkdir -p ${B}/gcc
> > as discussed in the "sstate info" thread?
> > 
> 
> By using this patch, gcc-cross-initial, gcc-cross-intermediate, gcc-cross would have the same signatures for tasks like do_fetch, do_unpack, do_headerfix, do_patch. But libgcc still has different signature with gcc-cross-initial for task do_patch.
> 
> By bitbake-diffsigs the do_patch signature files between gcc-cross-initial and libgcc, it says:
>   Dependency on task gcc-cross-initial_4.6.bb.do_unpack was added
>   Dependency on task gcc-cross-initial_4.6.bb.do_headerfix was added
>   Dependency on task libgcc_4.6.bb.do_unpack was removed
> 
> Besides, gcc-runtime seems have an additional patch file "fortran-cross-compile-hack.patch" which was never got be used. This would results all the signature difference between gcc-cross-initial and gcc-runtime. After I remove that unused patch file, the signatures begin to differ in  task do_headerfix and do_patch. By bitbake-diffsigs the do_headerfix sigangure files between gcc-cross-initial and gcc-runtime, we could see tons of variable values, variable dependencies, task dependencies difference.
> 
> So I think this patch alone is not enough to solve all the problems here.

Agreed, there are further issues. The patch should really move into the
main SRC_URI which would resolve that problem. libgcc should really be
able to see the do_headerfix task so we could move that from
gcc-configure-common to gcc-common.inc.

This might not be all of the differences but should get us closer to
solving this problem!

Cheers,

Richard



