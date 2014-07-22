Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4400D6AC77;
	Tue, 22 Jul 2014 13:51:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6MDpgir000343
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jul 2014 06:51:43 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 22 Jul 2014 06:51:42 -0700
Message-ID: <53CE6C67.4000405@windriver.com>
Date: Tue, 22 Jul 2014 09:51:35 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20140618094425.8523A504AA@opal.openembedded.org>
	<20140720140213.GA12193@jama>
In-Reply-To: <20140720140213.GA12193@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : lttng-modules: update to 2.4.1-stable latest
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
X-List-Received-Date: Tue, 22 Jul 2014 13:51:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-07-20 10:02 AM, Martin Jansa wrote:
> On Wed, Jun 18, 2014 at 09:44:25AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: bb304f306c0f6ee496a75a67c0bb8a6c1e41ddf2
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=bb304f306c0f6ee496a75a67c0bb8a6c1e41ddf2
>>
>> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Date:   Tue Jun 17 21:29:51 2014 -0400
>>
>> lttng-modules: update to 2.4.1-stable latest
>>
>> The 3.15, and 3.14.5+ kernels introduced a change to trace_block_rq_complete,
>> which triggers the following build error:
>>
>>      probes/../instrumentation/events/lttng-module/../../../probes/lttng-events.h:151:6:
>>      error: conflicting types for 'trace_block_rq_complete'
>>      |  void trace_##_name(_proto);
>>      |       ^
>>      |
>>      probes/../instrumentation/events/lttng-module/../../../probes/lttng-events.h:117:2:
>>      note: in expansion of macro 'DEFINE_EVENT_MAP'
>>      |   DEFINE_EVENT_MAP(template, name, name, PARAMS(proto), PARAMS(args))
>>      |   ^
>>      |
>>      probes/../instrumentation/events/lttng-module/../../../probes/../instrumentation/events/lttng-module/block.h:235:1:
>>      note: in expansion of macro 'DEFINE_EVENT'
>>      |  DEFINE_EVENT(block_rq_with_error, block_rq_complete,
>>
>> The lttng 2.4.x-stable branch contains the fix (and several other small fixes), so
>> we bump the SRCREV to import the change.
>
> We still have lttng-modules 2.3.3 in oe-core which still suffers from
> this issue, can you please drop or fix them?

I'm currently fighting with 3.16 and lttng .. once I survive my current
battle, I'll see about sorting this out as well.

Cheers,

Bruce

>
> 2.3.3 is used by default for qemuarm, because of this in 2.4.1:
> # lttng currently blacklists arm with gcc-4.8
> COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
>
> The issue was already reported 7 times in world status builds.
>
> |   CC [M]  /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/lttng-probe-block.o
> | In file included from /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng-module/../../../probes/define_trace.h:148:0,
> |                  from /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng-module/block.h:932,
> |                  from /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/lttng-probe-block.c:41:
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng-module/../../../probes/lttng-events.h:151:6: error: conflicting types for 'trace_block_rq_complete'
> |  void trace_##_name(_proto);
> |       ^
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng-module/../../../probes/lttng-events.h:117:2: note: in expansion of macro 'DEFINE_EVENT_MAP'
> |   DEFINE_EVENT_MAP(template, name, name, PARAMS(proto), PARAMS(args))
> |   ^
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng-module/../../../probes/../instrumentation/events/lttng-module/block.h:235:1: note: in expansion of macro 'DEFINE_EVENT'
> |  DEFINE_EVENT(block_rq_with_error, block_rq_complete,
> |  ^
> | In file included from include/linux/module.h:18:0,
> |                  from /home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/lttng-probe-block.c:23:
> | include/linux/tracepoint.h:168:21: note: previous definition of 'trace_block_rq_complete' was here
> |   static inline void trace_##name(proto)    \
> |                      ^
> | include/linux/tracepoint.h:265:3: note: in expansion of macro '__DECLARE_TRACE'
> |    __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
> |    ^
> | include/linux/tracepoint.h:399:2: note: in expansion of macro 'DECLARE_TRACE'
> |   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
> |   ^
> | include/trace/events/block.h:143:1: note: in expansion of macro 'TRACE_EVENT'
> |  TRACE_EVENT(block_rq_complete,
> |  ^
> | make[3]: *** [/home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes/lttng-probe-block.o] Error 1
> | make[2]: *** [/home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git/probes] Error 2
> | make[1]: *** [_module_/home/jenkins/oe/world/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/lttng-modules/2.3.3-r0/git] Error 2
> | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm/usr/src/kernel'
> | make: *** [default] Error 2
>
>>
>> Build tested against 3.14 and 3.10.
>>
>> [YOCTO #6459]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
>> index 4ef74dd..5e05ffc 100644
>> --- a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
>> @@ -10,7 +10,7 @@ DEPENDS = "virtual/kernel"
>>
>>   inherit module
>>
>> -SRCREV = "afdc6b155161f209fcfadc5288dc017ceab56353"
>> +SRCREV = "a0383def517e3aebbbcebae61fe2bcfb50d31e71"
>>   PV = "2.4.1"
>>
>>   # lttng currently blacklists arm with gcc-4.8
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>


