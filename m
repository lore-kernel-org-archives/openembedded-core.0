Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2KMb-000254-JV for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 13:05:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HArC9N008036;
	Fri, 17 Aug 2012 11:53:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07637-04; Fri, 17 Aug 2012 11:53:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HAr2qQ008030
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 17 Aug 2012 11:53:03 +0100
Message-ID: <1345200782.26132.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Liang Li <liang.li@windriver.com>
Date: Fri, 17 Aug 2012 11:53:02 +0100
In-Reply-To: <20120817100001.GA16621@localhost>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost> <502D12E2.4000808@windriver.com>
	<1345132684.14667.70.camel@ted> <20120817033209.GB19625@localhost>
	<1345196146.14667.84.camel@ted> <20120817100001.GA16621@localhost>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
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
X-List-Received-Date: Fri, 17 Aug 2012 11:05:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 18:00 +0800, Liang Li wrote:
> I am totally confused, you mentioned 'general kernel do_install', I
> assume it's oe-core kernel.bbclass concept. Then you mentioned 'get
> the fix upstream in the mainline kernel', how could that happen?
> 
> We are discussing about the solution to 'fix the compile warning to
> error' stuff that triggered by the '-I/usr/include/slang', right?

Yes.

>  We do not necessarily have to change recipe to fix it since the issue
> is not introduced by the recipe, the hard coded '-I/usr/include/slang'
> in the Makefile cause the issue, we can fix the root cause by kernel
> patch(other than just comment the line out). I see your previous patch
> to kernel, by comment out the '-I/usr/include/slang' line in the
> Makefile, is the same behavior, but we won't have the change(comment
> out -I.. in Makefile) upstream to mainline, right?

I am suggesting that firstly, someone send a patch to the mainline
kernel which changes -I/usr/include/slang to -I=/usr/include/slang in
that Makefile.

Secondly, I'm suggesting that we add a line to kernel_do_install() in
kernel.bbclass which does a sed on the Makefile as installed into
$kerneldir which changes -I/usr/include/slang to -I=/usr/include/slang.

We can then drop the patch I added to the linux-yocto kernels.

This is all that should be needed, it should fix all the issues people
have reported in a way that is acceptable to everyone.

Cheers,

Richard




