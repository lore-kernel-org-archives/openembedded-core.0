Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63D796E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 02:11:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3B2Bidq025380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 10 Apr 2016 19:11:44 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Apr 2016 19:11:43 -0700
To: Christopher Larson <kergoth@gmail.com>, Denys Dmytriyenko <denis@denix.org>
References: <cover.1460297667.git.liezhi.yang@windriver.com>
	<86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
	<20160410190630.GI16135@denix.org> <570AFB23.9070507@windriver.com>
	<CABcZANk80jGAHW4uUFqoF2DkMqh7wL2TpOVvQbo4-w+XXmMQwQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <570B07DD.3080309@windriver.com>
Date: Mon, 11 Apr 2016 10:11:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CABcZANk80jGAHW4uUFqoF2DkMqh7wL2TpOVvQbo4-w+XXmMQwQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 11 Apr 2016 02:11:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2016 09:56 AM, Christopher Larson wrote:
> On Sun, Apr 10, 2016 at 6:17 PM Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>
>
>     On 04/11/2016 03:06 AM, Denys Dmytriyenko wrote:
>      > On Sun, Apr 10, 2016 at 07:14:56AM -0700, Robert Yang wrote:
>      >> It mismatched such as qemux86 and qemux86-64 which was incorrect, for
>      >> example:
>      >> COMPATIBLE_MACHINE = "(qemux86)"
>      >
>      > That will match qemux86 and qemux86-64 and is by design! It's a regular
>
>     I'm afraid no, please see my last reply, for others such as
>     MACHINE_OVERRIDES, they never design to work in such a way, so I don't
>     think that COMPATIBLE_MACHINE should work in this way. If you really
>     want to match more, I think that you can set it as "(qemux86.*)" or
>     something familiar.
>
>
> That's an apples and oranges comparison. MACHINEOVERRIDES is part of OVERRIDES,
> which has *completely* different semantics than COMPATIBLE_*. COMPATIBLE_MACHINE
> is a regex variable more like BBMASK than anything else, and it's been that way
> since we introduced it. OVERRIDES has nothing to do with regular expressions.

Since introduced ? I did a grep in oe-core and meta-openembedded, it seems
that no ?

In oe-core:

$ grep 'COMPATIBLE_MACHINE.*qemux86' meta/recipes* -r
linux-yocto_4.4.bb:COMPATIBLE_MACHINE = 
"qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE = "(qemux86)"
linux-yocto-dev.bb:COMPATIBLE_MACHINE = 
"(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE = "(qemux86)"
linux-yocto-rt_4.1.bb:COMPATIBLE_MACHINE = 
"(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
linux-yocto-rt_4.4.bb:COMPATIBLE_MACHINE = 
"(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
linux-yocto_4.1.bb:COMPATIBLE_MACHINE = 
"qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"

In meta-openembedded:
vboxguestdrivers_4.3.30.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"

We can see that the only one sets qemux86 but no set qemux86-64 is
linux-yocto-tiny:
COMPATIBLE_MACHINE = "(qemux86)"

And it really doesn't work with qemux86-64.

// Robert

