Received: from ford.bithub.de (ford.bithub.de [159.69.22.172])
 by mx.groups.io with SMTP id smtpd.web08.10739.1629031863604336696
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 05:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bithub.de header.s=ford header.b=UFSFxKV2;
 spf=pass (domain: bithub.de, ip: 159.69.22.172, mailfrom: philip@bithub.de)
Received: from [192.168.188.56] (x4db4887a.dyn.telefonica.de [77.180.136.122])
	by ford.bithub.de (Postfix) with ESMTPSA id 25A471FACB;
	Sun, 15 Aug 2021 14:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bithub.de; s=ford;
	t=1629031854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HA51biVP7BQQnnzNWgaUG+Xn+eQVvbrBfLH5hzK0UkM=;
	b=UFSFxKV2wu/5lKiXuaDUjhHzCraQbVb9SPGxLWnrlFYxFRIWNw50RMxYalWWvpcr2JIkiS
	8IAExD7HOHyAukri2HilBcOJSaMGzLb1fYoFK2vQvqo9wF7uvBAVyWlNwGr/9zL3mHvcQq
	pszsNSn5bNp35vhfgN3kghmpKDdCITVzG3YudI4mzwtD3efUo8kkNXZtH4vcl5qf+vyL6l
	r3hFHFjjqH71Sc9rm/BPoqlpJZ2X/zR46mjpXx/4tUPYEz1lk/xUij0quUqvHU9KpqcT4C
	a69oaFuhlOnoAMLqCa7OgbSZPgFtEAM0ZIOIfdssNcXJFNuFccnQu4nxf2lsIg==
Subject: Re: [OE-core] [pseudo][PATCH] test: Add missing test-statx test case
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
References: <20210811164132.74849-1-philip@bithub.de>
 <20210811171925.GA15765@mcrowe.com>
From: "Philip Lorenz" <philip@bithub.de>
Message-ID: <1da17950-2f3b-632f-44ec-35feaef70ce8@bithub.de>
Date: Sun, 15 Aug 2021 14:50:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811171925.GA15765@mcrowe.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large

On 11.08.21 19:19, Mike Crowe wrote:
> On Wednesday 11 August 2021 at 18:41:32 +0200, Philip Lorenz wrote:
>> Adding this test case was erroneously omitted in
>> 7c722296879906fe093e1e7c4b7537e150d492cd.
>>
>> Signed-off-by: Philip Lorenz <philip@bithub.de>
>> ---
>>   test/test-statx.c  | 20 ++++++++++++++++++++
>>   test/test-statx.sh |  6 ++++++
>>   2 files changed, 26 insertions(+)
>>   create mode 100644 test/test-statx.c
>>   create mode 100755 test/test-statx.sh
>>
>> diff --git a/test/test-statx.c b/test/test-statx.c
>> new file mode 100644
>> index 0000000..06d86af
>> --- /dev/null
>> +++ b/test/test-statx.c
>> @@ -0,0 +1,20 @@
>> +/*
>> + * Test that passing NULL to a parameter marked as nonnull works correctly
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + */
>> +#define _GNU_SOURCE
>> +
>> +#include <sys/stat.h>
>> +#include <unistd.h>
>> +#include <fcntl.h>
>> +
>> +// Passing a null pointer is the test scenario
>> +#pragma GCC diagnostic ignored "-Wnonnull"
>> +
>> +int main(void) {
>> +    if (statx(0, NULL, 0, 0, NULL) != -1) {
>> +        return 1;
>> +    }
>> +    return 0;
>> +}
>> diff --git a/test/test-statx.sh b/test/test-statx.sh
>> new file mode 100755
>> index 0000000..77d0302
>> --- /dev/null
>> +++ b/test/test-statx.sh
>> @@ -0,0 +1,6 @@
>> +#!/bin/bash
>> +#
>> +# SPDX-License-Identifier: LGPL-2.1-only
>> +#
>> +
>> +exec ./test/test-statx
>> -- 
>> 2.32.0
> Applying this patch (along with <169A4FE272BB166C.28384@lists.openembedded.org>)
> makes all the tests pass for me. However, the run of test-statx.sh causes:
>
>   couldn't allocate absolute path for '(null)'.
>
> to be printed.

The test explicitly tests whether a NULL path does not segfault when 
compiled with newer GCC releases (which was fixed in 
7c722296879906fe093e1e7c4b7537e150d492cd). As such the observed error 
message is "intended". It may however make sense to special case NULL 
parameters in pseudo_root_path.

Philip

