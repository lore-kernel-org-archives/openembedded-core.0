Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3D44674621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 16:58:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jun 2018 09:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,240,1526367600"; d="scan'208";a="233528877"
Received: from swold-mobl2.jf.intel.com ([10.254.9.231])
	by orsmga005.jf.intel.com with ESMTP; 18 Jun 2018 09:58:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	openembedded-core@lists.openembedded.org, akuster808@gmail.com
References: <1528788854-29279-1-git-send-email-naresh.kamboju@linaro.org>
	<283c5cb8-ec62-99a4-156c-8748a46f6ea1@linux.intel.com>
Message-ID: <20005489-c469-6aea-6471-92867ac55595@linux.intel.com>
Date: Mon, 18 Jun 2018 09:58:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <283c5cb8-ec62-99a4-156c-8748a46f6ea1@linux.intel.com>
Subject: Re: [PATCH v3] ltp: fix cve-2017-5669 test case
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
X-List-Received-Date: Mon, 18 Jun 2018 16:58:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Armin

Is there any chance of getting this into Sumo and Rocko?


Sau!


On 06/13/2018 10:40 AM, Saul Wold wrote:
> Can this be backported to both Rocko and Sumo?
>
> Or is this a case to update LTP in those older releases?
>
>
> Sau!
>
>
> On 06/12/2018 12:34 AM, Naresh Kamboju wrote:
>> Adding cve-2017-5669 test fix patch which is accepted upstream in LTP 
>> repo.
>>
>> Ref:
>> cve-2017-5669: shmat() for 0 (or <PAGESIZE with RND flag) has to fail 
>> with REMAPs
>> https://github.com/linux-test-project/ltp/pull/324
>>
>> Upstream-Status: Accepted 
>> [https://github.com/linux-test-project/ltp/pull/324]
>> CVE: cve-2017-5669
>> Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> ---
>>   ...69-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch | 97 
>> ++++++++++++++++++++++
>>   meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
>>   2 files changed, 98 insertions(+)
>>   create mode 100644 
>> meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
>>
>> diff --git 
>> a/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch 
>> b/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch 
>>
>> new file mode 100644
>> index 0000000..2a47785
>> --- /dev/null
>> +++ 
>> b/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
>> @@ -0,0 +1,97 @@
>> +From b767b73ef027ba8d35f297c7d3659265ac80425b Mon Sep 17 00:00:00 2001
>> +From: Rafael David Tinoco <rafael.tinoco@canonical.com>
>> +Date: Wed, 30 May 2018 09:14:34 -0300
>> +Subject: [PATCH] cve-2017-5669: shmat() for 0 (or <PAGESIZE with RND 
>> flag) has
>> + to fail with REMAPs
>> +
>> +Fixes: https://github.com/linux-test-project/ltp/issues/319
>> +
>> +According to upstream thread (https://lkml.org/lkml/2018/5/28/2056),
>> +cve-2017-5669 needs to address the "new" way of handling nil addresses
>> +for shmat() when used with MAP_FIXED or SHM_REMAP flags.
>> +
>> +- mapping nil-page is OK on lower addresses with MAP_FIXED (or else 
>> X11 is broken)
>> +- mapping nil-page is NOT OK with SHM_REMAP on lower addresses
>> +
>> +Addresses Davidlohr Bueso's comments/changes:
>> +
>> +commit 8f89c007b6de
>> +Author: Davidlohr Bueso <dave@stgolabs.net>
>> +Date:   Fri May 25 14:47:30 2018 -0700
>> +
>> +    ipc/shm: fix shmat() nil address after round-down when remapping
>> +
>> +commit a73ab244f0da
>> +Author: Davidlohr Bueso <dave@stgolabs.net>
>> +Date:   Fri May 25 14:47:27 2018 -0700
>> +
>> +    Revert "ipc/shm: Fix shmat mmap nil-page protection"
>> +
>> +For previously test, and now broken, made based on:
>> +
>> +commit 95e91b831f87
>> +Author: Davidlohr Bueso <dave@stgolabs.net>
>> +Date:   Mon Feb 27 14:28:24 2017 -0800
>> +
>> +    ipc/shm: Fix shmat mmap nil-page protection
>> +
>> +Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>
>> +Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> +Reviewed-by: Jan Stancek <jstancek@redhat.com>
>> +
>> +Upstream-Status: Accepted 
>> [https://github.com/linux-test-project/ltp/pull/324]
>> +CVE: cve-2017-5669
>> +Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>
>> +---
>> + testcases/cve/cve-2017-5669.c | 20 +++++++++++++++++++-
>> + 1 file changed, 19 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/testcases/cve/cve-2017-5669.c 
>> b/testcases/cve/cve-2017-5669.c
>> +index 1ca5983..0834626 100644
>> +--- a/testcases/cve/cve-2017-5669.c
>> ++++ b/testcases/cve/cve-2017-5669.c
>> +@@ -28,7 +28,20 @@
>> +  * is just to see if we get an access error or some other 
>> unexpected behaviour.
>> +  *
>> +  * See commit 95e91b831f (ipc/shm: Fix shmat mmap nil-page protection)
>> ++ *
>> ++ * The commit above disallowed SHM_RND maps to zero (and rounded) 
>> entirely and
>> ++ * that broke userland for cases like Xorg. New behavior disallows 
>> REMAPs to
>> ++ * lower addresses (0<=PAGESIZE).
>> ++ *
>> ++ * See commit a73ab244f0da (Revert "ipc/shm: Fix shmat mmap 
>> nil-page protect...)
>> ++ * See commit 8f89c007b6de (ipc/shm: fix shmat() nil address after 
>> round-dow...)
>> ++ * See https://github.com/linux-test-project/ltp/issues/319
>> ++ *
>> ++ * This test needs root permissions or else security_mmap_addr(), from
>> ++ * get_unmapped_area(), will cause permission errors when trying to 
>> mmap lower
>> ++ * addresses.
>> +  */
>> ++
>> + #include <sys/types.h>
>> + #include <sys/ipc.h>
>> + #include <sys/shm.h>
>> +@@ -60,7 +73,11 @@ static void cleanup(void)
>> + static void run(void)
>> + {
>> +     tst_res(TINFO, "Attempting to attach shared memory to null page");
>> +-    shm_addr = shmat(shm_id, ((void *)1), SHM_RND);
>> ++    /*
>> ++     * shmat() for 0 (or < PAGESIZE with RND flag) has to fail with 
>> REMAPs
>> ++     * https://github.com/linux-test-project/ltp/issues/319
>> ++     */
>> ++    shm_addr = shmat(shm_id, ((void *)1), SHM_RND | SHM_REMAP);
>> +     if (shm_addr == (void *)-1) {
>> +         shm_addr = NULL;
>> +         if (errno == EINVAL) {
>> +@@ -89,6 +106,7 @@ static void run(void)
>> + }
>> +
>> + static struct tst_test test = {
>> ++    .needs_root = 1,
>> +     .setup = setup,
>> +     .cleanup = cleanup,
>> +     .test_all = run,
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb 
>> b/meta/recipes-extended/ltp/ltp_20180515.bb
>> index b07c1b9..48739f1 100644
>> --- a/meta/recipes-extended/ltp/ltp_20180515.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
>> @@ -41,6 +41,7 @@ SRC_URI = 
>> "git://github.com/linux-test-project/ltp.git \
>> file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
>> file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
>> file://0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
>> + 
>> file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch \
>>              "
>>     S = "${WORKDIR}/git"
>


