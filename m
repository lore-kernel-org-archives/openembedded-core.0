Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20BE872A78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 07:49:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G7n0iI008860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Sep 2015 00:49:00 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 00:49:00 -0700
Message-ID: <55F91EEA.8040005@windriver.com>
Date: Wed, 16 Sep 2015 15:48:58 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20150910160557.GD2387@jama>	<1442294991-12427-1-git-send-email-Martin.Jansa@gmail.com>
	<55F7B25B.6030801@windriver.com>
In-Reply-To: <55F7B25B.6030801@windriver.com>
Subject: Re: [PATCH][master][fido][dizzy] Revert "perf: fix for rebuilding"
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
X-List-Received-Date: Wed, 16 Sep 2015 07:49:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Martin,

I've figured out the reason, this is because the task's default cwd
is ${B}, the easier way to fix the problem is use mkdir -p rather than
mkdir, autotools.bbclass also has this problem, but I'd like to fix
exec_func, I will send a patch to bitbake-devel after more testing.

// Robert

On 09/15/2015 01:53 PM, Robert Yang wrote:
>
> Hi Martin,
>
> Sorry, I'm blocked by mutitlib SDK issues recently, I will fix it sooner.
> Revert the patch is fine to me if it is urgent.
>
> // Robert
>
> On 09/15/2015 01:29 PM, Martin Jansa wrote:
>> * This reverts commit 9dafa571ed0a40d21a886dec7704c31150b21942.
>>
>> * The "fix" is causing more issues then it's fixing and there was no
>>    feedback in many months.
>> * More info:
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2015-June/105684.html
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2015-September/109870.html
>>
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2015-September/110338.html
>>
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta/recipes-kernel/perf/perf.bb | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index adb3a2c..f1d7894 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -118,10 +118,6 @@ do_install() {
>>   }
>>
>>   do_configure_prepend () {
>> -    # Fix for rebuilding
>> -    rm -rf ${B}/
>> -    mkdir ${B}/
>> -
>>       # If building a multlib based perf, the incorrect library path will be
>>       # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a
>> 32 bit
>>       # build, with a 64 bit multilib, the arch won't match and the detection
>> of a
>>

