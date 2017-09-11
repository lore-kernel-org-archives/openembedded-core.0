Return-Path: <prvs=42006fa7b=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1E54977DB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 07:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2301; q=dns/txt;
	s=ironport2; t=1505113366; x=1536649366;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=iKo7X3Fzgbthls1NTsl1YVFac6Ga3o86ziO9g6p87ew=;
	b=dgQjnQ2iEPS90aOFIT+qP5zgZh9votpiUK7v/NwjShY/7zTjUF5D83Yv
	XcTN7iYtPH9VnV61Uu95eRBA4TpMd12mtWxjOJzCxAgVf2WIUfZTiFGgg
	KreCAKWY2JJonUv9Zd36K95p9/RaFap2qzhfhpGen1WovMZyObh1s1qtx c=;
X-IronPort-AV: E=Sophos;i="5.42,376,1500933600"; 
   d="scan'208";a="2467983"
Received: from vmprevas3.prevas.se (HELO smtp.prevas.se) ([172.16.8.103])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-SHA;
	11 Sep 2017 09:02:42 +0200
Received: from [172.16.11.54] (172.16.8.31) by smtp.prevas.se (172.16.8.103)
	with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 11 Sep 2017 09:02:42 +0200
To: Paul Barker <pbarker@toganlabs.com>
References: <20170821083946.4493-1-mnhu@prevas.dk>
	<20170821092134.6329-1-mnhu@prevas.dk>
	<CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
	<20170908203726.GG26405@denix.org>
	<75F5325D-9BEC-49A6-AEF8-75448B46BCF7@prevas.dk>
	<CAPyrkgyzzfR7jmeyJURRyPra4Jd2CPKWMiJbEPR3a8W=h+4W+A@mail.gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <aa0e9f4b-bc55-8f25-ab72-efdeca0f7c17@prevas.dk>
Date: Mon, 11 Sep 2017 09:02:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAPyrkgyzzfR7jmeyJURRyPra4Jd2CPKWMiJbEPR3a8W=h+4W+A@mail.gmail.com>
X-Originating-IP: [172.16.8.31]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-module-split: rrecommend kernel-image instead of rdepend
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
X-List-Received-Date: Mon, 11 Sep 2017 07:02:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2017-09-08 23:29, Paul Barker wrote:
> On Fri, Sep 8, 2017 at 10:07 PM, Martin Hundebøll
> <martin.hundeboll@prevas.dk> wrote:
>>
>>
>> On September 8, 2017 10:37:26 PM GMT+02:00, Denys Dmytriyenko <denis@denix.org> wrote:
>>> On Fri, Sep 08, 2017 at 09:06:17PM +0100, Paul Barker wrote:
>>>>
>>>> This breaks the method described in the kernel dev FAQ to omit the
>>>> kernel image from the rootfs which is to set the following in a conf
>>>> file:
>>>>
>>>>      RDEPENDS_kernel-base = ""
>>>>
>>>> See
>>> http://www.yoctoproject.org/docs/2.3.1/kernel-dev/kernel-dev.html#idm45690538384880.
>>>>
>>>> By recommending kernel-image directly instead of recommending the
>>>> top-level kernel-<version> package which was actually removed from
>>>> extra_depends, we skip the inclusion of the kernel-base package. I'm
>>>> not familiar enough with the details of kernel module loading to know
>>>> if the 2 files in kernel-base (modules.builtin and modules.order) are
>>>> strictly needed but I think they should at least be included in via
>>>> recommendation.
>>>>
>>>> As we already have a documented way to omit the kernel image, can we
>>>> revert this?
>>>>
>>>> As an alternative I can send in a patch which changes the recommend
>>> to
>>>> the top-level kernel-<version> package instead of kernel-image.
>>>
>>> FWIW, this was discussed at #yocto on IRC today. When I first saw the
>>> change
>>> several days ago, I was puzzled as well...
>>> The existing method has been in use by many of us for a very long time
>>> and
>>> seems to be well documented - I also vote for reverting the change.
>>
>> Does setting `RDEPENDS_kernel-base = ""` in an image recipe work too?
>>
> 
> No, you'd need it to be set in a conf file so it takes effect when the
> kernel-base package is created.
> 
> I can see the issue here though. Can you set `RDEPENDS_kernel-base =
> ""` globally and explicitly install kernel-image into the appropriate
> image? If not then yes we'll need to find an alternative solution to
> simply reverting the change.
> 

Seems like the inverted approach of disabling install of kernel-image 
globally, and enabling it per-image works just fine.

Reverting the patch is fine by me - sorry for the noise.

// Martin

