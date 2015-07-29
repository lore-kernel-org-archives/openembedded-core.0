Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F352A73D13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 01:35:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T1ZCaT028678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 18:35:12 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 18:34:55 -0700
Message-ID: <55B82DCF.4020605@windriver.com>
Date: Wed, 29 Jul 2015 09:35:11 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1438048807-23716-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LaXtgUCjzPS_6+5fEL6CDdLK1Cn_3wNvCM_EfWH_wDG2A@mail.gmail.com>
In-Reply-To: <CAJTo0LaXtgUCjzPS_6+5fEL6CDdLK1Cn_3wNvCM_EfWH_wDG2A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-mkimage: fix a building failure on OpenSus
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
X-List-Received-Date: Wed, 29 Jul 2015 01:35:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月28日 19:47, Burton, Ross wrote:
>
> On 28 July 2015 at 03:00, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     +config.mk <http://config.mk> will be included only if auto.conf is
>     newer than .config
>     +but in some system, the HPET is not enabled, the smallest unit of
>     +time is second, and can not decise which file is newer, even if
>     +the correct dependency has been created.
>     +
>     +The below shows unit of time:
>     +
>     +under SUSE Linux Enterprise Desktop 11 SP2  (i586):
>     +    $ls --full-time include/config/auto.conf .config
>     +    2015-07-27 03:46:20.000000000 -0400 .config
>     +    2015-07-27 03:46:20.000000000 -0400 include/config/auto.conf
>     +    $
>     +
>     +under Ubuntu 14.04 LTS:
>     +    $ ls --full-time include/config/auto.conf .config
>     +    2015-07-27 13:40:14.008703027 +0800 .config
>     +    2015-07-27 13:40:15.020703054 +0800 include/config/auto.conf
>     +    $
>     +
>     +The rule of including config.mk <http://config.mk> in Makefile as below
>     +    autoconf_is_current := $(if $(wildcard
>     $(KCONFIG_CONFIG)),$(shell find . \
>     +                    -path ./include/config/auto.conf -newer
>     $(KCONFIG_CONFIG)))
>     +    ifneq ($(autoconf_is_current),)
>     +    include $(srctree)/config.mk <http://config.mk>
>     +    include $(srctree)/arch/$(ARCH)/Makefile
>     +    endif
>     +
>     +The compilation will be failed if config.mk <http://config.mk> is
>     not included
>     +so delay 1 second to create auto.conf after creating of .config
>
>
> Adding a sleep seems pretty ugly, wouldn't a neater fix be to change the
> logic so that instead of the test being "is newer" you use "is not
> older", to handle identical timestamps as being current.
>

I am not sure if your suggestion works, Since "is newer" is to fix something
as the comments in Makefile said

---------------------------------------------------------------------------
# We want to include arch/$(ARCH)/config.mk only when 
include/config/auto.conf
# is up-to-date. When we switch to a different board configuration, old 
CONFIG
# macros are still remaining in include/config/auto.conf. Without the 
following
# gimmick, wrong config.mk would be included leading nasty warnings/errors.
ifneq ($(wildcard $(KCONFIG_CONFIG)),)
ifneq ($(wildcard include/config/auto.conf),)
autoconf_is_old := $(shell find . -path ./$(KCONFIG_CONFIG) -newer \
                                                 include/config/auto.conf)
ifeq ($(autoconf_is_old),)
include $(srctree)/config.mk
include $(srctree)/arch/$(ARCH)/Makefile
endif
endif
endif


-Roy


> Ross

-- 
Best Reagrds,
Roy | RongQing Li

