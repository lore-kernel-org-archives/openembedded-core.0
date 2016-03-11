Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 95ABA73232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 17:06:43 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160311170642457_0484;
	Fri, 11 Mar 2016 17:06:42 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [127.0.0.1] (port=41003 helo=localhost)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1aeQXe-0003eN-1D; Fri, 11 Mar 2016 12:07:58 -0500
Received: from 216.191.234.70 ([216.191.234.70]) by crashcourse.ca (Horde
	Framework) with HTTP; Fri, 11 Mar 2016 12:07:57 -0500
Message-ID: <20160311120757.57925u23rdrmrpc0@crashcourse.ca>
Date: Fri, 11 Mar 2016 12:07:57 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Christopher Larson <clarson@kergoth.com>
References: <20160311070859.163019mr4vs6d940@crashcourse.ca>
	<CABcZAN=yAkvKMUqSML_PhO_mogQUxaBJcqiUpsXT+HAj5FMy6A@mail.gmail.com>
In-Reply-To: <CABcZAN=yAkvKMUqSML_PhO_mogQUxaBJcqiUpsXT+HAj5FMy6A@mail.gmail.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: what is the precise search path for resolving "include" or "require" .inc files?
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
X-List-Received-Date: Fri, 11 Mar 2016 17:06:45 -0000
Content-Type: text/plain;
 charset=UTF-8;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Quoting Christopher Larson <clarson@kergoth.com>:

> On Fri, Mar 11, 2016 at 5:08 AM Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
>
>>    not sure why i never noticed this before, but what is the search order
>> or precedence or priority for resolving recipe file directives "include"
>> or "require"? i was just perusing the bitbake user manual, and noticed
>> the explanation that those directives use BBPATH to track down the first
>> include file by a given name.
>>
>>    but AIUI, BBPATH is supposed to represent an ordered set of *layers*
>> (i just examined BBPATH for a current [wind river linux] build, and that
>> is exactly what it seems to contain). so when a recipe file like
>> busybox.whatever.bb contains the line:
>>
>>    require busybox.inc
>>
>> i always just assumed the search would look in the current busybox
>> directory, but that directory is not technically a layer directory --
>> it's not a directory specified on the alleged BBPATH search path.
>>
>>    i never thought about this until i noticed some .bbappend files
>> specifically using directives like:
>>
>>    require recipes-bsp/u-boot/u-boot.inc
>>
>> where that file reference *does* refer to a file relative to some
>> actual layer directory somewhere.
>>
>>    what am i missing here?
>>
>
> BBPATH is temporarily prepended to include the directory the recipe lives
> in, as a special case.

   i *assumed* that must have been what was happening, i just didn't see
that explicitly mentioned in the bitbake user manual. and while we're
talking about the bitbake user manual here:

http://www.yoctoproject.org/docs/latest/bitbake-user-manual/bitbake-user-manual.html

this can't be right, can it?

"3.3.1. Locating Include and Class Files¶

"BitBake uses the BBPATH variable to locate needed include and class files.
The BBPATH variable is analogous to the environment variable PATH.

"In order for include and class files to be found by BitBake, they need to
be located in a "classes" subdirectory that can be found in BBPATH."

   while that statement might be true for class files, pretty sure it
isn't true for *include* files, as it suggests.

rday

p.s. i should probably submit another proofreading patch, to tweak stuff
like this in section 3.3.2:

"In this case, BitBake would search for the directory [sic]  
classes/autotools.bbclass in BBPATH."




