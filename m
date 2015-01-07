Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id E1CA3728C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 09:23:17 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 583DA3F9B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:23:16 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:23:16 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:23:15 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Wed, 7 Jan 2015 10:24:38 +0100
Message-ID: <54ACFB02.5060209@topic.nl>
Date: Wed, 7 Jan 2015 10:23:14 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1420592855-20473-1-git-send-email-liezhi.yang@windriver.com>
	<1420618033.25779.56.camel@linuxfoundation.org>
In-Reply-To: <1420618033.25779.56.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [RFC PATCH] package.bbclass: omit .pyc and .pyo file
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
X-List-Received-Date: Wed, 07 Jan 2015 09:23:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 01/07/2015 09:07 AM, Richard Purdie wrote:
> On Tue, 2015-01-06 at 17:07 -0800, Robert Yang wrote:
>> We should not ship .pyc or .pyo file, but there are a few packages
>> ship .pyc, should we:
>
> Why should we not ship them? Doesn't python create these at runtime if
> they're not present? What happens on a read only filesystem?

You definitely SHOULD ship the .pyc files. If they don't exist, the=20
interpreter is forced to re-compile the .py source, and will attempt to wri=
te=20
the result to the filesystem. It won't cause harm, it won't fail, but it's=
=20
very inefficient. It's better to let the host do the py->pyc conversion any=
way.

The opposite works just fine: You can omit the .py files and ship only .pyc=
=20
files. We do that on settopboxes that use Python for the GUI, this saves=20
several megabytes of flash space.
To accomplish that, we put the .py files into a $PN-src package.

There has been general agreement that .pyo files are utterly pointless.

> I'm sure we've had issues raised by someone with a read only filesystem
> before FWIW.
>
> I agree there is probably an issue here but deleting them may not be the
> best option. I'm open to ideas though.

My idea would be to standardize on shipping ONLY compiled files, and put th=
e=20
source .py files into a separate package named $PN-src by default. There is=
 no=20
need to install megabytes of python source files that neither users nor the=
=20
interpreter will ever read.



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


