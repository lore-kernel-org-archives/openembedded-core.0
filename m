Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 375C360204
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 03:42:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01E3fiWK007065
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 13 Feb 2020 19:41:54 -0800
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 13 Feb 2020 19:41:33 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1581619124-194740-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4NH98R-2YEK_G7xgn5JW8odimr5EPnm=Xg5qQPMmAxXQg@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <fd6182d5-1051-8101-a412-8b5d768c35b4@windriver.com>
Date: Fri, 14 Feb 2020 11:41:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4NH98R-2YEK_G7xgn5JW8odimr5EPnm=Xg5qQPMmAxXQg@mail.gmail.com>
X-Originating-IP: [128.224.162.175]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Fri, 14 Feb 2020 03:42:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thanks for your input.

Since the old one doesn't make it to next branch and the thread hasn't had following replies, I'll send v2 as a summary.

Zhe

On 2/14/20 4:45 AM, Bruce Ashfield wrote:
> On Thu, Feb 13, 2020 at 1:39 PM <zhe.he@windriver.com> wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> To make the native python3 are always used,
>>
>> - Move the substitution of /usr/bin/python3 to first, otherwise the
>>   possible original /usr/bin/python3 would be changed to
>>   /usr/bin/env python33.
>> - Add substitution for ${S}/scripts/
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  meta/recipes-kernel/perf/perf.bb | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index 6d1b066..14a9090 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -240,10 +240,17 @@ do_configure_prepend () {
>>
>>      # use /usr/bin/env instead of version specific python
>>      for s in `find ${S}/tools/perf/ -name '*.py'`; do
>> +        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
> Rather than messing around with the order of these, we should just
> combine them into a single sed invocation. When I started those
> substitutions, there weren't so many.
>
> As was mentioned in the other perf patch  and review:
>
> sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
>
> or some variant of the regex should fix them all.
>
>>          sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>>          sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>>          sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>> +    done
>> +
>> +    for s in `find ${S}/scripts/ -name '*.py'`; do
> It would be better to not have two loops doing the same thing, why not
> combine the two ? In the other review, the single script that was
> causing the problem was specifically pointed out .. and while I also
> agree that we can just substitute them all, technically, if we haven't
> run them, we don't know they are py3 safe.
>
> But minimally, getting them into a single for loop is something we
> should do (also part of that other patch/review).
>
> Bruce
>
>>          sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
>> +        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>> +        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>> +        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>>      done
>>
>>      # unistd.h can be out of sync between libc-headers and the captured version in the perf source
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


