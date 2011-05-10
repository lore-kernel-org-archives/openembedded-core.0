Received: from mail.fim.uni-passau.de ([132.231.1.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leitl@fim.uni-passau.de>) id 1QJcDO-0002cY-RK
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 03:58:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.fim.uni-passau.de (Postfix) with ESMTP id 39D1592239
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 03:55:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.fim.uni-passau.de
Received: from mail.fim.uni-passau.de ([127.0.0.1])
	by localhost (mail.fim.uni-passau.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Mj5mPofXsZHQ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 03:55:40 +0200 (CEST)
Received: from darkx.localnet (p5DC751CD.dip.t-dialin.net [93.199.81.205])
	by mail.fim.uni-passau.de (Postfix) with ESMTPSA id E475D92238
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 03:55:39 +0200 (CEST)
From: Franz Leitl <leitl@fim.uni-passau.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 03:56:05 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38.4-23-default; KDE/4.6.1; x86_64; ; )
References: <201105090016.46391.leitl@fim.uni-passau.de>
	<4DC8543F.3090501@linux.intel.com>
	<201105100340.04862.leitl@fim.uni-passau.de>
In-Reply-To: <201105100340.04862.leitl@fim.uni-passau.de>
MIME-Version: 1.0
Message-Id: <201105100356.05227.leitl@fim.uni-passau.de>
Subject: Re: Patch for fixing build issues with external kernel modules.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 01:58:22 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

Am Dienstag 10 Mai 2011, 03:40:04 schrieb Franz Leitl:
> Am Montag 09 Mai 2011, 22:53:19 schrieben Sie:
> > The kernel should not remove bounds.h, that is documented in the
> > Makefile. If it does, it's a bug.
> 
> After executing "bitbake -f -c compile virtual/kernel"  I get bounds.h in
> "${S}/includes/generated/".
> Seems as if both
>     oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
> and
>     make -C $kerneldir _mrproper_scripts
> in kernel.bbclass are to blame for removing bounds.h from
> "$kerneldir/includes/generated/".
> I tested it twice. Only in case both lines are commented out bounds.h stays
> in "$kerneldir/includes/generated/"
I still would like to know, what to do next.

> What to do with module.bbclass not setting KERNEL_PATH in
> module_do_install? My Makefile relies on it, if KERNEL_PATH is not set it
> will use
> "/lib/modules/$(shell uname -r)/build" instead. But uname returns the
> host's kernel version.
> Is there any reason why oe_runmake in module_do_compile sets
> "KERNEL_PATH=${STAGING_KERNEL_DIR}" while in module_do_install it doesn't?
> Should I overwrite the do_install in my recipe or should module.bbclass be
> fixed?
Ok, I just remembered the hint to recipes-kernel/hello-mod/files/Makefile. Works 
as KERNEL_SRC is also set to ${STAGING_KERNEL_DIR}. But it does not explain what 
the real difference between KERNEL_SRC and KERNEL_PATH is, as both are set to 
the same value and why does module_do_install not set KERNEL_PATH but 
module_do_compile does?


Regards,
Franz


