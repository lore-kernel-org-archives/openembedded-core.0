Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9E95C719AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:36:50 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id r136so6158160vke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XszGCtMtMu6UCpIiW+V2NU+ZPskq/WHvjekmta9Kfg4=;
	b=m9XKENzuNghjhGViu7HbMzyXLDvSXjwoYAWqMgHXvuw/rq1qeo0MqP1y5kCNmPzvh/
	Iq3WsWzWKJQSm35i1jxWV18Br/CqJUR4o049Dbcq7aVEYgfezKFZs+zvWUz8ojB/b6Mq
	9KsxNXo3Jc/RJWnJ3QIdY/XNyPN66z85H8mq8iJmInMHd5pqdE6cwG/VnxVAaQqkewkA
	PF422OBU1ySV45Bysj5+3CQxUEMiddG9+a4ps+9glgyiwWWy97AQPmJWSBuhJsFIEKgb
	ZQ+YQu169KuIOkuF6APM7KfbfKVu1wqH9uoWmGGhdTfgtIKgvMZNy4+UMkxvc3HvPO2u
	CUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XszGCtMtMu6UCpIiW+V2NU+ZPskq/WHvjekmta9Kfg4=;
	b=SAy+qyYL/4wJueuDT8mahyNJoeBZisMSpDgPJxW8srcNFLS6kjYJMDb8/Rv16LpQ6D
	UDwsjxfr5cP8jv1rBRFq8jq5HzzTtJLgRuRtr1DVxrsKovUfRVHjE+PIUEYKoh+G+Tvt
	zNKTqDSkZ3AhjnBeMPZXA+r7SXOR6ccdDqVUlXurcaHfm9oPXYAuMTqMDIacGdg4oXVM
	RScFQJMiT08l1O/gN6A4z1WCyaDXVV5KoC66xsgQFmUmF7hf0RsYRX8eZugPThf7DUT2
	tnA/7jl04bGz7x/qo/cZJWTMSwd++qBrEGwlqlK/8JG2iUpNYI2t48rAE6/aWMW1BohU
	4yBA==
X-Gm-Message-State: AIkVDXJZv78/CNQJurUwd48bRI+Kh6ed8E3JL3O+R/1+zjMc5EHMhLK4s9xMODASWUNAlA5/8vKanW8pUjxYjw==
X-Received: by 10.31.161.205 with SMTP id k196mr7399762vke.12.1484919410738;
	Fri, 20 Jan 2017 05:36:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Fri, 20 Jan 2017 05:36:50 -0800 (PST)
In-Reply-To: <1484505711-6341-1-git-send-email-juro.bystricky@intel.com>
References: <1484505711-6341-1-git-send-email-juro.bystricky@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 20 Jan 2017 14:36:50 +0100
Message-ID: <CALbNGRS1L24_fJK3D14vacfRAKcxUfftR4BA8G8hxzHhuYgrFA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: require conf/multiconfig/${BB_CURRENT_MC}.conf
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
X-List-Received-Date: Fri, 20 Jan 2017 13:36:51 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 15, 2017 at 7:41 PM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> Presently there is no check to verify the existence of configuration
> files as listed in BBMULTICONFIG.
> For example, BBMULTICONFIG = "foobar" in local.conf does not trigger
> an error or even a warning when there is no conf/multiconfig/foobar.conf.
> The missing file is silently ignored.
>
> This patch changes the inclusion of all multiconfig configuration files as
> a non-optional requirement. If the file is missing, we get an error such as:
>
> ERROR: ParseError at /data/master-multi/poky/meta/conf/bitbake.conf:704: Could not include required file conf/multiconfig/foobar.conf
>
> Although the "default" configuration is not listed in BBMULTICONFIG,
> this change also requires the file multiconfig/default.conf to exist.
> The "default" (non-multiconfig) configuration is normally configured via local.conf,
> so although this file is required, it can/should be empty. This patch creates
> an empty file default.conf in meta/conf/multiconfig.
>
> [YOCTO#10917]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/conf/bitbake.conf             | 2 +-
>  meta/conf/multiconfig/default.conf | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  create mode 100644 meta/conf/multiconfig/default.conf
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 40efb95..c8516a8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -701,7 +701,7 @@ require conf/abi_version.conf
>  include conf/site.conf
>  include conf/auto.conf
>  include conf/local.conf
> -include conf/multiconfig/${BB_CURRENT_MC}.conf
> +require conf/multiconfig/${BB_CURRENT_MC}.conf
>  include conf/build/${BUILD_SYS}.conf
>  include conf/target/${TARGET_SYS}.conf
>  include conf/machine/${MACHINE}.conf
> diff --git a/meta/conf/multiconfig/default.conf b/meta/conf/multiconfig/default.conf
> new file mode 100644
> index 0000000..e69de29
> --
> 2.7.4
>
This makes multiconfig mandatory for me:

| ERROR: ParseError at
/home/superandy/oe-core/sources/openembedded-core/meta/conf/bitbake.conf:704:
Could not include required file conf/multiconfig/${BB_CURRENT_MC}.conf

What am I missing - e.g bitbake update?

Andreas

