Return-Path: <prvs=5113892fe=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 126A7786AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 12:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2100; q=dns/txt;
	s=ironport2; t=1512994072; x=1544530072;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=Lct3CHzGeeoKtJ8VtajxbqVUbuoY9pCgrA9cJuEmK3E=;
	b=KnqcyxC6JYSnAV0wa6vPv1en4FzcgzNf42m9TvvTW86TTAv16AII5irq
	gyvMxyKuevKfmAu35g+fvlRg9E0wHG/Z5q4EBQdpjOc56yLVFJrv90tSq
	CdcFznI7VvYPsNljH/szHB+3rVqJzOyGKTgGq+05KXBI/MFmlAw+5FRH4 E=;
X-IronPort-AV: E=Sophos;i="5.45,391,1508796000"; 
   d="scan'208";a="2792843"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 13:07:49 +0100
Received: from [172.16.11.15] (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 11 Dec 2017 13:07:49 +0100
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Kevin Hao
	<kexin.hao@windriver.com>
References: <20171209024546.16918-1-kexin.hao@windriver.com>
	<20171209024546.16918-2-kexin.hao@windriver.com>
	<CAP9ODKqdYcwwz0U2FG_LQ7cX2JpsX3bQ5q-Mnn2-x7b7xfDaqg@mail.gmail.com>
	<20171211053039.GC5051@pek-khao-d1>
	<CAP9ODKp_Y=CYLsi8okwH=JH+jNRWt7qTjF+XwxPg+ie-z7tDRg@mail.gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <1dacc22c-4870-447d-5096-9021cb1fd521@prevas.dk>
Date: Mon, 11 Dec 2017 13:07:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp_Y=CYLsi8okwH=JH+jNRWt7qTjF+XwxPg+ie-z7tDRg@mail.gmail.com>
X-Originating-IP: [172.16.8.31]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] wic: plugins: rawcopy: Add support to download the raw image from a http server
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
X-List-Received-Date: Mon, 11 Dec 2017 12:07:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2017-12-11 12:45, Otavio Salvador wrote:
> On Mon, Dec 11, 2017 at 3:30 AM, Kevin Hao <kexin.hao@windriver.com> wrote:
>> On Sun, Dec 10, 2017 at 10:53:43PM -0200, Otavio Salvador wrote:
>>> On Sat, Dec 9, 2017 at 12:45 AM, Kevin Hao <kexin.hao@windriver.com> wrote:
>>>> Some firmwares are critical for the basic functions of the board, and may
>>>> be used by the bootloader. Due to the license issue, we can't integrate
>>>> it. But we do need it when creating a booting image by using WIC.
>>>> So add the support for the WIC to download a raw file from http
>>>> server and write it to a specific part. In order to restrict the
>>>> downloading behaviour, we introduce a "WKS_ALLOW_DOWNLOAD" variable and
>>>> only do the downloading when this variable is set.
>>>>
>>>> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
>>>
>>> This does not make much sense.
>>>
>>> It does not allow to be downloaded? so build system can download it
>>> and use it as a normal artifact.
>>
>> In some cases, it doesn't make sense to do so. Because:
>> a) These firmwares are just raw binary files, they don't need any build or
>>     process. They are only useful when we try to create a bootable image.
> 
> In any case, keep them on the download cache is a good thing as it
> avoids build issues due network instability and avoids as well
> undesired file content changes.
> 
>> b) There firmwares may be licensed under a proprietary license. We may not
>>     integrate them to a fully open source build system. But we do want to provide
>>     an easy way for the customer to build a bootable image.
> 
> Sure and I agree, but this is what layers are for.
> 

I agree with Otavio here. Images built with OE / Bitbake should list all 
their sources in SRC_URIs.

Our (internal) releases includes images with all the sources needed to 
build the final target images, and we have had issues before with make 
systems pulling in sources in do_configure.

I don't personally think do_image_wic is any different than do_configure 
in this regard.

// Martin

