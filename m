Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RHA23-0002Oa-Pk
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:00:49 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Oct 2011 00:54:49 -0700
Received: by wyg24 with SMTP id 24so3684910wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 00:54:48 -0700 (PDT)
Received: by 10.216.198.213 with SMTP id v63mr697153wen.98.1319183684787;
	Fri, 21 Oct 2011 00:54:44 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id l42sm1238098wbn.16.2011.10.21.00.54.41
	(version=SSLv3 cipher=OTHER); Fri, 21 Oct 2011 00:54:43 -0700 (PDT)
Message-ID: <4EA12540.9020002@intel.com>
Date: Fri, 21 Oct 2011 00:54:40 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
References: <66cdd5054e220fcce980222ed68a2afc37f614af.1318984111.git.nitin.a.kamble@intel.com>
	<35417d38f61615445ed0c4d875e0bd0aa5649af4.1318984111.git.nitin.a.kamble@intel.com>
	<4E9FD2B2.5000508@intel.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E32D2390@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E32D2390@orsmsx504.amr.corp.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: also generate the libgmpcxx library
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
X-List-Received-Date: Fri, 21 Oct 2011 08:00:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2011 11:04 PM, Kamble, Nitin A wrote:
>
>
>> -----Original Message-----
>> From: Saul Wold [mailto:saul.wold@intel.com]
>> Sent: Thursday, October 20, 2011 12:50 AM
>> To: Patches and discussions about the oe-core layer
>> Cc: Kamble, Nitin A
>> Subject: Re: [OE-core] [PATCH 2/6] gmp: also generate the libgmpcxx
>> library
>>
>> On 10/18/2011 05:30 PM, nitin.a.kamble@intel.com wrote:
>>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>>
>>> configure runs few checks to make sure c++ compiler and runtime are
>> working as expected
>>> with the --enable-cxx=detect option.
>>>
>> Somehow this change has also changed what the gmp package provides,
>> before this change the package provided libgmp10 via PKG_gmp: libgmp10,
>> after this change, the libgmp10 is no longer provided and causes other
>> breakage.
>>
>> The example case I found was a coreutils package that was built prior
>> to
>> this change failed to fulfill it's dependencies after this change when
>> creating an image.  If I rebuild coreutils with the newer gmp build,
>> then all is well, I think we need to understand this better before
>> making this change.
>>
>> Did something else change in the packaging that would cause use to look
>> the mapping above?
>>
> Saul,
>    In my testing I did not get any of these issues you mentioned above.
>
> Also I tried to reproduce the issue with coreutils as mentioned above, and I can not reproduce the issue for creations of an image. Can you verify the issue one more time?
>
Just to confirm, did you have a build of coreutils prior to your gmp 
changes? Which image did you build?  Be sure you build an image that 
includes coreutils, such at an -sdk image.

I can easily reproduce this issue.

Sau!

> Thanks,
> Nitin
>
>>
>> Sau!
>>
>>
>>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>>> ---
>>>    meta/recipes-support/gmp/gmp.inc      |    2 ++
>>>    meta/recipes-support/gmp/gmp_4.2.1.bb |    2 +-
>>>    meta/recipes-support/gmp/gmp_5.0.2.bb |    2 +-
>>>    3 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-
>> support/gmp/gmp.inc
>>> index 66349e6..3c662a0 100644
>>> --- a/meta/recipes-support/gmp/gmp.inc
>>> +++ b/meta/recipes-support/gmp/gmp.inc
>>> @@ -14,3 +14,5 @@ ARM_INSTRUCTION_SET = "arm"
>>>    acpaths = ""
>>>
>>>    BBCLASSEXTEND = "native nativesdk"
>>> +
>>> +EXTRA_OECONF += " --enable-cxx=detect"
>>> diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-
>> support/gmp/gmp_4.2.1.bb
>>> index 74da6b8..97ac4b2 100644
>>> --- a/meta/recipes-support/gmp/gmp_4.2.1.bb
>>> +++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
>>> @@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
>>>    LIC_FILES_CHKSUM =
>> "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
>>>
>> file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
>>>                        file://gmp-
>> h.in;startline=6;endline=21;md5=5e25ffd16996faba8c1cd27b04b16099"
>>> -PR = "r0"
>>> +PR = "r1"
>>>
>>>    SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
>>>               file://disable-stdc.patch"
>>> diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bb b/meta/recipes-
>> support/gmp/gmp_5.0.2.bb
>>> index 03fef45..f80971e 100644
>>> --- a/meta/recipes-support/gmp/gmp_5.0.2.bb
>>> +++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
>>> @@ -2,7 +2,7 @@ require gmp.inc
>>>    LICENSE="LGPLv3&GPLv3"
>>>    LIC_FILES_CHKSUM =
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>>>
>> file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
>>> -PR = "r0"
>>> +PR = "r1"
>>>
>>>    SRC_URI_append += "file://sh4-asmfix.patch \
>>>                       file://use-includedir.patch "
>



