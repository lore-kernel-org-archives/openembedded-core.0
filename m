Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2252C6E88D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 14:01:44 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z5so5228001lbh.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 06:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=d9eI+GjkJj+ReJqqnLV71KuJq6SoOW98aGOyZpdoLtA=;
	b=XwHzm09GrHaOVavFu0xL5Kuz8rHLgQUxjvWSHDZgnSN7SIKJHLX1Wg/tdc3cJVzqs1
	R6SBxD2wORCve7psKNcsg7xqpKR+M/UsrzagrejxK7M7z9N7T9gB0FW1LRlJlWvFE5PT
	TO2QQD53dxxk/nY5N2fd7z2KxEW9mh8M7e0Zem//KO21KX9qAGGbp6/EeZEEwUr5IgCy
	oMGukhutNN4HJ7uHi3pwSaRw15ypnrSI754TTLvzPC7F6YprUDbUEMpihRQ9IRkrD4Iv
	vfwjvn+5GvfPUlpuWco5tS939w7332lIwOB9vcDT51s+f3tIqxnsIpdPOQL/FBZkn19D
	RhZg==
X-Received: by 10.112.139.232 with SMTP id rb8mr1032890lbb.53.1391436105380;
	Mon, 03 Feb 2014 06:01:45 -0800 (PST)
Received: from [172.16.141.133] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id gi5sm21560885lbc.4.2014.02.03.06.01.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Feb 2014 06:01:44 -0800 (PST)
Message-ID: <52EFA146.5010405@gmail.com>
Date: Mon, 03 Feb 2014 15:01:42 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>
	<1391435033.14769.5.camel@phil-desktop.brightsign>
In-Reply-To: <1391435033.14769.5.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 03 Feb 2014 14:01:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On mån  3 feb 2014 14:43:53, Phil Blundell wrote:
> On Mon, 2014-02-03 at 13:58 +0100, David Nyström wrote:
>> An intended fix for below error message with core-image-lsb,
>> Sending this as an RFC since I dont really know what constitutes
>> a RRECOMMENDS vs. RDEPENDS.
>> Is this clearly defined somewhere ?
>> Below should be an RDEPENDS, no ?
>>
>> INIT: version 2.88 booting
>> Starting udev
>> udevd[59]: starting version 182
>> /etc/rcS.d/S04udev: line 108: udevadm: command not found
>> /etc/rcS.d/S04udev: line 113: udevadm: command not found
>> /etc/rcS.d/S04udev: line 114: udevadm: command not found
>
> That depends (ha ha) on what the udevadm call in question is actually
> doing.  If udev is so badly broken without it as to be unusable then
> yes, it should be an RDEPENDS.  If udev will still work without then
> RRECOMMENDS is appropriate and the initscript should be tweaked to deal
> with it.
>
> p.
>
>


SNIP
--
    udevadm control --env=STARTUP=1
    if [ "$not_first_boot" != "" ];then
            udevadm trigger --action=add --subsystem-nomatch=tty 
--subsystem-nomatch=mem --subsystem-nomatch=vc 
--subsystem-nomatch=vtconsole --subsystem-nomatch=misc 
--subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  
--subsystem-nomatch=graphics        --subsystem-nomatch=backlight 
--subsystem-nomatch=video4linux  --subsystem-nomatch=platform
            (udevadm settle --timeout=10; udevadm control 
--env=STARTUP=)&
    else
            udevadm trigger --action=add
            udevadm settle
    fi
--
SNIP

Does this classify as essential ?

If essential, we either need to move udev-utils to RDEPENDS.
If not essential, fix the script to detect if udevadm is available.

Br,
David

