Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.41399.1601311231184924917
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 08SGeIl3013692
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 28 Sep 2020 11:40:27 -0500
Subject: Re: [OE-core] [PATCH 7/7] sstate: set mode explicitly when creating directories in sstate-cache
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20200928161900.452970-1-ross.burton@arm.com>
 <20200928161900.452970-7-ross.burton@arm.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <817c9c37-3036-5be3-4934-db1dfe56985d@kernel.crashing.org>
Date: Mon, 28 Sep 2020 11:40:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928161900.452970-7-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I worry that this could be problematic for other ways.  Security requirements
for an org or even users who want to share the sstate case 0777 etc.

Wouldn't it be better to warn the user that their umask won't allow them to
share this with others, and give them instructions and opening the umask?

--Mark

On 9/28/20 11:19 AM, Ross Burton wrote:
> When creating directories in the sstate-cache, explicitly set the mode
> passed to mkdir to 0775 so that the directories are group writable, as
> otherwise they cannot be shared with other users.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/sstate.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 66a96a7603..a8ae75101d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -787,7 +787,7 @@ sstate_create_package () {
>  		return
>  	fi
>  
> -	mkdir -p `dirname ${SSTATE_PKG}`
> +	mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`
>  	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>  
>  	# Use pigz if available
> 
> 
> 
> 
> 
