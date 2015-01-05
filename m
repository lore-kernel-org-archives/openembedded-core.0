Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 169FB72011
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:36:55 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id C02B03F6AB;
	Mon,  5 Jan 2015 11:36:55 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -0.499
X-Spam-Level: 
X-Spam-Status: No, score=-0.499 tagged_above=-999 required=3.5
	tests=[BAYES_05=-0.5, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon,  5 Jan 2015 11:36:55 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon,  5 Jan 2015 11:36:54 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 5 Jan 2015 11:38:07 +0100
Message-ID: <54AA6945.7020501@topic.nl>
Date: Mon, 5 Jan 2015 11:36:53 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <54A2C3B2.9010006@topic.nl>				<20141230175915.GB18678@crash.betafive.co.uk>
	<54A44ADC.3010000@topic.nl>			 <54A65B5E.4030504@topic.nl>		
	<1420190187.25779.15.camel@linuxfoundation.org>
	<54A95A5A.70809@topic.nl>	
	<1420450079.25779.21.camel@linuxfoundation.org>
	<54AA5C4C.60201@topic.nl>
	<1420452462.25779.23.camel@linuxfoundation.org>
In-Reply-To: <1420452462.25779.23.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Bug: PR server changes the PKGV variable too
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
X-List-Received-Date: Mon, 05 Jan 2015 10:37:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 01/05/2015 11:07 AM, Richard Purdie wrote:
> On Mon, 2015-01-05 at 10:41 +0100, Mike Looijmans wrote:
>> =EF=BB=BFOn 01/05/2015 10:27 AM, Richard Purdie wrote:
>>> On Sun, 2015-01-04 at 16:20 +0100, Mike Looijmans wrote:
>>> Imagine you're not using gitpkgv. You set:
>>>
>>> PV =3D "x.y+${SRCPV}"
>>>
>>> Since SRCPV contains a revision hash, you can end up in a situation
>>> where the version changes and you cannot upgrade the package since the
>>> hash didn't 'increase'.
>>>
>>> The PR server therefore combines with the git fetcher to add an
>>> incremental number at the start of the SRCPV string and yes, in that
>>> scenario, it acts as a PV server. This is actually working as designed.
>>
>> Then the design is wrong. If a package chose to override PKGV manually, =
then
>> the rest of the system should leave that value as is, and not touch it.
>> Apparently the recipe author knows better, so please let him use that wi=
sdom.
>>
>> Also, if you change the architecture of the package, the PR server will =
reset
>> the version counter to 0 and break the upgrade path too. That was the pr=
oblem
>> that caused me to discover this problem, the PR server is making it hard=
 to
>> fix arch errors in recipes.
>
> You realise why it does that though? Imagine multiple MACHINE values
> being built against a PR server. Each MACHINE will have different
> package architecture values and different hashes. The 'PR' values should
> therefore be seen as different. If the system didn't do this, it would
> increment PR for every MACHINE change.
>
> Ok, so you say, lets make it work against MACHINE. That fails in the
> case where multiple MACHINES share a package architecture :/. Its not a
> simple problem to try and deal with :(
>
> I make no claim the system is perfect or free from bugs but these
> behaviours you're referring to are like this for various reasons. I'm
> open to changing them but we need to address the underlying problems
> like changing MACHINE above.
>
> There are several other issues with changing package architecture such
> as the sstate files in the sysroot. There is an open bug for this and
> right now, I simply don't know how to solve it properly :(.

Yeah, I stand corrected, this is not something easily fixed.

I'd still like to have a way to override the PR server. Is there a way to m=
ake=20
the PR server ignore a package, or at least, have it NOT modify the PKGV=20
variable for a package?
And if not, would you accept a patch to add that functionality to the prser=
ver=20
system?

>>> When you add in gitpkgv, something is obviously going wrong. gitpkgv is
>>> in meta-oe since I've refused to add it to core on the several occasion=
s
>>> its been requested. I've said this before but I will say is again, it
>>> *needs* become part of the standard fetcher API rather than a hacked in
>>> afterthought which doesn't integrate well.
>>
>> I already volunteered and tried to do that, but got stuck in lack of
>> understanding how the fetcher works, and did not get any help so abandon=
ed it
>> in favor of keep using gitpkgv "as is". I'm still volunteering, but with=
out
>> help I can't do it.
>
> I'm struggling since to provide the help you need, I'd nearly have to
> solve the problem myself. I've helped several different people
> understand the fetcher in the past, only to have most of them move onto
> other things :(. Add in the 101 other distractions I have and its
> frustrating for everyone including me. Can you remind me where you were
> at (links to the right emails would help)?

This is basically as far as I got:

http://lists.openembedded.org/pipermail/openembedded-core/2014-October/0981=
10.html





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


