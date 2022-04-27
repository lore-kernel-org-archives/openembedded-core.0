Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <38e3b167-c996-2c03-a1b4-fba72049a826@gmail.com>
Date: Wed, 27 Apr 2022 19:29:51 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] staging: Ensure we filter out ourselves
References: <20220427152354.2824313-1-richard.purdie@linuxfoundation.org>
 <ac98c29b-ecd8-5dc4-12bc-d60f770fb58d@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
In-Reply-To: <ac98c29b-ecd8-5dc4-12bc-d60f770fb58d@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Joshua Watt <JPEWhacker@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core@lists.openembedded.org

On 4/27/22 17:25, Joshua Watt wrote:
> Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
> 
> On 4/27/22 10:23, Richard Purdie wrote:
>> Adding a dependency on ourselves in this function doesn't make sense,
>> the hash
>> may change after hash equivalence is applied. Other code using
>> BB_TASKDEPDATA does
>> handle the self reference correctly (which is there for a reason),
>> update this
>> code to do likewise.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/classes/staging.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
>> index ab827766bef..9fc8f4f2839 100644
>> --- a/meta/classes/staging.bbclass
>> +++ b/meta/classes/staging.bbclass
>> @@ -651,7 +651,7 @@ python target_add_sysroot_deps () {
>>       taskdepdata = d.getVar("BB_TASKDEPDATA", False)
>>       deps = {}
>>       for dep in taskdepdata.values():
>> -        if dep[1] == "do_populate_sysroot" and not
>> dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0]:
>> +        if dep[1] == "do_populate_sysroot" and not
>> dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0]
>> and dep[0] != pn:
>>               deps[dep[0]] = dep[6]
>>         d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k,
>> deps[k]) for k in sorted(deps.keys())))
>>

Thanks Richard/Joshua. With the patch applied everything behaves nicely
here again.

Jacob
