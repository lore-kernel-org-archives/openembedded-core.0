Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id D388B7701A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 11:59:38 +0000 (UTC)
Received: by iofh134 with SMTP id h134so7512991iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 04:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=M63iir2C1UW4COuhJpHRO517dkahtmdLF91VfkLu7VI=;
	b=T9kBiaZvDHnhHqb7434kEixA71u7sopak+cymEz4HsP0gIbgAIXmazp0vqLSI47msn
	07MUtYwXpxnLj+B4vIrT3c7n6ab6F4dyV3089DqZs0smCal7YyiSy5uFnu0LtHfWhdF5
	i09fG91yOoEtcHui8PB5r+PyaOG2b4JDxWtobIz79jVbvdoh0IiM7OHUJ3hYr6awFvZ3
	O/IjCIMx6kt98MfoyajVRl51JRIdsasRvkXFVkNclphf8b6qJZ0EjcHEVsH/Nbw9/uYy
	dy1IhAz9hSdLYI7uLdFklsIpSTIolD5kg6Sp1lu9oEV3cgeCLmrT+6TuoK7Bera/cHrZ
	oexw==
X-Gm-Message-State: ALoCoQl7lxdlgXzkk4jOpoh6ubkBiIEg5dVQ/t369wy9ntodvF4BHhYrv5RC4nE6ly78sFqvNliU
X-Received: by 10.107.19.161 with SMTP id 33mr30247655iot.62.1443527978462;
	Tue, 29 Sep 2015 04:59:38 -0700 (PDT)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
	[209.85.223.170]) by smtp.gmail.com with ESMTPSA id
	s36sm11003490ioi.21.2015.09.29.04.59.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Sep 2015 04:59:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so7512275iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 04:59:36 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.27.136 with SMTP id b130mr12702227iob.28.1443527976726; 
	Tue, 29 Sep 2015 04:59:36 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 29 Sep 2015 04:59:36 -0700 (PDT)
In-Reply-To: <1443437615.19044.275.camel@linuxfoundation.org>
References: <1443437615.19044.275.camel@linuxfoundation.org>
Date: Tue, 29 Sep 2015 08:59:36 -0300
Message-ID: <CAP9ODKoo0sFA2ET0SAXoPFWo1x1bxFCd2cXRjAX=eD2y3OuyAw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/meta: Add DISTRO_FEATURES check for gtk+/gtk3+
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
X-List-Received-Date: Tue, 29 Sep 2015 11:59:39 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 28, 2015 at 7:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If you currently do a DISTRO_FEATURES_remove = "x11" with OE-Core, you
> see failures due to dependency problems. The work in resolving this was
> partially completed a while back. This adds in the markup mainly for
> gtk/gtk3+ recipes and means "bitbake world" will work successfully.
>
> Rather than code the gtk/gtk+ specific distro features into each recipe,
> a shared variable is used.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 29b762b..b8fd039 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -47,3 +47,6 @@ DISTRO_VERSION ??= "nodistro.0"
>
>  # Missing checksums should raise an error
>  BB_STRICT_CHECKSUM = "1"
> +
> +GTKDISTROFEATURES = "directfb x11"

GTK2 please.

Also a more meanful name like:

GTK2_COMPATIBLE_DISTRO_FEATURES would be appreciated ...


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

