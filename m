Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 7DAB470660
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:22:44 +0000 (UTC)
Received: from amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.128])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 691C53F679
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 15:22:44 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 15:22:43 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 15:22:43 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 27 Nov 2014 15:22:57 +0100
Message-ID: <547733B2.2010501@topic.nl>
Date: Thu, 27 Nov 2014 15:22:42 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <5476E26B.80003@topic.nl> <547712F1.9090209@mlbassoc.com>
	<1417094262.15614.6.camel@linuxfoundation.org>
In-Reply-To: <1417094262.15614.6.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: Deployment for machine X will remove its results from machine Y's deploy dir
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
X-List-Received-Date: Thu, 27 Nov 2014 14:22:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/27/2014 02:17 PM, Richard Purdie wrote:
> On Thu, 2014-11-27 at 05:02 -0700, Gary Thomas wrote:
>> On 2014-11-27 01:35, Mike Looijmans wrote:
>>> Here's an example recipe to demonstrate the issue. Save it as "deployme=
.bb" into a recipe dir. Then build it for two machines. Building it for one=
 machine will remove it from the
>>> deployment directory of the other. This problem has been bugging me for=
 months, I had files just "disappear" mysteriously from the deploy director=
y and seemingly random times, and
>>> now I finally figured out what causes it.
>>>
>>> (cut here)
>>>
>>> SUMMARY =3D "Demonstrate a bug in OE deployment"
>>> DESCRIPTION =3D "Build this package for a machine X, then look at the i=
mage's \
>>>    deploy directory. You'll see a deployme.txt there. Now build it for =
another \
>>>    machine, e.g. "Y". The deployme.txt for machine X will have disappea=
red \
>>>    from the image dir. This appears to be a bug in OE's deployment."
>>> LICENSE =3D "GPLv2"
>>> LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D4d92cd373abda393=
7c2bc47fbc49d690"
>>>
>>> inherit allarch deploy
>>>
>>> do_compile () {
>>>       echo "Hello world!" > deployme.txt
>>> }
>>>
>>> do_deploy () {
>>>       install -d ${DEPLOYDIR}
>>>       install -m 644 ${B}/deployme.txt ${DEPLOYDIR}/
>>> }
>>>
>>> addtask deploy before do_build after do_compile
>>>
>>> (cut here)
>>
>> Very interesting & verified with the latest master.
>>
>> Have you filed a bug?  https://bugzilla.yoctoproject.org/
>
> Well, I'm not convinced this is a bug as such. You've created an
> "allarch" deploy task, how would you expect this to behave?
>
> "allarch" means that the output from this task is universal and can be
> used on all targets. It will therefore get run once.
>
> A "deploy" task is machine specific.
>
> What ends up happening is therefore the task has a stamp is
> "universally" created. When you change machine, the checksum of the task
> changes, the previous version is removed, the new version is installed.
>
> So in many ways the system is doing exactly what I would expect it to do
> and it isn't a bug in that sense.

It's not a bug in the sense that it doesn't do as it was programmed to do. =
I=20
understand what's happening here.

I just think that the logic here is wrong. If "deploy" is machine specific,=
=20
then the implicit "undeploy" should be machine specific too, right?

> The real question is how should an "allarch" + "deploy" task behave when
> you've specified machine specific paths? Perhaps erroring would be
> better?

That would mean that roughly all deploy tasks will fail. At best they're ti=
ed=20
to MACHINE_ARCH, but never to MACHINE itself.

Would be strange to put PACKAGE_ARCH=3D"${MACHINE}" in a recipe that clearl=
y has=20
no dependency on machine specific things. And I wrote "${MACHINE}" here on=
=20
purpose.

I was thinking along the lines of "DEPLOY_DIR_IMAGE must have the same pref=
ix"=20
or so.

If I knew the solution, I'd have posted a patch instead of a question or re=
port.

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


