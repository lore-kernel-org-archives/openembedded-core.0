Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 47C6C7273D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 06:31:12 +0000 (UTC)
Received: from amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.128])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id CD4133F524
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 07:31:12 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 07:31:12 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 07:31:11 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 18 Dec 2014 07:31:25 +0100
Message-ID: <549274AF.8050508@topic.nl>
Date: Thu, 18 Dec 2014 07:31:11 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>	<CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>
	<5491FECA.3020707@mlbassoc.com>
In-Reply-To: <5491FECA.3020707@mlbassoc.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
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
X-List-Received-Date: Thu, 18 Dec 2014 06:31:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 12/17/2014 11:08 PM, Gary Thomas wrote:
> On 2014-12-17 15:03, Burton, Ross wrote:
>> Hi Mike,
>>
>> On 5 December 2014 at 09:58, Mike Looijmans <mike.looijmans@topic.nl
>> <mailto:mike.looijmans@topic.nl>> wrote:
>>
>>     Upon inserting a USB stick or similar device, mdev will run
>>     an automounter script that mounts valid partitions on
>>     /media/<device>. The script first checks /etc/fstab entries
>>     so that mounting on UUID or LABEL or using custom mount options
>>     is still possible. If /etc/fstab does not contain particular
>>     mount options, the script will create (and remove) the mountpoint
>>     automatically.
>>     The script also supports full disk partitions (devices without
>>     partition table).
>>
>>
>> Thanks for this, but can this script be put into a separate recipe to ma=
ke
>> it even easier for people who don't want it, or want their own version? =
 The
>> prior art here is the udev
>> automounting script which is in udev-extraconf.
>
> Also it would be nice if the path matched the most recent
> use in udev which is /run/media/<device>

Of course, these locations need to move around every few years, otherwise=20
people would be expecting things to remain in place...

I'd rather keep using the /media symlink, as it gives distributions a chanc=
e=20
to move things around.

On the satellite settop boxes, /media is a 64k tmpfs mount. This is because=
=20
when a mount fails, the box may end up writing a TV recording to wherever=20
/media happens to be. It that's flash or a big tmpfs, the box will commit=20
suicide in mere seconds by either filling the flash or eating up the precio=
us=20
RAM. And for some things, the box really needs a big tmpfs, so just reducin=
g=20
the volatiles' sizes wasn't an option.

Having said that, if this is blocking, I'll do a s./media./run/media.g on t=
he=20
file, getting this mainlined has higher priority.

M.


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


