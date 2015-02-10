Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1C2732AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 21:16:19 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so11044866pdb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 13:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=BBA1H0L0RdoQniu4VghF2cxr4atzBGmaUYoPiwP/WYo=;
	b=D48Z4QId83YR4LvnmwDXjq3Cc4Blww9PunrmBHT1bUSp5G4EmVmufHtoznpLIcpX3P
	S59VyHLbdBNZzh/GZlAP5LIpVjWuArvGzWd8DGWvTs/6kcBkfqMFKEm3a7Xcqem0Gcnr
	WgVFydPA2kpN174cncs9/W1bbVJEs+2Fh75fVo+a1rAgsDS1z2GEfLUEfn0YwkPIyXAk
	PUieoffizBCGSgwhDsayn4y8cEQV4x2rq5+s8IYlPXA2wzEo8Be0VPw2RvadGX472b9U
	xFaLxFlgqBj6EF04aTNwhilS2zJ+oQR623wKo5hJ8K+0sJR7EtBKz8XKKPfW3ZGrf8jO
	Crzg==
X-Received: by 10.70.94.195 with SMTP id de3mr466257pdb.59.1423602980569;
	Tue, 10 Feb 2015 13:16:20 -0800 (PST)
Received: from [10.22.11.16] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id ht2sm8455006pdb.82.2015.02.10.13.16.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Feb 2015 13:16:19 -0800 (PST)
Message-ID: <54DA7521.8040209@gmail.com>
Date: Tue, 10 Feb 2015 13:16:17 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1423497825-4095-1-git-send-email-anibal.limon@linux.intel.com>
In-Reply-To: <1423497825-4095-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [dizzy][PATCH] files/toolchain-shar-template.sh: fix replace target_sdk_dir twice in environment setup file
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
X-List-Received-Date: Tue, 10 Feb 2015 21:16:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

staging.

thanks.

- armin

On 02/09/2015 08:03 AM, Aníbal Limón wrote:
> When specify a target sdk dir that contains default install dir as
> subdir,
>
> 	target_sdk_dir=/opt/poky/$version/
> 	custom_target_sdk_dir=/opt/poky/$version/some
>
> The target_sdk_dir variable in environment-setup file is replaced twice
> causes to point to wrong PATH.
>
> In order to fix filter environment-setup file in second replacement.
>
> [YOCTO #7032]
>
> (From OE-Core rev: 02ecaa69abe97fe2f01cd609e0e59933c0f9ddbf)
>
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/files/toolchain-shar-template.sh | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
> index 0d679a6..4a7fbd5 100644
> --- a/meta/files/toolchain-shar-template.sh
> +++ b/meta/files/toolchain-shar-template.sh
> @@ -158,6 +158,7 @@ for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
>   	$SUDO_EXEC find $replace -type f -exec file '{}' \; | \
>   		grep ":.*\(ASCII\|script\|source\).*text" | \
>   		awk -F':' '{printf "\"%s\"\n", $1}' | \
> +		grep -v "$target_sdk_dir/environment-setup-*" | \
>   		$SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
>   done
>
>

