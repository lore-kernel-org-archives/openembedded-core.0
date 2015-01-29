Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 434376013C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 21:13:15 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id b16so13680916igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 13:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=OD8h69SK0wG7R2CTpUs2WSTspyDYy/kqR8QGDfKhGig=;
	b=UVNFG+BjZCtsWktrEaSopBrCNjIiGxg8/zwDZ2RkZ6FmUJcnkl+VEb7npb4vGS8LLv
	vFxhG4SGVx8J8QABRlRbBBVmahYdT+P9uwIgxzJmi2H2uh2iTMGlZJos1YbzYequYZx1
	M6FjkyDMuCMtgzlHwYO6Rn+LdCNhF4I6g2knkH9bXzjIbWK1qqigZJycH78FwlKLzoeF
	YSkYq0pIyqhu3rGxnhpzx7z8FryA6orNVV4h0+ru6EE5e11U13SjnFSuI0n1G8Y0YM+6
	tjdVlSKWZupR342WslZnUZqMoe82uAX8krkrLTR44yJIgRkWBk0/UZx432qn1MbLrYjP
	h6CQ==
X-Received: by 10.70.130.205 with SMTP id og13mr3854620pdb.72.1422565996114;
	Thu, 29 Jan 2015 13:13:16 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:edf9:51d3:8122:c109?
	([2601:c:a700:272f:edf9:51d3:8122:c109])
	by mx.google.com with ESMTPSA id y2sm8677824pdm.31.2015.01.29.13.13.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jan 2015 13:13:14 -0800 (PST)
Message-ID: <54CAA268.80207@gmail.com>
Date: Thu, 29 Jan 2015 13:13:12 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1421597533-7850-1-git-send-email-Martin.Jansa@gmail.com>
	<20150129124118.GA2443@jama>
In-Reply-To: <20150129124118.GA2443@jama>
Subject: Re: [dizzy][PATCH] package.bbclass: Fix support for private libs
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
X-List-Received-Date: Thu, 29 Jan 2015 21:13:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

thanks for the reminder. I have pulled into my staging work.

-armin

On 01/29/2015 04:41 AM, Martin Jansa wrote:
> On Sun, Jan 18, 2015 at 05:12:13PM +0100, Martin Jansa wrote:
>> * n is a tuple since this commit:
>>    commit d3aa7668a9f001044d0a0f1ba2de425a36056102
>>    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>>    Date:   Mon Jul 7 18:41:23 2014 +0100
>>    Subject package.bbclass: Improve shlibs needed data structure
>>
>>    since then 'n in private_libs' was always false and private libs
>>    were always processed
>> * this is bad when we have libfoo in private libs, but also some package
>>    providing libfoo, that way we ship own libfoo.so, but together with
>>    runtime dependency on package providing libfoo
>
> ping
>
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta/classes/package.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 96d7fd9..4685cd2 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1572,7 +1572,7 @@ python package_do_shlibs() {
>>               # /opt/abc/lib/libfoo.so.1 and contains /usr/bin/abc depending on system library libfoo.so.1
>>               # but skipping it is still better alternative than providing own
>>               # version and then adding runtime dependency for the same system library
>> -            if private_libs and n in private_libs:
>> +            if private_libs and n[0] in private_libs:
>>                   bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n[0]))
>>                   continue
>>               if n[0] in shlib_provider.keys():
>> --
>> 2.2.1
>>
>
>
>

