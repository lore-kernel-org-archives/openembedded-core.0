Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7B49C707BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 17:16:01 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so21525150pab.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 10:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lADoYbrm8Skbype3vMSxXY+i2hCSyF2Z53rMdb2DRTM=;
	b=phnBM0Mcj87D3YdxET0G3wuq2rMNbcV602S0zxDjY50PkESB2/RextybMsBpjJWMgP
	k74I30uM7HEgppl0lx9xBXmOIxKHGw2aFg0WPUP4WDb8sBt6yyzW2kfzNHkDWBb/ZUsZ
	FRNiuiGgZPw8ovLIKXqD8uIIpM/9mKpLihf0XPKpdoaqQK15CBq+h9UIQKqeDgc+hUS6
	af6PVRO+Evu23G6l4gOQiY3u/5pz7TwNXZI2R8wSc+8LSB3CQtrt2+FryvcH2qmVa/g2
	5RnYCKTIkJODg7HllI3RZc+k7z1+A/K8/8m0yGzErCs7+eFdUUH5rBWTxYzMg4P1Rfbx
	DZjg==
X-Received: by 10.66.231.10 with SMTP id tc10mr13326227pac.121.1408986962553; 
	Mon, 25 Aug 2014 10:16:02 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id ey4sm498377pdb.79.2014.08.25.10.16.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 10:16:01 -0700 (PDT)
Date: Mon, 25 Aug 2014 10:19:45 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Fahad Usman <fahad_usman@mentor.com>
Message-ID: <20140825171945.GA25050@haswell>
References: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] logrotate: obey our flags
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
X-List-Received-Date: Mon, 25 Aug 2014 17:16:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-25 21:22:04, Fahad Usman wrote:
> Needed to quiet GNU_HASH warnings, amd some minor fixes.
> 
> Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  meta/recipes-extended/logrotate/logrotate_3.8.7.bb |   18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> index 3a6a228..42cd764 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> @@ -16,7 +16,21 @@ SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
>  SRC_URI[md5sum] = "99e08503ef24c3e2e3ff74cc5f3be213"
>  SRC_URI[sha256sum] = "f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64"
>  
> -EXTRA_OEMAKE = ""
> +# If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
> +# optimization variables, so use it rather than EXTRA_CFLAGS.
> +EXTRA_OEMAKE = "\
> +    LFS= \
> +    OS_NAME='${OS_NAME}' \
> +    \
> +    'CC=${CC}' \

hmmm CC may have spaces in it so you might need 'CC="${CC}"' or somesuch

