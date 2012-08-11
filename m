Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T05LV-0006jC-8m
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 08:38:49 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 10 Aug 2012 23:26:56 -0700
Received: by pbcxa7 with SMTP id xa7so3989649pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 23:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=adtxiQN5E6oAoQIzZFsPYKVrgkLCLLQKT8aNfeH5LMw=;
	b=belTGq0NjiCOsBuWwFIaXOeQZ0Lra+iyj2/Rian+FkSiZdpDgmNYSshoKXXn1vTobD
	ccbNUiv5ox8F/w7eX/UVk6pe6VyJPtm2e5Kn9VHWzpkMt7GgKZBL8xtX5K4yGuXb98Y5
	djOFXYTHMvzCsUhXWVoEarr8xsRDZ5kabfYdbbTwpKbx3rUZHKHanYnEZtd1Q76Y/BF5
	q7sVgM/uREbkodJkS7a96A1/08cpJ6MEODQ/AqXDkF64DD+Rvs4LqACFVVQcxrtTwT6k
	vI+lZq91lvTY/wrxj8PNZgrE0HPbkWUqkOTc3SlSgWrbeVtXBhlnUkKseuu7kZDiqzBL
	7zwg==
Received: by 10.66.77.168 with SMTP id t8mr3789485paw.28.1344666416196;
	Fri, 10 Aug 2012 23:26:56 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id hx9sm802520pbc.68.2012.08.10.23.26.55
	(version=SSLv3 cipher=OTHER); Fri, 10 Aug 2012 23:26:55 -0700 (PDT)
Message-ID: <5025FB30.30307@intel.com>
Date: Fri, 10 Aug 2012 23:26:56 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1344655148.git.scott.a.garman@intel.com>
	<081e2a4154575d494f0f56f1b5e4ff70b93ca8e2.1344655148.git.scott.a.garman@intel.com>
	<CAMKF1so0GJfh7uotOMxMDH2dD4KBbTM1rnGpB6w5yrf9EOaYEw@mail.gmail.com>
In-Reply-To: <CAMKF1so0GJfh7uotOMxMDH2dD4KBbTM1rnGpB6w5yrf9EOaYEw@mail.gmail.com>
X-Gm-Message-State: ALoCoQmS1/mKAH7wcczECiemiaOtsBngb9k5GwCkHiLRnqPCuqBloPYZ5YFrr3xPODuoCYIlt1lM
Subject: Re: [PATCH 1/1] runqemu: support booting poky-tiny images
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
X-List-Received-Date: Sat, 11 Aug 2012 06:38:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2012 09:48 PM, Khem Raj wrote:
> On Fri, Aug 10, 2012 at 8:20 PM, Scott Garman <scott.a.garman@intel.com> wrote:
>> Added support for booting poky-tiny images, which do not have block
>> device support. Note to shut down a running poky-tiny image, you
>> need to include the -f option to the poweroff command.
>>
>> This fixes [YOCTO #2612].
>>
>> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>> ---
>>   scripts/runqemu          |    6 ++++++
>>   scripts/runqemu-internal |    5 +++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 7454dd4..6f2f861 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -26,6 +26,7 @@ usage() {
>>       echo "  KERNEL - the kernel image file to use"
>>       echo "  ROOTFS - the rootfs image file or nfsroot directory to use"
>>       echo "  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)"
>> +    echo "  TINY - specify 'tiny' if booting a poky-tiny image"
>
>
> you seem to be mixing poky distro with OE-Core here. As a whole the
> patch seems like adding support for ramfs based images. If you intend
> to just have images specific to poky then this patch
> belongs to [poky] but if you generalize it enough that non
> tiny users can also leverage this then it certainly is good
> for OE-Core.

Hi Khem,

I had a hunch I'd get called out for this. :)

I will respin by changing the "tiny" feature to "ramfs". I definitely 
don't want to see the runqemu script diverge between oe-core and poky.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


