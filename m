Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4010478317
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 21:24:00 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 20 Jul 2017 14:24:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,386,1496127600"; d="scan'208";a="110226993"
Received: from jalamego-mobl3.zpn.intel.com (HELO [10.219.128.123])
	([10.219.128.123])
	by orsmga004.jf.intel.com with ESMTP; 20 Jul 2017 14:24:02 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: OE-core <openembedded-core@lists.openembedded.org>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-3-git-send-email-jose.a.lamego@linux.intel.com>
	<CAJTo0LZEF_O3Evumo1+YQ8kpjt=FpTqszfg0704B45GXFHNYVA@mail.gmail.com>
	<a2fd37e9-cc6d-b323-09d4-267dbdd0e5f5@linux.intel.com>
Message-ID: <366a1622-dbf0-2d1d-40c9-45c25087d9df@linux.intel.com>
Date: Thu, 20 Jul 2017 16:24:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a2fd37e9-cc6d-b323-09d4-267dbdd0e5f5@linux.intel.com>
Subject: Re: [PATCH 2/2] bc: upgrade 1.06 to 1.07.1
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
X-List-Received-Date: Thu, 20 Jul 2017 21:24:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 05/19/2017 02:17 PM, Jose Lamego wrote:
>
> On 05/19/2017 10:25 AM, Burton, Ross wrote:
>> On 18 May 2017 at 23:28, Jose Lamego <jose.a.lamego@linux.intel.com
>> <mailto:jose.a.lamego@linux.intel.com>> wrote:
>>
>>     bc recipe must be upgraded to latest version in upstream.
>>
>>     bc license changed from "GPLv2+ & LGPLv2.1" to "GPLv3+ & LGPLv3"
>>     The new version exhibits a Parallel Make Race that required
>>     unsetting PARALLEL_MAKE variable.
>>     This change was tested with core-image-minimal in qemux86.
>>
>>
>> It would be appreciated if you could spend a few minutes looking at what
>> the build race is and pushing a fix upstream.  Or at least include a
>> comment showing the failure.
>>
>> I chased the sed thing as previous releases didn't need it: my build
>> machine doesn't even have ed installed so HOSTTOOLS won't help.  This
>> appears to be a regression as 1.06 shipped the file that needs ed to
>> build.  The makefile now always builds a binary to generate a file that
>> it then runs through ed, and it doesn't build this tool correctly in a
>> cross environment either:
>>
>> | /bin/bash: ./fbc: cannot execute binary file: Exec format error
>>
>> (it's trying to run an arm binary on x86)
>>
>> I'd suggest that we approach the upstream maintainer and discuss:
>> 1) should the tarballs ship libmath.h instead of requiring it to be
>> generated
>> 2) using CC_FOR_BUILD etc from autoconf-archive to build fbc with the
>> host compiler in cross-compile environments
>> 3) can sed be used instead of ed to reduce the host requirements
>>
>> Ross
> Agree. I will contact the bc maintainer and work on the build race. I'll
> get back to you with the findings. Thanks for the suggestions!
>
Update: bc maintainer is working on version 1.07.2, which includes fixes
for the ed and fbc errors and the Parallel Make race. This upgrade will
be released soon, so we may skip 1.07.1 upgrade and wait for the new
stable release.

-- 
Jose Lamego | OTC Embedded Platform & Tools | GDC


