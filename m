Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF5476B7D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 13:37:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7FDbX0b002095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Aug 2013 06:37:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 15 Aug 2013 06:37:32 -0700
Message-ID: <520CD99C.3030702@windriver.com>
Date: Thu, 15 Aug 2013 08:37:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-4-git-send-email-mark.hatle@windriver.com>
	<3913312.dVjBbQiR11@helios>
In-Reply-To: <3913312.dVjBbQiR11@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/11] package_rpm.bbclass: Add support for PACKAGE_EXCLUDE to RPM installs
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
X-List-Received-Date: Thu, 15 Aug 2013 13:37:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/13 7:01 AM, Paul Eggleton wrote:
> On Wednesday 14 August 2013 15:30:01 Mark Hatle wrote:
>> Using the new smart exclude mechanism an error will be generated in the
>> excluded package is required for the image to be generated.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/classes/package_rpm.bbclass | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/classes/package_rpm.bbclass
>> b/meta/classes/package_rpm.bbclass index 324d83f..74ae0ed 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -356,6 +356,11 @@ EOF
>>   		smart --data-dir=${target_rootfs}/var/lib/smart config --set
>> rpm-extra-macros._var=${localstatedir} smart
>> --data-dir=${target_rootfs}/var/lib/smart config --set
>> rpm-extra-macros._tmppath=/install/tmp package_write_smart_config
>> ${target_rootfs}
>> +		# Do the following configurations here, to avoid them being saved for
>> field upgrade
>> +		for i in ${PACKAGE_EXCLUDE}; do
>> +			smart --data-dir=$1/var/lib/smart flag --set exclude-packages $i
>> +		done
>
> IMO, it would be correct to persist these exclusions into the runtime
> configuration. Not doing so is inconsistent with the behaviour of
> BAD_RECOMMENDATIONS, and it means that if you do an upgrade or an install on
> the target, these excluded packages can sneak back in which I would think
> would not be desirable unless the user explicitly turns off the exclusion.
> Clearing the flag if it were persisted is easy to do with smart.

(I spoke w/ Paul on IRC about this briefly yesterday.. so this is more a recap 
for the mailing list.)

The deb and ipk implementation of the exclude packages makes them transient.  If 
we want consistent behavior, we'll likely need to change the deb/apt-get pin 
file to make them persistent... and for ipk, I'm not exactly sure how to do 
this.  We're not saving the list of excluded files anywhere.

If a difference in behavior between the packaging systems is acceptable, then 
moving the rpm(smart) exclude code should be fairly easy to make persistent.

HOWEVER, I'm not sure we really want it to be persistent.  Just because the 
initial image generation may have skipped specific files, doesn't necessarily 
mean they should be skipped on the target (field/user upgrade scenario).  If we 
do persist them, we need to somehow make it clear to the end user how to clear 
the setting(s) as well, and that isn't always very obvious.

Both positions may be negated by the fact these are embedded systems, and in 
many cases simply don't end up with a package database on the target.  So it 
doesn't really matter in those cases.  It's more the specialized case where 
field upgrade / additional field software install could happen.

Does anyone else have opinions on this?  I can certainly see reasons for both, 
but I'm not sure if one is more appropriate then the other at this point.

--Mark

> Cheers,
> Paul
>


