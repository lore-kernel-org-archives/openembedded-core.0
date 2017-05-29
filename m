Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C3C4F780AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 15:55:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 29 May 2017 08:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,415,1491289200"; d="scan'208";a="93146968"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 29 May 2017 08:55:56 -0700
To: Max Krummenacher <max.oss.09@gmail.com>
References: <20170526203537.30721-1-max.krummenacher@toradex.com>
	<cf075667-da8d-6b04-8cbb-a39fd3c0fcfa@linux.intel.com>
	<CAEHkU3VWN7gwy1pZYK6izb5V6kr6=s+9fCymb+Px==ZLRZi6-g@mail.gmail.com>
	<CAEHkU3VzMEsCgxwL_mc1MiAQ-1-Ks7WEhyz15T3OpzdpJ-C1+w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e9b75721-f3e3-7f3f-e781-58df67b4130a@linux.intel.com>
Date: Mon, 29 May 2017 18:54:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAEHkU3VzMEsCgxwL_mc1MiAQ-1-Ks7WEhyz15T3OpzdpJ-C1+w@mail.gmail.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Mon, 29 May 2017 15:55:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/29/2017 04:06 PM, Max Krummenacher wrote:
>>>> +-  # check if rpm contains a bundled berkeley db
>>>> +-  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H)
>>>> ++  set(HAVE_RPM_DB_H 0)
>>>
>>>
>>> Have you looked into what CHECK_INCLUDE_FILE does, and whether it can be
>>> fixed? I'd like to hear about your findings.
>>
>> Yes, I did.
>>
>> I creates a c file and tries to compile it with the CFLAGS specified
>> in CMaketext.
>>
>> <<<<<<<<
>> #include "rpm/db.h"
>> int main () {
>> return 0;
>> }
>>>>>>>>>>
>>
>> As we're talking about libsolv-native here it uses the build host's
>> gcc which has the standard include directory
>> /usr/include and thus finds a /usr/include/rpm/db.h
>>
>> And again, I do not think that it is an error to find/use headers from
>> the build host's /usr/include for a *-native
>> build.
>
> Maybe to add to 'can it be fixed?'
>
> As I said, IMHO it is not broken, but
> yes, one could pass an additional parameter to the compiler '-nostdinc'.
> CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H, "-nostdinc")
> But this would break the intention of the test on the not '-native'
> build as there
> the rpm headers whould actually be found in the standard include directories.
> So if OE ever would decide to change the rpm recipe to have an included db
> this would not be picked up by the test in the not '-native' tests.

I see. You are right here. I admit I don't fully understand if it's 
generally okay for -native recipes to look around in (and later use) 
host include  directories like that, as we're striving towards 
reproducible builds, and this behavior is not supportive of them. 
Richard, can we have your say please?

Alex


