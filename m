Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id EAF446EA0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 16:39:30 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kp14so1973684pab.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 08:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=+MnV3RgJ9oQOk38g5p3NiYk4dNskGPkODeYkR2xL6ts=;
	b=hafCl41ZpUmrlOg8FLg8SNxuo6zMZ4qO6RGS8azl9nBeGYd4pb31Sw5h6gHvH6y+Lh
	IihyafZrjs0FfskoSKMA3UyCFq4sWxw8xeqTB8yFWwzxqZbHT+dOsKXKwq4/ibSadCxq
	hAAfhxR9UUpeG7AgK+Du7H0PmZcj0MJmSzg1z+qRi8SJ2MRqk3CmyHGVbF5zDeGaRFcv
	GJL1qV5Ge5WJoi7E46SzQnCn9NFLD1Ii0zd0tg3xTOuAIjtUVUqNt6y6o5j1l5ZiaWaC
	gdGxNmY8qbo+ebPO2NPx/46P6win5rqJipT/FYOrOxRiPRQOTlfCb5LXdD7BK9nfub9B
	HITQ==
X-Gm-Message-State: ALoCoQlkA7FaP8WXxpto//6M0/jh4LGDBjAGiDfGixmg/nwB82L640K+Jc64BXwSVg73T3dZrXGX
MIME-Version: 1.0
X-Received: by 10.69.2.2 with SMTP id bk2mr8946139pbd.75.1391013571875; Wed,
	29 Jan 2014 08:39:31 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Wed, 29 Jan 2014 08:39:31 -0800 (PST)
In-Reply-To: <1390833588.17424.254.camel@ted>
References: <1390833588.17424.254.camel@ted>
Date: Wed, 29 Jan 2014 16:39:31 +0000
X-Google-Sender-Auth: iu4Yamhck-uLYh8BNFIfx15b6Zc
Message-ID: <CAOMwXhPmMXxV=u70f+X1EAA=X_1rdZfGqxbO9ut1Jz-ye+8eFQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Wed, 29 Jan 2014 16:39:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thank you for this contribution.

As a side note, please consider the documentation bits in the future
as well. :-) I have just opened a separate ticket for that here:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5770

On Mon, Jan 27, 2014 at 2:39 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Its rather sad that people don't appear to read local.conf and then complain
> about slow builds when they're just using a single thread. Most systems have
> more than one core now so we might as well use a more automatic default
> for these values. This may lead to better experiences for new users.
>
> [YOCTO #2528]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 71856b8..36d33e1 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -18,12 +18,18 @@
>  # option determines how many tasks bitbake should run in parallel:
>  #
>  #BB_NUMBER_THREADS ?= "4"
> +#
> +# Default to setting automatically based on cpu count
> +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
>  #
>  # The second option controls how many processes make should run in parallel when
>  # running compile tasks:
>  #
>  #PARALLEL_MAKE ?= "-j 4"
>  #
> +# Default to setting automatically based on cpu count
> +PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
> +#
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
>  # be appropriate for example.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

