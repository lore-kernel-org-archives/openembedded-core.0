Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1A78773F47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 15:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4DFihMc023367; Wed, 13 May 2015 16:44:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qO0oWKYHDWlY; Wed, 13 May 2015 16:44:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4DFiS1E023364
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 May 2015 16:44:39 +0100
Message-ID: <1431531868.30971.175.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>, "Ashfield, Bruce"
	<Bruce.Ashfield@windriver.com>
Date: Wed, 13 May 2015 16:44:28 +0100
In-Reply-To: <1431513222.30971.163.camel@linuxfoundation.org>
References: <5549B621.4060008@topic.nl>
	<1430915731.8074.34.camel@linuxfoundation.org>
	<5551972F.9070202@topic.nl>
	<1431513222.30971.163.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Changing external kernel module results in rebuild of whole kernel
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
X-List-Received-Date: Wed, 13 May 2015 15:44:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-13 at 11:33 +0100, Richard Purdie wrote:
> On Tue, 2015-05-12 at 08:01 +0200, Mike Looijmans wrote:
> > As things are now, I'd much prefer the "taring up and then extracting a large 
> > (GB) sized sstate object" option, since that at least worked correctly.
> 
> Sorry for the delayed reply, I didn't understand exactly what was
> happening without looking at a build. By far the easiest "fix" right now
> is:
> 
> RM_WORK_EXCLUDE += "<my kernel recipe PN>"
> 
> This won't cost that much diskspace and should avoid the problem you're
> seeing.
> 
> The problem is module.bbclass has a DEPENDS on virtual/kernel which
> means it depends on <kernel>:do_populate_sysroot. As well as triggering
> the unpack to repopulate the shared work area for the kernel, this means
> it will cause the thing to effectively repackage.
> 
> There are various ideas coming to mind:
> 
> * We could drop virtual/kernel from DEPENDS which would shorten the
> kernel dependency chain by removing populate_sysroot from the equation.
> 
> * We could change the task dependencies of populate_sysroot in
> kernel.bbclass so that it doesn't depend on do_install (it doesn't
> handle files any more now anyway).
> 
> * We could figure out why populate_sysroot from sstate isn't good enough
> for bitbake and change the sstate code to use sstate more heavily. If I
> remember rightly, we currently rerun all a task's tasks rather than pull
> it half from sstate and half not.
> 
> None of these jumps out at me as an easy or necessarily desirable fix.

I do have some patches:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=c4aed2ba7ae74e54a4ae8ac7aeda291704bde82a
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=7a20f175c0a1cdec208471e5f7ff5f560f0b609e
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=c5f3cdca3e16d90c4e5bbb3abe5e136b8025f1a4

What I've noticed is that rm_work does not remove the data from
shared-work. What it does do is remove the stamp file which causes all
the tasks to rerun even if the data was there. The above patches make
"do_shared_work" a semi sstate task, one which is never generated into
the sstate feed but does have the right stamp functionality. This
basically stops kernel modules from rerunning kernel tasks even with
rm_work.

Whether these patches are a good idea, I'm less sure.

Bruce: You might want to look at the module.bbclass changes in the first
patch. I think there is some duplication between module and module-base
I need to remove.

Cheers,

Richard




