Return-Path: <martin@geanix.com>
X-Greylist: delayed 341 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Feb 2020 07:58:28 UTC
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id C74D2600A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 07:58:28 +0000 (UTC)
Received: from [192.168.8.20] (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id 940E0726F;
	Thu,  6 Feb 2020 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1580975549; bh=xbqqvVHmX8phXGbd7UxRQcrw12ylj+3LElgS8nsk+ds=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=d9wGHTTlnDPVRLzKkA8QdDROCuDxy7r5EGb+ra6DIPR9ef/vIU+pm0y8DKMawiDHS
	cRczyAT4BHVvpZK3TiCvGszZAJarfKzhMnOQBuj6UUg8xh4V5hi5Pye5Bpy7UEnf+N
	c2FnXil96KeCiUQnuNKEVH8eydFxFfbPyPijd2/oo7+dTTnZus3oks+1FkxADpzrRl
	ctWnHthAyWgOWbwWvkiYBphQQ2P+oiGRV1vaF4ybOg80nGW3hWyDnT2Itrv60qA/5g
	aPM3vDKfoD35j7noIExXaF5nkPujPACH82JBa1x3HAC6Xa2zw+mfqASgctatz4XI7t
	FTOmAAtpCLz8g==
To: Jaewon Lee <jaewon.lee@xilinx.com>,
	openembedded-core@lists.openembedded.org
References: <1580950649-8807-1-git-send-email-jaewon.lee@xilinx.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <57d3655a-a20f-f7df-f335-9958075465e5@geanix.com>
Date: Thu, 6 Feb 2020 08:52:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1580950649-8807-1-git-send-email-jaewon.lee@xilinx.com>
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
	DKIM_SIGNED,URIBL_BLOCKED autolearn=disabled version=3.4.3
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on eb9da72b0f73
Cc: Mark Hatle <mark.hatle@xilinx.com>
Subject: Re: [PATCH] sstate.bbclass: fix issue while handling long sstate filenames
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
X-List-Received-Date: Thu, 06 Feb 2020 07:58:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit



On 06/02/2020 01.57, Jaewon Lee wrote:
> When moving to python3, divison using '/' now returns float instead of
> an integer. In upstream commit b8025e972081b70960ffcbcbe43a7118041556a1
> sstate filenames longer than the limit are changed to just include
> necessary info + 3 fields just for information. The space left over
> after the necessary info is divided into 3 for each of the fields.
> Casting the outcome of that division to int to solve the following error
> message:
> 
> avail = (254 - len(hash + "_" + taskname + extension) -
> len(components[0]) - len(components[1]) - len(components[5]) -
> len(components[6]) - 7) / 3
>      >        components[2] = components[2][:avail]
>               components[3] = components[3][:avail]
> TypeError: slice indices must be integers or None or have an __index__
> method
> 
> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> ---
>   meta/classes/sstate.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index faa6470..53a6d06 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -20,7 +20,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
>           components = spec.split(":")
>           # Fields 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information
>           # 7 is for the separators
> -        avail = (254 - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) / 3
> +        avail = int((254 - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) / 3)

Python has a nifty // operator that resembles integer division from C:

 >>> 3 / 2

1.5

 >>> 3 // 2

1


// Martin

>           components[2] = components[2][:avail]
>           components[3] = components[3][:avail]
>           components[4] = components[4][:avail]
> 

