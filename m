Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6D473779
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 01:55:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5G1tCac008733
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Jun 2015 18:55:12 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Jun 2015 18:55:11 -0700
Message-ID: <557F81FE.5050106@windriver.com>
Date: Tue, 16 Jun 2015 09:55:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1434013682.git.liezhi.yang@windriver.com>
	<135be24d84523a7ccfc166283a659109f238c713.1434013682.git.liezhi.yang@windriver.com>
	<CAJTo0LZgSPeeWf02swV4d7Aq_XxdywM+kogYboMuvTRUtAD66w@mail.gmail.com>
In-Reply-To: <CAJTo0LZgSPeeWf02swV4d7Aq_XxdywM+kogYboMuvTRUtAD66w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libpcap: fix PACKAGECONFIG
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
X-List-Received-Date: Tue, 16 Jun 2015 01:55:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/15/2015 07:52 PM, Burton, Ross wrote:
>
> On 11 June 2015 at 10:08, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The BLUEZ is default to bluez5, but there is only PACKAGECONFIG[bluez4],
>     no PACKAGECONFIG[bluez5], and the current version of libpcap (or the
>     higher version 1.7.3) only supports bluez4, we can't use
>     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
>     for PACKAGECONFIG any more since BLUEZ is default to bluez5, and not
>     supported, and there is no bluez4 in oe-core any more, set PACKAGECONFIG to ""
>     by default, other layers where bluez4 is available can enable it via bbappend.
>
>
> So the point of this logic is that simply removing bluez5 from DISTRO_FEATURES
> results in bluez4 being enabled where relevant, which you're removing.
>
> Would a better fix would be to have a dummy (empty) bluez5 stanza?

Hi Ross,

The code was:
PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 
'${BLUEZ}', '', d)}"
PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"

BLUEZ is default to bluez5, did you mean that we add a line like:
PACKAGECONFIG[bluez5] = ",,"
or
PACKAGECONFIG[bluez5] = ",--disable-bluetooth,"

But we didn't need such a line, since when PACKAGECONFIG != bluez4, the
--disable-bluetooth will be used.

Maybe we can simply drop this patch ? I made this patch to avoid confusing
the user.

// Robert

>
> Ross

