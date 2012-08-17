Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1T2MN8-0005be-CC
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:13:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7HD1rlp023465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Aug 2012 06:01:53 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 17 Aug 2012 06:01:52 -0700
Date: Fri, 17 Aug 2012 21:01:51 +0800
From: Liang Li <liang.li@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120817130151.GA1416@localhost>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost> <502D12E2.4000808@windriver.com>
	<1345132684.14667.70.camel@ted> <20120817033209.GB19625@localhost>
	<1345196146.14667.84.camel@ted> <20120817100001.GA16621@localhost>
	<1345200782.26132.18.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1345200782.26132.18.camel@ted>
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
X-List-Received-Date: Fri, 17 Aug 2012 13:13:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 2012-08-17 18:53, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-08-17 at 18:00 +0800, Liang Li wrote:
> > I am totally confused, you mentioned 'general kernel do_install', I
> > assume it's oe-core kernel.bbclass concept. Then you mentioned 'get
> > the fix upstream in the mainline kernel', how could that happen?
> > 
> > We are discussing about the solution to 'fix the compile warning to
> > error' stuff that triggered by the '-I/usr/include/slang', right?
> 
> Yes.
> 
> >  We do not necessarily have to change recipe to fix it since the issue
> > is not introduced by the recipe, the hard coded '-I/usr/include/slang'
> > in the Makefile cause the issue, we can fix the root cause by kernel
> > patch(other than just comment the line out). I see your previous patch
> > to kernel, by comment out the '-I/usr/include/slang' line in the
> > Makefile, is the same behavior, but we won't have the change(comment
> > out -I.. in Makefile) upstream to mainline, right?
> 
> I am suggesting that firstly, someone send a patch to the mainline
> kernel which changes -I/usr/include/slang to -I=/usr/include/slang in
> that Makefile.
> 
> Secondly, I'm suggesting that we add a line to kernel_do_install() in
> kernel.bbclass which does a sed on the Makefile as installed into
> $kerneldir which changes -I/usr/include/slang to -I=/usr/include/slang.
> 
> We can then drop the patch I added to the linux-yocto kernels.
> 
> This is all that should be needed, it should fix all the issues people
> have reported in a way that is acceptable to everyone.
> 

Ah, I see what you mean now. But we have push acceptable kernel patch
to linux-yocto kernel first, and propose it to mainline kernel in the
meantime. With proper kernel patch in linux-yocto kernel(s), we does
not have to do the second above, right? :)

And I see what you mean here, let me paste the revised change to
kernel here:

commit 5236988
Author: Liang Li <liang.li@windriver.com>
Date:   Wed Aug 1 14:31:24 2012 +0800

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
index b7a7a87..e403c36 100644
--- a/tools/perf/Makefile
+++ b/tools/perf/Makefile
@@ -496,8 +496,10 @@ else
 		msg := $(warning newt not found, disables TUI support. Please install newt-devel or libnewt-dev);
 		BASIC_CFLAGS += -DNO_NEWT_SUPPORT
 	else
-		# Fedora has /usr/include/slang/slang.h, but ubuntu /usr/include/slang.h
-		BASIC_CFLAGS += -I/usr/include/slang
+		# Some releases like Fedora has /usr/include/slang/slang.h other than /usr/include/slang.h
+		SLANG_INC ?= -idirafter =/usr/include/slang
+		BASIC_CFLAGS += $(SLANG_INC)
+
 		EXTLIBS += -lnewt -lslang
 		LIB_OBJS += $(OUTPUT)ui/setup.o
 		LIB_OBJS += $(OUTPUT)ui/browser.o

---

Thanks for clarification.

Regards,
		Liang Li

> Cheers,
> 
> Richard
> 


