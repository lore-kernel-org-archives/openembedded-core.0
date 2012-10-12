Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMeI4-000777-EL
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 14:24:32 +0200
Received: from localhost ([127.0.0.1]:48696 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMe5I-0007rX-Pg
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 12:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=KjjvR3v590tvGyIHocd0e74Fvzs=; b=e1gOwSB7XyHhz5NKVXiRpkn9XyG9
	y1VXTvBYaPSSPEYjZy2xHVINazuuKM+HKloThgJqx0iBlB+lH4+tHGp+sDwIcbUV
	oqCPnQ/88fCjXdMQKhQl4byNP/tvQ5Kz/okZdNJ7zcZ2DK8JHm3bjODyW9trWrwJ
	RGQCfFQu1lapogI=
Received: from [195.171.99.130] (port=25618 helo=[192.168.0.79])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMe5I-0007rU-NJ
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 12:11:20 +0000
Message-ID: <50780958.4080209@communistcode.co.uk>
Date: Fri, 12 Oct 2012 13:13:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAGiJk9fX67UyL_NQo-TWUzgpu=0wq6N3u9pDmKnOskbsjNhxAQ@mail.gmail.com>
In-Reply-To: <CAGiJk9fX67UyL_NQo-TWUzgpu=0wq6N3u9pDmKnOskbsjNhxAQ@mail.gmail.com>
Subject: Re: Accelerate do_package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 12:24:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/12 12:43, Samuel Stirtzel wrote:
> Hi,
> after re-building Qt the third time today, I was curious why
> do_package takes this long.
>
>  From my investigation it looks like the library stripping is the culprit,
> it lets my system idle with 5% CPU usage over a long time.
>
> Would it be possible to accelerate do_package with parallelisation?
> Likely I could look into this sometime soon, but I'd rather hear your
> thoughts on this first.
>
>
> PS:
> Also sstate creation and rootfs packing could be made faster with
> pbzip2 [1] / pigz [2] (we have a recipe for pigz), or is anthing
> preventing this?
>
> [1] http://compression.ca/pbzip2/
> [2] http://zlib.net/pigz/
>
>

Samuel,

You being up an interesting point here as I have recently been mulling 
over ways of improving performance. I believe performance improvements 
are one of the targets of the 1.4 yocto/oe-core release so it will be 
properly discussed then.

In the meantime a couple of points I was thinking about related to 
improving performance was by deeming some tasks as "non active" such as 
they didn't take up a thread of your total specified. This could be 
applied to low-cpu intensive tasks such as do_fetch and do_package which 
I believe would greatly speed up the build and make more efficient use 
of the CPU.

As for using pbzip2/pigz I believe there was a discussion on it and 
something was said regarding the compatibility of the created archives. 
For example an archive created by pigz could sometimes not be 
uncompressed by gzip, I am just remembering this from memory though, I'm 
sure a search of the list would be more enlightening.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



