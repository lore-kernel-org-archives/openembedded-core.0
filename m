Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1T2JXB-0000Q2-Jr
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:12:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7HA024X018115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Aug 2012 03:00:03 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 17 Aug 2012 03:00:02 -0700
Date: Fri, 17 Aug 2012 18:00:01 +0800
From: Liang Li <liang.li@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120817100001.GA16621@localhost>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost> <502D12E2.4000808@windriver.com>
	<1345132684.14667.70.camel@ted> <20120817033209.GB19625@localhost>
	<1345196146.14667.84.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1345196146.14667.84.camel@ted>
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
X-List-Received-Date: Fri, 17 Aug 2012 10:12:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 2012-08-17 17:35, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-08-17 at 11:32 +0800, Liang Li wrote:
> > On 2012-08-16 23:58, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2012-08-16 at 11:33 -0400, Bruce Ashfield wrote:
> > > > On 12-08-13 10:17 PM, Liang Li wrote:
> > > > > Hi Richard,
> > > > >
> > > > > Ping ...
> > > > >
> > > > > Hopefully you could recall sufficient context from this thread about
> > > > > the 'include path for slang.h' cause compile error issue that we are
> > > > > trying to fix here.
> > > > 
> > > > Bump.
> > > > 
> > > > I'm holding off on merging a kernel patch for this while this is still
> > > > outstanding.
> > > > 
> > > > Can I distill this into the following (in the hope of resolving it).
> > > > 
> > > >    - do we want to fix this problem for all kernels, or just the linux-yocto
> > > >      ones ? And by 'fix', I mean without the requirement of porting
> > > >      a kernel patch to older recipes.
> > > 
> > > I propose we add a sed expression to the general kernel do_install which
> > > changes the -I/usr/include/slang -> -I=/usr/include/slang. That should
> > > be generic, acceptable to upstream and fixes all kernel versions.
> > > 
> > > Comments?
> > > 
> > 
> > Good advise, so the kernel patch can be revised to:
> > 
> > diff --git a/tools/perf/Makefile b/tools/perf/Makefile
> > index 067f2df..071986c 100644
> > --- a/tools/perf/Makefile
> > +++ b/tools/perf/Makefile
> > @@ -497,7 +497,7 @@ else
> >  		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
> >  	else
> >  		# Some releases like Fedora has /usr/include/slang/slang.h other than /usr/include/slang.h
> > -		SLANG_INC ?= -I/usr/include/slang
> > +		SLANG_INC ?= -idirafter /usr/include/slang
> >  		BASIC_CFLAGS += $(SLANG_INC)
> >  
> >  		EXTLIBS += -lnewt -lslang
> 
> Why do you need a kernel patch at all with the solution I mentioned
> above?
> 
> > With this, we might not have to touch perf.bb. So seems like we'll use
> > this solution? :)
> 
> You should need to add the sed to the general kernel do_install. We
> should also get this fixed upstream in the mainline kernel. We shouldn't
> need a kernel patch or any recipe change to perf.
> 

I am totally confused, you mentioned 'general kernel do_install', I
assume it's oe-core kernel.bbclass concept. Then you mentioned 'get
the fix upstream in the mainline kernel', how could that happen?

We are discussing about the solution to 'fix the compile warning to
error' stuff that triggered by the '-I/usr/include/slang', right? We
do not necessarily have to change recipe to fix it since the issue
is not introduced by the recipe, the hard coded '-I/usr/include/slang'
in the Makefile cause the issue, we can fix the root cause by kernel
patch(other than just comment the line out). I see your previous patch
to kernel, by comment out the '-I/usr/include/slang' line in the
Makefile, is the same behavior, but we won't have the change(comment
out -I.. in Makefile) upstream to mainline, right?

If you mean the logic in plan, the 'sed ..' stuff in do_install can be
push to upstream kernel, then what is the difference in your plan,
compared with my proposed change like the below:

commit c7e9626

    perf: add SLANG_INC for slang.h
    
    Previously we hard code '-I/usr/include/slang' to CFLAGS to works with
    some hosts that has /usr/include/slang/slang.h other than
    /usr/include/slang.h like Fedora. This will cause compiling warnings
    in some cases.
    
    We could downgrade the priority of the default hard coded path, and
    provide user a chance to specify correct location of slang.h then user
    could specify SLANG_INC to avoid compile warnings like the
    '/usr/include/slang' is not exists etc.
    
    Signed-off-by: Liang Li <liang.li@windriver.com>

diff --git a/tools/perf/Makefile b/tools/perf/Makefile
index b7a7a87..071986c 100644
--- a/tools/perf/Makefile
+++ b/tools/perf/Makefile
@@ -496,8 +496,10 @@ else
 		msg := $(warning newt not found, disables TUI support. Please install newt-devel or libnewt-dev);
 		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
 	else
-		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
-		BASIC_CFLAGS += -I/usr/include/slang
+		# Some releases like Fedora has /usr/include/slang/slang.h other than /usr/include/slang.h
+		SLANG_INC ?= -idirafter /usr/include/slang
+		BASIC_CFLAGS += $(SLANG_INC)
+
 		EXTLIBS += -lnewt -lslang
 		LIB_OBJS += $(OUTPUT)ui/setup.o
 		LIB_OBJS += $(OUTPUT)ui/browser.o

---

If the change to kernel works, we do not have to change perf.bb,
do not have to patch kernel's do_install by 'sed..' and could send the
fix mainline etc.

Thanks,
		Liang Li

> Cheers,
> 
> Richard


