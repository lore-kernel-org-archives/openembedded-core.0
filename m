Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0FE2756A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 15:22:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t55FMZhc025491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Jun 2015 08:22:35 -0700 (PDT)
Received: from server.local (128.224.20.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 5 Jun 2015 08:22:35 -0700
Message-ID: <5571BEBA.8090306@windriver.com>
Date: Fri, 5 Jun 2015 11:22:34 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1433477519.git.bruce.ashfield@windriver.com>
	<c954cdeeaf11fb5bd8f4fbf63ddf0904998f2ca4.1433477519.git.bruce.ashfield@windriver.com>
	<CAJTo0LYE8Oe6=aK0GekB+vb0TPZVZLCAtNUjecD9BZv3EZWEFQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYE8Oe6=aK0GekB+vb0TPZVZLCAtNUjecD9BZv3EZWEFQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto: update beaglebone, mpc8315e and edgerouter to 3.19
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
X-List-Received-Date: Fri, 05 Jun 2015 15:22:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-06-05 11:07 AM, Burton, Ross wrote:
>
> On 5 June 2015 at 05:13, Bruce Ashfield <bruce.ashfield@windriver.com
> <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     Bumping the linux-yocto SRCREVs to integrate fixes for the h/w reference
>     BSPs to the 3.19 kernel.
>
>
> edgerouter fails for me:
>
> |
> /data/poky-master/tmp/work-shared/edgerouter/kernel-source/fs/aufs/i_op.c:
> In function 'au_pin_hdir_set_owner':
> |
> /data/poky-master/tmp/work-shared/edgerouter/kernel-source/fs/aufs/i_op.c:445:28:
> error: 'struct mutex' has no member named 'owner'
> |   p->hdir->hi_inode->i_mutex.owner = task;
> |                             ^
> |   LD      drivers/idle/built-in.o
> |   CC      fs/aufs/i_op_del.o
> |   LD      drivers/i2c/busses/built-in.o
> |   CC      drivers/base/module.o
> |   LD      drivers/i2c/muxes/built-in.o
> |
> /data/poky-master/tmp/work-shared/edgerouter/kernel-source/scripts/Makefile.build:257:
> recipe for target 'fs/aufs/i_op.o' failed
> | make[4]: *** [fs/aufs/i_op.o] Error 1

Indeed, we have this fix:

commit 6c21811060c03100a32d0acc493df5fb3743b7c8
Author: Kevin Hao <kexin.hao@windriver.com>
Date:   Wed May 27 20:19:12 2015 +0800

     fs: aufs: fix a build error for archs which doesn't support 
MUTEX_SPIN_ON_OWNER

     For struct mutex, the member "owner" only exist when either
     DEBUG_MUTEXES or MUTEX_SPIN_ON_OWNER is enabled. The SMP is a necessary
     condition, but not a sufficiency condition for MUTEX_SPIN_ON_OWNER.
     So we would get build error on arch such as mpis due to SMP is
     enabled and both DEBUG_MUTEXES and MUTEX_SPIN_ON_OWNER are disabled.
     Replace the SMP with MUTEX_SPIN_ON_OWNER to fix it.

     Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

:100644 100644 f0edd021102b... 268a8a54ebfc... M        fs/aufs/i_op.c

---------

And it is on the edgerouter branch.

So either the fix isn't complete, or we are building a different config
here, or the revs are wrong.

... and indeed, that isn't part of the patch Kevin sent, so you are building
and old SRCREV.

I'll send a follow up patch shortly.

Bruce

>
> Ross


