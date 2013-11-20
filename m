Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F07C6C73F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 04:32:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAK4WFkK004799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 20:32:16 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 19 Nov 2013 20:32:14 -0800
Message-ID: <528C3B60.1000705@windriver.com>
Date: Wed, 20 Nov 2013 12:32:32 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <2838381.LbivOYPPzY@yiqingliang-pc>
In-Reply-To: <2838381.LbivOYPPzY@yiqingliang-pc>
X-Originating-IP: [128.224.162.213]
Subject: Re: kernel build fail after update
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
X-List-Received-Date: Wed, 20 Nov 2013 04:32:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I met the same error when I inherited 'rm_work' in local.conf and 
performed a world build.

This is reproducible with the latest code.

1. add in local.conf
     INHERIT += "rm_work"
2. bitbake world

//Chen Qi


On 11/19/2013 07:21 AM, Yi Qingliang wrote:
> after update poky, I got error when compile my own kernel, it looks like there
> is no directory '/mnt/src/kl360-build/tmp/work/kl360-jilong-linux-
> gnueabi/linux-jilong/3.9.4-gitAUTOINC+5dbff4f559/image'.
>
> in my bb file, I only inherit kernel.
>
> I found one patch 'Use hardlinks for do_populate_sysroot for speed' may be
> related with this error.
>
>
>
>
>
> ERROR: Error executing a python function in /mnt/src/optimus/poky/../meta-
> jilong/recipes-kernel/linux/linux-jilong.bb:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'sysroot_stage_all', lineno: 6, function: <module>
>       0002:def sysroot_stage_all(d):
>       0003:    oe.path.copyhardlinktree(d.expand("/mnt/src/kl360-
> build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
> gitAUTOINC+5dbff4f559/image/usr/src/kernel"), d.expand("/mnt/src/kl360-
> build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
> gitAUTOINC+5dbff4f559/sysroot-destdir//usr/src/kernel"))
>       0004:
>       0005:
>   *** 0006:sysroot_stage_all(d)
>       0007:
> File: 'sysroot_stage_all', lineno: 3, function: sysroot_stage_all
>       0001:
>       0002:def sysroot_stage_all(d):
>   *** 0003:    oe.path.copyhardlinktree(d.expand("/mnt/src/kl360-
> build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
> gitAUTOINC+5dbff4f559/image/usr/src/kernel"), d.expand("/mnt/src/kl360-
> build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
> gitAUTOINC+5dbff4f559/sysroot-destdir//usr/src/kernel"))
>       0004:
>       0005:
>       0006:sysroot_stage_all(d)
>       0007:
> File: '/mnt/src/optimus/poky/meta/lib/oe/path.py', lineno: 93, function:
> copyhardlinktree
>       0089:    bb.utils.mkdirhier(dst)
>       0090:    if os.path.isdir(src) and not len(os.listdir(src)):
>       0091:        return
>       0092:
>   *** 0093:    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>       0094:        # Need to copy directories only with tar first since cp will
> error if two
>       0095:        # writers try and create a directory at the same time
>       0096:        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --
> files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
>       0097:        check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> Exception: OSError: [Errno 2] No such file or directory: '/mnt/src/kl360-
> build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
> gitAUTOINC+5dbff4f559/image/usr/src/kernel'
>
> ERROR: Function failed: sysroot_stage_all
> ERROR: Logfile of failure stored in: /mnt/src/kl360-build/tmp/work/kl360-
> jilong-linux-gnueabi/linux-jilong/3.9.4-
> gitAUTOINC+5dbff4f559/temp/log.do_populate_sysroot.5146
> ERROR: Task 3 (/mnt/src/optimus/poky/../meta-jilong/recipes-
> kernel/linux/linux-jilong.bb, do_populate_sysroot) failed with exit code '1'
>
>


