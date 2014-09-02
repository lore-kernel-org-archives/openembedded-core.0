Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D44B6FCE0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 03:30:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s823UmtY013876
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Sep 2014 20:30:48 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 20:30:47 -0700
Message-ID: <540539E6.2030508@windriver.com>
Date: Tue, 2 Sep 2014 11:30:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>	<540530B8.8040107@windriver.com>
	<CAP9ODKrxFsbVs7xNQ1tOW2xmrQ4-omTZCTVQ04aO8ms--Lu9Qw@mail.gmail.com>
In-Reply-To: <CAP9ODKrxFsbVs7xNQ1tOW2xmrQ4-omTZCTVQ04aO8ms--Lu9Qw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error while building qemu without X11 support.
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
X-List-Received-Date: Tue, 02 Sep 2014 03:30:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2014 11:17 AM, Otavio Salvador wrote:
> On Mon, Sep 1, 2014 at 11:51 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> On 09/02/2014 10:30 AM, Otavio Salvador wrote:
>>>
>>> Hello,
>>>
>>> During our regression tests we found the following error:
>>>
>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) consider defining a
>>> PREFERRED_PROVIDER entry to match jpeg
>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR: Nothing
>>> PROVIDES 'libxext-native' (but
>>
>>
>> Did you use meta/recipes-graphics/xorg-lib/libxext_git.bb ? This one
>> doesn't provide native, but libxext_1.3.2.bb does.
>>
>> Seems that we need remove the git version since it is older:
>>
>> PV = "1.0.99.1+gitr${SRCPV}"
>>
>> And doesn't see a license issue.
>
> This has been reproduced in our autobuilder.
>
> It removes:
>
> x11 and wayland
>
> and adds:
>
> directfb
>
> Can you try to reproduce it?
>

Yes, I can reproduce the error, sorry, please revert this as a quick
workaround:

Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Jul 29 01:02:44 2014 -0700

     qemu-native: depends on libxext-native when enable sdl


The DISTRO_FEATURES affects the native recipe, I'm not sure whether this is
intended or not.

// Robert



