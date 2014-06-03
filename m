Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 703BE60E23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 06:57:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s536vaCW023938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 23:57:38 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 2 Jun 2014 23:57:36 -0700
Message-ID: <538D7214.6060805@windriver.com>
Date: Tue, 3 Jun 2014 14:58:28 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>	<1391435033.14769.5.camel@phil-desktop.brightsign>
	<52EFA146.5010405@gmail.com>
In-Reply-To: <52EFA146.5010405@gmail.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [RFC][PATCH] udev: add udev-utils to RDEPENDS
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
X-List-Received-Date: Tue, 03 Jun 2014 06:57:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 02/03/2014 10:01 PM, David Nyström wrote:
> On mån  3 feb 2014 14:43:53, Phil Blundell wrote:
>> On Mon, 2014-02-03 at 13:58 +0100, David Nyström wrote:
>>> An intended fix for below error message with core-image-lsb,
>>> Sending this as an RFC since I dont really know what constitutes
>>> a RRECOMMENDS vs. RDEPENDS.
>>> Is this clearly defined somewhere ?
>>> Below should be an RDEPENDS, no ?
>>>
>>> INIT: version 2.88 booting
>>> Starting udev
>>> udevd[59]: starting version 182
>>> /etc/rcS.d/S04udev: line 108: udevadm: command not found
>>> /etc/rcS.d/S04udev: line 113: udevadm: command not found
>>> /etc/rcS.d/S04udev: line 114: udevadm: command not found
>>
>> That depends (ha ha) on what the udevadm call in question is actually
>> doing.  If udev is so badly broken without it as to be unusable then
>> yes, it should be an RDEPENDS.  If udev will still work without then
>> RRECOMMENDS is appropriate and the initscript should be tweaked to deal
>> with it.
>>
>> p.
>>
>>
>
>
> SNIP
> -- 
>    udevadm control --env=STARTUP=1
>    if [ "$not_first_boot" != "" ];then
>            udevadm trigger --action=add --subsystem-nomatch=tty 
> --subsystem-nomatch=mem --subsystem-nomatch=vc 
> --subsystem-nomatch=vtconsole --subsystem-nomatch=misc 
> --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus 
> --subsystem-nomatch=graphics        --subsystem-nomatch=backlight 
> --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
>            (udevadm settle --timeout=10; udevadm control --env=STARTUP=)&
>    else
>            udevadm trigger --action=add
>            udevadm settle
>    fi
> -- 
> SNIP
>
> Does this classify as essential ?
>
> If essential, we either need to move udev-utils to RDEPENDS.
> If not essential, fix the script to detect if udevadm is available.
>
> Br,
> David

Hi All,

I think it's essential.
Without 'udevadm trigger --action=add', the system start-up process may 
have some problem. I can recall that once I removed this line from the 
init scripts in my live image, the image could not boot up correctly.

I think this patch is reasonable and I'd like to acknowledge it.

Best Regards,
Chen Qi

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


