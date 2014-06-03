Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 62B9665EB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 05:25:12 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id C63C53F918
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 07:25:11 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 07:25:09 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 07:25:09 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Tue, 3 Jun 2014 07:25:13 +0200
Message-ID: <538D5C34.4060905@topic.nl>
Date: Tue, 3 Jun 2014 07:25:08 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <53843793.3030309@topic.nl>	<CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>	<CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>
	<1401318733.2607.71.camel@ted>
In-Reply-To: <1401318733.2607.71.camel@ted>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
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
X-List-Received-Date: Tue, 03 Jun 2014 05:25:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 05/29/2014 01:12 AM, Richard Purdie wrote:
> On Wed, 2014-05-28 at 13:46 -0700, Christopher Larson wrote:
>>
>> On Wed, May 28, 2014 at 1:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>          On Mon, May 26, 2014 at 11:58 PM, Mike Looijmans
>>          <mike.looijmans@topic.nl> wrote:
>>          > I have a deja-vu feeling about this question.
>>          >
>>          > I have this recipe:
>>          >
>>          >
>>          https://github.com/topic-embedded-products/meta-topic/blob/mast=
er/recipes-bsp/fpga/fpga-image-miami.bb
>>          >
>>          > Which includes this one:
>>          >
>>          https://github.com/topic-embedded-products/meta-topic/blob/mast=
er/recipes-bsp/fpga/fpga-image.inc
>>          >
>>          > I have a build server that exports its sstate-cache
>>          directory through HTTP,
>>          > and a local host that attempts to use that sstate-cache.
>>          This works fine,
>>          > except for the recipe above. Building this recipe takes
>>          about 1 hour, so i
>>          > really really really want to share that state at any cost.
>>          As you can see,
>>          > I've done a big shotgun blast of "vardepdsexclude" to get
>>          the recipe to be
>>          > as common as possible. Still any host wants to build its own
>>          version.
>>          >
>>          > How can I diagnose the REASON that my machine thinks it
>>          isn't building the
>>          > exact same thing as the build server?
>>
>>
>>          see https://wiki.yoctoproject.org/wiki/Enable_sstate_cache
>>          towards the end it talks about verifying sstate sigs
>>
>>
>> If the sstate is local at least, you can use bitbake -S printdiff
>> <target>. There's also bitbake-whatchanged, but the bitbake one is
>> superior.

It's on two different machines, so I think that does not qualify as "local"=
.

> Worst case, you can pull the siginfo files from one build and the
> siginfo files from the sstate mirror and then see which ones are
> different, then run bitbake-diffsigs X Y to compare the two files.

How do I find what to pull? I have (ssh) access to both machines. The=20
sstate-cache dir contains a bunch of two-digit directories and a gazillion =
files.

I could just copy the whole thing to one machine, there's gigabit between=20
them, but then what do I do with these files?


>
> bitbake -S just tries to automate that process if it can.
>

bitbake -S usually crashes here.



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


