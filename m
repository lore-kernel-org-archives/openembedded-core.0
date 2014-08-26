Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id B5C8965D56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 19:56:22 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20140826195622971
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 19:56:22 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=54766 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XMMqn-0008WH-3F; Tue, 26 Aug 2014 15:56:17 -0400
Date: Tue, 26 Aug 2014 15:56:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4MAOB21eT+pM7BE4nxXWm1PSOv2EPFmoLY8T2-gAu4HWA@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1408261555490.8552@localhost>
References: <alpine.LFD.2.11.1408261510310.8225@localhost>
	<CADkTA4MAOB21eT+pM7BE4nxXWm1PSOv2EPFmoLY8T2-gAu4HWA@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is INITRAMFS_TASK still useful, or can it be tossed?
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
X-List-Received-Date: Tue, 26 Aug 2014 19:56:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 26 Aug 2014, Bruce Ashfield wrote:

> On Tue, Aug 26, 2014 at 3:14 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   just noticed the following -- here's snippets from kernel.bbclass:
> >
> > ... snip ...
> > INITRAMFS_TASK ?= ""
> > ... snip ...
> >     # NOTE: setting INITRAMFS_TASK is for backward compatibility
> >     #       The preferred method is to set INITRAMFS_IMAGE, because
> >     #       this INITRAMFS_TASK has circular dependency problems
> >     #       if the initramfs requires kernel modules
> >     image_task = d.getVar('INITRAMFS_TASK', True)
> >     if image_task:
> >         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
> >     ... snip ...
> >         if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
> >                 # The old style way of copying an prebuilt image and building it
> >                 # is turned on via INTIRAMFS_TASK != ""
> >     ... snip ...
> >
> >   i have about a dozen layers checked out and the only other place i
> > see that variable used is:
> >
> > meta-oe/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb:
> >   INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
>
> check meta-handheld, it was an existing use case we didn't want to break.

  ah, that wasn't one of the layers i had checked out, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


