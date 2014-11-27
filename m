Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 39CD365CA7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 13:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sARDHKeR009414; Thu, 27 Nov 2014 13:17:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GfkiPntymBZt; Thu, 27 Nov 2014 13:17:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sARDH6Uo009400
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 27 Nov 2014 13:17:19 GMT
Message-ID: <1417094262.15614.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 27 Nov 2014 13:17:42 +0000
In-Reply-To: <547712F1.9090209@mlbassoc.com>
References: <5476E26B.80003@topic.nl> <547712F1.9090209@mlbassoc.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 27 Nov 2014 13:18:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-11-27 at 05:02 -0700, Gary Thomas wrote:
> On 2014-11-27 01:35, Mike Looijmans wrote:
> > Here's an example recipe to demonstrate the issue. Save it as "deployme.bb" into a recipe dir. Then build it for two machines. Building it for one machine will remove it from the
> > deployment directory of the other. This problem has been bugging me for months, I had files just "disappear" mysteriously from the deploy directory and seemingly random times, and
> > now I finally figured out what causes it.
> >
> > (cut here)
> >
> > SUMMARY = "Demonstrate a bug in OE deployment"
> > DESCRIPTION = "Build this package for a machine X, then look at the image's \
> >   deploy directory. You'll see a deployme.txt there. Now build it for another \
> >   machine, e.g. "Y". The deployme.txt for machine X will have disappeared \
> >   from the image dir. This appears to be a bug in OE's deployment."
> > LICENSE = "GPLv2"
> > LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
> >
> > inherit allarch deploy
> >
> > do_compile () {
> >      echo "Hello world!" > deployme.txt
> > }
> >
> > do_deploy () {
> >      install -d ${DEPLOYDIR}
> >      install -m 644 ${B}/deployme.txt ${DEPLOYDIR}/
> > }
> >
> > addtask deploy before do_build after do_compile
> >
> > (cut here)
> 
> Very interesting & verified with the latest master.
> 
> Have you filed a bug?  https://bugzilla.yoctoproject.org/

Well, I'm not convinced this is a bug as such. You've created an
"allarch" deploy task, how would you expect this to behave?

"allarch" means that the output from this task is universal and can be
used on all targets. It will therefore get run once.

A "deploy" task is machine specific.

What ends up happening is therefore the task has a stamp is
"universally" created. When you change machine, the checksum of the task
changes, the previous version is removed, the new version is installed.

So in many ways the system is doing exactly what I would expect it to do
and it isn't a bug in that sense.

The real question is how should an "allarch" + "deploy" task behave when
you've specified machine specific paths? Perhaps erroring would be
better?

Cheers,

Richard



