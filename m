Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC3347858B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 14:59:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB7ExGco013731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Dec 2017 06:59:17 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 7 Dec 2017 06:59:16 -0800
To: <jackie.huang@windriver.com>, <openembedded-core@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
References: <cover.1512613370.git.jackie.huang@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5343d5cf-94cc-9e56-68d8-e5d096a1f712@windriver.com>
Date: Thu, 7 Dec 2017 08:59:15 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <cover.1512613370.git.jackie.huang@windriver.com>
Subject: [rocko] Re: [PATCH 0/1] features_backfill: fix for multilib
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
X-List-Received-Date: Thu, 07 Dec 2017 14:59:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Armin, assuming there are no concerns raised in review and this is integrated
into master, we'd like to get this backported to Rocko as well.

(I believe the patch can be applied as-is.)

Thanks!
--Mark

On 12/6/17 8:33 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Tested with:
> 
> 1) local.conf:
> MACHINE = "qemumips64"
> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
> MULTILIBS = "multilib:libn32"
> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
> require conf/multilib.conf
> 
> 2) run bitbake -e to check the features:
> 
> $ bitbake -e libn32-gobject-introspection | grep '^MACHINE_FEATURES'
> 
> (before the fix)
> MACHINE_FEATURES="alsa bluetooth usbgadget screen rtc qemu-usermode"
> MACHINE_FEATURES_BACKFILL="rtc qemu-usermode"
> MACHINE_FEATURES_BACKFILL_CONSIDERED=" qemu-usermode"
> 
> (after the fix)
> MACHINE_FEATURES="alsa bluetooth usbgadget screen rtc"
> MACHINE_FEATURES_BACKFILL="rtc qemu-usermode"
> MACHINE_FEATURES_BACKFILL_CONSIDERED=" qemu-usermode"
> MACHINE_FEATURES_ORIGINAL="alsa bluetooth usbgadget screen"
> 
> 3) world build:
> 
> $ bitbake world
> 
> builds without error.
> 
> 
> --
> The following changes since commit 4469acdf1d0338220f3fe2ecb5e079eea6fda375:
> 
>   lib/oe/utils: remove param_bool() (2017-12-02 11:25:34 +0000)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib.git jhuang0/d_backfill_multilib_171207_0
>   http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_backfill_multilib_171207_0
> 
> Jackie Huang (1):
>   features_backfill: fix for multilib
> 
>  meta/classes/multilib.bbclass | 4 ++++
>  meta/lib/oe/utils.py          | 9 +++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 


