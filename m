Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E57E76FFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:26:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g141so3123491wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WbaxcVSk+yoxgDsnuyaFNP2byS4nMHUB8w/AN9Q21fk=;
	b=h2/b8/o2ivjUtZLTAz9VsvIpUHRwiyT/Kojxqt3LwmzEDJXzUQp73gb4e277uc6mf1
	mByVFGU7D1kDZ5XLXpiNs+ugARpKpCqqGCL+PEAbb7E7JvryY4PJzXEb4dqOayfadO9j
	LkJuC6zREcTiiN2kz8XUbCkdCF/DLQAm9pWop83gz7diGQhzgwHH/1qsq2dT/H+2rv4R
	OYbtzv7xmg56kuW0eUcY/baLDfTlHo0A8f2TM/xsDukX1jzr+Dy+OXw4QRMVUiLJyZKH
	b5aLvXLXptvbeMbioxLn9cs6co34Gqkl8PFYt8L0219sHB/+9XgTKxHZpeBHW+bclMVb
	jZ1A==
X-Gm-Message-State: AE9vXwNutKCtWKxjFw7KCc6DYcIM/sdSdZI0UHN0ihlAg7Q3S8hQ6vEDLvBACxdNdMwkGQ==
X-Received: by 10.28.144.5 with SMTP id s5mr12163522wmd.39.1473693972893;
	Mon, 12 Sep 2016 08:26:12 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t5sm18287027wjm.12.2016.09.12.08.26.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Sep 2016 08:26:11 -0700 (PDT)
Message-ID: <1473693970.22823.0.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 16:26:10 +0100
In-Reply-To: <20160905083354.27655-1-git@andred.net>
References: <20160905083354.27655-1-git@andred.net>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] image.bbclass: also mask debugfs versions of masked images
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
X-List-Received-Date: Mon, 12 Sep 2016 15:26:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

ping

On Mo, 2016-09-05 at 09:33 +0100, André Draszik wrote:
> When IMAGE_GEN_DEBUGFS is enabled, and IMAGE_FSTYPES_DEBUGFS is left
> at its default (as suggested by local.conf.sample.extended),
> recipe parsing fails:
> 
>   bitbake kern-tools-native # or anything else for that matter
>   ERROR: <poky.git>/meta/recipes-core/images/build-appliance-
> image_15.0.0.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry
> 'debugfs_vmdk' - possibly invalid type name or missing support class
>   ERROR: Failed to parse recipe: <poky.git>/meta/recipes-
> core/images/build-appliance-image_15.0.0.bb
> 
>   Summary: There was 1 WARNING message shown.
>   Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
> 
> i.e. bitbake doesn't even finish parsing...
> 
> Since IMAGE_FSTYPES_DEBUGFS is based on IMAGE_FSTYPES, and
> since the build-appliance-image is setting IMAGE_FSTYPES
> to vmdk, image.bbclass/image_types.bbclass will be trying
> to build a debugfs_vmdk, causing the error, as this is not
> implemented.
> 
> One solution to solving this problem could be as simple as
> adding a line
>   IMAGE_FSTYPES_DEBUGFS_remove = "vmdk"
> to the build-appliance-image recipe, but that is very
> specific to the error encountered and carries the risk of
> the error being reintroduced in another recipe.
> 
> Another solution could be to add 'debugfs_vmdk' to
> IMAGE_TYPES_MASKED in image-vm.bbclass, but again, this
> approach doesn't seem generic enough.
> 
> None of the live and vm type images have an implementation
> for building a debugfs version, it doesn't seem to make
> sense to build debugfs versions of any of them anyway, and
> given IMAGE_TYPES_MASKED appears to be intended for those
> image types exclusively, it seems the right approach is to
> unconditionally also mask all debugfs_ flavours from
> IMAGE_TYPES_MASKED to achieve a generic solution.
> 
> Do that so.
> 
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta/classes/image.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 8c8b8a2..07bd2d6 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -415,6 +415,7 @@ python () {
>      d.appendVarFlag('do_image', 'vardeps', ' '.join(vardeps))
>  
>      maskedtypes = (d.getVar('IMAGE_TYPES_MASKED', True) or "").split()
> +    maskedtypes = [dbg + t for t in maskedtypes for dbg in ("",
> "debugfs_")]
>  
>      for t in basetypes:
>          vardeps = set()

