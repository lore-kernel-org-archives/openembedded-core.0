Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1T2DTn-0004k5-F6
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 05:44:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7H3WBRA015412
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Aug 2012 20:32:11 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 16 Aug 2012 20:32:10 -0700
Date: Fri, 17 Aug 2012 11:32:09 +0800
From: Liang Li <liang.li@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120817033209.GB19625@localhost>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost> <502D12E2.4000808@windriver.com>
	<1345132684.14667.70.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1345132684.14667.70.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Liang Li <liang.li@windriver.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 17 Aug 2012 03:44:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 2012-08-16 23:58, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-08-16 at 11:33 -0400, Bruce Ashfield wrote:
> > On 12-08-13 10:17 PM, Liang Li wrote:
> > > Hi Richard,
> > >
> > > Ping ...
> > >
> > > Hopefully you could recall sufficient context from this thread about
> > > the 'include path for slang.h' cause compile error issue that we are
> > > trying to fix here.
> > 
> > Bump.
> > 
> > I'm holding off on merging a kernel patch for this while this is still
> > outstanding.
> > 
> > Can I distill this into the following (in the hope of resolving it).
> > 
> >    - do we want to fix this problem for all kernels, or just the linux-yocto
> >      ones ? And by 'fix', I mean without the requirement of porting
> >      a kernel patch to older recipes.
> 
> I propose we add a sed expression to the general kernel do_install which
> changes the -I/usr/include/slang -> -I=/usr/include/slang. That should
> be generic, acceptable to upstream and fixes all kernel versions.
> 
> Comments?
> 

Good advise, so the kernel patch can be revised to:

diff --git a/tools/perf/Makefile b/tools/perf/Makefile
index 067f2df..071986c 100644
--- a/tools/perf/Makefile
+++ b/tools/perf/Makefile
@@ -497,7 +497,7 @@ else
 		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
 	else
 		# Some releases like Fedora has /usr/include/slang/slang.h other than /usr/include/slang.h
-		SLANG_INC ?= -I/usr/include/slang
+		SLANG_INC ?= -idirafter /usr/include/slang
 		BASIC_CFLAGS += $(SLANG_INC)
 
 		EXTLIBS += -lnewt -lslang

---

With this, we might not have to touch perf.bb. So seems like we'll use
this solution? :)

Thanks,
		Liang Li

> Cheers,
> 
> Richard


