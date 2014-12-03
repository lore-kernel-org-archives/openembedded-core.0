Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 0A9BA601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 11:32:34 +0000 (UTC)
Received: from amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.114])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id D1EAC3F50B;
	Wed,  3 Dec 2014 12:32:33 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Wed,  3 Dec 2014 12:32:32 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Wed,  3 Dec 2014 12:32:31 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Wed, 3 Dec 2014 12:32:44 +0100
Message-ID: <547EF4CD.3030507@topic.nl>
Date: Wed, 3 Dec 2014 12:32:29 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5476E26B.80003@topic.nl> <547712F1.9090209@mlbassoc.com>	
	<1417094262.15614.6.camel@linuxfoundation.org>
	<547733B2.2010501@topic.nl>
	<1417099280.15614.11.camel@linuxfoundation.org>
In-Reply-To: <1417099280.15614.11.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 03 Dec 2014 11:32:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/27/2014 03:41 PM, Richard Purdie wrote:
> On Thu, 2014-11-27 at 15:22 +0100, Mike Looijmans wrote:
>> =EF=BB=BFOn 11/27/2014 02:17 PM, Richard Purdie wrote:
>>> On Thu, 2014-11-27 at 05:02 -0700, Gary Thomas wrote:
>>>> On 2014-11-27 01:35, Mike Looijmans wrote:
>>>>> Here's an example recipe to demonstrate the issue. Save it as "deploy=
me.bb" into a recipe dir. Then build it for two machines. Building it for o=
ne machine will remove it from the
>>>>> deployment directory of the other. This problem has been bugging me f=
or months, I had files just "disappear" mysteriously from the deploy direct=
ory and seemingly random times, and
>>>>> now I finally figured out what causes it.
>>>>>
>>>>> (cut here)
>>>>>
>>>>> SUMMARY =3D "Demonstrate a bug in OE deployment"
>>>>> DESCRIPTION =3D "Build this package for a machine X, then look at the=
 image's \
>>>>>     deploy directory. You'll see a deployme.txt there. Now build it f=
or another \
>>>>>     machine, e.g. "Y". The deployme.txt for machine X will have disap=
peared \
>>>>>     from the image dir. This appears to be a bug in OE's deployment."
>>>>> LICENSE =3D "GPLv2"
>>>>> LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3=
937c2bc47fbc49d690"
>>>>>
>>>>> inherit allarch deploy
>>>>>
>>>>> do_compile () {
>>>>>        echo "Hello world!" > deployme.txt
>>>>> }
>>>>>
>>>>> do_deploy () {
>>>>>        install -d ${DEPLOYDIR}
>>>>>        install -m 644 ${B}/deployme.txt ${DEPLOYDIR}/
>>>>> }
>>>>>
>>>>> addtask deploy before do_build after do_compile
>>>>>
>>>>> (cut here)
>>>>
>>>> Very interesting & verified with the latest master.
>>>>
>>>> Have you filed a bug?  https://bugzilla.yoctoproject.org/
>>>
>>> Well, I'm not convinced this is a bug as such. You've created an
>>> "allarch" deploy task, how would you expect this to behave?
>>>
>>> "allarch" means that the output from this task is universal and can be
>>> used on all targets. It will therefore get run once.
>>>
>>> A "deploy" task is machine specific.
>>>
>>> What ends up happening is therefore the task has a stamp is
>>> "universally" created. When you change machine, the checksum of the tas=
k
>>> changes, the previous version is removed, the new version is installed.
>>>
>>> So in many ways the system is doing exactly what I would expect it to d=
o
>>> and it isn't a bug in that sense.
>>
>> It's not a bug in the sense that it doesn't do as it was programmed to d=
o.
>
> Its doing *exactly* what the was designed to do. That doesn't match what
> you want/expect though.
>
>>   I understand what's happening here.
>>
>> I just think that the logic here is wrong. If "deploy" is machine specif=
ic,
>> then the implicit "undeploy" should be machine specific too, right?
>
> Well, its more complex than that.
>
> deploy.bbclass defaults to DEPLOY_DIR_IMAGE.
>
> DEPLOY_DIR_IMAGE defaults to ${DEPLOY_DIR}/images/${MACHINE}
>
> I actually put off merging the latter since I knew it would cause
> issues, I just couldn't articulate all of them at the time :(.
>
>>> The real question is how should an "allarch" + "deploy" task behave whe=
n
>>> you've specified machine specific paths? Perhaps erroring would be
>>> better?
>>
>> That would mean that roughly all deploy tasks will fail.
>
> I'm not sure we have many deploy+allarch tasks so I think "roughly none"
> would be a better description.
>
> deploy is usually used for bootloaders and kernels, both of which are
> not allarch.
>
>> At best they're tied
>> to MACHINE_ARCH, but never to MACHINE itself.
>
> No, they're tried to MACHINE itself, see above.
>
>> Would be strange to put PACKAGE_ARCH=3D"${MACHINE}" in a recipe that cle=
arly has
>> no dependency on machine specific things. And I wrote "${MACHINE}" here =
on
>> purpose.
>
> Dropping the "allarch" would be better than that.
>
>> I was thinking along the lines of "DEPLOY_DIR_IMAGE must have the same p=
refix"
>> or so.
>>
>> If I knew the solution, I'd have posted a patch instead of a question or=
 report.
>
> Well, allarch.bbclass could override DEPLOY_DIR_IMAGE to remove
> the /${MACHINE} suffix. That would appear to fix the issues you're
> seeing, at the risk of having a different group of people upset that you
> don't get a complete directory per machine.
>
> It comes down to which behaviour we want. Changing MACHINE in the
> definition of DEPLOY_DIR_IMAGE to PACKAGE_ARCH might be the better
> solution, then it will deploy based on how specific or not specific the
> resulting code it. That will likely upset certain people even more
> though. The other option is to accept that its machine specific and do
> PACKAGE_ARCH=3D"${MACHINE_ARCH}" in the class. That is suboptimal for the
> reasons you describe but would get the behaviour some people want.

We might be able to reduce the number of upset people drastically by doing =
the=20
deployment in two stages.

Step one is to deploy the binaries to ${DEPLOY_DIR}/${PACKAGE_ARCH} as per=
=20
your suggestion. Having pondered about this for many days now, that is=20
actually the only thing that is "right" from a technical point of view.

That will wreak havoc on all scripts that want to take the deployment resul=
ts=20
and copy them to target devices (I have quite a few of those scripts myself=
),=20
because these now suddenly need to become aware of which package is for wha=
t=20
architecture.

That can be solved in a second step: For the MACHINE, create symbolic links=
=20
from ${DEPLOY_DIR}/${MACHINE} to the files in ${DEPLOY_DIR}/${PACKAGE_ARCH}=
.=20
Most packages (at least, bootloader and kernel do), already create symlinks=
 to=20
actual targets, so I'd expect existing scripts to be able to cope with that=
=20
already. This second step is purely MACHINE specific, and only serves to he=
lp=20
gather everything that is needed for a machine deployment. This second step=
 is=20
to be rerun for each MACHINE.

This second step could even be automated, one could iterate through all=20
supported ARCH for the machine, and create a symlink for each and every fil=
e=20
found there in the ${DEPLOY_DIR}/${MACHINE} directory.


The only problem I can see with this approach is that you may end up with=20
dangling symlinks for machine B after updating and deploying a shared packa=
ge=20
for machine A, or worse, a version mismatch of the deployed target.



> An opinion from Martin/Koen might be useful at this point since it could
> affect them more than others (as well as things like the yocto project
> autobuilder output and output processing/testing/releasing).

So far, we haven't heard from them :(



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


