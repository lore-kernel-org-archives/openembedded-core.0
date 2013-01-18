Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1TwBTi-0003py-Gi
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:55:58 +0100
Received: from amavisd-new (mailscanner6.mer-nm.internl.net [217.149.192.58])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 1208B3F49B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 13:40:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mailrelay1.nijmegen.internl.net
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner6.mer-nm.internl.net [217.149.192.159])
	(amavisd-new, port 10024) with ESMTP id LuVbczw8U01g
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 13:40:03 +0100 (CET)
Received: from TOP-EX02.topic.local (82-204-13-181.dsl.bbeyond.nl
	[82.204.13.181]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 13:40:03 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (192.168.10.102) by mail.topic.nl
	(192.168.1.103) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Fri, 18 Jan 2013 13:39:55 +0100
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.289.1;
	Fri, 18 Jan 2013 13:40:02 +0100
Message-ID: <50F942A2.7090105@topic.nl>
Date: Fri, 18 Jan 2013 13:40:02 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <3116730.Gs6kyeAI7b@yiqingliang-pc> <50F92396.403@topic.nl>
	<50F92BCC.5020006@topic.nl>
In-Reply-To: <50F92BCC.5020006@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: OpenMP and OE-core (or: Why is OpenMP explicitly disabled?)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 12:56:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 01/18/2013 12:02 PM, Mike Looijmans wrote:
> On 01/18/2013 11:27 AM, Mike Looijmans wrote:
>> Hello,
>>
>> When trying to use OpenMP in an embedded ARM project, I found that=20
>> oe-core explicitly tells GCC to NOT include the OpenMP support.
>>
>> Is there a particular reason why this was done?
>>
>> As an experiment, I just removed the "--disable-libgomp" OECONF=20
>> additions from the GCC recipes, and added libgomp unconditionally=20
>> (why is that only included for powerpc?).
>>
>> Since multicore systems are getting more and more common even in=20
>> embedded systems, I guess I shouldn't be the only one who bumped into=20
>> this.
>
> I tested with simply compiling like that, and adding a=20
> "ac_cv_prog_c_openmp=3D-fopenmp" to the OECONF options because otherwise=
=20
> autotools tries to run an ARM binary on the build machine. The=20
> resulting image rusn fine, and my program get double the performance.

The logical thing to do seems to me:

- Enable openmp for all platforms. This should be unconditionally, if=20
you're building for multiple targets, some may have multiple cores and=20
some don't, but they will share the compiler. The option will make the=20
compiler bigger, but will not have any effect on the produced binaries=20
(except when they ask for it). I have a GIT patch that does just that.

- Add some switch (is MACHINE_FEATURE a good place for that?) to enable=20
openmp options. This should conditionally add=20
"ac_cv_prog_c_openmp=3D-fopenmp" or "ac_cv_prog_c_openmp=3Dunsupported" to=
=20
the autotools options. Looks like it should go into the "site" files,=20
but I don't have a clue as to how that can be accomplished conditionally.




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


