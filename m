Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 45B3B706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 10:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1NA8vQ2020278; Mon, 23 Feb 2015 10:08:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l1CYC5LAnH3x; Mon, 23 Feb 2015 10:08:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1NA8h9I020260
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Feb 2015 10:08:55 GMT
Message-ID: <1424686123.11836.76.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 23 Feb 2015 10:08:43 +0000
In-Reply-To: <54EAB6E3.5010804@windriver.com>
References: <1424610251.11836.74.camel@linuxfoundation.org>
	<54EAB6E3.5010804@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 23 Feb 2015 10:09:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-02-23 at 00:13 -0500, Bruce Ashfield wrote:
> Was this the 3.19 kernel you used for these stats ? I just ran a quick
> test (i.e. not with buildstats) with my latest kernel tree (on my
> crappy I/O laptop) and get the following:
> 
> % time bitbake -f -c kernel_configme linux-yocto
> 
> real    0m7.378s
> user    0m4.356s
> sys     0m5.553s
> 
> 
> So I'm showing 7 seconds, versus 45 in your run .. and I'm showing:
> 
> real    0m26.371s
> user    0m12.561s
> sys     0m19.534s
> 
> For do_patch (and that is before the already in progress changes that
> I mentioned earlier).
> 
> Just with those differences alone, sounds like we should log this in
> bugzilla and put the details of the configuration and build machines in
> there .. since I'll need to isolate what is causing those extra long
> runs, and ensure that everything is pushed to the various trees.

I think I messed up and ran against a slightly different version. The
numbers confirmed with 3.19 are:

do_bundle_initramfs: Elapsed time: 0.03 seconds 
do_compile: Elapsed time: 78.07 seconds 
do_compile_kernelmodules: Elapsed time: 35.23 seconds 
do_configure: Elapsed time: 0.60 seconds 
do_deploy: Elapsed time: 14.39 seconds 
do_fetch: Elapsed time: 0.04 seconds 
do_install: Elapsed time: 2.02 seconds 
do_kernel_checkout: Elapsed time: 10.67 seconds 
do_kernel_configcheck: Elapsed time: 8.03 seconds 
do_kernel_configme: Elapsed time: 70.41 seconds 
do_kernel_link_vmlinux: Elapsed time: 0.03 seconds 
do_package: Elapsed time: 33.48 seconds 
do_packagedata: Elapsed time: 2.30 seconds 
do_package_qa: Elapsed time: 4.94 seconds 
do_package_write_ipk: Elapsed time: 68.72 seconds 
do_package_write_rpm: Elapsed time: 44.33 seconds 
do_patch: Elapsed time: 56.43 seconds 
do_populate_lic: Elapsed time: 0.14 seconds 
do_populate_sysroot: Elapsed time: 0.16 seconds 
do_shared_workdir: Elapsed time: 0.04 seconds 
do_sizecheck: Elapsed time: 0.03 seconds 
do_strip: Elapsed time: 0.03 seconds 
do_uboot_mkimage: Elapsed time: 0.02 seconds 
do_unpack: Elapsed time: 5.06 seconds 
do_validate_branches: Elapsed time: 0.69 seconds 

To get the numbers:

bitbake linux-yocto -c cleansstate
bitbake linux-yocto
$ (cd tmp/buildstats/linux-yocto-qemux86-64/201502230954/linux-yocto-3.19+gitAUTOINC+8897ef68b3_43b9eced9b-r0/; grep El * | sed s/linux-yocto-3.19+gitAUTOINC+8897ef68b3_43b9eced9b-r0// | sed s/^.*:://)

So configcheck is better but the other times still seem high.

Cheers,

Richard


