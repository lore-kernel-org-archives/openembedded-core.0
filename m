Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S5hS1-0002y6-NG
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 18:48:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q28Hdn0N009289
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 09:39:49 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 8 Mar 2012 09:39:47 -0800
Message-ID: <4F58EEDF.70101@windriver.com>
Date: Thu, 8 Mar 2012 11:39:43 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1331107546.git.dvhart@linux.intel.com>
	<83eeb4ed11a6a63abda1f3978c849a46516b92a1.1331107546.git.dvhart@linux.intel.com>
	<AE0C8B23-EB0D-4DD3-9BF9-22BAEB66969F@dominion.thruhere.net>
	<4F579506.90805@linux.intel.com>
In-Reply-To: <4F579506.90805@linux.intel.com>
Subject: Re: [PATCH 1/1] kernel.bbclass: Remove warnings for modutils and modprobe.d
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2012 17:48:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/7/12 11:04 AM, Darren Hart wrote:
>
>
> On 03/07/2012 12:21 AM, Koen Kooi wrote:
>>
>> Op 7 mrt. 2012, om 09:06 heeft Darren Hart het volgende geschreven:
>>
>>> Fixes [Yocto #2036]
>>>
>>> The source and build directories are unused, remove them.
>>>
>>> The modutils and modprobe.d directories may be used if modules are built that
>>> are either autoloaded or have modprobe.d entries. This isn't known at install
>>> time, so check after the package split if these directories are empty and
>>> remove them if they are.
>>>
>>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>>> CC: Paul Eggleton<paul.eggleton@linux.intel.com>
>>> ---
>>> meta/classes/kernel.bbclass |   10 ++++++++++
>>> 1 files changed, 10 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 8fbec90..169df33 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -105,6 +105,8 @@ kernel_do_install() {
>>> 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
>>> 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
>>> 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
>>> +		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>>> +		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
>>
>> How do you want to support on-target building of exernal modules?
>
> That is an open issue that needs to be addressed, but we don't install
> the build or source directories now (unless I'm missing something), so
> these are links to nowhere at the moment.
>
> We do have a bug open to support on-target module building. I supect
> we'll need to add these as part of a headers package or similar. So
> these may come back.
>

Just as a note..  headers package(s) are the wrong way to support kernel modules 
compilation on the target.  You really need to supply a configured kernel source 
tree --- often you can dump the .c files though.  Kernel headers (for module 
compilation) and userspace are often intentionally different.. and people get 
this confused often.  (I can't express how often I've had to convince someone 
that, no you can't guaranty a working kernel module from the stuff in /usr/include!)

The right approach is to provide, as part of the kernel itself, a source 
tree/headers package tha installes into the 
"{D}/lib/modules/${KERNEL_VERSION}/source" (or similar) directory, and instruct 
people to use that location when building kernel modules on the target.

--Mark


