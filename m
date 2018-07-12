Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34D5F7551B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 05:15:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6C5F8X5026564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Jul 2018 22:15:09 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 11 Jul 2018 22:15:08 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1529919069.git.Qi.Chen@windriver.com>
	<c8a7632a1f27b73ac623c5399ed4e452f2b37571.1529919069.git.Qi.Chen@windriver.com>
	<CAJTo0LaW-4wBMWcp+ZdDJd0kKQMm_fRGo6nQph3GKXPJ6SuCPQ@mail.gmail.com>
	<838c72f4-251b-5183-073e-e83c93230e93@windriver.com>
	<0cdaabbf-0716-53d9-17b8-3daa0ca70f57@windriver.com>
	<3cf12664-4fac-2311-eb39-37722dd5d6e3@windriver.com>
	<CAJTo0LZx+-2LdYuA3bMcHWVQruq2c7X8S5t4keGy9RZ8zAHFYw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <1288b9d3-0548-d429-2fe8-262eff72b1ee@windriver.com>
Date: Thu, 12 Jul 2018 13:18:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZx+-2LdYuA3bMcHWVQruq2c7X8S5t4keGy9RZ8zAHFYw@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/runtime/cases/systemd.py: avoid timeout problem
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
X-List-Received-Date: Thu, 12 Jul 2018 05:15:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

You're right, it's better to patch systemd to allow timeout override.
I'll send out a patch to systemd.

Best Regards,
Chen Qi

On 07/11/2018 06:38 PM, Burton, Ross wrote:
> The problem is that when the system is loaded, systemctl calls may be
> too slow and they will time out.  This patch simply changes *one* of
> the many systemctl calls to use busctl directly, leaving many other
> calls as a potential failure point.
>
> Surely a better solution would be to patch in a way to override the
> timeout, so we can pass that in all calls.
>
> Ross
>
> On 11 July 2018 at 06:46, ChenQi <Qi.Chen@windriver.com> wrote:
>> ping
>>
>> Is there some problem with this patch?
>>
>> Recently when I'm doing testimage test for systemd upgrade, the 'systemctl
>> list-unit-files' command in this test case revealed a 'segment fault' error
>> on musl qemuarm.
>> So I'd suggest to keep 'systemctl list-unit-files' command and use 'busctl'
>> as a fallback in case of timeout.
>>
>> Best Regards,
>> Chen Qi
>>
>>
>> On 07/04/2018 06:05 PM, ChenQi wrote:
>>> ping
>>>
>>>
>>> On 06/26/2018 09:48 AM, ChenQi wrote:
>>>> On 06/25/2018 09:40 PM, Burton, Ross wrote:
>>>>> The busctl invocation will only rarely be called so is very prone to
>>>>> bitrot, maybe it should just always use busctl?
>>>>>
>>>>> Personally I think that there should be a way for VM time to be
>>>>> independent of host time to avoid this sort of problem...
>>>>>
>>>>> Ross
>>>>
>>>> Hi Ross,
>>>>
>>>> I now realize that I didn't include enough information in the commit
>>>> message.
>>>> In fact, for qemuarm, this problem always appeared.
>>>> Compared to other qemu bsps (e.g. qemux86-64), qemuarm is running much
>>>> slower.
>>>>
>>>> I've now updated the commit the message to include this qemuarm info, and
>>>> also updated the remote branch.
>>>>
>>>>    git://git.pokylinux.org/poky-contrib ChenQi/systemd-bus-timeout
>>>>
>>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-bus-timeout
>>>>
>>>>
>>>> If you think we should still use `busctl' directly, I can send out a new
>>>> patch. Either way is OK to me.
>>>>
>>>> Best Regards,
>>>> Chen Qi
>>>>
>>>>> On 25 June 2018 at 10:33, Chen Qi <Qi.Chen@windriver.com> wrote:
>>>>>> I've encountered the following error when doing testimage.
>>>>>>
>>>>>>     RESULTS - systemd.SystemdBasicTests.test_systemd_list - Testcase
>>>>>> 551: FAILED
>>>>>>
>>>>>> After investigation, I found that it's not functionality issue. It's
>>>>>> just that the qemu was not running fast enough. And it resulted 'time
>>>>>> out'
>>>>>> problem when using `systemctl list-unit-files'.
>>>>>>
>>>>>> The correctness could be verified by using 'busctl' directly.
>>>>>> e.g.
>>>>>> busctl --timeout=240 call org.freedesktop.systemd1 \
>>>>>> /org/freedesktop/systemd1 org.freedesktop.systemd1.Manager \
>>>>>> ListUnitFilesByPatterns asas 0 0
>>>>>>
>>>>>> Checking the source codes, I can see that the timeout is 25s. I don't
>>>>>> think we should patch systemd's source codes just for such a simple
>>>>>> runtime test case.
>>>>>>
>>>>>> So instead, I change the test case to use 'busctl' directly if
>>>>>> 'systemctl list-unit-files' gets a timeout error.
>>>>>>
>>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>>> ---
>>>>>>    meta/lib/oeqa/runtime/cases/systemd.py | 14 +++++++++++++-
>>>>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta/lib/oeqa/runtime/cases/systemd.py
>>>>>> b/meta/lib/oeqa/runtime/cases/systemd.py
>>>>>> index db69384..b4f1025 100644
>>>>>> --- a/meta/lib/oeqa/runtime/cases/systemd.py
>>>>>> +++ b/meta/lib/oeqa/runtime/cases/systemd.py
>>>>>> @@ -81,7 +81,19 @@ class SystemdBasicTests(SystemdTest):
>>>>>>        @OETestID(551)
>>>>>> @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
>>>>>>        def test_systemd_list(self):
>>>>>> -        self.systemctl('list-unit-files')
>>>>>> +        command = 'systemctl list-unit-files'
>>>>>> +        status, output = self.target.run(command)
>>>>>> +        message = '\n'.join([command, output])
>>>>>> +        match = re.search('Connection timed out', output)
>>>>>> +        if match:
>>>>>> +            # it's possible that qemu is running slow
>>>>>> +            # use busctl to check the results with timeout set to 240s
>>>>>> +            command = 'busctl --timeout=240 call
>>>>>> org.freedesktop.systemd1 /org/freedesktop/systemd1
>>>>>> org.freedesktop.systemd1.Manager ListUnitFilesByPatterns asas 0 0'
>>>>>> +            status, output = self.target.run(command)
>>>>>> +            message = '\n'.join([command, output])
>>>>>> +            self.assertEqual(status, 0, message)
>>>>>> +        else:
>>>>>> +            self.assertEqual(status, 0, message)
>>>>>>
>>>>>>        @OETestID(550)
>>>>>> @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
>>>>>> --
>>>>>> 1.9.1
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>>


