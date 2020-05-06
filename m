Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
 by mx.groups.io with SMTP id smtpd.web12.5288.1588768895025392074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 05:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=iudhdQfj;
 spf=pass (domain: pr.hu, ip: 87.242.0.9, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWJMh-0004R8-Um; Wed, 06 May 2020 14:41:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vmHKOjJGDjkRQnMgwq0S03YbPqYYL2wuw9+hHu4Kg5I=; b=iudhdQfj1bNjFer1Tf8wRLkHmx
	Syi2qZKVaIvtnXkGtaTPTTO4prSCpLLU8bJM533NgiWH+sERJ0cTPA+O0gn++WkTjLt1Cb1SVvIS9
	VKzsG9AWjLBE8cItpqizqqifrz3e7Yk/c+PoTS6UjNIC+5U7Ckizj9VoCsQAffmT8wjc8WDyawbbc
	Vh5yMVdMr9TtvjCdvgE0GkyVz2vNm8kg1Tjxl6aUA/i1tv+ru05zNh86tBkBTl6J4tnoEN9Gr5Hd4
	ksERXWJsPgXQ5bqlM35gvxZd0jrldGO15QGakOA8q2+tlKb0vUhe7QMEicvSTVNZxgZbqBSZYgFar
	1Y+DnzVw==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197] helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWJMd-0005L2-OK; Wed, 06 May 2020 14:41:29 +0200
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
To: =?UTF-8?Q?Bart=c5=82omiej_Burdukiewicz?=
 <bartlomiej.burdukiewicz@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <44fb22eb-a3ea-15cb-f93e-c0ff4503705b@pr.hu>
Date: Wed, 6 May 2020 14:41:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com>
X-Spam-Score: -1.0 (-)
X-Scan-Signature: 62ab2c1fe565f499513796e83ed81713
X-Spam-Tracer: backend.mail.pr.hu -1.0 20200506124129Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 04. 24. 17:01 keltezéssel, Bartłomiej Burdukiewicz írta:
> Mesa can be compiled with libva support, in order to avoid recursive
> dependency between mesa and libva, virtual/mesa must be removed
> from libva recipe.

This is why this patch series was created, to break the
circular dependency in a clean way:
https://patchwork.openembedded.org/series/22976/#

The libva-initial recipe was introduced that doesn't need
mesa, then mesa can be built with vaapi state tracker enabled,
finally libva can be built with dependency on mesa so its
GLX support is enabled.

What happened to it?

Best regards,
Zoltán Böszörményi

> 
> Signed-off-by: Bartłomiej Burdukiewicz <bartlomiej.burdukiewicz@gmail.com>
> ---
>   meta/recipes-graphics/libva/libva_2.6.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-graphics/libva/libva_2.6.1.bb
> index 92cea83bc1..c1a441a18b 100644
> --- a/meta/recipes-graphics/libva/libva_2.6.1.bb
> +++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
> @@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e4862940
>   
>   UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
>   
> -DEPENDS = "libdrm virtual/mesa"
> +DEPENDS = "libdrm"
>   
>   inherit meson pkgconfig features_check
>   
> 
> 
> 
> 

