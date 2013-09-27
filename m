Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1768760F09
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 14:45:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8REjNG0026762
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 07:45:23 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 27 Sep 2013 07:45:21 -0700
Message-ID: <52459A03.2000204@windriver.com>
Date: Fri, 27 Sep 2013 09:45:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>
References: <1380221559-25585-1-git-send-email-jslater@windriver.com>
	<5244CDA3.7080607@windriver.com>
In-Reply-To: <5244CDA3.7080607@windriver.com>
Cc: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [v2][PATCH 1/1] vala.bbclass: add dependency on vala
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
X-List-Received-Date: Fri, 27 Sep 2013 14:45:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/13 7:13 PM, Randy MacLeod wrote:
> On 13-09-26 02:52 PM, Joe Slater wrote:
>> This class points the inheritor, if it is a target,
>> to directories in the target sysroot, so we want to
>> be sure the .vapi files are there.
>>
>> Signed-off-by: Joe Slater <jslater@windriver.com>
>> ---
>>    meta/classes/vala.bbclass |    8 +++++---
>>    1 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
>> index c7db08c..3b70a04 100644
>> --- a/meta/classes/vala.bbclass
>> +++ b/meta/classes/vala.bbclass
>> @@ -1,9 +1,11 @@
>>    # Vala has problems with multiple concurrent invocations
>>    PARALLEL_MAKE = ""
>>
>> -# Vala needs vala-native
>> -DEPENDS += "vala-native"
>> -DEPENDS_virtclass-native += "vala-native"
>> +# Everyone needs vala-native and targets need vala, too,
>> +# because that is where target builds look for .vapi files.
>> +#
>> +VALADEPENDS_class-target = "vala"
>> +DEPENDS_append = " vala-native ${VALADEPENDS}"
>>
>>    # Our patched version of Vala looks in STAGING_DATADIR for .vapi files
>>    export STAGING_DATADIR
>>
>
>
> In response to your previous patch, Richard P said:
>> In class code this is a really bad idea. Why? Imagine a recipe which
>> does:
>>
>> DEPENDS =+ "x"
>> DEPENDS_class-native = "y"
>>
>> The += on the class-native above will not do what you think.
>>
>> I'd recommend something like:
>>
>> VALADEPENDS = "vala vala-native"
>> VALADEPENDS_class-native = "vala-native"
>> DEPENDS += "${VALADEPENDS}"
>>
>> Most other classes actually use _append on DEPENDS to ensure consistent
>> behaviour.
>
> so send it to oe-core and see what they say.
> Mark H any comments?

Good catch, I had missed this.

Ya the overrides (class-native) run -after- the rest of the system.  So:

DEPENDS = "foobar"
DEPENDS =+ "x"
DEPENDS_class-native =+ "y"

For "normal" it' would be "x foobar"
For "native" it would be "y"

This is because that system evals and gets:

DEPENDS = "foobar"  (DEPENDS = "foobar")
DEPENDS =+ "x"      (DEPENDS = "x foobar")
DEPENDS_class-native =+ "y"  (DEPENDS_class-native = "y")

invoke 'class-native' override,  DEPENDS = "y"

--Mark

> // Randy
>


