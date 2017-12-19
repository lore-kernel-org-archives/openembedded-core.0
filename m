Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D7DA860721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 20:54:39 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 143so9508874qki.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 12:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TVFRIHGIMr4Yd2I8GFlXKesI1RtQbAV+P6RMGmxBsdQ=;
	b=tkY3hfLDDzATLBaGTQTd83hsr1c43b8mQKnb9ipBb5kdQfcBQ/kc+/Dffv3Wy+hMC+
	su7DIlqo2Fnl29KQhJiJXPHf/I3V+C4Gq9G+57+78u+xpl8CZRcJN5HQSkqev+gnFxUN
	XOgS7VEmurXrhYgMQo1pKJZdGJWnib/R9kuOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TVFRIHGIMr4Yd2I8GFlXKesI1RtQbAV+P6RMGmxBsdQ=;
	b=j2tiDKxz3S945Aid6Ddat+jBlOzE9VNTyqIqeGlNYUq7iCufl2Y3fS9ojWvaz2d+jd
	an+QI63wJdsPwRoTPAZcjC3Q/GxmTK+c/tNvchz9e92pbNls/WV1b0EiaGm74VOHN/QR
	JbKicAsYplBjG3+PinYkByFT7bXmsWXWEJaIQ9kYx4anWTDSu8pVjAJFBa9r3WZi5TBX
	gz/qVefhv2U5vWdVqzGhQapvpKxWLt2MyuFit7iJp0K2yMbTgbOwtsC0wd3DTboUZ2u5
	hS75yk3kdK6G7u8L1RUnKAv1xjL3grfOKwSCMZjUjey4ez5nyMp+6k3QhIeH9gZxgLUW
	JbDg==
X-Gm-Message-State: AKGB3mL3ccvXzN4U21nT0eNqdYogE5OqxZJSZRUdk2yacqqU+pGBNIIW
	FUZEZKLNHUii3U1gYPusTFqLKg==
X-Google-Smtp-Source: ACJfBosQ5/+AXzrSxEHfkEtKmjqs094SbWe4HwDJW+vPWKaP2w30awl0/N/owC/OqZVnm6DuVgjx6w==
X-Received: by 10.55.103.20 with SMTP id b20mr4245877qkc.224.1513716880828;
	Tue, 19 Dec 2017 12:54:40 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	n64sm10099214qkd.97.2017.12.19.12.54.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Dec 2017 12:54:40 -0800 (PST)
Date: Tue, 19 Dec 2017 15:54:38 -0500
From: Tom Rini <trini@konsulko.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20171219205438.GN14220@bill-the-cat>
References: <20171219201148.19828-1-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171219201148.19828-1-sgw@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: preserve rootfs if mkext234fs() fails
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
X-List-Received-Date: Tue, 19 Dec 2017 20:54:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 19, 2017 at 12:11:48PM -0800, Saul Wold wrote:
> We have seen more failures, but have not been able to directly reproduce
> it maybe svaing the rootfs and it contains some content that is tripping
> up the e2fsprogs mkfs.ext4 populate_rootfs() function
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 9188bed4197..6b4f39ed274 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -86,9 +86,14 @@ oe_mkext234fs () {
>  	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
>  	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
>  	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
> -	bbdebug 1 "Actual Partion size: `ls -s ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
> +	bbdebug 1 "Actual Partion size: `ls -l ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
>  	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}"
>  	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
> +	if [ $? -ne 0 ]; then
> +		tmp_saved_rootfs=`mktemp -d -p /tmp saved_rootfs.XXXXX`
> +		cp -r ${IMAGE_ROOTFS} $tmp_saved_rootfs
> +	fi

Wouldn't it be better to just fail on error here, rather than dump stuff
to /tmp ?

-- 
Tom

