Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 5D52E6A4AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 13:17:04 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id DB70A3F604;
	Mon, 29 Jul 2013 15:17:03 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -3.418
X-Spam-Level: 
X-Spam-Status: No, score=-3.418 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_DYNAMIC2=1, KHOP_THREADED=-1.5,
	RDNS_DYNAMIC=0.982, _DSLHELP01=-1] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon, 29 Jul 2013 15:17:03 +0200 (CEST)
Received: from TOP-EX02.topic.local (82-204-13-181.dsl.bbeyond.nl
	[82.204.13.181]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon, 29 Jul 2013 15:17:02 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (192.168.10.102) by mail.topic.nl
	(192.168.1.103) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Mon, 29 Jul 2013 15:17:01 +0200
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.289.1;
	Mon, 29 Jul 2013 15:17:01 +0200
Message-ID: <51F66B4D.3090903@topic.nl>
Date: Mon, 29 Jul 2013 15:17:01 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
	<51DD5C13.1040701@topic.nl> <2537500.7dBumEqH9t@helios>
	<20130710174516.GE3288@jama>
In-Reply-To: <20130710174516.GE3288@jama>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: sstate-cache and making a package "host-dependent"
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
X-List-Received-Date: Mon, 29 Jul 2013 13:17:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 07/10/2013 07:45 PM, Martin Jansa wrote:
> On Wed, Jul 10, 2013 at 06:39:20PM +0100, Paul Eggleton wrote:
>> Hi Mike,
>>
>> On Wednesday 10 July 2013 15:05:23 Mike Looijmans wrote:
>>> I added a buildserver that also exports its "sstate-cache" directory, s=
o
>>> that other build machines can grab their stuff from it. This works fine=
,
>>> but I have one problem. Some packages are meant to be dependent on the
>>> system that built it. I want to enforce that each build machine creates
>>> its own package, and does not grab it from the sstate-cache of the
>>> central server.
>>>
>>> For example,
>>>
>>> $ cat recipes-core/meta/distro-feed-configs.bbappend
>>> PRINC=3D"1"
>>> DISTRO_HOST_NAME ?=3D "${@os.uname()[1]}"
>>> DISTRO_FEED_NAME ?=3D "feed"
>>> DISTRO_FEED_PREFIX =3D "topic"
>>> DISTRO_FEED_URI =3D
>>> "http://${DISTRO_HOST_NAME}/${DISTRO_FEED_NAME}/${MACHINE}"
>>>
>>>
>>> The purpose being that the host name of the machien that built the imag=
e
>>> ends up in the opkg config files. This works just fine.
>>> Now that we have a central server, all images on all build hosts grab
>>> the package from the sstate-cache server, resulting in the feed pointin=
g
>>> to the central server instead of the private one, which is not what I
>>> wanted to happen.
>>>
>>> After reading the documentation, I added the following line to the reci=
pe:
>>>
>>> PACKAGE_ARCHS[vardeps] =3D "DISTRO_FEED_URI"
>>>
>>> This did not have the desired effect. The package is still retrieved
>>> from the cache, and not rebuilt locally. Even if I clean and force a
>>> rebuild of the distro-feed-configs package, the package that ends up in
>>> the image is still the one from the central server.
>>>
>>> What am I missing here?
>>
>> I think distro-feed-configs (from meta-oe, not OE-Core) is for package
>> installation on the target, and has nothing to do with shared state.
>>
>> I'm not sure if it's entirely appropriate, but you could take a similar
>> approach to the one we use for preventing native sstate packages from mi=
xing
>> across different distributions (mostly to sidestep host glibc version
>> dependency problems) - set SSTATE_EXTRAPATH to some value for the recipe=
s you
>> don't want to share and then the packages will go into a subdirectory na=
med
>> with that value; you could then delete these automatically from the serv=
er.
>
> I would try to add
> DISTRO_HOST_NAME[vardepvalue] =3D "${DISTRO_HOST_NAME}"
>
> that way each builder should create own sstate archive.

I forgot to give my final feedback on this, it would be impolite to ask=20
for advise and don't report back on whether it was useful, so here goes:

I've been using that setting for a while now and it does exactly what I=20
wanted it to do. Every build machine creates its own feed configuration,=20
while the big buildserver creates about everything else. The shared=20
state cache is a big time saver for us.

Thanks!

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

