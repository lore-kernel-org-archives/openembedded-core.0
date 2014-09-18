Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 33DB365D58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 15:10:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8IFAjho015197
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 08:10:45 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 18 Sep 2014 08:10:41 -0700
Message-ID: <541AF5EF.3050904@windriver.com>
Date: Thu, 18 Sep 2014 23:10:39 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1411023982.git.hongxu.jia@windriver.com>	
	<afb9eb87d6ebebd33c1f6febf8f37111db63a614.1411023982.git.hongxu.jia@windriver.com>
	<1411048067.4736.8.camel@ted>
In-Reply-To: <1411048067.4736.8.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] sstatesig: Only dump incremental locked signatures
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
X-List-Received-Date: Thu, 18 Sep 2014 15:10:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2014 09:47 PM, Richard Purdie wrote:
> I'm afraid I'm starting to feel very strongly this is not a direction we
> should move in. Having the ability to write out a .inc file containing
> on a delta is one thing, writing out a file for automatic inclusion and
> trying to maintain that file is not something I feel comfortable with.

Yes, I understand that your worry is reasonable, so many unexpected
exception needs to be maintained

> I think that at some point there needs to be external tooling handling
> the inclusion and updating of this file and that the sigs code is not
> the place for this.

I once coded a python script to handling the locked sig file from an
existed sstate, translated sstate item name (ends with '.tgz.siginfo')
to "<pn>:<task>:<hash>" tuple.

The main blocker is: for some tasks (such as do_patch/do_fetch/
do_unpack), the target and native have the same pn in sstate, such as:
''sstate-cache/c6/sstate:automake::1.14.1:r0::3:c667b87f5d4e15198afc744f525895fc_unpack.tgz.siginfo"
is used for "automake" and "automake-native", you could not figure
out arch (which used as type in locked sig file) from it neither.

> For example, consider the case where you switch machines and want to
> share an include file between these machines. With the changes proposed
> in this patch series it will simply overwrite the file and remove the
> entries for the other machine.

I think the swith machines case could work in this patch series,
It appends to the tail of the locked sig file, and not overwrite
the other machine's sig if incremetnal dump is set.

But I indeed understand what you worry about.

> We could keep trying to patch up this code to cover every combination
> and eventuality but in the end, I believe the maintenance of this file
> should be something external, the sigs code should only be concerned
> with the generation of the core entries.

Completely agree.

//Hongxu

> Cheers,
>
> Richard


