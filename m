Return-Path: <paul.barker.commagility@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1D16612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 14:04:47 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p66so27048364wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 06:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:subject:message-id:in-reply-to:references:organization
	:mime-version:content-type:content-transfer-encoding;
	bh=RXTLP4KycBfvRNkNmKow+Qp+qxn86xP/fe9RM6gxSfA=;
	b=kNS8uoIWUhwqxpBHn6YKWxxhmEAjEzbvOF95RpwPPkOkKUFPeIjy+u+VK7mfoG+Cn9
	aQ/X8BFjYRV9ig5QoFs8XKuTa1m3X9RiuqPKz1XcIPDAPsCulBy+oxJKCTbcUwL3mmen
	JTiXBmu1q7TvxlXdyHJujp2CHAOp9KkqybwCh16BOv8ym9MeZkXkXM+aXXvG0+ELW92c
	puSWKscJoeHXu1Ma+tulKyXS7YnWcAdrX4EwpweCvwWTvqibhDKNHoLVbD2DVkO0kvIU
	/pambA6ARk2FFfFkVqkVNUkCdz+ae1i0yGx0iJ2P7ymhYUdMzwos6vZBYIxOK1Qw+LjH
	/CkQ==
X-Received: by 10.194.114.105 with SMTP id jf9mr43647014wjb.102.1450188287598; 
	Tue, 15 Dec 2015 06:04:47 -0800 (PST)
Received: from centos-7 (inno-commagility-ownrouter.lut.ac.uk. [131.231.60.35])
	by smtp.gmail.com with ESMTPSA id e9sm1576747wjp.18.2015.12.15.06.04.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 06:04:46 -0800 (PST)
Date: Tue, 15 Dec 2015 14:04:34 +0000
From: Paul Barker <paul.barker@commagility.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20151215140434.75233de0@centos-7>
In-Reply-To: <1449401194-31567-1-git-send-email-paul.barker@commagility.com>
References: <1449401194-31567-1-git-send-email-paul.barker@commagility.com>
Organization: CommAgility Ltd
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH RFC] module.bbclass: Fix potential do_compile/do_make_scripts race condition
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
X-List-Received-Date: Tue, 15 Dec 2015 14:04:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 6 Dec 2015 11:26:33 +0000
Paul Barker <paul.barker@commagility.com> wrote:

> I ran into a race condition building multiple external modules against a 3.10.y
> series kernel using the dylan branch of OpenEmbedded. This is difficult to
> reproduce as it requires very specific timing: the do_make_scripts task for one
> module was linking the modpost script whilst the do_compile task for another
> module was attempting to use the modpost script. This resulted in a permission
> error:
> 
> ERROR: Function failed: do_compile (see /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434 for further information)
> ERROR: Logfile of failure stored in: /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | make -C /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel M=$PWD clean
> | make[1]: Entering directory `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> | make[1]: Leaving directory `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> | make -C /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel M=$PWD modules
> | make[1]: Entering directory `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> |   CC [M]  /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/git/ti/runtime/hplib/module/hplibmod.o
> |   Building modules, stage 2.
> |   MODPOST 1 modules
> | /bin/sh: scripts/mod/modpost: Permission denied
> | make[2]: *** [__modpost] Error 126
> | make[1]: *** [modules] Error 2
> | make[1]: Leaving directory `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> | make: *** [default] Error 2
> | ERROR: Function failed: do_compile (see /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434 for further information)
> ERROR: Task 1284 (/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/meta-mcsdk/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-mod_git.bb, do_compile) failed with exit code '1'
> 
> Later kernel versions do not rebuild the modpost script every time that 'make
> scripts' is invoked so they should be safe from this particular failure. However
> I'm not convinced that running 'make scripts' whilst also building an
> out-of-tree module is always safe on later kernels and there is always the
> potential for vendor kernels to have different behaviour here.
> 
> Although this was seen on the dylan branch the behaviour of master and jethro
> looks to be the same here - do_make_scripts is locked so that only one instance
> of it may run at one time but there is nothing to prevent one instance of
> do_make_scripts running at the same time as an instance of do_compile.
> 
> The patch I'm sending attempts to solve this issue by locking the do_compile
> task with the same lockfile as the do_make_scripts task in module.bbclass so
> that an instance of do_copile can't run at the same time as an instance of
> do_make_scripts. I don't know enough about the task locking to guarantee that
> this is the right solution or to be able to test that it works as expected so
> I'm marking the patch as an RFC.
> 
> Please let me know if this is the right approach and if there is any easy way to
> test this.
> 
> Paul Barker (1):
>   module.bbclass: Fix potential do_compile/do_make_scripts race
>     condition
> 
>  meta/classes/module.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 

ping on this.

I've just got bitten by this again so it's not a one-off. Is anyone able to
give me some feedback on the patch, whether this is the right approach to fix
the problem and whether this is applicable to jethro/master.

Thanks,

-- 
Paul Barker
CommAgility Ltd

