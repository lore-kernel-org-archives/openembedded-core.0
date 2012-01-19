Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rnp5N-00078j-22 for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 11:19:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JABX0W032347
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 10:11:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32042-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 10:11:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JABPgj032341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 10:11:26 GMT
Message-ID: <1326967885.2511.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 10:11:25 +0000
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FCBF7E0@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326714004.git.lianhao.lu@intel.com>
	<2588490b8b8424c96da2824c604929baeb1c5c16.1326714004.git.lianhao.lu@intel.com>
	<1326733174.2933.3.camel@ted>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCA9A7E@SHSMSX102.ccr.corp.intel.com>
	<1326964344.2511.49.camel@ted>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCBF7E0@SHSMSX102.ccr.corp.intel.com>
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
X-List-Received-Date: Thu, 19 Jan 2012 10:19:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-19 at 09:40 +0000, Lu, Lianhao wrote:
> Richard Purdie wrote on 2012-01-19:
> > On Tue, 2012-01-17 at 03:05 +0000, Lu, Lianhao wrote:
> >> Richard Purdie wrote on 2012-01-17:
> >>> On Mon, 2012-01-16 at 19:43 +0800, Lianhao Lu wrote:
> >>> 
> >>> Can you please check if this can be fixed by:
> >>> 
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> >>> index d014980..3a82720 100644
> >>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> >>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> >>> @@ -77,6 +77,9 @@ do_headerfix () {
> >>> 
> >>>  addtask headerfix after do_unpack before do_patch
> >>> +CROSS_TARGET_SYS_DIR[vardepsexclude] = "PN"
> >>> +CROSS_TARGET_SYS_DIR[vardepvalue] = "1"
> >>> +
> >>>  do_configure_prepend () {
> >>>         # teach gcc to find correct target includedir when checking libc ssp support
> >>>         mkdir -p ${B}/gcc
> >>> as discussed in the "sstate info" thread?
> >>> 
> >> 
> >> By using this patch, gcc-cross-initial, gcc-cross-intermediate,
> >> gcc-cross would have the same signatures for tasks like do_fetch,
> >> do_unpack, do_headerfix, do_patch. But libgcc still has different
> >> signature with gcc-cross-initial for task do_patch.
> >> 
> >> By bitbake-diffsigs the do_patch signature files between gcc-cross-initial and libgcc, it says:
> >>   Dependency on task gcc-cross-initial_4.6.bb.do_unpack was added
> >>   Dependency on task gcc-cross-initial_4.6.bb.do_headerfix was added
> >>   Dependency on task libgcc_4.6.bb.do_unpack was removed
> >> Besides, gcc-runtime seems have an additional patch file "fortran-cross-compile-hack.patch" which was never got be used. This would
> > results all the signature difference between gcc-cross-initial and gcc-runtime. After I remove that unused patch file, the signatures begin to
> > differ in  task do_headerfix and do_patch. By bitbake-diffsigs the do_headerfix sigangure files between gcc-cross-initial and gcc-runtime,
> > we could see tons of variable values, variable dependencies, task dependencies difference.
> >> 
> >> So I think this patch alone is not enough to solve all the problems here.
> > 
> > Agreed, there are further issues. The patch should really move into the
> > main SRC_URI which would resolve that problem. libgcc should really be
> > able to see the do_headerfix task so we could move that from
> > gcc-configure-common to gcc-common.inc.
> > 
> > This might not be all of the differences but should get us closer to
> > solving this problem!
> > 
> 
> By moving the gcc-runtime specific patch into main SRC_URI,
> gcc-runtime still has different signature with gcc-cross-initial for
> task do_headerfix. Bitbake-diffsigs gives the following information.
> Is it possible that the difference comes from the "inherit cross" in
> gcc-cross.inc?

Yes, this is exactly where this difference is coming from.

The problem is that do_headerfix has a lot of variables exported into
its environment, even if it doesn't need/use them. I'm wondering if we
should override bitbake in this particular case using the vardeps flag
with something like:

do_headerfix[vardeps] = "PATH"

which might solve this problem cleanly and remove the need for my
original patch too...

Cheers,

Richard



