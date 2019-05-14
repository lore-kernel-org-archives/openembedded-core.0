Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1129F7D597
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 17:54:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4EHs7pn027573
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 May 2019 10:54:07 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 14 May 2019 10:54:06 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
	<4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <8f1030b6-b831-7ac8-88e3-1208272d7533@windriver.com>
Date: Tue, 14 May 2019 13:54:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Tue, 14 May 2019 17:54:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 5/14/19 10:08 AM, Richard Purdie wrote:
> On Mon, 2019-05-13 at 23:57 -0400, Randy MacLeod wrote:
>> About half the ptests will fail if the executables deployed
>> as part of the ptest package are stripped. Currently
>> there is no easy way to only strip the main valgrind
>> package so leave it and the ptests *all* unstripped.
>>
>> There is an enhancement filed to enable wildcard stripping:
>>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=13343
>> so this recipe can be fixed once that is implemented.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>   meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> I did test whether we could get away with a dependency on valgrind-dbg
> as in theory that should behave the same way. It doesn't which means
> the debug symbol linkage isn't being honoured by valgrind and that is
> something we need to look into too :/.

I tried that as well. When it didn't work and I couldn't find an
example that used that sort of dependency, I looked for other solutions
and ended up with the admittedly poor one here which only has the
one benefit that it works. ;-)

Ross asked about the disk usage impact:

du -sk for .../packages-split/foo

Type         valgrind    valgrind-ptest
unstripped   169732      138192
stripped      27224       99836

ls -l /.../packages-split/usr/bin/valgrind
unstripped: 88672
   stripped: 22728

To be sure such bloat doesn't slip into the 2.8 release,
we should probably wait for the partial stripping ER implementation
and/or I can figure out what's wrong with adding a
    valgrind-ptest -> valgrind-dbg
dependency.

> 
> I'm torn on whether to accept this patch or try and fix partial
> stripping...

Let's wait. See above.

We at least understand all but one of the valgrind ptest problems
that were happening on x86-64. The drd/tests/pth_detached3 [1] failure
seems to be with valgrind itself. The executable is meant to segfault
and it does:

root@qemux86-64:/usr/lib/valgrind/ptest# drd/tests/pth_detached3
[ 2148.508705] pth_detached3[9127]: segfault at 7ffc5acd0090 ip 
0000003a0460a15c sp 00007ffc5accfa08 error 6 in 
libpthread-2.29.so[3a04607000+f000]
[ 2148.515650] Code: 10 00 00 00 f0 83 88 08 03 00 00 10 64 48 8b 3c 25 
00 03 00 00 e8 64 7c 00 00 0f 1f 40 00 8b 87 d0 02 00 00 85 c0 78 36 31 
c0 <f6
Segmentation fault

but when run under valgrind, there's an extra frame in the stack trace:

root@qemux86-64:# cat drd/tests/pth_detached3.stderr.diff1
--- pth_detached3.stderr.exp1   2019-05-14 15:46:06.000000000 +0000
+++ pth_detached3.stderr.out    2019-05-14 16:13:34.355000000 +0000
@@ -1,12 +1,19 @@

  pthread_detach(): invalid thread ID 0x........
-   at 0x........: pthread_detach (drd_pthread_intercepts.c:?)
+   at 0x........: vgDrd_set_joinable (drd_pthread_intercepts.c:?)
+   by 0x........: pthread_detach (drd_pthread_intercepts.c:?)
     by 0x........: main (pth_detached3.c:21)
...

I need to learn a bit more before considering whether to just add
the missing lines to the expected output file to allow the test to pass.

qemuarm64 is still a problem that I intend to work on it soon.
ptests trigger the OOM killer even if I give the system 3GB of RAM
but I haven't really worked to understand why.

../Randy

> 
> Cheers,
> 
> Richard
> 


-- 
# Randy MacLeod
# Wind River Linux


[1] drd/tests/pth_detached3.c

/* Invoke pthread_detach() with an invalid thread ID. */

#include <assert.h>
#include <errno.h>
#include <pthread.h>
#include <stdio.h>

static void* thread_func(void* arg)
{
   return 0;
}

int main(int argc, char** argv)
{
   pthread_t thread;

   pthread_create(&thread, NULL, thread_func, NULL);
   pthread_join(thread, NULL);

   /* Invoke pthread_detach() with the thread ID of a joined thread. */
   pthread_detach(thread);

   /* Invoke pthread_detach() with an invalid thread ID. */
   pthread_detach(thread + 8);

   fprintf(stderr, "Finished.\n");

   return 0;
}

