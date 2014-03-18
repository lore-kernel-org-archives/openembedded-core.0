Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1DF6EA2F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 07:12:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2I7Ctj8007227
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Mar 2014 00:12:55 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 18 Mar 2014 00:12:54 -0700
Message-ID: <5327F1F3.9000307@windriver.com>
Date: Tue, 18 Mar 2014 15:12:51 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
	<53265958.6050806@windriver.com>
	<4460653.1fTuVUzje8@peggleto-mobl5.ger.corp.intel.com>
	<2336481.uJ8DxcTUgT@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2336481.uJ8DxcTUgT@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Tue, 18 Mar 2014 07:12:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/17/2014 07:05 PM, Paul Eggleton wrote:
> On Monday 17 March 2014 10:44:44 Paul Eggleton wrote:
>> On Monday 17 March 2014 10:09:28 Chong Lu wrote:
>>> On 03/14/2014 06:12 PM, Paul Eggleton wrote:
>>>> On Friday 14 March 2014 17:14:27 Chong Lu wrote:
>>>>> On 03/13/2014 06:01 PM, Paul Eggleton wrote:
>>>>>> On Thursday 13 March 2014 17:54:03 Chong Lu wrote:
>>>>>>> On 03/06/2014 06:04 PM, Burton, Ross wrote:
>>>>>>>> On 6 March 2014 08:06, Chong Lu <Chong.Lu@windriver.com> wrote:
>>>>>>>>> +PACKAGES += "dbus-ptest"
>>>>>>>>> +ALLOW_EMPTY_${PN}-ptest = "1"
>>>>>>>>> +RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES',
>>>>>>>>> 'ptest-pkgs',
>>>>>>>>> 'dbus-test-ptest', 'dbus-test', d)}"
>>>>>>>> Clearly I wasn't thinking clearly last week.  You can't check
>>>>>>>> IMAGE_FEATURES in a non-image recipe so this isn't a good solution.
>>>>>>> Do you have any suggestion about this issue?
>>>>>>> If we don't check IMAGE_FEATURES, I have no way to resolve this
>>>>>>> problem
>>>>>>> that only build but not install ptest. I'm very confused.
>>>>>> This should check DISTRO_FEATURES, not IMAGE_FEATURES. Assuming ptest
>>>>>> is
>>>>>> in
>>>>>> DISTRO_FEATURES, even if ptest is not in IMAGE_FEATURES it doesn't
>>>>>> matter
>>>>>> if the dependency between dbus-ptest and dbus-ptest-ptest exists
>>>>>> because
>>>>>> dbus- ptest itself shouldn't be in the image, so dbus-ptest-ptest
>>>>>> shouldn't be pulled in either. Does that make sense?
>>>>>>
>>>>>> Cheers,
>>>>>> Paul
>>>>> Hi Paul,
>>>>>
>>>>> Thanks for your reply!
>>>>> But I still have a question.
>>>>>
>>>>> I try to following way:
>>>>>
>>>>> # git diff
>>>>> diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
>>>>> b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
>>>>> index bc260de..50dfe54 100644
>>>>> --- a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
>>>>> +++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
>>>>> @@ -9,6 +9,7 @@ DEPENDS = "python-pygobject dbus dbus-glib"
>>>>>
>>>>>     RDEPENDS_${PN} += "make"
>>>>>     RDEPENDS_${PN}-dev = ""
>>>>>
>>>>> +ALLOW_EMPTY_${PN} = "1"
>>>>>
>>>>>     SRC_URI =
>>>>>     "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz
>>>>>     \
>>>>>     
>>>>>                file://tmpdir.patch \
>>>>>
>>>>> diff --git a/meta/recipes-core/dbus/dbus.inc
>>>>> b/meta/recipes-core/dbus/dbus.inc
>>>>> index 677ff78..ba7f3cb 100644
>>>>> --- a/meta/recipes-core/dbus/dbus.inc
>>>>> +++ b/meta/recipes-core/dbus/dbus.inc
>>>>> @@ -6,7 +6,7 @@ LICENSE = "AFL-2 | GPLv2+"
>>>>>
>>>>>     LIC_FILES_CHKSUM =
>>>>>     "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>>>>>
>>>>> file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974
>>>>> 53
>>>>> 8bb 3c" DEPENDS = "expat virtual/libintl"
>>>>> -RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest',
>>>>> 'dbus-ptest-ptest', '', d)}"
>>>>> +RDEPENDS_dbus = "dbus-ptest"
>>>> The line above is the problem. You *cannot* do this or dbus-ptest (and
>>>> therefore dbus-ptest-ptest) will always be installed whether you want it
>>>> or not. You need to remove this line.
>>> Do you mean the patch we only need to remove RDEPENDS_dbus =
>>> "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '',
>>> d)}" in dbus.inc ?
>>> If do this, we can't build and install dbus-ptest through `bitbake dbus'
>>> command.
>>> How to relate between dbus and dbus-ptest?
>> Assuming you rename the current dbus-ptest recipe to dbus-test:
>>
>> 1) If the dbus recipe refers to dbus-test-ptest elsewhere (i.e.
>> RDEPENDS_dbus-ptest = "dbus-test-ptest") then dbus-ptest will be built as
>> needed.
> Sorry that should have been "dbus-test will be built as needed".
>
>> 2) If dbus is part of the image and ptest-pkgs is in IMAGE_FEATURES, the
>> dbus- ptest package (and therefore the dbus-test-ptest) will be brought in
>> automatically. The relationship between dbus and dbus-ptest is solely on
>> the name, you do not need to add any RDEPENDS for that part.
> I should also mention that we need a fix for this soon in order to make the 1.6
> release (and we *really* don't want to release 1.6 with this issue.)
>
> Thanks,
> Paul
>
Thanks a lot. I will send a V2, please check it.

Chong


