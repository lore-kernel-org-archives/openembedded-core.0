Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E58EC767FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 06:14:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7A6Emnq011644
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Aug 2015 23:14:48 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 9 Aug 2015 23:14:48 -0700
Message-ID: <55C84156.8090609@windriver.com>
Date: Mon, 10 Aug 2015 14:14:46 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1438155256-3385-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LY_8MGszbQYJziM+bj4GUV+qmQgnzSTOHb4XG0+1GVb8A@mail.gmail.com>
	<55B9D4E3.1010305@windriver.com>
	<4FCE2229-1F6C-42A3-B74A-9906A61A64AE@gmail.com>
In-Reply-To: <4FCE2229-1F6C-42A3-B74A-9906A61A64AE@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bjam-native: inhibit sysroot strip
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
X-List-Received-Date: Mon, 10 Aug 2015 06:14:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 08/09/2015 07:52 AM, Khem Raj wrote:
>
>> On Jul 30, 2015, at 12:40 AM, wenzong fan <wenzong.fan@windriver.com> wrote:
>>
>> On 07/29/2015 06:19 PM, Burton, Ross wrote:
>>>
>>> On 29 July 2015 at 08:34, <wenzong.fan@windriver.com
>>> <mailto:wenzong.fan@windriver.com>> wrote:
>>>
>>>     +# bjam is already stripped, don't strip it again
>>>     +INHIBIT_SYSROOT_STRIP = "1"
>>>
>>>
>>> In case it's even needed to debug bjam-native, how hard would it be to
>>> stop bjam from being stripped in the first place?
>>
>> By default, a release version is stripped, we could build & install the debug version for bjam.
>>
>> For specific changes, we only need to append "--debug" to build.sh, then update do_install() to select the unstripped version.
>>
>> Do you think this is the right ways?
>
>
> export INSTALL=“install” or something like that might do it. usually folks use install -s by default during install step which cause such issues.

The bjam is stripped while compiling via gcc options '-s'. There are 
three build types defined in build.jam:

...
     [ opt --release : [ opt --symbols : -g : -s ] -O3 ]
     [ opt --debug : -g -O0 -fno-inline ]
     [ opt --profile : -O3 -g -pg ]
...

Build & install "debug" version would provide unstripped bjam for 
further stripping. I have sent V2 patch:

[OE-core] [PATCH v2] bjam-native: build and install bjam.debug

Thanks
Wenzong

>
>> Thanks
>> Wenzong
>>
>>>
>>> Ross
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

