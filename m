Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TOx5W-0005Sc-I7
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:53:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Oct 2012 13:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="235700618"
Received: from unknown (HELO envy.home) ([10.255.14.53])
	by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2012 13:39:19 -0700
Message-ID: <508068BA.8070301@linux.intel.com>
Date: Thu, 18 Oct 2012 16:38:18 -0400
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121009 Thunderbird/16.0
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<508063AF.9030400@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A70949E@039-SN1MPN1-002.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A70949E@039-SN1MPN1-002.039d.mgd.msft.net>
X-Enigmail-Version: 1.4.5
Cc: Dutta Yashpal-B05456 <B05456@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev kernel module recipe
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
X-List-Received-Date: Thu, 18 Oct 2012 20:53:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/18/2012 04:33 PM, McClintock Matthew-B29882 wrote:
> On Thu, Oct 18, 2012 at 3:16 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>
>>
>> On 10/18/2012 05:57 AM, Yashpal Dutta wrote:
>>> This is a /dev/crypto device driver, equivalent to those in OpenBSD or FreeBSD.
>>> The main idea is to access of existing ciphers in kernel space from userspace,
>>> thus enabling re-use of a hardware implementation of a cipher.
>>>
>>> Signed-off-by: Yashpal Dutta <yashpal.dutta@freescale.com>
>>> ---
>>>  meta/recipes-kernel/cryptodev/cryptodev_1.5.bb     |   18 +++++++++++++
>>>  .../cryptodev/files/makefile_fixup.patch           |   26 ++++++++++++++++++++
>>>  2 files changed, 44 insertions(+), 0 deletions(-)
>>>  create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
>>>  create mode 100644 meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
>>>
>>> diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
>>> new file mode 100644
>>> index 0000000..5125710
>>> --- /dev/null
>>> +++ b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
>>> @@ -0,0 +1,18 @@
>>> +SECTION = "devel"
>>> +SUMMARY = "Linux Cryptodev KERNEL MODULE"
>>> +DESCRIPTION = "The Cryptodev package contains the kernel /dev/crypto module"
>>> +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>> +
>>> +DEPENDS = "virtual/kernel"
>>
>> This DEPENDS in inherited from the module.bbclass, no need to duplicate
>>
>>> +
>>> +inherit module
>>> +
>>> +SRCREV = "1c24a0aa996630518d47826a2e3fea129ea094c7"
>>> +
>>> +SRC_URI = "git://repo.or.cz/cryptodev-linux.git;protocol=git \
>>> +       file://makefile_fixup.patch"
>>
>> Tabs to indent, spaces to align. Spaces here please.
>>
>>> +
>>> +EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
>>
>> modules.bbclass already sets KERNEL_PATH and KERNEL_SRC, perhaps you
>> could use one of those?
> 
> cryptodev Makefile does not use these it uses KERNEL_DIR in it's
> Makefile for whatever reason. Getting an upstream project to change is
> more difficult.

I think this is the second reference to KERNEL_DIR in an external module,
perhaps module.bbclass should add that to it's list of predefined names for
the STAGING_KERNEL_DIR.

> 
> Is changing upstream cryptodev is one thing (e.g. SUBDIR= vs. M=), how
> far do you want a patch to a Makefile to change the way a project
> builds?

Yeah, you're correct about the Makefile changes. I got carried away
during a rapid review.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


