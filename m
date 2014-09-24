Return-Path: <dvhart@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D3EC060809
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 21:18:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Sep 2014 14:18:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,591,1406617200"; d="scan'208";a="604875181"
Received: from dvhart-mac01.jf.intel.com (HELO [10.24.6.33]) ([10.24.6.33])
	by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2014 14:18:34 -0700
User-Agent: Microsoft-MacOutlook/14.4.3.140616
Date: Wed, 24 Sep 2014 14:18:30 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <D0487728.AA0CF%dvhart@linux.intel.com>
Thread-Topic: [OE-core] daisy: runtime-reverse/udev-hwdb missing during
	do_rootfs
References: <D04840BD.A9FE9%dvhart@linux.intel.com>
	<1411581534.4189.65.camel@ted>
In-Reply-To: <1411581534.4189.65.camel@ted>
Mime-version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: daisy: runtime-reverse/udev-hwdb missing during do_rootfs
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
X-List-Received-Date: Wed, 24 Sep 2014 21:18:40 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 9/24/14, 10:58, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>On Wed, 2014-09-24 at 09:34 -0700, Darren Hart wrote:
>> I've hit the following on a custom image recipe (based on core-image):
>> 
>> | Configuring run-postinsts.
>> |
>> | NOTE: Installing complementary packages ...
>> | NOTE: Running intercept scripts:
>> | NOTE: Executing write_package_manifest ...
>> | DEBUG: Executing python function write_package_manifest
>> | DEBUG: Python function write_package_manifest finished
>> | NOTE: Executing license_create_manifest ...
>> | DEBUG: Executing shell function license_create_manifest
>> | ls: cannot access
>> 
>>/build/yocto/daisy/intel-corei7-64_20140718205500/build/tmp/sysroots/inte
>>l-
>> internal-corei7-64/pkgdata/runtime-reverse/udev-hwdb: No such file or
>> directory
>> | readlink: missing operand
>> | Try 'readlink --help' for more information.
>> | basename: missing operand
>> | Try 'basename --help' for more information.
>> | WARNING: exit code 1 from a shell command.
>> | DEBUG: Python function do_rootfs finished
>> | ERROR: Function failed: license_create_manifest (log file is located
>>at
>> 
>>/build/yocto/daisy/intel-corei7-64_20140718205500/build/tmp/work/intel_in
>>te
>> 
>>rnal_corei7_64-eywa-linux/core-image-minimal-initramfs/1.0-r0/temp/log.do
>>_r
>> ootfs.15414)
>> ERROR: Task 150 
>> 
>>(/build/yocto/daisy/intel-corei7-64_20140718205500/poky/meta/recipes-core
>>/i
>> mages/core-image-minimal-initramfs.bb, do_rootfs) failed with exit code
>>'1'
>> NOTE: Tasks Summary: Attempted 4727 tasks of which 4697 didn't need to
>>be
>> rerun and 1 failed.
>> Waiting for 0 running tasks to finish:
>
>I don't know why it does this but I can perhaps give some pointers as to
>where to look.
>
>udev-hwdb was installed in the image. First question is whether that is
>actually in the build dependencies. "bitbake
>core-image-minimal-initramfs -c rootfs -g", then grep task-depends.dot
>and see if udev is in there.

This was due to switching between systemd in DISTRO_FEATURES and not.
Cleaning systemd and udev and rebuilding resolved the issue.

Lesson: use different tmp when changing DISTRO_FEATURES.

-- 
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation




