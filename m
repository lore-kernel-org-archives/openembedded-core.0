Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDFD277E93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 03:48:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8J3muI7029918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Sep 2017 20:48:56 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 18 Sep 2017 20:48:54 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <d8c3aa94-8f9f-2d06-0dac-9c46a1639505@windriver.com>
	<CAJ86T=XSXk4DGhJqDT4hmKO1BK0y-39rFc7r_codDWf72vAoCg@mail.gmail.com>
	<41556f05-e92c-1962-99af-97d1812909d1@windriver.com>
	<CAJ86T=VO8un10ov9_8orHkhec5z5z5GCO6dnvtikqchukT285A@mail.gmail.com>
	<649e138d-4ccf-770f-9e4d-aeb066d325a5@windriver.com>
	<CAJ86T=VJkYG3VN2oxsM+3rE3RY18tJbb68BWea-FQ+zYY9uEsQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <8a06943b-573f-af2f-84c6-8a4f45e16de7@windriver.com>
Date: Mon, 18 Sep 2017 22:48:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VJkYG3VN2oxsM+3rE3RY18tJbb68BWea-FQ+zYY9uEsQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain / /bin/sh requirement / ldconfig backfill
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
X-List-Received-Date: Tue, 19 Sep 2017 03:48:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/18/17 5:56 PM, Andre McCurdy wrote:
> On Mon, Sep 18, 2017 at 3:00 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 9/18/17 4:33 PM, Andre McCurdy wrote:
>>> On Mon, Sep 18, 2017 at 2:20 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>> On 9/18/17 4:05 PM, Andre McCurdy wrote:
>>>>> On Mon, Sep 18, 2017 at 12:30 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>>>>
>>>>>> Because of this, there is no way (with a default configuration) to build
>>>>>> meta-toolchain....
>>>>>>
>>>>>> Investigating further, ldconfig support moved from "USE_LDCONFIG" to a
>>>>>> distribution configuration.  It does this via the "DISTRO_FEATURES_BACKFILL"
>>>>>> (introduced in commit: a905df2dd8f43a2febffa64a39b6e508510326a0)
>>>>>
>>>>> The intention of that commit was only to change the way support for
>>>>> running ldconfig on the target is controlled (ie changed from an
>>>>> ad-hoc bitbake variable to a distro config option). It's enabled by
>>>>> default now, but it was enabled by default before that commit as well.
>>>>>
>>>>> Did meta-toolchain work previously? If so, was USE_LDCONFIG being
>>>>> forced to 0 somewhere?
>>>>
>>>> In many distributions, the default was 0.
>>>
>>> Right. As mentioned in the OE 2.3 reference manual, if your distro
>>> previously set USE_LDCONFIG to 0 then you now need to disable the
>>> "ldconfig" distro config option instead:
>>>
>>>   http://www.yoctoproject.org/docs/2.3.1/ref-manual/ref-manual.html#migration-2.3-miscellaneous-changes
>>
>> The key is that meta-toolchain worked before, and doesn't now.  (In a default
>> configuration.)
> 
> Do you mean it worked before in plain oe-core or poky? Or was it only
> tested in a custom distro which sets USE_LDCONFIG to 0?

I have configured a morty project in the same way, and NOT set USE_LDCONFIG one
way or another.

Inspecting the packages, I am finding the install script for LDCONFIG by
default.  Which means that the skip of /bin/sh is elsewhere.


Inspecting further, the system defines:

$ cat
./sdk/image/usr/local/oecore-x86_64/sysroots/i586-oe-linux/etc/rpm/sysinfo/Providename

/bin/sh
/bin/bash
/usr/bin/env
/usr/bin/perl
pkgconfig


This tells RPM(5) to ignore the runtime dependencies listed above.  Which avoids
the problem.

> If it fails in the OE 2.3 default configuration (ie when the ldconfig
> distro feature is enabled) then I think either it should also fail in
> OE 2.2 default configuration (ie when USE_LDCONFIG is not forced to 0)
> or the change in behaviour is not related to the a905df2 commit.

I've not tried pyro.

I expect it to fail in a similar way, because it switched to RPM4.  Which
apparently dropped the ability to specify specific provides.  It's possible it
has this support, but the implementation has changed enough that it is
definitely NOT doing it.

I expect at this point that an enhancement to rpm4 to pay attention to the
sysinfo file(s) (like RPM5 had) or a dummy (meta-toolchain only) file with
rprovides for these things may be required.

--Mark

>> Either someone needs to add a message to meta-toolchain to tell
>> the user it can't work with ldconfig set, fix it (so the missing dependency is
>> resolved [optimal solution], or ???
>>
>> In the past there was a way to tell the package manager to ignore a specific
>> dependency (such as /bin/sh) and allow the install.  I don't know if there is a
>> way to do this any longer.  2.2 was the last version I know this worked on.
>>
>> --Mark


