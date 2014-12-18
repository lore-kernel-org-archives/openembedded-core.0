Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id C69A072832
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:38:58 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 6F2723F4E4;
	Thu, 18 Dec 2014 15:38:58 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Thu, 18 Dec 2014 15:38:58 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Thu, 18 Dec 2014 15:38:57 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 18 Dec 2014 15:39:10 +0100
Message-ID: <5492E700.3050000@topic.nl>
Date: Thu, 18 Dec 2014 15:38:56 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>	<CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>	<5491FECA.3020707@mlbassoc.com>	<549274AF.8050508@topic.nl>
	<CAP9ODKrXLd9mQpJco47ddwOhZOARN3PYY9Ci6Se0XBsmTQM7Lw@mail.gmail.com>
In-Reply-To: <CAP9ODKrXLd9mQpJco47ddwOhZOARN3PYY9Ci6Se0XBsmTQM7Lw@mail.gmail.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
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
X-List-Received-Date: Thu, 18 Dec 2014 14:39:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 12/18/2014 01:55 PM, Otavio Salvador wrote:
> Hello Mike,
>
> On Thu, Dec 18, 2014 at 4:31 AM, Mike Looijmans <mike.looijmans@topic.nl>=
 wrote:
>> On 12/17/2014 11:08 PM, Gary Thomas wrote:
>>>
>>> On 2014-12-17 15:03, Burton, Ross wrote:
>>>>
>>>> Hi Mike,
>>>>
>>>> On 5 December 2014 at 09:58, Mike Looijmans <mike.looijmans@topic.nl
>>>> <mailto:mike.looijmans@topic.nl>> wrote:
>>>>
>>>>      Upon inserting a USB stick or similar device, mdev will run
>>>>      an automounter script that mounts valid partitions on
>>>>      /media/<device>. The script first checks /etc/fstab entries
>>>>      so that mounting on UUID or LABEL or using custom mount options
>>>>      is still possible. If /etc/fstab does not contain particular
>>>>      mount options, the script will create (and remove) the mountpoint
>>>>      automatically.
>>>>      The script also supports full disk partitions (devices without
>>>>      partition table).
>>>>
>>>>
>>>> Thanks for this, but can this script be put into a separate recipe to
>>>> make
>>>> it even easier for people who don't want it, or want their own version=
?
>>>> The
>>>> prior art here is the udev
>>>> automounting script which is in udev-extraconf.
> ...
>
> I didn't try but what happens in mdev if the script does not exists? I
> mean keep mdev.conf as is (ready for use) and move the script to
> another package which can be installed or not.

I just tried, removed the script and inserted a stick. It still created=20
/dev/sda and /dev/sda1 so it seems nothing really bad will happen then.

>> On the satellite settop boxes, /media is a 64k tmpfs mount. This is beca=
use
>> when a mount fails, the box may end up writing a TV recording to whereve=
r
>> /media happens to be. It that's flash or a big tmpfs, the box will commi=
t
>> suicide in mere seconds by either filling the flash or eating up the
>> precious RAM. And for some things, the box really needs a big tmpfs, so =
just
>> reducing the volatiles' sizes wasn't an option.
>
> Nice 'solution' to avoid a more serious problem :-D

Well, it got rid of tons of "check if this and that" code in the recorder c=
ode=20
which occasionally would still be fooled into recording onto flash or RAM.

>> Having said that, if this is blocking, I'll do a s./media./run/media.g o=
n
>> the file, getting this mainlined has higher priority.
>
> I prefer to have it behaving as udev as much as possible, by default.
> However, the script could source a defaults file (if it exists) to
> change the mounting point for example and allow for those special
> systems to be handle without forking.

Yeah, something like "MDEV_AUTOMOUNT_ROOT=3D/media" in /etc/default/mdev sh=
ould=20
do the trick.



Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


