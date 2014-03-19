Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4336EE66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 20:06:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2014 13:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,688,1389772800"; d="scan'208";a="503318492"
Received: from unknown (HELO [10.255.12.240]) ([10.255.12.240])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2014 13:06:51 -0700
Message-ID: <5329F8DB.8030306@linux.intel.com>
Date: Wed, 19 Mar 2014 13:06:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	"Stanacar, StefanX" <stefanx.stanacar@intel.com>
References: <1395189079-18831-1-git-send-email-sgw@linux.intel.com>
	<1395231830.31252.10.camel@firebird.rb.intel.com>
	<1803761.bM8W6F0XkC@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1803761.bM8W6F0XkC@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] testimage: dont use DNS lookup for qemu based testimages
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
X-List-Received-Date: Wed, 19 Mar 2014 20:06:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/19/2014 06:17 AM, Paul Eggleton wrote:
> On Wednesday 19 March 2014 12:23:37 Stanacar, StefanX wrote:
>> On Tue, 2014-03-18 at 17:31 -0700, Saul Wold wrote:
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>>
>>>   meta/classes/testimage.bbclass | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/meta/classes/testimage.bbclass
>>> b/meta/classes/testimage.bbclass index 691c7f6..ee028e1 100644
>>> --- a/meta/classes/testimage.bbclass
>>> +++ b/meta/classes/testimage.bbclass
>>> @@ -45,6 +45,16 @@ TESTIMAGEDEPENDS_qemuall =
>>> "qemu-native:do_populate_sysroot qemu-helper-native:d>
>>>   TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
>>>   TESTIMAGELOCK_qemuall = ""
>>>
>>> +IMAGE_POSTPROCESS_COMMAND_qemuall += "fix_dns_lookup_for_qemu"
>>> +
>>
>> I might be wrong, but this won't have any effect with the default
>> (manual) way we use testimage. The testimage class isn't in the global
>> inherit, so that  IMAGE_POSTPROCESS_COMMAND won't run as the image isn't
>> reconstructed.
>>
>> The AB does: bitbake core-image-sato on one step and then adds INHERIT
>> +="testimage" in local.conf in the next step and runs bitbake
>> core-image-sato -c testimage, no more do_rootfs here.
>>
>> As it this it will only work with testimage-auto when you have
>> TEST_IMAGE="1" in local.conf in the first build step so you only need to
>> do bitbake core-image-sato and do_testimage gets run after do_rootfs,
>> but we don't use this. And the fix should work for running the task
>> manually too.
>
> I have to say I agree; this is not the right fix.
>
Is there any reason that we can't include the INHERIT += "testimage" 
during the core build?

The other choice is to move the function into the openssh recipe and 
then the actual setting of the IMAGE_POSTPROCESS_COMMAND can happen in 
the local.conf or auto.conf


>> I liked v1, I don't really see what the problem was there. No mattter
>> the way you run our qemu images, you still have to set a proper DNS, and
>> have network connectivity in the image (which usually involves the host
>> too) so defaulting to UseDNS no for qemu images seems a sensible default
>> to me.
>
> Well, v1 was unconditional in the openssh recipe; I think it still needs to be
> just for qemuall.
>
It was originally for qemuall, but was also for all images and was to 
broad as some may not want it disabled in this way.

Further thoughts?

Sau!
> Cheers,
> Paul
>

