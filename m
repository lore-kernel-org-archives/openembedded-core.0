Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 362CA7F275
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 09:01:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7J90ghC024827
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 02:00:58 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 19 Aug 2019 02:00:36 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190726092342.37231-1-kai.kang@windriver.com>
	<0c505fd8dd1e01a8ff06eea35144466d3662f67d.camel@linuxfoundation.org>
	<f13aa830-7c06-8777-8133-714c277ce1b4@windriver.com>
	<e145097a-2db6-9921-dd3b-1aad00eca440@windriver.com>
	<c5201d25-ee34-6f55-925a-6a7dbde0abfa@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ac54d0fd-212d-5ac3-e0d9-3eb774d257b6@windriver.com>
Date: Mon, 19 Aug 2019 17:14:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <c5201d25-ee34-6f55-925a-6a7dbde0abfa@windriver.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH] core-image-sato-sdk: test image with 512M memory
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
X-List-Received-Date: Mon, 19 Aug 2019 09:01:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 08/16/2019 02:53 PM, Kang Kai wrote:
> On 2019/8/12 下午4:57, Kang Kai wrote:
>> On 2019/7/27 下午4:42, Kang Kai wrote:
>>> On 2019/7/27 上午5:40, richard.purdie@linuxfoundation.org wrote:
>>>> On Fri, 2019-07-26 at 05:23 -0400, kai.kang@windriver.com wrote:
>>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>>
>>>>> When run do_testimage for core-image-sato-sdk, it fails to pass test
>>>>> case:
>>>>>
>>>>>> RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED
>>>>>> (0.43s)
>>>>> It is OOM issue and daemon rpc.statd is killed:
>>>>>
>>>>>>   [  531.306146] Out of memory: Kill process 193 (rpc.statd) score
>>>>>> 200 or sacrifice child
>>>>> Increase the memory of qemu to 512M to avoid such OOM issue.
>>>>>
>>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>>> ---
>>>>>   meta/recipes-sato/images/core-image-sato-sdk.bb | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb
>>>>> b/meta/recipes-sato/images/core-image-sato-sdk.bb
>>>>> index d7cc52b52b..f7963d018e 100644
>>>>> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
>>>>> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
>>>>> @@ -9,3 +9,4 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \
>>>>>     IMAGE_INSTALL += "kernel-devsrc"
>>>>>   +TEST_QEMUPARAMS = "-m 512"
>>>> Any idea what is using so much memory in the image when this happens?
>>>>
>>>> Its rather sad that we can't have NFS+systemd with 256MB memory...
>>>
>>> It caused by stap test case. I minimized the test cases to
>>>
>>> TEST_SUITES = "ping date ssh systemd stap kernelmodule gcc "
>>>
>>> which could reproduce the error.
>>>
>>> And it PASSes testimage that remove stap test from default TEST_SUITES:
>>>
>>> TEST_SUITES_remove = 'stap'
>>>
>>> But I can't reproduce the OOM failure to run stap tests manually.
>>
>> Hi Richard,
>>
>> The root cause of test case stap fails is available memory is too 
>> low. Compare systemd with sysvinit, memory status are listed:
>>
>> systemd:
>> root@qemux86:~# free -h
>>               total        used        free      shared buff/cache   
>> available
>> Mem:          239Mi       120Mi        23Mi       8.0Mi 94Mi 100Mi
>> Swap:            0B          0B          0B
>>
>> sysvinit:
>> root@qemux86:~# free -h
>>               total        used        free      shared buff/cache   
>> available
>> Mem:          239Mi        45Mi       111Mi       0.0Ki 82Mi 184Mi
>> Swap:            0B          0B          0B
>>
>>
>> With systemd, processes of rpc.statd and rpc.mountd take about less 
>> than 80M memories.
>> And I compared with Debian 10, they take similar size of memories.
>>
>> PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM TIME+ COMMAND
>> 464 rpcuser   20   0   56316  51336   2192 S   0.0  20.9 0:00.09 
>> rpc.statd
>>   186 root      20   0   30136  27024   2280 S   0.0  11.0 0:00.02 
>> rpc.mountd
>>
>>
>> Compare to sysvinit, they take only about 2M and 448K:
>>
>>  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM TIME+ COMMAND
>>   567 rpcuser   20   0    3444   2372   1792 S   0.0   1.0 0:00.00 
>> rpc.statd
>>   677 root      20   0    3700    448      0 S   0.0   0.2 0:00.00 
>> rpc.mountd
>>
>>
>> I didn't figure out the differences between these 2 ways to start the 
>> commands:
>>
>> ExecStart=/usr/sbin/rpc.statd -F $STATD_OPTS
>>
>> Vs.
>>
>> test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
>> start-stop-daemon --start --exec "$NFS_STATD" --pidfile "$STATD_PID"
>
> Hi Richard,
>
> Any more comment here please?
>
> Regards,
> Kai
>
>

Hi Richard,

Do you think it's acceptable to use swap as part of this test case? For 
example, enable 100M swap before running `stap' and disable it 
afterwards? This ensure no oom caused by other software using too much 
memory.

Best Regards,
Chen Qi

>
>>
>>
>> Regards,
>> Kai
>>
>>
>>
>>
>>>
>>>
>>> Regards,
>>> Kai
>>>
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>>
>>
>


