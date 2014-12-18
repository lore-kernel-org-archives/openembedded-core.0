Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 48FA872809
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 13:55:00 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 5E7073F5B2;
	Thu, 18 Dec 2014 14:54:59 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Thu, 18 Dec 2014 14:54:59 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Thu, 18 Dec 2014 14:54:58 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 18 Dec 2014 14:55:12 +0100
Message-ID: <5492DCB1.4000609@topic.nl>
Date: Thu, 18 Dec 2014 14:54:57 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
	<CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>
	<549272C4.8060001@topic.nl>
	<CAJTo0LYk9szY3r5FxMHLF+MF-G41rAqg1vimhWXzqdo3+kqa2w@mail.gmail.com>
In-Reply-To: <CAJTo0LYk9szY3r5FxMHLF+MF-G41rAqg1vimhWXzqdo3+kqa2w@mail.gmail.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 18 Dec 2014 13:55:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 12/18/2014 02:30 PM, Burton, Ross wrote:
>
> On 18 December 2014 at 06:23, Mike Looijmans <mike.looijmans@topic.nl
> <mailto:mike.looijmans@topic.nl>> wrote:
>
>     Putting the script into its own package is no problem, but how does o=
ne
>     arrange this with mdev.conf?
>
>
> That's a fairly good argument for keeping it in the same package, and we =
can
> expect that users of mdev will be providing their own configuration file =
anyway.

Indeed. I was just implementing the split up, but it looks weird. You end u=
p=20
with a package "busybox-mdev" that contains nothing but an initscript and a=
=20
config file (because the actual "mdev" binary is supplied by busybox), whic=
h=20
refers to scripts that don't exist, and then an extra busybox-mdev-extracon=
f=20
that supplies these scripts, but doesn't actually contain any configuration=
=20
files in spite of its name. And then I had to find a way to get this packag=
e=20
installed by default, which also isn't trivial.

So can we keep it al in busybox-mdev? It's a tiny config package anyway, an=
d=20
when providing private configs (which should rarely be needed now), it's ea=
sy=20
enough to replace these in a bbappend.

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


