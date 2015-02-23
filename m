Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F00E706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 05:13:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1N5D8AB001715
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 22 Feb 2015 21:13:08 -0800 (PST)
Received: from server.local (128.224.23.72) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 22 Feb 2015 21:13:08 -0800
Message-ID: <54EAB6E3.5010804@windriver.com>
Date: Mon, 23 Feb 2015 00:13:07 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1424610251.11836.74.camel@linuxfoundation.org>
In-Reply-To: <1424610251.11836.74.camel@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: linux-yocto task performance numbers
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
X-List-Received-Date: Mon, 23 Feb 2015 05:13:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-02-22 8:04 AM, Richard Purdie wrote:
> As people know, I've been looking at performance a little, one of the
> benchmarks is how long the kernel takes to build. I dumped out the task
> performance data from buildstats for a linux-yocto build (nothing else
> running):
>
> do_fetch:                 Elapsed time: 0.04 seconds
> do_unpack:                Elapsed time: 1.61 seconds
> do_kernel_checkout:       Elapsed time: 4.39 seconds
> do_validate_branches:     Elapsed time: 0.47 seconds
> do_patch:                 Elapsed time: 57.77 seconds
> do_kernel_configme:       Elapsed time: 44.92 seconds
> do_kernel_configcheck:    Elapsed time: 8.94 seconds
> do_configure:             Elapsed time: 0.60 seconds
> do_compile:               Elapsed time: 72.95 seconds
> do_compile_kernelmodules: Elapsed time: 34.84 seconds
> do_populate_lic:          Elapsed time: 0.14 seconds
> do_strip:                 Elapsed time: 0.03 seconds
> do_uboot_mkimage:         Elapsed time: 0.03 seconds
> do_install:               Elapsed time: 1.87 seconds
> do_populate_sysroot:      Elapsed time: 0.16 seconds
> do_shared_workdir:        Elapsed time: 0.05 seconds
> do_sizecheck:             Elapsed time: 0.03 seconds
> do_bundle_initramfs:      Elapsed time: 0.03 seconds
> do_kernel_link_vmlinux:   Elapsed time: 0.03 seconds
> do_deploy:                Elapsed time: 13.17 seconds
> do_package:               Elapsed time: 31.54 seconds
> do_packagedata:           Elapsed time: 0.59 seconds
> do_package_qa:            Elapsed time: 5.30 seconds
> do_package_write_ipk:     Elapsed time: 83.24 seconds
> do_package_write_rpm:     Elapsed time: 44.58 seconds
>
> The "core" was getting blamed for a lot of the build time. As can be
> seen, the "core" isn't taking that much time now, apart from the fact
> that ipk packaging seems to be taking twice the time of rpm which needs
> looking into.
>
> Some tasks like the compile tasks are understandable and likely
> minimised by upstream work already.
>
> The other tasks which as consuming a disproportionate amount of time are
> kernel_configme and patch, I believe we need to look into those a little
> further too. To put it into context, should the kernel compile be at the
> same order of magnitude as the patch and configure?

Was this the 3.19 kernel you used for these stats ? I just ran a quick
test (i.e. not with buildstats) with my latest kernel tree (on my
crappy I/O laptop) and get the following:

% time bitbake -f -c kernel_configme linux-yocto

real    0m7.378s
user    0m4.356s
sys     0m5.553s


So I'm showing 7 seconds, versus 45 in your run .. and I'm showing:

real    0m26.371s
user    0m12.561s
sys     0m19.534s

For do_patch (and that is before the already in progress changes that
I mentioned earlier).

Just with those differences alone, sounds like we should log this in
bugzilla and put the details of the configuration and build machines in
there .. since I'll need to isolate what is causing those extra long
runs, and ensure that everything is pushed to the various trees.

Cheers,

Bruce


>
> Cheers,
>
> Richard
>


