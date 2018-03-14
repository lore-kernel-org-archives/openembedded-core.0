Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C9A6C78901
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 12:46:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2ECjTaD020479
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Mar 2018 05:45:29 -0700 (PDT)
Received: from server.local (128.224.20.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 14 Mar 2018 05:45:28 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0LZcrg5TmTEyEwjAW0_49RJ0T2A4ZBsuNmyJ=wSMFWtuZw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <dbc5da75-f7b9-bda4-c9da-5be3088945ab@windriver.com>
Date: Wed, 14 Mar 2018 08:46:08 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZcrg5TmTEyEwjAW0_49RJ0T2A4ZBsuNmyJ=wSMFWtuZw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] linux-yocto: aufs and systemtap
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
X-List-Received-Date: Wed, 14 Mar 2018 12:46:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-03-14 8:41 AM, Burton, Ross wrote:
> On 6 March 2018 at 18:11, Bruce Ashfield <bruce.ashfield@windriver.com 
> <mailto:bruce.ashfield@windriver.com>> wrote:
> 
>     Integrating a configuration change for systemtap:
> 
>        features/systemtap/systemtap.cfg: enable CONFIG_KERNEL_DEBUG
> 
> 
> I noticed that all the performance machines had a big spike in kernel 
> build time and build directory size, and annoyingly spent too long 
> bisecting builds before noticing this in the commit message for the 
> offending commit.  If I re-read the logs I might have spotted this 
> sooner. :)

Agreed. I should have realized this as well, we went through a process
about a year ago of moving all of the debug configs with the split into
a production/debug set of kernel configurations.

> 
> $ buildstats-diff 20180314122002-3a8cce8b5c2 20180314122610-a7c9bc7020a/
> Ignoring tasks less than 00:03.0 (3.0s)
> Ignoring differences less than 00:01.0 (1.0s)
> 
>    PKG            TASK                      ABSDIFF   RELDIFF  CPUTIME1 
> -> CPUTIME2
>    linux-yocto    do_package                  20.2s   +153.0%     13.2s 
> -> 33.3s
>    linux-yocto    do_deploy                   29.9s  +1502.8%      2.0s 
> -> 31.9s
>    linux-yocto    do_package_write_ipk       125.5s   +310.2%     40.5s 
> -> 166.0s
>    linux-yocto    do_compile_kernelmodules   142.6s    +17.8%    800.3s 
> -> 942.9s
>    linux-yocto    do_package_write_rpm       156.0s   +563.6%     27.7s 
> -> 183.7s
>    linux-yocto    do_compile                 174.8s    +18.7%    934.3s 
> -> 1109.1s
> 
> Cumulative cputime:
>    649.5s    +35.0%    30:56.0 (1856.0s) -> 41:45.5 (2505.5s)
> 
> $ buildhistory-diff | grep SIZE
> packages/qemux86-poky-linux/linux-yocto/kernel-vmlinux: PKGSIZE changed 
> from 19587044 to 300944172 (+1436%)
> 
> Is this really what we want out of the box?  Can the kernel have the 
> debugging bits stripped out into a separate package so even if we have 
> the build time hit, we don't have the kernel size change?

I'll revert this for now (or see if I can quickly move it to a debug
kernel build), and yes, there is a better way to do this. I'm just not
sure I can get it done in time for the release.

Bruce

> 
> Ross


