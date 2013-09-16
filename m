Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA9E660F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:47:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8GFlQ7e013415
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:47:26 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 16 Sep 2013 08:47:26 -0700
Message-ID: <52372815.50200@windriver.com>
Date: Mon, 16 Sep 2013 10:47:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1379071094.3484.245.camel@ted>
In-Reply-To: <1379071094.3484.245.camel@ted>
Subject: Re: [PATCH] linux-libc-headers: Add big warning about antisocial behaviour
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
X-List-Received-Date: Mon, 16 Sep 2013 15:47:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/13 6:18 AM, Richard Purdie wrote:
> I'm getting concerned with the number of people forking this recipe
> and not understanding what they're doing. I'm therefore proposing
> adding in a suitable warning to people thinking of copying it.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index 96fe2ff..79b7dc4 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -2,6 +2,28 @@ DESCRIPTION = "Sanitized set of kernel headers for the C library's use."
>   SECTION = "devel"
>   LICENSE = "GPLv2"
>
> +#########################################################################
> +####                        PLEASE READ
> +#########################################################################
> +#
> +# You're probably looking here thinking you need to create some new copy
> +# of linux-libc-headers since you have your own custom kernel. To put
> +# this simply, you DO NOT.
> +#
> +# Why? These headers are used to build the libc. If you customise the
> +# headers you are customising the libc and the libc becomes machine
> +# specific. Most people do not add custom libc extensions to the kernel
> +# and have a machine specific libc.
> +#
> +# But you have some kernel headers you need for some driver? That is fine
> +# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
> +# This will make the package using them machine specific but this is much
> +# better than having a maching specific C library. This does mean your

Typo in the above, "maching" should be "machine"...

> +# recipe needs a DEPENDS += "virtual/kernel" but again, that is fine and
> +# makes total sense.
> +#
> +# -- RP
> +

I am completely in favor of this.  People don't get that custom kernel headers 
have severe ramifications in projects.  I've had to explain this to hundreds 
over the last few years (and they keep doing it anyway)..

Acked-by: Mark Hatle  (with change mentioned above)

--Mark

>   LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>
>   python __anonymous () {
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


