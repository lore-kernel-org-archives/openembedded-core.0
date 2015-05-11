Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 80BE86013D;
	Mon, 11 May 2015 20:14:36 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO700DN0C7WOU00@vms173023.mailsrvcs.net>; Mon,
	11 May 2015 15:14:20 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=JbALdvP9 c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10	a=FcKxyJYLlGsT2hAwRO8A:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E7DE9200EB; Mon,
	11 May 2015 16:14:19 -0400 (EDT)
Date: Mon, 11 May 2015 16:14:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-id: <20150511201419.GA20022@denix.org>
References: <20150501160602.GA5885@denix.org>
	<CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
	<554A67AB.1000800@dresearch-fe.de> <20150506233137.GH5885@denix.org>
	<20150508192852.GJ5885@denix.org> <20150508210907.GK5885@denix.org>
	<1431160561.8074.345.camel@linuxfoundation.org>
	<20150511062615.GE2400@jama>
MIME-version: 1.0
In-reply-to: <20150511062615.GE2400@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Mon, 11 May 2015 20:14:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, May 11, 2015 at 08:26:15AM +0200, Martin Jansa wrote:
> On Sat, May 09, 2015 at 09:36:01AM +0100, Richard Purdie wrote:
> > On Fri, 2015-05-08 at 17:09 -0400, Denys Dmytriyenko wrote:
> > > weston-init RDEPENDS on weston and kbd.
> > > 
> > > $ bitbake-diffsigs 1.0-r0.do_package_write_ipk.sigdata.eb3921bfc9623056f7ffaef4be8549ab 1.0-r0.do_package_write_ipk.sigdata.90c2978497847912cd64f66039927f7d 
> > > Hash for dependent task waylandweston_1.6.0.bb.do_packagedata changed from 551b3b5ac7b3c41bfced58b88db2d824 to f3eb9cd1861c186382e47f90e82e3295
> > > Hash for dependent task kbdkbd_2.0.1.bb.do_packagedata changed from 53a5dc88b80dc5ab559fbecd14277650 to 950fbc7fe3c33564e781743f2c260670
> > > 
> > > Then, comparing signatures for weston, for exaple, gives all the changes 
> > > caused by different DEFAULTTUNEs, TUNE_FEATURES and ARMPKGARCH - obviously, 
> > > since one machine is cortexa8, while another is cortexa9.
> > > 
> > > But why would an allarch package even care about machine tunes in dependant 
> > > packages, when it only RDEPENDS on them?
> > 
> > If A DEPENDS on B and B changes, the package name may change (thanks to
> > debian.bbclass) so A has to repackage. Very very annoying but
> > technically correct :/.
> > 
> > > And how should I fix this? Thanks.
> > 
> > See SIGGEN_EXCLUDERECIPES_ABISAFE in layer.conf of OE-Core. You probably
> > need to add weston-init to the list.
> 
> IIRC this won't help, he would need to add weston and kbd to
> SIGGEN_EXCLUDERECIPES_ABISAFE which will exclude it from signature of
> all other recipes as well.
> 
> Maybe you meant SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
> 
> SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
>   weston-init->weston \
>   weston-init->kbd \
> "

Thanks, Martin & Richard,

I can confirm that SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS seems to work in my local 
tests, while SIGGEN_EXCLUDERECIPES_ABISAFE doesn't.

-- 
Denys

