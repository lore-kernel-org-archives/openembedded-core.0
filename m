Return-Path: <prvs=430dd721d=Martin.Hundeboll@prevas.dk>
Received: from mail01.prevas.se (mail01.prevas.se [62.95.78.3])
	by mail.openembedded.org (Postfix) with ESMTP id A1F3977D01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 05:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1213; q=dns/txt;
	s=ironport1; t=1505970919; x=1537506919;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=riD2OSWf58Y/YpgSKmFsBEwhHREfAXLkBDJ1tWbE0Rc=;
	b=gSn15NkoqnoSryUBwWkr8BHdaOPFRwGkL8qDBRyILTU1K4Yf+4xOmGvP
	DgkYRljGvC58j7YV/ZSpBVCJX0rMf6PA0p3zPLj7BO2tCaI1nDE/Y4Gyf
	7JFjTDXECKc0Vc+cZ0lHABAoJ4S089TPeSm/4J5OXoEPyGI3DCyfS2qCC U=;
X-IronPort-AV: E=Sophos;i="5.42,423,1500933600"; 
   d="scan'208";a="2619620"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport1.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Sep 2017 07:15:15 +0200
Received: from [172.16.11.54] (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 21 Sep 2017 07:15:14 +0200
To: <openembedded-core@lists.openembedded.org>
References: <1505841336-6415-1-git-send-email-nandojve@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <9504bd62-df10-36a8-01d5-34664c288f8c@prevas.dk>
Date: Thu, 21 Sep 2017 07:15:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505841336-6415-1-git-send-email-nandojve@gmail.com>
X-Originating-IP: [172.16.8.31]
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] image.bbclass: Sorted ctypes to avoid basehash error
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
X-List-Received-Date: Thu, 21 Sep 2017 05:15:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2017-09-19 19:15, Gerson Fernando Budke wrote:
> When selected multiple subimages a similar error could happend:
>    Variable do_image_cpio[subimages] value changed \
>      from 'cpio.gz.u-boot cpio.gz' to 'cpio.gz cpio.gz.u-boot'
> To avoid this, 'ctypes' should be sorted at 'gen_conversion_cmds'.
> 
> This garantee that 'CONVERSION_CMD_xxx' are always written in tha same
> order and consequently 'do_image_cpio' have the same hash.
> 
> Signed-off-by: Gerson Fernando Budke <nandojve@gmail.com>

Tested-by: Martin Hundebøll <mnhu@prevas.dk>

> ---
>   meta/classes/image.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 3639aa4..bef634b 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -452,7 +452,7 @@ python () {
>   
>           rm_tmp_images = set()
>           def gen_conversion_cmds(bt):
> -            for ctype in ctypes:
> +            for ctype in sorted(ctypes):
>                   if bt.endswith("." + ctype):
>                       type = bt[0:-len(ctype) - 1]
>                       if type.startswith("debugfs_"):
> 

