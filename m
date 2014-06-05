Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B25726FC29
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 23:47:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Jun 2014 16:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,984,1392192000"; d="scan'208";a="523459678"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO [10.255.12.167])
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2014 16:47:34 -0700
Message-ID: <53910196.8080401@linux.intel.com>
Date: Thu, 05 Jun 2014 16:47:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>, 
	"Chen, Qi" <Qi.Chen@windriver.com>
References: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>	<1391435033.14769.5.camel@phil-desktop.brightsign>	<52EFA146.5010405@gmail.com>
	<538D7214.6060805@windriver.com>
In-Reply-To: <538D7214.6060805@windriver.com>
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
X-List-Received-Date: Thu, 05 Jun 2014 23:47:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/02/2014 11:58 PM, ChenQi wrote:
> On 02/03/2014 10:01 PM, David Nyström wrote:
>> On mån  3 feb 2014 14:43:53, Phil Blundell wrote:
>>> On Mon, 2014-02-03 at 13:58 +0100, David Nyström wrote:
>>>> An intended fix for below error message with core-image-lsb,
>>>> Sending this as an RFC since I dont really know what constitutes
>>>> a RRECOMMENDS vs. RDEPENDS.
>>>> Is this clearly defined somewhere ?
>>>> Below should be an RDEPENDS, no ?
>>>>
>>>> INIT: version 2.88 booting
>>>> Starting udev
>>>> udevd[59]: starting version 182
>>>> /etc/rcS.d/S04udev: line 108: udevadm: command not found
>>>> /etc/rcS.d/S04udev: line 113: udevadm: command not found
>>>> /etc/rcS.d/S04udev: line 114: udevadm: command not found
>>>
>>> That depends (ha ha) on what the udevadm call in question is actually
>>> doing.  If udev is so badly broken without it as to be unusable then
>>> yes, it should be an RDEPENDS.  If udev will still work without then
>>> RRECOMMENDS is appropriate and the initscript should be tweaked to deal
>>> with it.
>>>
>>> p.
>>>
>>>
>>
>>
>> SNIP
>> --
>>    udevadm control --env=STARTUP=1
>>    if [ "$not_first_boot" != "" ];then
>>            udevadm trigger --action=add --subsystem-nomatch=tty
>> --subsystem-nomatch=mem --subsystem-nomatch=vc
>> --subsystem-nomatch=vtconsole --subsystem-nomatch=misc
>> --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus
>> --subsystem-nomatch=graphics        --subsystem-nomatch=backlight
>> --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
>>            (udevadm settle --timeout=10; udevadm control --env=STARTUP=)&
>>    else
>>            udevadm trigger --action=add
>>            udevadm settle
>>    fi
>> --
>> SNIP
>>
>> Does this classify as essential ?
>>
>> If essential, we either need to move udev-utils to RDEPENDS.
>> If not essential, fix the script to detect if udevadm is available.
>>
>> Br,
>> David
>
> Hi All,
>
> I think it's essential.
> Without 'udevadm trigger --action=add', the system start-up process may
> have some problem. I can recall that once I removed this line from the
> init scripts in my live image, the image could not boot up correctly.
>
> I think this patch is reasonable and I'd like to acknowledge it.
>

If it's that essential, then we should incude udevadm in the udev 
package directly and not have a 1 file package for udev-utils at all.

v2 patch welcome

Sau!

> Best Regards,
> Chen Qi
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


