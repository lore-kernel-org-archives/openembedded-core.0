Return-Path: <drew.moseley@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <43f17af6-eb16-efd3-ce23-374ea6791c52@gmail.com>
Date: Mon, 15 Aug 2022 14:29:58 -0400
MIME-Version: 1.0
Subject: Re: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for dev-hwrng.device
From: "Drew Moseley" <drew.moseley@gmail.com>
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
 <20220815182503.2007534-1-drew@moseleynet.net>
In-Reply-To: <20220815182503.2007534-1-drew@moseleynet.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: raj.khem@gmail.com, ch@denx.de
Cc: dragos.panait@windriver.com, openembedded-core@lists.openembedded.org

Hi Khem,

It looks like you recently removed both the dependency on hwrng and 
systemd-udev-settle.  Do you think this change will be useful?

Claudius, any thoughts here?


Drew



On 8/15/22 2:25 PM, drew.moseley@gmail.com wrote:
> From: Drew Moseley <drew@moseleynet.net>
>
> The previous change to remove the dependency on systemd-udev-settle
> caused boot delays at least on qemu. It seems that change required
> a hwrng device but that's not necessarily available on all platforms.
>
> This changes the "Requires" to a "WantedBy" as modeled after the
> version of this file on Ubuntu 20.04.
>
> Signed-off-by: Drew Moseley <drew@moseleynet.net>
> ---
>   meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> index 0f50890dcb..b013d95932 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> @@ -3,8 +3,6 @@ Description=Hardware RNG Entropy Gatherer Daemon
>   DefaultDependencies=no
>   After=systemd-udev-settle.service
>   Before=sysinit.target shutdown.target
> -Requires=dev-hwrng.device
> -After=dev-hwrng.device
>   Conflicts=shutdown.target
>   
>   [Service]
> @@ -32,3 +30,4 @@ SystemCallFilter=@system-service
>   
>   [Install]
>   WantedBy=sysinit.target
> +WantedBy=dev-hwrng.device

-- 
mailto:drew@moseleynet.net

