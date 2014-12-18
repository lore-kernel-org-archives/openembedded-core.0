Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9978F72805
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:55:41 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 9so483604ykp.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=KxEfwFO8kuXWXzIyERXsaacp6n2y2ri41KJpC2MOSrY=;
	b=hxnca3JsqVR0641cFWK/wixxaMBUUFde0rIunUBcgdlyUsc0Eie0fdcM0oHSpoQZ4F
	2jtxELPIYVCdi8f5O/YhQ35fWJNGyM7fmUo6LEL4tuuU+xJdPl4Z4WXTvVC9iElKjuQj
	9qTvRJ82L/KatDUZyTI4ReO2IbwrdWQflIDx0xPNXSani9xkOwHTR+jFGFH/IZeI3x5d
	VCca1Gbc5TrhxCyOIXL24W9xO7ti/7Uhz+xI/dvJDkHZVAbXgKOvWx3oq9pwfXbXy9/N
	/DehvRUeWqAy8DQhPLwq/QbHhPgu2eZ5B8nSh6zbG3GUWEVAAFCoeHpx4TbZ9Imd09PT
	vzIw==
MIME-Version: 1.0
X-Received: by 10.170.211.67 with SMTP id c64mr1722312ykf.110.1418907342261;
	Thu, 18 Dec 2014 04:55:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 18 Dec 2014 04:55:41 -0800 (PST)
In-Reply-To: <549274AF.8050508@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
	<CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>
	<5491FECA.3020707@mlbassoc.com> <549274AF.8050508@topic.nl>
Date: Thu, 18 Dec 2014 10:55:41 -0200
X-Google-Sender-Auth: uwkresMLCDerkHmwUEIUCCGGJdI
Message-ID: <CAP9ODKrXLd9mQpJco47ddwOhZOARN3PYY9Ci6Se0XBsmTQM7Lw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox-mdev: Support automatic mounting of block devices
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
X-List-Received-Date: Thu, 18 Dec 2014 12:55:43 -0000
Content-Type: text/plain; charset=UTF-8

Hello Mike,

On Thu, Dec 18, 2014 at 4:31 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 12/17/2014 11:08 PM, Gary Thomas wrote:
>>
>> On 2014-12-17 15:03, Burton, Ross wrote:
>>>
>>> Hi Mike,
>>>
>>> On 5 December 2014 at 09:58, Mike Looijmans <mike.looijmans@topic.nl
>>> <mailto:mike.looijmans@topic.nl>> wrote:
>>>
>>>     Upon inserting a USB stick or similar device, mdev will run
>>>     an automounter script that mounts valid partitions on
>>>     /media/<device>. The script first checks /etc/fstab entries
>>>     so that mounting on UUID or LABEL or using custom mount options
>>>     is still possible. If /etc/fstab does not contain particular
>>>     mount options, the script will create (and remove) the mountpoint
>>>     automatically.
>>>     The script also supports full disk partitions (devices without
>>>     partition table).
>>>
>>>
>>> Thanks for this, but can this script be put into a separate recipe to
>>> make
>>> it even easier for people who don't want it, or want their own version?
>>> The
>>> prior art here is the udev
>>> automounting script which is in udev-extraconf.
...

I didn't try but what happens in mdev if the script does not exists? I
mean keep mdev.conf as is (ready for use) and move the script to
another package which can be installed or not.

> On the satellite settop boxes, /media is a 64k tmpfs mount. This is because
> when a mount fails, the box may end up writing a TV recording to wherever
> /media happens to be. It that's flash or a big tmpfs, the box will commit
> suicide in mere seconds by either filling the flash or eating up the
> precious RAM. And for some things, the box really needs a big tmpfs, so just
> reducing the volatiles' sizes wasn't an option.

Nice 'solution' to avoid a more serious problem :-D

> Having said that, if this is blocking, I'll do a s./media./run/media.g on
> the file, getting this mainlined has higher priority.

I prefer to have it behaving as udev as much as possible, by default.
However, the script could source a defaults file (if it exists) to
change the mounting point for example and allow for those special
systems to be handle without forking.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

