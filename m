Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 131637DF0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 05:59:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4E5xkca028225
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 May 2019 22:59:46 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 13 May 2019 22:59:45 -0700
To: <richard.purdie@linuxfoundation.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <5CD13414.9060408@windriver.com>
	<20190508030539.448075-1-mingli.yu@windriver.com>
	<CAJTo0LbWzug_9N5eZwaaWNX3w6wRfOCNx379DYkpODf=t71KbA@mail.gmail.com>
	<eb9506045669eaf6dc51f56fab72195c7cdba6b3.camel@linuxfoundation.org>
	<5CD93813.1060907@windriver.com>
	<eaaab67f52892780cfcc2cb8359dabe5ab365931.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CDA5AE2.4070507@windriver.com>
Date: Tue, 14 May 2019 14:06:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <eaaab67f52892780cfcc2cb8359dabe5ab365931.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.170]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] glib-2.0: fix ptest failures
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
X-List-Received-Date: Tue, 14 May 2019 05:59:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年05月13日 17:40, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2019-05-13 at 17:25 +0800, Yu, Mingli wrote:
>>
>> On 2019年05月08日 20:25, richard.purdie@linuxfoundation.org wrote:
>>> On Wed, 2019-05-08 at 12:54 +0100, Burton, Ross wrote:
>>>> On Wed, 8 May 2019 at 04:06, <mingli.yu@windriver.com> wrote:
>>>>> * Increase the timeout to 15 minutes as the default
>>>>>     timeout which is 5 minutes is not enough to fix below error:
>>>>>     | Executing: glib/actions.test
>>>>>     | Test timed out after 300 seconds
>>>>>     | cleaning up pid 13050
>>>>>     | FAIL: glib/actions.test (Child process killed by signal 9)
>>>>
>>>> My Debian machine runs that test in 20 seconds.
>>>>
>>>> Maybe we're missing dependencies to get a working session dbus
>>>> up?
>>>
>>> That seems likely. I'd note that we see:
>>>
>>> https://autobuilder.yocto.io/pub/non-release/20190502-12/testresults/testresult-report.txt
>>>
>>>
>>> Recipe                       | Passed      | Failed   | Skipped   |
>>> Time(s)
>>> glib-2.0                     | 290         | 1        | 0         |
>>> 427
>>>
>>> and the failing test is:
>>>
>>>       ptestresult.glib-
>>> 2.0.glib/gdatetime.test__Child_process_killed_by_signal_6_
>>>
>>> so it would seem this is working on our autobuilder tests? That
>>> would
>>> seem to back up Ross' comments.
>>
>> Thanks Ross and RP's comments!
>>
>> It's weird! Seems it succeeds in autobuilder, but I can reproduce
>> the
>> glib/actions.test failure steadily in my env as below:
>> # time; /usr/libexec/installed-tests/glib/actions -p;time
>> user	0m0.13s
>> sys	0m0.07s
>> /actions/dbus/threaded: OK
>> user	6m29.03s
>> sys	0m50.46s
>
> I suspect its a dependency such as the dbus session Ross mentioned.
> Which image are you running this test in? Have you tried testing in
> something like a core-image-sato for comparison?

Use core-image-sato to test in my env as below and still 
/actions/dbus/threaded takes most of the time.

# time; /usr/libexec/installed-tests/glib/actions -p;time
user	0m0.20s
sys	0m0.09s
/actions/basic: OK
/actions/name: OK
/actions/simplegroup: OK
/actions/stateful: OK
/actions/default-activate: OK
/actions/entries: OK
/actions/parse-detailed: OK
/actions/property: OK
/actions/dbus/export: OK
/actions/dbus/threaded: OK
/actions/dbus/bug679509: OK
user	6m29.77s
sys	0m48.97s

Thanks,

>
> It would be good to narrow down the missing dependency.
>
> Cheers,
>
> Richard
>
>

