Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA136E367
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:24:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 14:20:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442537524"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 14:24:07 -0800
Message-ID: <52DEF386.6040701@linux.intel.com>
Date: Tue, 21 Jan 2014 14:24:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1390306673-9822-1-git-send-email-paul.eggleton@linux.intel.com>
	<52DEF00C.20608@linux.intel.com>
	<2733074.aO9SOLRWn4@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2733074.aO9SOLRWn4@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] conf/bitbake.conf: default HOMEPAGE to blank instead of unknown
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
X-List-Received-Date: Tue, 21 Jan 2014 22:24:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2014 02:12 PM, Paul Eggleton wrote:
> Hi Saul,
>
> On Tuesday 21 January 2014 14:09:16 Saul Wold wrote:
>> On 01/21/2014 04:17 AM, Paul Eggleton wrote:
>>> The default value for HOMEPAGE of "unknown" has been in place since the
>>> early OE-Classic days, but it doesn't really make sense - "unknown" is
>>> not a valid URL and it just means we have to explicitly check for this
>>> hardcoded string if we're displaying the value in some form of UI, such
>>> as Toaster. There is some code in the unmaintained oelint.bbclass to
>>> check for this value, presumably on the assumption that the recipe will
>>> explicitly set it to "" if there really isn't a homepage, but looking at
>>> recipes in OE-Core and meta-oe suggests that we haven't been using this
>>> convention for some time (with one exception in the latter) and it's
>>> rather uncommon these days to have no URL to associate with a recipe.
>>>
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>> ---
>>>
>>>    meta/conf/bitbake.conf | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index 57668e1..4fb6a1c 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -241,7 +241,7 @@ This package contains documentation."
>>>
>>>    LICENSE = "INVALID"
>>>    MAINTAINER = "OE-Core Developers
>>>    <openembedded-core@lists.openembedded.org>">
>>> -HOMEPAGE = "unknown"
>>> +HOMEPAGE = ""
>>
>> This seems to have caused a couple of problems with shadow-securetty,
>> updaterc and depmodwrapper.
>>
>> There may be more.
>
> Can you perhaps be more specific as to what the problem is?
>

Sorry, thought perhaps you would see the autobuilder failures.
> ERROR: Task 1962 (/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb, do_package_write_rpm) failed with exit code '1'
> NOTE: recipe shadow-securetty-4.1.4.3-r2: task do_package_write_deb: Started
> ERROR: Function failed: dpkg-deb execution failed
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2/temp/log.do_package_write_deb.8751
> Log data follows:
> | DEBUG: Executing python function sstate_task_prefunc
> | DEBUG: Python function sstate_task_prefunc finished
> | DEBUG: Executing python function do_package_write_deb
> | DEBUG: Executing python function read_subpackage_metadata
> | DEBUG: Python function read_subpackage_metadata finished
> | DEBUG: Executing python function do_package_deb
> | dpkg-deb: error: parsing file '/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2/packages-split/shadow-securetty-dbg/DEBIAN/control' near line 11 package 'shadow-securetty-dbg':
> |  EOF before value of field `Homepage' (missing final newline)
> | DEBUG: Python function do_package_deb finished
> | DEBUG: Python function do_package_write_deb finished
> | ERROR: Function failed: dpkg-deb execution failed
> NOTE: recipe shadow-securetty-4.1.4.3-r2: task do_package_write_deb: Failed
> ERROR: Task 4847 (/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb, do_package_write_deb) failed with exit code '1'
> ERROR: Function failed: BUILDSPEC (log file is located at /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2/temp/log.do_package_write_rpm.8020)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2/temp/log.do_package_write_rpm.8020
> Log data follows:
> | DEBUG: Executing python function sstate_task_prefunc
> | DEBUG: Python function sstate_task_prefunc finished
> | DEBUG: Executing python function do_package_write_rpm
> | DEBUG: Executing python function read_subpackage_metadata
> | DEBUG: Python function read_subpackage_metadata finished
> | DEBUG: Executing python function do_package_rpm
> | DEBUG: Executing python function write_specfile
> | NOTE: Creating EMPTY RPM Package for shadow-securetty-dbg
> | NOTE: Not creating empty RPM package for shadow-securetty-staticdev
> | NOTE: Creating EMPTY RPM Package for shadow-securetty-dev
> | NOTE: Not creating empty RPM package for shadow-securetty-doc
> | NOTE: Not creating empty RPM package for shadow-securetty-locale
> | NOTE: Creating RPM package for shadow-securetty
> | NOTE: Creating RPM package for shadow-securetty
> | DEBUG: Python function write_specfile finished
> | DEBUG: Executing shell function BUILDSPEC
> | error: line 8: Empty tag: URL:
> | error: Package has no %description: shadow-securetty-4.1.4.3-r2.qemuarm
> | Building target platforms: qemuarm-poky-linux-gnueabi
> | WARNING: /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2/temp/run.BUILDSPEC.8020:1 exit 1 from
> |   rpmbuild --nodeps --short-circuit --target qemuarm-poky-linux-gnueabi --buildroot /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2/package --define '_topdir /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2' --define '_rpmdir /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2/deploy-rpms/qemuarm' --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm' --define '_use_internal_dependency_generator 0' --define '__find_requires %{nil}' --define '__find_provides %{nil}' --define '_unpackaged_files_terminate_build 0' --define 'debug_package %{nil}' --define '_rpmfc_magic_path /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/sysroots/x86_64-linux/usr/share/misc/magic.mgc' --define 
'_tmppath /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2' -bb /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2/shadow-securetty.spec
> | DEBUG: Python function do_package_rpm finished
> | DEBUG: Python function do_package_write_rpm finished
> | ERROR: Function failed: BUILDSPEC (log file is located at /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/shadow-securetty/4.1.4.3-r2/temp/log.do_package_write_rpm.8020)
> NOTE: recipe shadow-securetty-4.1.4.3-r2: task do_package_write_rpm: Failed



> Thanks,
> Paul
>

