Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFF3673190
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 06:54:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6L6spUZ026715
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jul 2016 23:54:51 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jul 2016 23:54:50 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1468994042.git.liezhi.yang@windriver.com>
	<6dc817964ba46c0263b3b07cccf84a9917b72121.1468994042.git.liezhi.yang@windriver.com>
	<CAJTo0La07P1tsmf_trC0Gj+WQHVYwM=QiASRjBS8fFaBUjSaAA@mail.gmail.com>
	<579029B1.8030102@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <579071B9.1010705@windriver.com>
Date: Thu, 21 Jul 2016 14:54:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <579029B1.8030102@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: fix installed-vs-shipped
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
X-List-Received-Date: Thu, 21 Jul 2016 06:54:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 07/21/2016 09:47 AM, Robert Yang wrote:
>
>
> On 07/20/2016 07:59 PM, Burton, Ross wrote:
>>
>> On 20 July 2016 at 06:54, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>        /lib64/udev/rules.d/64-btrfs-dm.rules
>>
>>
>> This says that the btrfstools recipe is broken, not the packaging.  udev looks
>> in /lib no matter what $libdir is.
>>
>> udev reads UDEVLIBEXECDIR/rules.d, where udevlibexecdir=$(rootprefix)/lib/udev
>> and we pass rootprefix=$baseprefix (which defaults to /).
>
> Thanks, I was misleaded by eudev, whose udevlibexecdir is ${rootlibexecdir}
> which is ${libdir}/udev, so it is /lib64/udev. It supports /lib/udev and
> /lib64/udev as the code in eudev-3.2/src/udev/udev-rules.c shows:
>
> static const char* const rules_dirs[] = {
>          UDEV_CONF_DIR "/rules.d",
>          UDEV_RULES_DIR,
>          UDEV_ROOT_RUN "/udev/rules.d",
>          UDEV_LIBEXEC_DIR "/rules.d",
> #ifdef HAVE_SPLIT_USR
>          "/lib/udev/rules.d",
>          "/usr/lib/udev/rules.d",
> #endif
>          NULL};
>
>
> But for systemd, it hardcoded to $(rootprefix)/lib/udev.
>
> I looked into tmp/deploy/rpms, the following packages doesn't install
> to /lib/udev, but /lib64/udev or /usr/lib64/udev:
>
> tmp/deploy/rpm/core2_64/pcmciautils-018-r1.0.core2_64.rpm
> tmp/deploy/rpm/core2_64/pulseaudio-server-8.0-r0.0.core2_64.rpm
> tmp/deploy/rpm/core2_64/alsa-utils-alsactl-1.1.1-r0.0.core2_64.rpm
> tmp/deploy/rpm/core2_64/mdadm-3.4-r0.0.core2_64.rpm
> tmp/deploy/rpm/core2_64/libinput-1.3.0-r0.0.core2_64.rpm
> tmp/deploy/rpm/core2_64/bluez5-5.40-r0.0.core2_64.rpm

Hi Ross,

I just found that when build with eudev, the files will be installed
to /lib64/udev, and when build with systemd, they will be inistalled
to /lib/udev, so I think that they are OK. They use
"pkg-config --variable=udevdir udev" to find udev dir, while systemd
is /lib/udev and eudev is /lib64/eudev.

The one which has problem is libinput which installs /usr/lib/udev or
/usr/lib64/udev, this in incorrect. Another problem is that systemd
doesn't install udev.pc.

I think that the fix for btrfs-tools is correct. I will send a V2 with
another 2 fixes.

// Robert


>
> I will fix all of them.
>
> // Robert
>
>>
>> Ross

