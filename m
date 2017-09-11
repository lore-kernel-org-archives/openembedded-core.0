Return-Path: <prvs=42006fa7b=Martin.Hundeboll@prevas.dk>
Received: from mail01.prevas.se (mail01.prevas.se [62.95.78.3])
	by mail.openembedded.org (Postfix) with ESMTP id F1F3677E68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1348; q=dns/txt;
	s=ironport1; t=1505132411; x=1536668411;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=Paz5t4J5XfftFWAnz62hAeor7MAg7QLS6G7jiE0EHCI=;
	b=O7FSe2pc5QrvdcqcC5OjiTVGbf2NsI8st6JfTlFq5ztZoW80gjDTK333
	VC8Ty72CBHqNc5frgvreQA/vbV6F3HMW2sq89DkC31uS5E9Fbufm0oVI+
	oVA2uh4KpK+eGt0Ou3tNZ0hWLqa3Fw4fpFCXEeq2PvrfqfaDqKVrSx1rv w=;
X-IronPort-AV: E=Sophos;i="5.42,377,1500933600"; 
   d="scan'208";a="2584752"
Received: from vmprevas3.prevas.se (HELO smtp.prevas.se) ([172.16.8.103])
	by ironport1.prevas.se with ESMTP/TLS/DHE-RSA-AES256-SHA;
	11 Sep 2017 14:20:07 +0200
Received: from [172.16.11.54] (172.16.8.31) by smtp.prevas.se (172.16.8.103)
	with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 11 Sep 2017 14:20:06 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker
	<pbarker@toganlabs.com>
References: <20170821083946.4493-1-mnhu@prevas.dk>
	<20170821092134.6329-1-mnhu@prevas.dk>
	<CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
	<20170908203726.GG26405@denix.org>
	<75F5325D-9BEC-49A6-AEF8-75448B46BCF7@prevas.dk>
	<CAPyrkgyzzfR7jmeyJURRyPra4Jd2CPKWMiJbEPR3a8W=h+4W+A@mail.gmail.com>
	<aa0e9f4b-bc55-8f25-ab72-efdeca0f7c17@prevas.dk>
	<1505122013.18640.1.camel@linuxfoundation.org>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <a52ee58f-6ede-006d-750a-38b5d5f59b8a@prevas.dk>
Date: Mon, 11 Sep 2017 14:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505122013.18640.1.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 11 Sep 2017 12:20:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2017-09-11 11:26, Richard Purdie wrote:
> On Mon, 2017-09-11 at 09:02 +0200, Martin Hundebøll wrote:
>>
>> On 2017-09-08 23:29, Paul Barker wrote:
>>>
>>> On Fri, Sep 8, 2017 at 10:07 PM, Martin Hundebøll
>>> <martin.hundeboll@prevas.dk> wrote:
>>>>
>>>>   
>>> No, you'd need it to be set in a conf file so it takes effect when
>>> the
>>> kernel-base package is created.
>>>
>>> I can see the issue here though. Can you set `RDEPENDS_kernel-base
>>> =
>>> ""` globally and explicitly install kernel-image into the
>>> appropriate
>>> image? If not then yes we'll need to find an alternative solution
>>> to
>>> simply reverting the change.
>>>
>> Seems like the inverted approach of disabling install of kernel-
>> image
>> globally, and enabling it per-image works just fine.
>>
>> Reverting the patch is fine by me - sorry for the noise.
> 
> Are you sure? I can't imagine being able to influence this at all from
> an image recipe, either the dependency is present or its not and it
> would be set from the global configuration, not from an image recipe...

Pretty sure, yes.

conf/distro/basic.conf:
RDEPENDS_kernel-base = ""

recipes-filesystems/rootfs.bb:
IMAGE_INSTALL += "kernel-image kernel-module-foo"

recipes-filesystems/rescuefs.bb:
IMAGE_INSTALL += "kernel-module-foo"

// Martin

