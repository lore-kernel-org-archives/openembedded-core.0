Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE77475129
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 23:48:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w51Nm06U009869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Jun 2018 16:48:00 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 1 Jun 2018 16:47:59 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1527840158-99078-1-git-send-email-hongzhi.song@windriver.com>
	<1527840759.16911.180.camel@linuxfoundation.org>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <e42dcf03-8341-e0c6-c4b1-2d2c75d92584@windriver.com>
Date: Sat, 2 Jun 2018 07:48:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527840759.16911.180.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.161]
Subject: Re: [PATCH] Meta runtime cases: add testcases for kernel sample
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
X-List-Received-Date: Fri, 01 Jun 2018 23:48:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

I have made patch-v2 with shared functions.
And these kernel-samples are just for testing, so maybe it's unnecessary 
to enable them by default.


On 2018年06月01日 16:12, Richard Purdie wrote:
> On Fri, 2018-06-01 at 04:02 -0400, Hongzhi.Song wrote:
>> We are going to let runtime test support kernel tests. Now we just
>> add
>> kernel self-contained sample tests. And we plan to add overall kernel
>> tests in the future.
>>
>> This patch is just add kernel samples test which contains about 13
>> tests
>> enabled by kernel-sample.scc. So it needs statement,
>> KERNEL_FEATURES_append += " kernel-sample/kernel-sample.scc" in
>> local.conf.
>>
>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> ---
>>   meta/lib/oeqa/runtime/cases/ksample.py | 440
>> +++++++++++++++++++++++++++++++++
>>   1 file changed, 440 insertions(+)
>>   create mode 100644 meta/lib/oeqa/runtime/cases/ksample.py
> [...]
>> +        # check config
>> +        status, ret = self.target.run('zcat /proc/config.gz | grep CONFIG_TRACING_SUPPORT')
>> +        result = "CONFIG_TRACING_SUPPORT=y" in ret
>> +        if not result:
>> +            self.skipTest("CONFIG error")
>> +        # make sure if module exists
>> +        status, ret = self.target.run('uname -r')
>> +        cmd = "ls " + "/lib/modules/" + ret + "/kernel/samples/trace_events/trace-events-sample.ko"
>> +        status, output = self.target.run(cmd)
>> +        if status != 0:
>> +            self.skipTest("trace-events-sample.ko doesn't exist")
>
> There looks to be a fair bit of copy and paste code in these tests such
> as the code above to look at config.gz. Could you turn some of these
> into shared functions please?
>
> Also, do we want to include this kernel-sample feature to the qemu
> machines by default so that we enable these tests?
>
> Cheers,
>
> Richard
>
>


