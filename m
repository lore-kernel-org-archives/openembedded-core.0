Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 557ED6C794
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 07:21:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Sep 2013 00:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,913,1371106800"; d="scan'208";a="396205307"
Received: from sorvi.fi.intel.com (HELO [10.237.72.152]) ([10.237.72.152])
	by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2013 00:21:55 -0700
Message-ID: <5236B192.2050609@linux.intel.com>
Date: Mon, 16 Sep 2013 10:21:54 +0300
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Muhammad Shakeel <muhammad_shakeel@mentor.com>
References: <1379073002-19032-1-git-send-email-muhammad_shakeel@mentor.com>
	<52330B60.6000008@linux.intel.com> <52332851.4020009@mentor.com>
In-Reply-To: <52332851.4020009@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Fix EXTRA_OECONF
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
X-List-Received-Date: Mon, 16 Sep 2013 07:21:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 13.09.2013 17:59, Muhammad Shakeel wrote:
> On 09/13/2013 05:56 PM, Jukka Rissanen wrote:
>> Hi Muhammad,
>>
>>> -PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
>>> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth,
>>> bluez4"
>>> -PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
>>> +PACKAGECONFIG[wifi] = "--enable-wifi=builtin, --disable-wifi,
>>> wpa-supplicant"
>>> +PACKAGECONFIG[bluetooth] = "--enable-bluetooth=builtin,
>>> --disable-bluetooth --disable-dundee, bluez4"
>>> +PACKAGECONFIG[3g] = "--enable-ofono=builtin, --disable-ofono, ofono"
>>
>> There is no need to say builtin here as that is the default and those
>> plugins are always builtin anyways.
>>
> Hi Jukka,
> I did this change because I was trying to enable wifi, bluetooth and
> ofono through connman and I was getting this (for all these options):
> connmanctl> enable ofono
> Error ofono: Method "SetProperty" with signature "sv" on interface
> "net.connman.Technology" doesn't exist

You should have said "enable cellular". Ofono is name of the program, 
and "enable" command expect the name of the technology instead.

The connman commit 55f6589c3298b5cd36032aea98023474513c5b18 (found in 
ConnMan v1.18 or later) introduces technology name completion for the 
"enable" command. So you will see available technologies by pressing TAB 
after the "enable" command.

>
> I shared this on connman channel and what I got from there was:
> "connman plugins have not been installed. if you do --enable-bluetooth,
> bluetooth functionality is built as plugins and these plugins need to be
> installed. if you do --enable-bluetooth=builtin, the functionality is
> built into connman. if you specify nothing (as there is no reason to
> specify anything anyway), the functionality will be built into connman"
>
> and --enable-*=builtin worked for me. So either we should not mention
> anything or we have to use builtin otherwise (seems more intuitive). Do
> you think it should have worked without builtin and it was something
> else which was incorrect? has anyone else seen this error?

having --enable-bluetooth=builtin will have the same effect as 
--enable-bluetooth i.e., the builtin is optional and it is also the 
default value for bluetooth, wifi, ofono and dundee plugins (see ConnMan 
sources Makefile.plugins file and look for builtin modules).

So this part of the patch has no effect on functinality as those plugins 
are builtin already.


Cheers,
Jukka


