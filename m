Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5A2673CC7;
	Fri, 30 Oct 2015 03:50:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9U3owXQ012137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Oct 2015 20:50:58 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 29 Oct 2015 20:50:58 -0700
To: Yocto Project <yocto@yoctoproject.org>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
References: <562E3896.6080405@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <5632E921.1030405@windriver.com>
Date: Thu, 29 Oct 2015 22:50:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <562E3896.6080405@windriver.com>
Subject: Re: Prelink status
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
X-List-Received-Date: Fri, 30 Oct 2015 03:51:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

I just wanted to update everyone on where we are at.  (I won't bore anyone with
any followups past this.)

IA32 (32-bit and 64-bit):

We believe the problems are resolved.  The error was a combination of prior
patch merge issues and a bug in glibc 2.22.  A patch for the glibc 2.22 has
already been sent to the GLIBC community and I have a change ready for OE.


ARM:

The same glibc 2.22 bug affected ARM as well as IA32.

Also it appears that a patch that went in last fall to enable IFUNC on arm
somehow had a hunk dropped from it.  Now that we've identified and restored this
hunk, it appears to be working again.


MIPS32/MIPS64 (o32, n32, n64):

A new section was added, SHT_MIPS_ABIFLAGS, this was confusing the prelinker
causing it to refused to continue.  A patch has gone in to instruct the
prelinker how to handle this new section (ignore it).


Power (32-bit):

We are still investigating changes that have happened in the past year+ to
binutils and glibc for Power systems.

Power (64-bit):

It is likely this will not work anytime soon.  The ABI has changed and is no
longer compatible with the previous methods of prelinking.  This is fairly low
priority to be fixed, as it's been broken for a while now.


If anyone has any expertise on Power 32-bit or 64-bit ELF, I'm still looking for
help there to get these issues resolved.

--Mark

On 10/26/15 9:28 AM, Mark Hatle wrote:
> I'm cross posting this in an effort to ask for help for the cross-prelink
> project.  (If you are unaware of what the prelinker does, it goes through and
> adjusts the relocation addresses to predefined values in an attempt to speed up
> executable load times.  For embedded systems, this can be fairly critical in
> meeting boot and runtime load performance targets.)
> 
> As some people might be aware, the upstream 'prelink' project that was
> maintained by Jakub Jelinek at Red Hat appears to have been abandoned.
> 
> I've been the maintainer for the Yocto Project's 'prelink-cross' project for a
> few years, but my work has been dealing with compilation issues and other things
> that have to do with using the prelinker in a cross compilation environment.
> 
> This means that unfortunately I'm in a situation where I am having problems
> trying to fix the problems in the prelinker itself, but I am not an ELF expert.
>  Currently the cross prelinker appears to be broken for pretty much every
> architecture and I need help trying to resolve these problems.
> 
> Issues I know of right now:
> 
> Introduction of RTYPE_CLASS_EXTERN_PROTECTED_DATA appears to be causing failures
> on ARM32, x86 and x86_64.
> 
> Some possibly unrelated issue is causing various items to relocate incorrectly
> (IFUNCs perhaps) on ARMv7 builds.
> 
> Power is no longer working properly, most likely due to an optimization in the
> way the PPC GOT table(s) are setup.
> 
> Power64 hasn't been working properly for a while, possibly due to the switch to
> ELFv2.
> 
> MIPS and MIPS64 also do not appear to be working, and I've not found a possible
> cause.
> 
> As you can see, pretty much everything is currently broken and I'm struggling to
> find community people with the right skill sets to help me resolve the issues.
> 
> The current state of my work in progress is available at:
> 
> git://git.yoctoproject.org/prelink-cross
> 
> branch cross_prelink_staging
> 
> If you think you can help, please let me know.
> --Mark
> 


