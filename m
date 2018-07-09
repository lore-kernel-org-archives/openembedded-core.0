Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0AA374BEC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 01:08:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6918JDB029364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Jul 2018 18:08:19 -0700 (PDT)
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 8 Jul 2018 18:08:19 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Hongzhi.Song"
	<hongzhi.song@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1530870706-206950-1-git-send-email-hongzhi.song@windriver.com>
	<995cd601a894144e95c2a2f940b7ba240a2e55f1.camel@linuxfoundation.org>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <89ff8443-4fd2-8f84-6a83-83e5797ef3a0@windriver.com>
Date: Mon, 9 Jul 2018 09:05:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <995cd601a894144e95c2a2f940b7ba240a2e55f1.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.149]
Subject: Re: [PATCH v3] kernel-selftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Mon, 09 Jul 2018 01:08:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年07月07日 20:14, Richard Purdie wrote:
> On Fri, 2018-07-06 at 05:51 -0400, Hongzhi.Song wrote:
>> The recipe builds the framework for kernel-selftest. Now, it just
>> contains two sets of testcase, bpf and vm. We are appending others
>> to the recipe.
>>
>> It needs some features which will be written into relevant recipe.
>> But now, you should add them to conf/local.conf manually.
>> KERNEL_FEATURES_append += "features/bpf/bpf.scc"
>>
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> ---
>>   .../kernel-selftest/kernel-selftest.bb             | 94
>> ++++++++++++++++++++++
>>   1 file changed, 94 insertions(+)
>>   create mode 100644 meta/recipes-kernel/kernel-selftest/kernel-
>> selftest.bb
>>
>> diff --git a/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
>> b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
>> new file mode 100644
>> index 0000000..28fd178
>> --- /dev/null
>> +++ b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
>> @@ -0,0 +1,94 @@
>> +SUMMARY = "Kernel selftest for Linux"
>> +DESCRIPTION = "Kernel selftest for Linux"
>> +LICENSE = "GPLv2"
>> +
>> +# for bpf and vm
>> +DEPENDS = " \
>> +    elfutils \
>> +    libcap \
>> +    libcap-ng \
>> +    fuse \
>> +    util-linux \
>> +    rsync-native \
>> +"
> This adds a DEPENDS on fuse but fuse is not in OE-Core therefore this
> recipe can never build there.
>
> +do_configure[prefuncs] += "copy_perf_source_from_kernel remove_clang_related"
> +python copy_perf_source_from_kernel() {
>
> We're copying to perf source here? The function name needs tweaking.

This recipe was similar to perf, using the kernel source, so based on 
perf recipe, we will change it in next patches set.

>
> Cheers,
>
> Richard
>


