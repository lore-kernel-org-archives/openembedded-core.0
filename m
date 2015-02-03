Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 63E436E5D7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 06:17:56 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 3AAD23F952;
	Tue,  3 Feb 2015 07:17:56 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Tue,  3 Feb 2015 07:17:55 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Tue,  3 Feb 2015 07:17:54 +0100 (CET)
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 3 Feb 2015 07:19:17 +0100
Message-ID: <54D06811.3000803@topic.nl>
Date: Tue, 3 Feb 2015 07:17:53 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>	<1422713174-18522-2-git-send-email-mike.looijmans@topic.nl>
	<CAP9ODKrsWm4CiaYmP5UJOa_9jm9F+rRNnPTWWe_WXfLXRKrOiA@mail.gmail.com>
In-Reply-To: <CAP9ODKrsWm4CiaYmP5UJOa_9jm9F+rRNnPTWWe_WXfLXRKrOiA@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Mike Looijmans <milo-software@users.sourceforge.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] fetch2/__init__.py: Make get_srcrev output configurable
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
X-List-Received-Date: Tue, 03 Feb 2015 06:18:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 02-02-15 21:50, Otavio Salvador wrote:
> On Sat, Jan 31, 2015 at 12:06 PM, Mike Looijmans
> <mike.looijmans@topic.nl> wrote:
>> From: Mike Looijmans <milo-software@users.sourceforge.net>
>>
>> The idea here is to support package version numbering similar to gitpkgv=
 in
>> meta-openembedded. This commit is the first step towards such functional=
ity.
>>
>> The original plan was to add a "get_pretty_srcrev" method to the fetcher=
, as
>> per Richard's suggestion [1]. While writing this, I noticed that it woul=
d
>> become a copy of get_srcrev with only two lines changed. So to create so=
mething
>> more Pythonic than a boolean argument and conditionals around the calls =
to the
>> fetcher's sortable_revision, I just made the method to be called on the =
fetcher
>> an argument to the method. Defaulting to 'sortable_revision' prevents af=
fecting
>> existing code.
>>
>> Now if the git fetcher were to implement, say 'gitpkgv_revision' one cou=
ld
>> set the following in a recipe:
>>    PKGV=3D"1.2+${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"
>> and this would yield the same result as gitpkgv's GITPKGV variable.
>>
>> See for the discussion leading to this change:
>> [1] http://lists.openembedded.org/pipermail/openembedded-core/2015-Janua=
ry/100345.html
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>
> I do enjoyed all the design but the way to set the PKGV.
>
> Maybe we could have a way to do it more transparently? Any idea how?

Just setting GITPKGV=3D"${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"=20
globally (bitbake.conf for example) would basically mimic the gitpkgv synta=
x,=20
then a recipe would just say:

PKGV=3D"1.2+${GITPKGV}"

Without the need to inherit gitpkgv.

Mike.


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

Visit us at Embedded World 2015 Nuernberg, 24.02.2015 till 26.02.2015, Hall=
 1, stand number 136.
https://www.embedded-world.de/de/ausstellerprodukte/?focus=3Dedb3exhibitor&=
focus2=3D14017667&focus3=3Dembwld15&highlight=3Dtopic


