Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 78A796DA62
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 02:41:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAF2f0SW007045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Nov 2013 18:41:00 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 14 Nov 2013 18:41:00 -0800
Message-ID: <528589C5.8050107@windriver.com>
Date: Fri, 15 Nov 2013 10:41:09 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1384433183.git.Qi.Chen@windriver.com>
	<a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>
	<1384434732.6460.121.camel@ted>
In-Reply-To: <1384434732.6460.121.camel@ted>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Fri, 15 Nov 2013 02:41:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2013 09:12 PM, Richard Purdie wrote:
> On Thu, 2013-11-14 at 21:07 +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> TMPDIR must be an absolute path, otherwise, the build will fail.
>> Special characters in TMPDIR will also cause build failures.
>>
>> This patch enables checking for the validity of TMPDIR.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/sanity.bbclass |    7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index 83378b0..e45906e 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -672,6 +672,13 @@ def check_sanity_everybuild(status, d):
>>           with open(checkfile, "w") as f:
>>               f.write(tmpdir)
>>   
>> +    # Check if TMPDIR contains invalid characters, and check if it is an absolute path
>> +    valid_tmpdir_regexp = "^/[a-zA-Z0-9\-_/.~]+$"
>> +    import re
>> +    valid_pattern = re.compile(valid_tmpdir_regexp)
>> +    if not valid_pattern.match(tmpdir):
>> +        status.addresult("Error, you have special characters in TMPDIR directory path or your TMPDIR is not an absolute path. The TMPDIR should match the this regexp: ^/[a-zA-Z0-9\-_/.~]$")
>> +
> I'm ok with the check itself however this does not need to be run every
> build. It needs to run when tmpdir changes only.
>
> Cheers,
>
> Richard
>
>
>
>

Thanks for pointing it out.

I've changed the logic a little bit.
1. Create the directory hierarchy for TMPDIR only if TMPDIR is valid
2. Handle ABI version change only if TMPDIR has been created.

So only when we had a valid TMPDIR for last build and this time the 
TMPDIR hasn't changed location, we don't check the validity for TMPDIR.

I've sent out  a V2.

Best Regards,
Chen Qi

