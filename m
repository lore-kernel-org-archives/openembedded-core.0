Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA596D8FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 08:15:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0T8Fr1A013429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 00:15:53 -0800 (PST)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 29 Jan 2014 00:15:53 -0800
Message-ID: <52E8B8B6.3070408@windriver.com>
Date: Wed, 29 Jan 2014 16:15:50 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
References: <1389257340-16166-1-git-send-email-ming.liu@windriver.com>
	<52CEE4F2.7050409@windriver.com> <52E8751D.50101@windriver.com>
In-Reply-To: <52E8751D.50101@windriver.com>
X-Originating-IP: [128.224.162.153]
Subject: Re: [PATCH] rpm: fix a endian incompatible error in generating tag
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
X-List-Received-Date: Wed, 29 Jan 2014 08:15:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2014 11:27 AM, Ming Liu wrote:
> On 01/10/2014 02:05 AM, Mark Hatle wrote:
>> On 1/9/14, 2:49 AM, Ming Liu wrote:
>>> A flaw was found in the way rpm generating arbitrary tags, which 
>>> leads to a
>>> incorrect query result, this issue is introduced by a incompatible 
>>> endianess
>>> when the generating process is executed on different architectures.
>>>
>>> This patch resolves it by taking a uniform byte order.
>>>
>>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>>> ---
>>>   .../rpm-tag-generate-endian-conversion-fix.patch   |   29 
>>> ++++++++++++++++++++
>>>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
>>>   2 files changed, 30 insertions(+), 0 deletions(-)
>>>   create mode 100644 
>>> meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
>>>
>>> diff --git 
>>> a/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch 
>>> b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch 
>>>
>>> new file mode 100644
>>> index 0000000..4379515
>>> --- /dev/null
>>> +++ 
>>> b/meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
>>> @@ -0,0 +1,29 @@
>>> +fix a endian incompatible error in generating rpm tag
>>> +
>>> +A flaw was found in the way rpm generating arbitrary tags, which 
>>> leads to a
>>> +incorrect query result, this issue is introduced by a incompatible 
>>> endianess
>>> +when the generating process is executed on different architectures.
>>> +
>>> +This patch resolves it by taking a uniform byte order.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
>>> +---
>>> + tagname.c |    3 +++
>>> + 1 file changed, 3 insertions(+)
>>> +
>>> +diff -urpN a/rpmdb/tagname.c b/rpmdb/tagname.c
>>> +--- a/rpmdb/tagname.c
>>> ++++ b/rpmdb/tagname.c
>>> +@@ -152,7 +152,10 @@ static rpmTag _tagGenerate(const char *s
>>> +     xx = rpmDigestUpdate(ctx, s, nb);
>>> +     xx = rpmDigestFinal(ctx, &digest, &digestlen, 0);
>>> +     if (digest && digestlen > 4) {
>>> ++    /* The tag is stored in a uniform byte order for cross-endian 
>>> compatibility.
>>> ++       Swap to little-endian if appropriate. */
>>> +     memcpy(&tag, digest + (digestlen - 4), 4);
>>> ++    tag = htole32(tag);
>>> +     tag = (rpmTag) (tag & 0x3fffffff);
>>> +     tag = (rpmTag) (tag | 0x40000000);
>>
>> The above code doesn't look right to me.
>>
>> If this is reading in from the RPM package, it should be an le32toh..
>>
>> Otherwise if it's generating the digest info.. then the htole32 
>> should be -after- the & and | operations, otherwise the wrong part of 
>> the value will be modified.
>
> Hi, Mark:
>
> I just saw your comments, sorry for the late feedback.
> I'd like to explain it more that _tagGenerate is called at both 
> reading and generating sides, so either of your recommended resolves 
> only one side of it based on my test, the tag is being counted as a 
> number with later & or | operator, but before that, we should transfer 
> it to a number with uniform byte order(big or little endian) after we 
> get it from a piece of memory, which in this case is the last 4 bytes 
> of digest, please think about the following scenario:
>
> x86 host (generating and querying)  -->  powerpc/mips (querying)
>
> Using le32toh or putting htole32 after the & and | operations both 
> will not satisfy it - to get a same result.
Despite the discussion above,  I found another concern with my patch 
that 'htole32' is not supported by libc of some system, like CentOS, 
which leads rpm-native fail to compile with my patch, so please ignore 
this so far, I will make a new patch soon.

//Ming Liu
>
> //Ming Liu
>
>>
>> --Mark
>>
>>> +     }
>>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb 
>>> b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>>> index 9d376a5..7921f40 100644
>>> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>>> @@ -89,6 +89,7 @@ SRC_URI = 
>>> "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>>> file://debugedit-valid-file-to-fix-segment-fault.patch \
>>>          file://rpm-platform-file-fix.patch \
>>>          file://rpm-lsb-compatibility.patch \
>>> +       file://rpm-tag-generate-endian-conversion-fix.patch \
>>>         "
>>>
>>>   # Uncomment the following line to enable platform score debugging
>>>
>>
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


