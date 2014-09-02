Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 744736FE64
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 06:52:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s826pfwJ005900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Sep 2014 23:51:41 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 23:51:41 -0700
Message-ID: <540568FB.4040006@windriver.com>
Date: Tue, 2 Sep 2014 14:51:39 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>	<540530B8.8040107@windriver.com>	<CAP9ODKrxFsbVs7xNQ1tOW2xmrQ4-omTZCTVQ04aO8ms--Lu9Qw@mail.gmail.com>	<540539E6.2030508@windriver.com>
	<CAP9ODKr_p-1z-nRLuM_nMVpei3A4Z2CuDh9wzEEpZW9jSEoL-w@mail.gmail.com>
In-Reply-To: <CAP9ODKr_p-1z-nRLuM_nMVpei3A4Z2CuDh9wzEEpZW9jSEoL-w@mail.gmail.com>
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
X-List-Received-Date: Tue, 02 Sep 2014 06:52:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2014 11:33 AM, Otavio Salvador wrote:
> On Tue, Sep 2, 2014 at 12:30 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>>
>> On 09/02/2014 11:17 AM, Otavio Salvador wrote:
>>>
>>> On Mon, Sep 1, 2014 at 11:51 PM, Robert Yang <liezhi.yang@windriver.com>
>>> wrote:
>>>>
>>>>
>>>> On 09/02/2014 10:30 AM, Otavio Salvador wrote:
>>>>>
>>>>>
>>>>> Hello,
>>>>>
>>>>> During our regression tests we found the following error:
>>>>>
>>>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) consider defining a
>>>>> PREFERRED_PROVIDER entry to match jpeg
>>>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR: Nothing
>>>>> PROVIDES 'libxext-native' (but
>>>>
>>>>
>>>>
>>>> Did you use meta/recipes-graphics/xorg-lib/libxext_git.bb ? This one
>>>> doesn't provide native, but libxext_1.3.2.bb does.
>>>>
>>>> Seems that we need remove the git version since it is older:
>>>>
>>>> PV = "1.0.99.1+gitr${SRCPV}"
>>>>
>>>> And doesn't see a license issue.
>>>
>>>
>>> This has been reproduced in our autobuilder.
>>>
>>> It removes:
>>>
>>> x11 and wayland

Hi Otavio,

How about only remove the x11 for target ?

DISTRO_FEATURES_remove_class-target = "x11"

// Robert

>>>
>>> and adds:
>>>
>>> directfb
>>>
>>> Can you try to reproduce it?
>>>
>>
>> Yes, I can reproduce the error, sorry, please revert this as a quick
>> workaround:
>>
>> Author: Robert Yang <liezhi.yang@windriver.com>
>> Date:   Tue Jul 29 01:02:44 2014 -0700
>>
>>      qemu-native: depends on libxext-native when enable sdl
>>
>>
>> The DISTRO_FEATURES affects the native recipe, I'm not sure whether this is
>> intended or not.
>
> This is an error in our autobuilder for regression test; Richard,
> could you revert this in OE-Core?
>

