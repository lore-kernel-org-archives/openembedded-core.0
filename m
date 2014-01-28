Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 89ADE6E897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 17:49:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2014 09:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,737,1384329600"; d="scan'208";a="473880205"
Received: from dvhart-mobl.jf.intel.com (HELO [10.7.196.58]) ([10.7.196.58])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2014 09:49:12 -0800
Message-ID: <1390903209.13217.77.camel@dvhart-mobl.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
Date: Tue, 28 Jan 2014 02:00:09 -0800
In-Reply-To: <1390901608.13217.74.camel@dvhart-mobl.amr.corp.intel.com>
References: <1390929399-28383-1-git-send-email-stefanx.stanacar@intel.com>
	<1390901608.13217.74.camel@dvhart-mobl.amr.corp.intel.com>
Organization: Intel
X-Mailer: Evolution 3.10.3 (3.10.3-1.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/runqemu-internal: use -cpu core2duo for qemux86-64
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
X-List-Received-Date: Tue, 28 Jan 2014 17:49:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-28 at 01:33 -0800, Darren Hart wrote:
> On Tue, 2014-01-28 at 19:16 +0200, Stefan Stanacar wrote:
> > Now that the tune for qemux86-64 changed to core2-64 we need to
> > tell the emulator to use a proper CPU model. With the default setting
> > of qemu64 we'll get things like:
> > 
> > root@qemux86-64:~# smart --help
> > traps: python[758] trap invalid opcode ip:7f2af01f6be7 sp:7fff49466ef0 error:0 in strop.so[7f2af01f5000+6000]
> > Illegal instruction
> > 
> > If the tune for qemux86 changes, that needs to be updated too.
> > 
> > Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>

Nevermind, all the calls below are done in the same if block where the
CPU_SUBTYPE is set. This is fine.

Acked-by: Darren Hart <dvhart@linux.intel.com>


> > ---
> >  scripts/runqemu-internal | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> > index e3b0729..0893107 100755
> > --- a/scripts/runqemu-internal
> > +++ b/scripts/runqemu-internal
> > @@ -388,6 +388,7 @@ fi
> >  
> >  if [ "$MACHINE" = "qemux86-64" ]; then
> >      QEMU=qemu-system-x86_64
> > +    CPU_SUBTYPE=core2duo
> 
> What is it set to by default? Just "" right?
> 
> >      if [ ! -z "$vga_option" ]; then
> >          QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
> >      else
> > @@ -395,7 +396,7 @@ if [ "$MACHINE" = "qemux86-64" ]; then
> >      fi
> >      if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
> >          KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
> > -        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
> > +        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
> 
> So what happens here when it is empty? "-cpu ''" ?
> 

-- 
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center


