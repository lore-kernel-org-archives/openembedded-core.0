Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1SzI6m-0008Ui-Gr
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 04:04:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q791qUP8003266
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Aug 2012 18:52:30 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 8 Aug 2012 18:52:30 -0700
Date: Thu, 9 Aug 2012 09:52:29 +0800
From: Liang Li <liang.li@windriver.com>
To: Darren Hart <darren.hart@intel.com>
Message-ID: <20120809015229.GA2473@localhost>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<5023062A.8050105@intel.com> <20120809012454.GA13378@localhost>
	<50231540.6020709@intel.com>
MIME-Version: 1.0
In-Reply-To: <50231540.6020709@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Thu, 09 Aug 2012 02:04:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 2012-08-09 09:41, Darren Hart <darren.hart@intel.com> wrote:
> On 08/08/2012 06:24 PM, Liang Li wrote:
> > On 2012-08-09 08:36, Darren Hart <darren.hart@intel.com> wrote:
> >> On 08/07/2012 08:37 PM, Liang Li wrote:
> >>> On 2012-08-07 22:02, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >>>> On Fri, 2012-08-03 at 23:43 +0800, Liang Li wrote:
> >>>>> Via EXTRA_CFLAGS, we can pass the sysroot include directory to perf to
> >>>>> provide slang.h rather than hardcoded host dir in perf's Makefile.
> >>>>>
> >>>>> Pass WERROR=0 to perf's Makefile to avoid warnings being treated
> >>>>> as errors. Warnings are not fatal, and while they will be fixed in the
> >>>>> future, there's no need for them to break the build.
> >>>>
> >>>> No mention of the additional slang dependency is made here?
> >>>>
> >>>
> >>> Forgot mentioned it. Good catch, but the one line change that add
> >>> slang to DEPENDS seems clear enough for everyone, isn't? :)
> >>
> >> Nope, the patch header declares the intent of the patch.
> >>
> > 
> > Can't agree with you anymore. :) But we don't list all changes(even
> > one line straight forward change) in patch header, don't we? :)
> 
> OK, so we're getting off into the weeds here for a relatively minor
> change. However, the answer to your question is YES we do list all the
> changes in the patch header. We don't list them individually, but rather
> group them functionally.

Still agree. Yes, we did this all along the time, no confusion here.
Then you think the one line change in this patch, to add slang to
DEPENDS, is functional, *should* be listed out in patch header
explicitly. That is our deviation here, I thought that is
straightforward, and the patch is *mainly* about *fix* an issue other
than add a function, the one line change is just part of fix so I was
mainly focus on explain intention of the fix. :)

> Adding a dependency to a recipe is a very clear
> example of a functional change that should be made explicit in the
> change log in my opinion.
> 

No problem, add it to patch header would be fine to me, but here let's
focusing on 'do we need changes in this patch'.

Thanks,
		Liang Li

> --
> Darren
> 
> > 
> > Thanks,
> > 		Liang Li
> > 
> >> --
> >> Darren
> >>
> >>>
> >>>>> Signed-off-by: Liang Li <liang.li@windriver.com>
> >>>>> ---
> >>>>>  meta/recipes-kernel/perf/perf_3.4.bb | 3 +++
> >>>>>  1 file changed, 3 insertions(+)
> >>>>>
> >>>>> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> >>>>> index 505c7b8..537e926 100644
> >>>>> --- a/meta/recipes-kernel/perf/perf_3.4.bb
> >>>>> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> >>>>> @@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
> >>>>>             ${MLPREFIX}binutils \
> >>>>>             ${TUI_DEPENDS} \
> >>>>>             ${SCRIPTING_DEPENDS} \
> >>>>> +           slang \
> >>>>>            "
> >>>>>  
> >>>>>  SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
> >>>>> @@ -63,6 +64,8 @@ EXTRA_OEMAKE = \
> >>>>>  		AR="${AR}" \
> >>>>>  		prefix=/usr \
> >>>>>  		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
> >>>>> +		WERROR=0 \
> >>>>> +		EXTRA_CFLAGS=-I${STAGING_INCDIR} \
> >>>>>  		'
> >>>>
> >>>> This is is not acceptable since the include directory /usr/include/slang
> >>>> is still being looked at and this just "hides" the error. STAGING_INCDIR
> >>>> is on the compilers default search path anyway.
> >>>
> >>> EXTRA_CFLAGS is processed early than the '-I/usr/include/slang', so
> >>> its being used here, to specify a path for slang.h. That indeed
> >>> 'hides' -I/usr/include/slang. And I agree that specify
> >>> -I/usr/include/slang blindly in Makefile should be fixed. And I've
> >>> discussed the fix for kernel tree several days before. However, the
> >>> fix for kernel tree will not conflict than this patch, I would think
> >>> that this patch for perf.bb would fix the issue for us for now, and
> >>> smooth the adoption of future fix for the Makefile.
> >>>
> >>>>
> >>>> So this patch is wrong in several different ways :(
> >>>>
> >>>
> >>> ... I can't reproduce the 'warning -> error' on my host now, but as I
> >>> explained above, this patch is just 'make use of existing mechanism of
> >>> Makefile to specify correct location of slang.h before the warning is
> >>> generated', even though the STAGING_INCDIR is in compilers default
> >>> search path, seems no hurt in case we just make it float top a bit
> >>> to get searched before wrong include directory is discovered, right?
> >>> :)
> >>>
> >>>> I've merged a temporary fix until we get this resolved properly.
> >>>>
> >>>
> >>> I saw that, but the fix that we've discussed several days before seems
> >>> is what we want:
> >>>
> >>> diff --git a/tools/perf/Makefile b/tools/perf/Makefile
> >>> index b7a7a87..3365ad2 100644
> >>> --- a/tools/perf/Makefile
> >>> +++ b/tools/perf/Makefile
> >>> @@ -496,8 +496,10 @@ else
> >>>  		msg := $(warning newt not found, disables TUI support. Please install newt-devel or libnewt-dev);
> >>>  		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
> >>>  	else
> >>> -		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
> >>> -		BASIC_CFLAGS += -I/usr/include/slang
> >>> +		# Some releases has /usr/include/slang/slang.h other than /usr/include/slang.h
> >>> +		SLANG_INC ?= -I/usr/include/slang
> >>> +		BASIC_CFLAGS += $(SLANG_INC)
> >>> +
> >>>  		EXTLIBS += -lnewt -lslang
> >>>  		LIB_OBJS += $(OUTPUT)ui/setup.o
> >>>  		LIB_OBJS += $(OUTPUT)ui/browser.o
> >>>
> >>> ---
> >>>
> >>> Then we still need a patch to perf.bb to specify SLANG_INC. Moreover,
> >>> this patch(EXTRA_CFLAGS for perf.bb) could co-exists with patch for
> >>> kernel. :)
> >>>
> >>> Thanks,
> >>> 		Liang Li
> >>>
> >>>> Cheers,
> >>>>
> >>>> Richard
> >>
> >>
> >> -- 
> >> Darren Hart
> >> Intel Open Source Technology Center
> >> Yocto Project - Linux Kernel
> 
> 
> -- 
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel


