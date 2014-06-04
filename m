Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4F26FA6A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 06:19:37 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id F1B7A4022E;
	Wed,  4 Jun 2014 08:19:36 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Wed,  4 Jun 2014 08:19:36 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Wed,  4 Jun 2014 08:19:35 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Wed, 4 Jun 2014 08:19:40 +0200
Message-ID: <538EBA77.8050900@topic.nl>
Date: Wed, 4 Jun 2014 08:19:35 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <53843793.3030309@topic.nl>	<CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>	<CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>	<1401318733.2607.71.camel@ted>
	<538D5C34.4060905@topic.nl>	<538D5E8C.1090008@topic.nl>
	<1401785145.12440.51.camel@ted>	<538DD39F.1080701@topic.nl>
	<1401804615.12440.98.camel@ted>
In-Reply-To: <1401804615.12440.98.camel@ted>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Wed, 04 Jun 2014 06:19:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 06/03/2014 04:10 PM, Richard Purdie wrote:
> On Tue, 2014-06-03 at 15:54 +0200, Mike Looijmans wrote:
>> =EF=BB=BFOn 06/03/2014 10:45 AM, Richard Purdie wrote:
>>> the next steps depend upon how clear the differences are. Basically
>>> there should be some degree of commonality between the two builds and a=
t
>>> some point there will be divergence. We need to pinpoint the point of
>>> divergence. The divergence will be in fpga-image-miami itself or in one
>>> of its dependencies.
>>
>> ALL stamps for ALL tasks for fpga-image-miami are different. There's a f=
ew
>> thousand lines in these files, with very few similarities.
>
> Ok, this gives a very strong pointer then, see below.
>
>> I'll just go for the "do_fetch" task then, since that's about the first =
to
>> execute.
>
> This is a good move.
>
>> So far, on one project (that is, NOT the fpga-image-miami) the SRC_URI i=
s
>> slightly different. The machines are on various sides of a router/firewa=
ll, so
>> SRC_URI=3D"git://${MY_SERVER}/blabla" evaluates differently.
>>
>> How can I tell the system that the value of "MY_SERVER" is irrelevant to=
 each
>> and every build step in each and every recipe?
>
> The SRC_URI changing would indeed cause the tasks build separately since
> bitbake thinks they're different things.
>
> You have two ways of addressing this. Firstly, you could setup PREMIRROR
> entries for these git urls which remaps them to the correct thing in
> each case. There would then be one "canonical" url in the recipe and
> you'd not need to change the hash generation.
>
> The other way would be to either exclude the variable from the checksum
> generation or give it a specific value. This would be something like:
>
> do_fetch[vardepsexclude] +=3D "SRC_URI"
>
> you may also have to do this with other tasks that use SRC_URI such as
> do_unpack and do_patch. The other option is:
>
> SRC_URI[vardepvalue] =3D "git://canonical/url/for/recipe"
>
> which gives it a specific value to use for checksum purposes.

In this case, a very useful syntax. The machines have different MY_SERVER=20
values in their local.conf, so I've changed one into:

MY_SERVER =3D "git://some/local/path"
MY_SERVER[vardepvalue] =3D "git://common.server/path"

This generates the same SRC_URI signatures for the locations that look=20
different but actually refer to the same location.

The PREMIRROR sounds like a generic solution to the underlying problem of=20
accessing servers from different locations. I'll keep that in mind for the=
=20
next project.

Next, I'll need to investigate why the fpga-image-miami generates different=
=20
signatures, as both machines fetch it from the same URI.

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

Visit us at MEDTEC Europe 3-5 June, Messe Stuttgart, stand number 5D20
http://medteceurope.com/index.php?page=3Dhome-en


