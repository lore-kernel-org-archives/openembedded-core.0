Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id CB9B86CA1D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 15:05:14 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 9EC8B3F816;
	Wed,  8 Jan 2014 16:05:15 +0100 (CET)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Wed,  8 Jan 2014 16:05:15 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Wed,  8 Jan 2014 16:05:14 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Wed, 8 Jan 2014 16:05:17 +0100
Message-ID: <52CD692A.80504@topic.nl>
Date: Wed, 8 Jan 2014 16:05:14 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <cover.1389186276.git.irina.patru@intel.com>
	<52CD5193.2060702@topic.nl> <52CD5795.8000005@balister.org>
In-Reply-To: <52CD5795.8000005@balister.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What package installs a C compiler on my target?
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
X-List-Received-Date: Wed, 08 Jan 2014 15:05:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 01/08/2014 02:50 PM, Philip Balister wrote:
> On 01/08/2014 08:24 AM, Mike Looijmans wrote:
>> Probably a silly question that has been asked a thousand times, but my
>> searches on Google only give me the answer to the wrong question (how to
>> build FOR the target, which I already know how to do).
>>
>> I want to run the C compiler on the board itself. That is, a GCC that
>> runs on the board and compiles (and links etc.) C code for that board.
>>
>> What package(s) do I need to build and install to accomplish this?
>
>  From one of my images:
>
>
> IMAGE_FEATURES +=3D "splash ssh-server-openssh tools-sdk \
> tools-debug debug-tweaks \
> dev-pkgs dbg-pkgs \
> "
> looks like tools-sdk is the one you want. dev- and dbg- packages might
> also be helpful, but will make the image larger. Especially the debug one=
s.

$ bitbake tools-sdk
ERROR: Nothing PROVIDES 'tools-sdk'

So I guess it's a package that's provided in another layer (I have oe-core =
and=20
most of meta-oe).

So far, the following set I've derived through trial and error seems to com=
e=20
close:

TARGET_COMPILER_TOOLS =3D "\
     binutils \
     binutils-symlinks \
     cpp \
     cpp-symlinks \
     g++ \
     g++-symlinks \
     gcc \
     gcc-symlinks \
     make \
     packagegroup-core-standalone-sdk-target \
"

This allows a basic "hello world" to compile on target in C and C++ code. M=
ake=20
wasn't really required, but it's very convenient to have...

I'm mostly surprised that there wasn't a packagegroup to contain this set.

It increased the image size to about 130MB, but in this particular case, th=
at=20
won't be a problem.

Anyway, thanks for the tips all. Guess this list may be useful to others...

Mike.


Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
Telefax: (+31) - (0)499 - 33.69.70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitsluit=
end bestemd voor de geadresseerde, zoals die blijkt uit het e-mail bericht =
en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaan.=
 Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, terwi=
jl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseerde=
 te ontvangen, wordt u verzocht de afzender hierover direct te informeren e=
n het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de i=
nhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, door=
 een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de event=
ueel in het e-mail bericht of de bijlagen voorkomende andere personen. TOPI=
C Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloeien=
d uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij beh=
orende bijlagen.

The contents of this message, as well as any enclosures, are addressed pers=
onally to, and thus solely intended for the addressee. They may contain inf=
ormation regarding a third party. A recipient who is neither the addressee,=
 nor empowered to receive this message on behalf of the addressee, is kindl=
y requested to immediately inform the sender of receipt, and to destroy the=
 message and the enclosures. Any use of the contents of this message and/or=
 the enclosures by any other person than the addressee or person who is emp=
owered to receive this message, is illegal towards the sender and/or the af=
orementioned third party. TOPIC Embedded Systems is not  liable for any dam=
age as a result of the use and/or acceptance of this message and as well as=
 any enclosures.

