Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id CBB196B4BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 13:22:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,737,1378854000"; d="scan'208";a="49567157"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 20 Nov 2013 13:22:15 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1Vj7jT-0005kk-3o; Wed, 20 Nov 2013 13:22:15 +0000
Date: Wed, 20 Nov 2013 13:22:15 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20131120132215.GA21763@mcrowe.com>
References: <528CB04F.6010904@topic.nl>
MIME-Version: 1.0
In-Reply-To: <528CB04F.6010904@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Kernel fails to build in do_populate_sysroot after OE-core upgrade
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
X-List-Received-Date: Wed, 20 Nov 2013 13:22:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wednesday 20 November 2013 at 13:51:27 +0100, Mike Looijmans wrote:
> ﻿I expect this is related somehow to the recent change in the kernel
> to use hardlinks, but I have no idea what's going wrong here.
> 
> This is the recipe for the kernel, which has run fine so far.
> https://github.com/milosoftware/meta-zynq/blob/master/recipes-kernel/linux-zynq/linux-milo.bb
> 
> 
> This is the output log:
> 
> 
> DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing python function do_populate_sysroot
> DEBUG: Executing python function sysroot_stage_all
> ERROR: Error executing a python function in /home/mike/zynq-next/meta-zynq/recipes-kernel/linux-zynq/linux-milo.bb:
> 
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'sysroot_stage_all', lineno: 6, function: <module>
>      0002:def sysroot_stage_all(d):
>      0003: oe.path.copyhardlinktree(d.expand("/home/mike/zynq-next/build/tmp-eglibc/work/zedboard-oe-linux-gnueabi/linux-milo/3.10+gitAUTOINC+dbebd8b890-r0/image/usr/src/kernel"), d.expand("/home/mike/zynq-next/build/tmp-eglibc/work/zedboard-oe-linux-gnueabi/linux-milo/3.10+gitAUTOINC+dbebd8b890-r0/sysroot-destdir//usr/src/kernel"))
>      0004:
>      0005:
>  *** 0006:sysroot_stage_all(d)
>      0007:
> File: 'sysroot_stage_all', lineno: 3, function: sysroot_stage_all
>      0001:
>      0002:def sysroot_stage_all(d):
>  *** 0003: oe.path.copyhardlinktree(d.expand("/home/mike/zynq-next/build/tmp-eglibc/work/zedboard-oe-linux-gnueabi/linux-milo/3.10+gitAUTOINC+dbebd8b890-r0/image/usr/src/kernel"), d.expand("/home/mike/zynq-next/build/tmp-eglibc/work/zedboard-oe-linux-gnueabi/linux-milo/3.10+gitAUTOINC+dbebd8b890-r0/sysroot-destdir//usr/src/kernel"))
>      0004:
>      0005:
>      0006:sysroot_stage_all(d)
>      0007:
> File: '/home/mike/zynq-next/oe-core/meta/lib/oe/path.py', lineno:
> 93, function: copyhardlinktree
>      0089:    bb.utils.mkdirhier(dst)
>      0090:    if os.path.isdir(src) and not len(os.listdir(src)):
>      0091:        return
>      0092:
>  *** 0093:    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>      0094:        # Need to copy directories only with tar first
> since cp will error if two
>      0095:        # writers try and create a directory at the same time
>      0096:        cmd = 'cd %s; find . -type d -print | tar -cf - -C
> %s -p --files-from - --no-recursion | tar -xf - -C %s' % (src, src,
> dst)
>      0097:        check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> Exception: OSError: [Errno 2] No such file or directory: '/home/mike/zynq-next/build/tmp-eglibc/work/zedboard-oe-linux-gnueabi/linux-milo/3.10+gitAUTOINC+dbebd8b890-r0/image/usr/src/kernel'
> 
> DEBUG: Python function sysroot_stage_all finished
> DEBUG: Python function do_populate_sysroot finished
> ERROR: Function failed: sysroot_stage_all

I believe that Richard Purdie's bitbake patch
http://git.openembedded.org/bitbake/commit/?h=master-next&id=f21910157d873c030b149c4cdc5b57c5062ab5a6
fixes this build failure.

HTH.

Mike.

