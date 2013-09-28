Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 42CB46C9CC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2013 12:17:41 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so2982394lab.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Sep 2013 05:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=1ZD/Ze76HXAFm9opfBjMdeRDZ3qCkJtUnbTqE6lJHzM=;
	b=h2YBozuTxT5yaV1YTtDWAD0NN/iE9gYHWITzZ/TfyLN6j+m4TfWCX2EJsympuu9nmE
	ZfdOdIKXwzVWeeE15N6WoUDK5/3BPBrnFJh3AWo0s795xEC+1htgOwHVokGlMX42N85R
	1ECjZ2dWL8K15+jxMoMD+V/LJ3UveDaA/C+eVRae8N4apkeOZGFrOnX+iyKXeserU6CP
	LJ0cJwc1dIQAtVUdPlji/RcpI20A2BwBf21L53bSmS297z+ppMBfc6iVJYkqyCR2McRR
	fs9oU+y43kXFtbhj7ld74XfBNwuucyz63qOxDKcwfuHvvssZrQINPL3/4btPk4g/tLpz
	WSRA==
X-Received: by 10.112.0.242 with SMTP id 18mr12845862lbh.18.1380370662094;
	Sat, 28 Sep 2013 05:17:42 -0700 (PDT)
Received: from [192.168.43.167] (c-5eeaaaa0-74736162.cust.telenor.se.
	[94.234.170.160])
	by mx.google.com with ESMTPSA id f17sm9074172lbo.12.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 28 Sep 2013 05:17:41 -0700 (PDT)
Message-ID: <5246C8E2.7060702@gmail.com>
Date: Sat, 28 Sep 2013 14:17:38 +0200
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>	<8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>	<CAP9ODKpYNSJs-T=GTpa725A6GK32GykgPbv7w5KeiwPhXVLfzw@mail.gmail.com>
	<1380291699.31937.46.camel@empanada>
In-Reply-To: <1380291699.31937.46.camel@empanada>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] wic: Initial code for wic (OpenEmbedded Image Creator)
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
X-List-Received-Date: Sat, 28 Sep 2013 12:17:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2013 04:21 PM, Tom Zanussi wrote:
> Hi Otavio,
>
> On Fri, 2013-09-27 at 11:01 -0300, Otavio Salvador wrote:
>> Hello Tom,
>>
>> On Thu, Sep 26, 2013 at 11:17 PM, Tom Zanussi
>> <tom.zanussi@linux.intel.com> wrote:
>>> Initial implementation of the 'wic' command.
>>>
><snip>
>> Could you please elaborate why to make a new command instead of using
>> the class system?
>>
>
> This isn't an either/or thing - the initial requirements were that the
> overall deployment effort end up being something that would be usable
> both from an external tool as well as from within the class system.

What do you mean when you say "within the class system" here ?
* A tool using only (kickstart for image cfg, partitioning et.c.) + 
(tmp/deploy/ipk|rpm|deb) as input data for image creation ?

Just my five cents,

I would like to see reproducible image creation from both the bitbake/OE 
build env and the nativesdk SDK build env.
This would require a common interface for input distribution data, It 
naturally feels like this interface should be the package repository.
i.e. if X is not packaged as class-target, it can't be included on the 
generated image.
Also, if X is required to generate the image, it should be packaged as 
class-nativesdk.

afaict, the standalone wic tool uses a hybrid approach, using 
OpenEmbedded build artifacts + a package repository as input for rootfs 
generation.
What is the long term plan for wic in regards to the above ?

Br,
David

> This just happens to be the initial (easier) part of that, the external
> tool, and I expect in 1.6 to be doing a lot of the harder part,
> integration with the build system.


> The most important part, I think, is that this provides a high-level
> user-oriented 'language' (the kickstart files) that users can use to
> define custom images, rather than having to muck around in class files
> or variable settings, or write specialized scripts such as mkefidisk.sh
> for example.
>
> Making that available from a standalone tool such as 'wic' is
> straightforward, doing the same from within the build system will
> require more thought and work, but that's what I'm hoping to do in
> 1.6...



>
> Tom
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


