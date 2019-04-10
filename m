Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 122526BA9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 15:38:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3AFbnef032061
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Apr 2019 08:37:59 -0700
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 10 Apr 2019 08:37:38 -0700
To: Dengke Du <dengke.du@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1554368553-1851-1-git-send-email-dengke.du@windriver.com>
	<CAMKF1sops9Hv0UTsQfUjq-DUfD3h1Wpf0artnf3y97RYfrBKvQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <9a17cfd7-1e7d-ca5e-c49a-aad4f81fd8ce@windriver.com>
Date: Wed, 10 Apr 2019 11:37:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sops9Hv0UTsQfUjq-DUfD3h1Wpf0artnf3y97RYfrBKvQ@mail.gmail.com>
X-Originating-IP: [172.25.44.10]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: workaround the error cased by maybe-uninitialized warning
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
X-List-Received-Date: Wed, 10 Apr 2019 15:38:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 4/5/19 5:55 PM, Khem Raj wrote:
> On Thu, Apr 4, 2019 at 2:03 AM Dengke Du <dengke.du@windriver.com> wrote:
>>
>> When enable DEBUG_BUILD, the perf build failed by the following error:
>>      libbpf.c:727:36: error: 'data' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> This is ok until Khem commit a patch in oe-core:
>>      16643b03227466e2c80a24c2d079fe36e89553c1
>> This commit import "-Og" option to "DEBUG_OPTIMIZATION", result in this error.
>>
>> Actually, the warning was misinformation. We explore the code in libbpf.c:
>>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/bpf/libbpf.c#n640
>> --------------------------------------------------------------------------
>>          if (scn)
>>                  data = elf_getdata(scn, NULL);
>>          if (!scn || !data) {
>>                  pr_warning("failed to get Elf_Data from map section %d\n",
>>                             obj->efile.maps_shndx);
>>                  return -EINVAL;
>>          }
>>          ......
>>          using data...
>>          ......
>> --------------------------------------------------------------------------
>> If the 'scn' was not null, the data will be initialized. if the data was null,
>> the function will return -EINVAL, so the data must be not null, but compiler
>> can't see it in 'if' code block, so treat it as 'maybe-uninitialized'.
>>
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>   meta/recipes-kernel/perf/perf.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index 5acdcfb..546076f 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -271,3 +271,4 @@ FILES_${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
>>
>>
>>   INHIBIT_PACKAGE_DEBUG_SPLIT="1"
>> +DEBUG_OPTIMIZATION_append = " -Wno-error=maybe-uninitialized"
> 
> I was thinking that this would be applied globally, but I think doing
> it on need bases is a better approach so this looks ok to me.

so this commit should be merged.

I don't see it in master[-next] yet so this is a reminder to the busy,
hard-working gatekeepers. :)

../Randy
> 


-- 
# Randy MacLeod
# Wind River Linux

