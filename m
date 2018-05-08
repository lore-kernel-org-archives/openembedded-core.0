Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 38F8F74BDF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 17:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DC88020914;
	Tue,  8 May 2018 17:45:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cuRhFbanU2LR; Tue,  8 May 2018 17:45:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A5FE02079D;
	Tue,  8 May 2018 17:45:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3E73F16345A; Tue,  8 May 2018 13:45:23 -0400 (EDT)
Date: Tue, 8 May 2018 13:45:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20180508174523.GW3228@denix.org>
References: <cover.1524665116.git.Martin.Jansa@gmail.com>
	<1cf93aa21ed541e982ff0be611cdc25eb4568538.1524665117.git.Martin.Jansa@gmail.com>
	<20180508170155.GV3228@denix.org>
	<1525800450.1489.119.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1525800450.1489.119.camel@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH 1/2] Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
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
X-List-Received-Date: Tue, 08 May 2018 17:45:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 08, 2018 at 12:27:30PM -0500, Joshua Watt wrote:
> On Tue, 2018-05-08 at 13:01 -0400, Denys Dmytriyenko wrote:
> > I see this got merged/backported to rocko today.
> > Now my builds are failing with this error during parsing of meta-
> > openembedded:
> > 
> > 
> > WARNING: /.../sources/meta-openembedded/meta-oe/recipes-
> > multimedia/jack/jack_git.bb: Error during finalise of
> > /.../sources/meta-openembedded/meta-oe/recipes-
> > multimedia/jack/jack_git.bb
> > WARNING: /.../sources/meta-openembedded/meta-oe/recipes-
> > multimedia/jack/a2jmidid_8.bb: Exception during build_dependencies
> > for waf_do_compile
> > WARNING: /.../sources/meta-openembedded/meta-oe/recipes-
> > multimedia/jack/a2jmidid_8.bb: Error during finalise of
> > /.../sources/meta-openembedded/meta-oe/recipes-
> > multimedia/jack/a2jmidid_8.bb
> > ERROR: ExpansionError during parsing /.../sources/meta-
> > openembedded/meta-oe/recipes-multimedia/jack/jack_git.bb
> > Traceback (most recent call last):
> > bb.data_smart.ExpansionError: Failure expanding variable
> > waf_do_compile, expression was /.../build/tmp/work/armv7ahf-neon-
> > linux-gnueabi/jack/1.9.10+gitAUTOINC+2d1d323505-r0/git/waf build
> > ${@get_waf_parallel_make(d)} which triggered exception IndexError:
> > pop from empty list
> 
> Hmm, interesting. I'm not sure it's related, it might be a bug in
> get_waf_parallel_make(). Whats the value of ${PARALLEL_MAKE} in that
> recipe?

Oh, thanks for the pointer! The recipe itself doesn't change PARALLEL_MAKE, 
but it appears I made a small typo in PARALLEL_MAKE setting in local.conf and 
it manifested so strangely in the wrong place! Sorry, my bad.


> > I remember we spent several week trying to fix it properly in master
> > back 
> > in February and coordinate fixes betweem meta-openembedded and oe-
> > core. Is 
> > anything else missing?
> > 
> > -- 
> > Denys
> > 
> > 
> > On Wed, Apr 25, 2018 at 02:07:13PM +0000, Martin Jansa wrote:
> > > * this doesn't work correctly as discussed in:
> > >   http://lists.openembedded.org/pipermail/openembedded-commits/2018
> > > -January/218460.html
> > > * some of the issues were fixed in master since then
> > >   but not all, so revert it until it's completely resolved
> > > 
> > > This reverts commit eac21f981337bfaddb2d67161a1ff049158041ce.
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/classes/waf.bbclass | 17 +----------------
> > >  1 file changed, 1 insertion(+), 16 deletions(-)
> > > 
> > > diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> > > index acbda278a2..c4698e910a 100644
> > > --- a/meta/classes/waf.bbclass
> > > +++ b/meta/classes/waf.bbclass
> > > @@ -25,23 +25,8 @@ def get_waf_parallel_make(d):
> > >  
> > >      return ""
> > >  
> > > -python waf_preconfigure() {
> > > -    from distutils.version import StrictVersion
> > > -    srcsubdir = d.getVar('S')
> > > -    wafbin = os.path.join(srcsubdir, 'waf')
> > > -    status, result = oe.utils.getstatusoutput(wafbin + " --
> > > version")
> > > -    if status != 0:
> > > -        bb.warn("Unable to execute waf --version, exit code %d.
> > > Assuming waf version without bindir/libdir support." % status)
> > > -        return
> > > -    version = result.split()[1]
> > > -    if StrictVersion(version) >= StrictVersion("1.8.7"):
> > > -        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --
> > > libdir=${libdir}")
> > > -}
> > > -
> > > -do_configure[prefuncs] += "waf_preconfigure"
> > > -
> > >  waf_do_configure() {
> > > -	${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF}
> > > ${EXTRA_OECONF}
> > > +	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
> > >  }
> > >  
> > >  waf_do_compile()  {
> > > -- 
> > > 2.17.0
> > > 
> > > -- 
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

