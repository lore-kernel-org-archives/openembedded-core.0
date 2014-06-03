Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A9EAE6F8EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 09:19:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s539JiVm013466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jun 2014 02:19:44 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 3 Jun 2014 02:19:43 -0700
Message-ID: <538D9363.2020006@windriver.com>
Date: Tue, 3 Jun 2014 17:20:35 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1401781206.git.Qi.Chen@windriver.com>	
	<cd4a352b664c2c15c0ad9ff7bc4e5870f2e0c941.1401781206.git.Qi.Chen@windriver.com>
	<1401786411.12440.54.camel@ted>
In-Reply-To: <1401786411.12440.54.camel@ted>
X-Originating-IP: [128.224.162.187]
Cc: matt.cowell@nsn.com, openembedded-core@lists.openembedded.org
Subject: Re: [daisy][PATCH 1/1] systemd: do not use alloca() function in case of uclibc
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
X-List-Received-Date: Tue, 03 Jun 2014 09:19:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2014 05:06 PM, Richard Purdie wrote:
> On Tue, 2014-06-03 at 15:42 +0800, Chen Qi wrote:
>> The alloca() function allocates space in the stack frame of the caller,
>> so using alloca(new_size - old_size) would possibly crash the stack,
>> causing a segment fault error.
>>
>> This patch fixes the above problem by avoiding using this function in
>> journal-file.c.
>>
>> [YOCTO #6201]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../0001-journal-file.c-do-not-use-alloca.patch    |   54 ++++++++++++++++++++
>>   meta/recipes-core/systemd/systemd_211.bb           |    1 +
>>   2 files changed, 55 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch b/meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch
>> new file mode 100644
>> index 0000000..a638d58
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch
>> @@ -0,0 +1,54 @@
>> +Upstream-Status: Inappropriate [oe specific]
> >From the description, this sounds like an allocation error which can
> happen *anywhere* and is a problem that should be addressed upstream.
>
> This Upstream-Status field is therefore completely bogus. Its not
> inappropriate or oe specific. If you still believe it is, I'd like to
> hear more explanation.
>
> The abuses of this field are starting to really annoy me since this
> keeps happening.
>
> Cheers,
>
> Richard
>
>
>
>
>

Hi Richard,

The use of alloca() was introduced by an oe-specific patch from Khem Raj.

The patch is 
meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch.
The upstream status of the above patch is as following.
        Upstream-Status: Denied [no desire for uclibc support]

That's why I use 'Inappropriate [oe specific]' in the Upstream-Status 
field of my patch.

And I just realized I forgot to also patch the journald-kmsg.c file. 
I'll send out a V2.

Best Regards,
Chen Qi

