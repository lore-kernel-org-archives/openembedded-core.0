Return-Path: <ulf@emagii.com>
Received: from smtprelay-h21.telenor.se (smtprelay-h21.telenor.se
	[195.54.99.196])
	by mail.openembedded.org (Postfix) with ESMTP id E02AD6CFF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 23:28:06 +0000 (UTC)
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 95382C06A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 01:28:08 +0200 (CEST)
X-SENDER-IP: [83.227.59.84]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuEXANa3ZVJT4ztUPGdsb2JhbAANTIM/g366R0uBRgMBAQEBOIJaAQEBAQIBAQEBIBU2CgEQCxgCAgUWCwICCQMCAQIBFQEbFAYNAQUCAQGHfAsIpxd1kkyBKY4yB4JqgT8DlCqBEoJNgS+JE4pr
X-IronPort-AV: E=Sophos;i="4.93,543,1378850400"; d="scan'208";a="417781347"
Received: from c-543be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.59.84])
	by ipb3.telenor.se with ESMTP; 22 Oct 2013 01:28:08 +0200
Message-ID: <5265B887.2060505@emagii.com>
Date: Tue, 22 Oct 2013 01:28:07 +0200
From: Ulf Samuelsson <ulf@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <526556B1.2010908@emagii.com>
	<CAMKF1sqtist2BpszV5AYEids7kYnWxxfu=becBYiAUaQs=PBpg@mail.gmail.com>
In-Reply-To: <CAMKF1sqtist2BpszV5AYEids7kYnWxxfu=becBYiAUaQs=PBpg@mail.gmail.com>
Cc: Discussion of the angstrom distribution development
	<Angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using the correct "xserver-xf86-config_0.1.bbappend
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ulf@emagii.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2013 23:28:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-10-21 22:21, Khem Raj wrote:
> Ulf
>
> On Mon, Oct 21, 2013 at 9:30 AM, Ulf Samuelsson
> <openembedded-core@emagii.com> wrote:
>> Trying to build a systemd-gnome-image raspberrypi under Angstrom, with a few
>> extra layers.
>>
>> This fails on "xserver-xf86-config_0.1.[bb|bbappend]"
>>
>> The extra layer has BBPRIORITY = 20.
>> meta-beagleboard has BBPRIORITY = 8
>> meta-raspberrypi has BBPRIORITY = 6 (later changed to 120)
>>
>> BBLAYERS are in the order meta-<extra layer> meta-beagleboard
>> meta-raspberrypi
>>
>> It looks like bitbake will select the bbappend in the layer with the highest
>> priority,
> Not really. All bbappends are selected the order or sequence of them
> is governed by how the layers line up in BBPATH
Hm, it seemed to work if I increased the BBPRIORITY.

Either method seems to be problematic.

If you build for a certain machine, then you want to define which 
bbappend to use
regardless of BBPATH or BBPRIORITY.

Maybe bitbake needs to know which meta-layer contains the <machine>.conf,
and always select a bbappend in that layer, over bbappends in other layers.

Otherwise you have to edit bblayer.conf every time you want to switch to 
a new machine,
which I think is undesirable.




>> even if that contains a COMPATIBLE_MACHINE clause, which does not
>> include the current MACHINE.
>>
>> Is there any way to make bitbake select the correct bbappend file without
>> modifying the BBPRIORITY?
>>
>> --------------------------------------------------------------------------------------------
>> Looks like the xserver-xf86-config for the raspberry-pi fails on
>>
>> SRC_URI_append_raspberrypi = " file://xorg.conf.d/*"
>>
>> When I change to:
>>
>> SRC_URI_append_raspberrypi = " file://xorg.conf.d/10-evdev.conf "
>>
>> the raspberry pi version completes.
>>
>> Wildcards are not allowed?
> This is a question of fundamental bitbake semantics/syntax for SRC_URI
> and nothing to do with bbappends. and I dont think wildcards in
> SRC_URI are reliable, so better be explicit about them.

Yes, since this problem occured at the same time,
I thought that I'd mention it as well.
Basically the any image build for raspberry pi involving X is broken then.
/Ulf


>
>> --
>> Best Regards
>> Ulf Samuelsson
>> eMagii
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


-- 
Best Regards
Ulf Samuelsson
ulf@emagii.com
+46 722 427437


