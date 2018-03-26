Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63F35601F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 15:28:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2QFSt4L001811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Mar 2018 08:28:56 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 26 Mar 2018 08:28:53 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Zhang Xiao
	<xiao.zhang@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
	<7673ca98-3ed5-c770-180e-88d599736d92@linux.intel.com>
	<a739f962-dad5-1d0f-5795-b46bee65c26d@windriver.com>
	<dcc91a62-07a3-9374-5f5c-41fae23fb682@linux.intel.com>
	<cc14195a-81df-190f-23fa-9c914e21e6d9@windriver.com>
	<4813fff9-6e19-4c8d-e22e-2ab6ce5e8989@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <ae9c1af4-ee4d-99f4-7485-968b17bb6811@windriver.com>
Date: Mon, 26 Mar 2018 10:28:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <4813fff9-6e19-4c8d-e22e-2ab6ce5e8989@linux.intel.com>
Subject: Re: [PATCH 1/7] eudev: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 26 Mar 2018 15:28:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/13/18 5:19 AM, Alexander Kanavin wrote:
> On 03/12/2018 09:48 PM, Mark Hatle wrote:
>> Then an advanced user to select a specific version of the 'alternatives'.  The
>> key with all of this is that it needs to be 'reasonable' for both the recipe
>> maintainer and the end user.  Having to manually rename things, use the existing
>> update-alternatives, etc really isn't a good idea -- even if it solves (some of)
>> the user issues.

Back online after a business trip.

> But what is the specific need for having both 32 and 64 bit development 
> packages *installed at the same time*? You do need to explain this, 
> because any solution will add complexity and headaches for oe-core 
> maintainers, and multilib is already far too complex and tricky.

Two user-cases.

The primary one is SDK generation.  Right now creating a multilib SDK is causing
tons of failures for both headers and executables.  The user is trying to build
ONE SDK that can build either 32-bit or 64-bit applications and they are getting
numerous failures during SDK creation.  We've offered the workaround of two
SDKs, but needless to say that is far from ideal.

The secondary use-case is on-target generation.  We're not talking about tiny
embedded systems here.  We're talking about targets that have 192 or more cores
that are used for both executing code, as well as creating customized code
alternatives.  (Think high-end routers, industrial control systems, etc.)  In
this case, the biggest issue has been python.  The user has a library, which for
some reason is available in either 32-bit or 64-bit mode (and ONLY that mode).
They don't have the source for that.. so they need to create a program that runs
on 32-bit python -- or 64-bit python to use the special library for the
processing that they are doing.   This is unfortunately still very common.

The answer of 'just uninstall' one or the other doesn't solve that problem, as
they are both needed to create a functioning system.

A related case, it's really the same just different symptoms, is that we have
customers who are still needing to run -16-bit- IA code.  Yes, you can run
16-bit IA code on Linux -- the key is that it runs in a 32-bit context.  So now
you are forced to run both a 32-bit and 64-bit user space.  32-bit for legacy
(16-bit) code, and 64-bit for any new code.  The immediate question is, well
then why are you shipping 'development' components for 32-bit, the customer
isn't in this case.. but once they enable 'dev-pkgs' in the image gen code, both
32-bit AND 64-bit get dev-pkgs and their system falls apart.

In this version of the case, you can't "just uninstall", but you instead now
have to convince the system to only install 64-bit dev components, but not
32-bit..  And there is no 'easy' way to do that in the current infrastructure.

> If the customer is fine with switching between the two sets, then this 
> can be trivially solved using existing tools:
> 
> 1. Deinstall 32 bit dev packages on device.
> 2. Install matching 64 bit dev packages on device
> 
> ... or vice versa. Just wrap it in a script.

Switching really is not an option.

Update-alternatives work, but it's too complicated and not exactly 'automatic'.
We don't want to have recipe maintainers try to understand the complexities of
update-alternative priorities and such.  There is also no guaranty that the
selected script and ELF executable [or matching library]) is of the matching
type.  So while it's A solution -- it's not the right one.

Instead what I want is a simple equivalent to multilib_header that will also
handle abstracting executables with an appropriate wrapper that determines the
default behavior based on the users configuration.  It's pretty easy to
determine what the default for the system is.  (i.e. Inspect the related app, is
it 64-bit or 32-bit?   Check the CC/gcc and it's default word size... etc.)   If
the system really can't tell you, then the wrapper should stop with an error
telling the user it can't determine what the default is and suggest how to pass
the value for make/configure/etc.

I want a multilib_exec that can be used to generate a wrapper.  The recipe will
have to pass in the name of what is being wrapped, and how to determine the
correct 'default'.  The scripting should handle everything else.   Like
multilib_header it needs to generate an identical script no matter when multilib
it's called with, avoiding any potential file conflict during install -- and
then an automatic rename of the underlying 'executable'... using the same logic
as multilib_header.

--Mark

> 
> Alex
> 
> 


