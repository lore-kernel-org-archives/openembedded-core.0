Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id C97B571467
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:47:26 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 41D013F616;
	Mon, 15 Sep 2014 16:47:27 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -0.001
X-Spam-Level: 
X-Spam-Status: No, score=-0.001 tagged_above=-999 required=4.5
	tests=[BAYES_20=-0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon, 15 Sep 2014 16:47:26 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon, 15 Sep 2014 16:47:26 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 15 Sep 2014 16:47:39 +0200
Message-ID: <5416FBFD.9070406@topic.nl>
Date: Mon, 15 Sep 2014 16:47:25 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1410536389.14624.1.camel@ted> <5416F0A0.80000@topic.nl>
	<1410790333.14624.45.camel@ted>
In-Reply-To: <1410790333.14624.45.camel@ted>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] license: Improve disk usage
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
X-List-Received-Date: Mon, 15 Sep 2014 14:47:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 09/15/2014 04:12 PM, Richard Purdie wrote:
> On Mon, 2014-09-15 at 15:58 +0200, Mike Looijmans wrote:
>> =EF=BB=BFI can probably come up with scenarios where "os.stat(src).st_de=
v =3D=3D
>> os.stat(destdir).st_dev" but os.link will still fail.
>>
>> Less code and does not assume that when src and destdir are on the same
>> device, they can be linked:
>>
>> try:
>>     os.link(src, dst)
>> except:
>>     shutil.copyfile(src, dst)
>
> I agree that is probably easier. I'm curious which scenarios you're
> thinking of though. We do have that device comparison elsewhere in the
> codebase and I copied it mainly as it was how it was done elsewhere...
>

Simplest case is when the underlying filesystem does not support hardlinks.

I admit that chances of that being the case here will be very very small.

It's just that the try/except version will always work on any system, where=
as=20
the device comparison may fail on some setups. And given the habit of=20
programmers to copy these things from other locations, chances are that a=20
device comparison will some day be used on the "downloads" directory which =
is=20
FAT on my system.

Also, when the copy fails, the resulting message should be clearer, as the=
=20
"copyfile" call will be in the stacktrace.

Mike.


Met vriendelijke groet / kind regards,

Mike Looijmans

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


