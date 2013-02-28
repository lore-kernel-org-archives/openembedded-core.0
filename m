Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UB8vu-00026w-6v
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 20:14:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2013 10:56:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,756,1355126400"; d="scan'208";a="269199818"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by orsmga001.jf.intel.com with ESMTP; 28 Feb 2013 10:57:58 -0800
Message-ID: <512FA8B6.4030909@linux.intel.com>
Date: Thu, 28 Feb 2013 10:57:58 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
	<4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
	<512EDDE0.2060907@linux.intel.com>
	<1362026705.2588.33.camel@empanada>
In-Reply-To: <1362026705.2588.33.camel@empanada>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libaudit: new package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 19:14:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2013 08:45 PM, Tom Zanussi wrote:
> On Wed, 2013-02-27 at 20:32 -0800, Saul Wold wrote:
>> On 02/27/2013 07:00 AM, tom.zanussi@linux.intel.com wrote:
>>> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>>>
>>> Add libaudit, used by system call auditing applications.  From the
>>> sources:
>>>
>>>    "The audit package contains the user space utilities for storing and
>>>    searching the audit records generate by the audit subsystem in the
>>>    Linux 2.6 kernel."
>>>
>>> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
>>> ---
>>>    .../libaudit/libaudit/build-lib-only.patch         |  33 ++
>>>    .../libaudit/libaudit/fix-host-gen.patch           | 461 +++++++++++++++++++++
>>>    meta/recipes-support/libaudit/libaudit_2.2.2.bb    |  25 ++
>>>    3 files changed, 519 insertions(+)
>>>    create mode 100644 meta/recipes-support/libaudit/libaudit/build-lib-only.patch
>>>    create mode 100644 meta/recipes-support/libaudit/libaudit/fix-host-gen.patch
>>>    create mode 100644 meta/recipes-support/libaudit/libaudit_2.2.2.bb
>>
>>>
>> <SNIP>
>>
>>
>>> diff --git a/meta/recipes-support/libaudit/libaudit_2.2.2.bb b/meta/recipes-support/libaudit/libaudit_2.2.2.bb
>>> new file mode 100644
>>> index 0000000..e28b619
>>> --- /dev/null
>>> +++ b/meta/recipes-support/libaudit/libaudit_2.2.2.bb
>>> @@ -0,0 +1,25 @@
>>> +DESCRIPTION = "libaudit is the dynamic library needed for applications to use the audit framework."
>>> +SECTION = "libs"
>>> +AUTHOR = "Steve Grubb <sgrubb@redhat.com>"
>>> +HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
>>> +LICENSE = "LGPLv2+"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>> +PR = "r0"
>>> +
>>> +SRC_URI = "http://people.redhat.com/sgrubb/audit/audit-${PV}.tar.gz \
>>> +           file://build-lib-only.patch \
>>> +           file://fix-host-gen.patch \
>>> +          "
>>> +
>>> +SRC_URI[md5sum] = "6641fde111cf5dfda6d4282ab8410df5"
>>> +SRC_URI[sha256sum] = "8bc2b45a5f08f5df6cebcd5543f24b7e68e28b64da4b23f08de2c6616384302b"
>>> +
>>> +S = "${WORKDIR}/audit-${PV}"
>>> +
>>> +inherit autotools
>>> +
>>> +EXTRA_OECONF = "--disable-dependency-tracking --disable-listener"
>>> +
>>> +do_configure() {
>>> +	       oe_runconf
>>> +}
>>>
>> Is this do_configure really needed?  Does the autotools default not work
>> correctly?  And if not why not?
>
> This is to avoid the autoreconf step, which ends up overwriting the
> lib/Makefile.in changes when it regenerates it from lib/Makefile.am.
>
> The Makefile.in is shipped with the source tarball, so I modified it
> directly instead of complicating things by trying to get autoreconf to
> generate the correct Makefile for the target part of the build vs these
> specific changes to Makefile.in for the set of programs generated to run
> on the host.
>

Tom,

I understand your approach here and while it has good intentions, is not 
the right way to go about this.  We want to enable upstream packages to 
cross compile (if they are open to the idea). So changing the 
Makefile.am would be the right way to do this and allow the standard 
automake and autoreconf to do their work.  This would also allow the 
patches to be possibly accepted up stream.

I understand there are examples of this type of patching in OE-Core, 
that does not mean they are good examples and they should probably be 
looked into for fixing also.

I know you have put effort in here, and we want to make sure the patches 
are correct and good example moving forward.

For example in the first build-lib-only patch you can just edit the 
SUBDIRS line to include lib.

For the larger patch, are you selectively changing CCLD and CFLAGS or is 
it through out?  You should probably build these -native and use them 
instead of trying to tweak around the target build.

We can discuss it further as needed.

Thanks
	Sau!

> Tom
>
>>
>> Sau!
>>
>
>
>
>


