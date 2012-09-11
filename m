Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBT1F-0001qs-06 for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:08:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8BFuOmc011141;
	Tue, 11 Sep 2012 16:56:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09947-10; Tue, 11 Sep 2012 16:56:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8BFuGcv011135
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 11 Sep 2012 16:56:17 +0100
Message-ID: <1347378978.2122.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 11 Sep 2012 16:56:18 +0100
In-Reply-To: <504F5A7C.9070407@linux.intel.com>
References: <1347376071-29566-1-git-send-email-sgw@linux.intel.com>
	<1347376402.2122.44.camel@ted> <504F5A7C.9070407@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] arch-ia32: Add x32 to MACHINEOVERRIDES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 16:08:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 08:36 -0700, Saul Wold wrote:
> On 09/11/2012 08:13 AM, Richard Purdie wrote:
> > On Tue, 2012-09-11 at 08:07 -0700, Saul Wold wrote:
> >> This will allow the KERNEL_FEATURES to trigger the x32 ABI via overrides
> >>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >> ---
> >>   meta/conf/machine/include/ia32/arch-ia32.inc |    1 +
> >>   1 files changed, 1 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
> >> index 15f67d7..fa70e57 100644
> >> --- a/meta/conf/machine/include/ia32/arch-ia32.inc
> >> +++ b/meta/conf/machine/include/ia32/arch-ia32.inc
> >> @@ -24,6 +24,7 @@ ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}"
> >>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-mx32", "", d)}"
> >>   TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
> >>   TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
> >> +MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", ":x32", "" ,d)}"
> >>
> >>   # ELF64 ABI
> >>   TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
> >
> > This is just for the kernel issue, right?
> >
> > In that case, just use ${@bb.utils.contains("TUNE_FEATURES", "mx32",
> > "xxxx", "" ,d)} in the kernel recipe code...
> >
> It's possible that there will be other recipes that need patches or 
> other changes in the future, but I guess we can cross that bridge when 
> we come to it.
> 
> I think I will actually use the features update that Bruce just added 
> from here instead.  Since multiple BSP could take advantage of x32 we 
> should not have to edit each of there kernel recipes.  It should just be 
> enabled based on the x32 DEFAULTTUNE.

No, no, no. DEFAULTTUNE is a really bad idea for these kind of
decisions, what if x32 is one of the other tunes enabled?

You're not the first person to use DEFAULTTUNE like this recently and
its not what its intended for at all :/.

Also, the kernel features are specific to linux-yocto so you can't use
them from a core ABI file.

Cheers,

Richard





