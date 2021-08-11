Received: from ford.bithub.de (ford.bithub.de [159.69.22.172])
 by mx.groups.io with SMTP id smtpd.web11.10250.1628700212346395847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 09:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bithub.de header.s=ford header.b=RvoE0Tj4;
 spf=pass (domain: bithub.de, ip: 159.69.22.172, mailfrom: philip@bithub.de)
Received: from [192.168.188.36] (x4db4214e.dyn.telefonica.de [77.180.33.78])
	by ford.bithub.de (Postfix) with ESMTPSA id 3BA961FCC5;
	Wed, 11 Aug 2021 18:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bithub.de; s=ford;
	t=1628700210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClwUiqz/I0mqbrnFhbWlSctO4BDi9tFd1OjHUYHW+9E=;
	b=RvoE0Tj48jZ56byyRsxl7ktC3uGAsmGUuBCvIThLE6hkCsyJFRxx/diq7fTYydaOmRnJ0g
	0NQOyBLsFj7OO37V9hELoUzj0gXhCaV2Ca48D9LfkIHfDhxJ8yYC2CHg7hxFEW+KrGz/ZL
	kOSQXOeQMO1SCpN35+a3mSZaVvSXq1i+sLxf6gsjoM7DC2pEL/VZNUN8omE6+xixEVSXbM
	Rihy6q1RlVzMozvLPKiYOUDMEOo3nyXThB3mnDGhd7C1I3T8/4hCFuYMmCy5hO1P/5rmEO
	L3LmeoKa208ptWnFD33gDIBN1Mo/IzbGKZLuU1AC3BVwE0OmDp3asdu1XFu/jA==
Subject: Re: [OE-core] [pseudo][PATCH] makewrappers: Handle parameters marked as nonnull
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
References: <20210517192506.48088-1-philip@bithub.de>
 <20210811162522.GA9259@mcrowe.com>
From: "Philip Lorenz" <philip@bithub.de>
Message-ID: <87eda11b-e544-ed39-b9be-234c64bd5b43@bithub.de>
Date: Wed, 11 Aug 2021 18:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811162522.GA9259@mcrowe.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large

Hi Mike,

On 11.08.21 18:25, Mike Crowe wrote:
> On Monday 17 May 2021 at 21:25:06 +0200, Philip Lorenz wrote:
>> Commit 60e25a36558f1f07dcce1a044fe976b475bec42b started dereferencing
>> the "path" parameter which for some functions is annotated with the
>> "nonnull" attribute. While the commit explicitly checks for NULL
>> pointers before dereferencing it, GCC (at optimization level 1 and
>> above) removes the check due to the "nonnull" attribute being set for
>> some parameters in the glibc headers (e.g. statx()).
>>
>> However, the statx() man page explicitly allows calling with NULL
>> pointers (in which case the EFAULT is returned) and this behaviour is
>> used in the wild (e.g. in Rust) to determine whether the statx() system
>> call is supported.
>>
>> Disabling the optimization is not possible ([1]) so prevent the compiler
>> optimization by referencing the parameter in a noop inline assembly
>> instruction instead.
>>
>> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100404
>>
>> Signed-off-by: Philip Lorenz <philip@bithub.de>
>> ---
>>   Makefile.in        |  2 ++
>>   makewrappers       |  6 +++++-
>>   test/test-fstat.c  | 29 +++++++++++++++++++++++++++++
>>   test/test-fstat.sh |  8 ++++++++
>>   4 files changed, 44 insertions(+), 1 deletion(-)
>>   create mode 100644 test/test-fstat.c
>>   create mode 100755 test/test-fstat.sh
>>
>> diff --git a/Makefile.in b/Makefile.in
>> index cf13010..10441ef 100644
>> --- a/Makefile.in
>> +++ b/Makefile.in
>> @@ -77,6 +77,8 @@ all: $(LIBPSEUDO) $(PSEUDO) $(PSEUDODB) $(PSEUDOLOG) $(PSEUDO_PROFILE)
>>   test: all | $(BIN) $(LIB) $(LOCALSTATE)
>>   	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-rename-fstat test/test-rename-fstat.c
>>   	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-openat test/test-openat.c
>> +	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-statx test/test-statx.c
> The test/test-stax.c file wasn't included in the patch, which means that
> "make test" no longer works on the current pseudo oe-core branch. :(
> Perhaps this went unnoticed since it's necessary to run configure again for
> the Makefile to be regenerated to see the problem.
>
> Do you still have the file, or should I just submit a change to remove this
> line?

My bad - I must've forgotten to stage it. Just resent the missing test 
case in "[pseudo][PATCH] test: Add missing test-statx test case".

Philip

