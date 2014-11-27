Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5D072389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAREf0i1012575; Thu, 27 Nov 2014 14:41:00 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IdvhyRbU-xUC; Thu, 27 Nov 2014 14:41:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAREeiRL012572
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 27 Nov 2014 14:40:55 GMT
Message-ID: <1417099280.15614.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Thu, 27 Nov 2014 14:41:20 +0000
In-Reply-To: <547733B2.2010501@topic.nl>
References: <5476E26B.80003@topic.nl> <547712F1.9090209@mlbassoc.com>
	<1417094262.15614.6.camel@linuxfoundation.org>
	<547733B2.2010501@topic.nl>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 27 Nov 2014 14:41:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2014-11-27 at 15:22 +0100, Mike Looijmans wrote:
> ﻿On 11/27/2014 02:17 PM, Richard Purdie wrote:
> > On Thu, 2014-11-27 at 05:02 -0700, Gary Thomas wrote:
> >> On 2014-11-27 01:35, Mike Looijmans wrote:
> >>> Here's an example recipe to demonstrate the issue. Save it as "deployme.bb" into a recipe dir. Then build it for two machines. Building it for one machine will remove it from the
> >>> deployment directory of the other. This problem has been bugging me for months, I had files just "disappear" mysteriously from the deploy directory and seemingly random times, and
> >>> now I finally figured out what causes it.
> >>>
> >>> (cut here)
> >>>
> >>> SUMMARY = "Demonstrate a bug in OE deployment"
> >>> DESCRIPTION = "Build this package for a machine X, then look at the image's \
> >>>    deploy directory. You'll see a deployme.txt there. Now build it for another \
> >>>    machine, e.g. "Y". The deployme.txt for machine X will have disappeared \
> >>>    from the image dir. This appears to be a bug in OE's deployment."
> >>> LICENSE = "GPLv2"
> >>> LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
> >>>
> >>> inherit allarch deploy
> >>>
> >>> do_compile () {
> >>>       echo "Hello world!" > deployme.txt
> >>> }
> >>>
> >>> do_deploy () {
> >>>       install -d ${DEPLOYDIR}
> >>>       install -m 644 ${B}/deployme.txt ${DEPLOYDIR}/
> >>> }
> >>>
> >>> addtask deploy before do_build after do_compile
> >>>
> >>> (cut here)
> >>
> >> Very interesting & verified with the latest master.
> >>
> >> Have you filed a bug?  https://bugzilla.yoctoproject.org/
> >
> > Well, I'm not convinced this is a bug as such. You've created an
> > "allarch" deploy task, how would you expect this to behave?
> >
> > "allarch" means that the output from this task is universal and can be
> > used on all targets. It will therefore get run once.
> >
> > A "deploy" task is machine specific.
> >
> > What ends up happening is therefore the task has a stamp is
> > "universally" created. When you change machine, the checksum of the task
> > changes, the previous version is removed, the new version is installed.
> >
> > So in many ways the system is doing exactly what I would expect it to do
> > and it isn't a bug in that sense.
> 
> It's not a bug in the sense that it doesn't do as it was programmed to do.

Its doing *exactly* what the was designed to do. That doesn't match what
you want/expect though.

>  I understand what's happening here.
> 
> I just think that the logic here is wrong. If "deploy" is machine specific, 
> then the implicit "undeploy" should be machine specific too, right?

Well, its more complex than that.

deploy.bbclass defaults to DEPLOY_DIR_IMAGE.

DEPLOY_DIR_IMAGE defaults to ${DEPLOY_DIR}/images/${MACHINE} 

I actually put off merging the latter since I knew it would cause
issues, I just couldn't articulate all of them at the time :(.

> > The real question is how should an "allarch" + "deploy" task behave when
> > you've specified machine specific paths? Perhaps erroring would be
> > better?
> 
> That would mean that roughly all deploy tasks will fail.

I'm not sure we have many deploy+allarch tasks so I think "roughly none"
would be a better description.

deploy is usually used for bootloaders and kernels, both of which are
not allarch.

> At best they're tied 
> to MACHINE_ARCH, but never to MACHINE itself.

No, they're tried to MACHINE itself, see above.

> Would be strange to put PACKAGE_ARCH="${MACHINE}" in a recipe that clearly has 
> no dependency on machine specific things. And I wrote "${MACHINE}" here on 
> purpose.

Dropping the "allarch" would be better than that.

> I was thinking along the lines of "DEPLOY_DIR_IMAGE must have the same prefix" 
> or so.
> 
> If I knew the solution, I'd have posted a patch instead of a question or report.

Well, allarch.bbclass could override DEPLOY_DIR_IMAGE to remove
the /${MACHINE} suffix. That would appear to fix the issues you're
seeing, at the risk of having a different group of people upset that you
don't get a complete directory per machine.

It comes down to which behaviour we want. Changing MACHINE in the
definition of DEPLOY_DIR_IMAGE to PACKAGE_ARCH might be the better
solution, then it will deploy based on how specific or not specific the
resulting code it. That will likely upset certain people even more
though. The other option is to accept that its machine specific and do
PACKAGE_ARCH="${MACHINE_ARCH}" in the class. That is suboptimal for the
reasons you describe but would get the behaviour some people want.

I suspect there isn't a right answer here :(

An opinion from Martin/Koen might be useful at this point since it could
affect them more than others (as well as things like the yocto project
autobuilder output and output processing/testing/releasing).

Cheers,

Richard




