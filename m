Return-Path: <akuster808@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 543CD6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 15:30:08 +0000 (UTC)
Received: by obbkp3 with SMTP id kp3so102338577obb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=IhT/AO++jWZy8g0GdK45+ihgErPHvIk8kwKPDvDNTog=;
	b=krc+n/DF1nwietGPxOhaTTHKMjYkAwRqyI9cJD7ES+27zDifeKxB3XLGF2V4cAPtOx
	j1osWYRSZT6Tq2OsT49IbrbVbGxa8xZgVJ2pSyv/PwlcltxCRCDezXBMgS9kjcobw6D8
	yNWmEBaZp4f/pgbSArejn2STAFmeiFS6xXn7t7PV/yfWAS/nZzE2GDY9wmOWErYfGJH9
	loKEJM4uMyKJ8Fd5JM28M3w95M+uHqpMVgq+4HJ80yvFewSeV/lA/SzOLQbZ69fPX9tU
	CsoEc4uUXbf5nPBCxS9eDfJ6SIk+YGvrOFqqRTg5QR2o+HHJbtTjk8iI0jl8L5hbPUXz
	ecPw==
X-Received: by 10.60.39.65 with SMTP id n1mr8357770oek.31.1431358209179;
	Mon, 11 May 2015 08:30:09 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:d9ea:b13c:f1c:2b5d?
	([2601:c:a700:3ba7:d9ea:b13c:f1c:2b5d])
	by mx.google.com with ESMTPSA id l5sm9033066oey.5.2015.05.11.08.30.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 08:30:07 -0700 (PDT)
Message-ID: <5550CAFD.1000006@gmail.com>
Date: Mon, 11 May 2015 08:30:05 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Khem Raj <raj.khem@gmail.com>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>	
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
In-Reply-To: <1431295383.30971.25.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Mon, 11 May 2015 15:30:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/10/2015 03:03 PM, Richard Purdie wrote:
> On Sun, 2015-05-10 at 09:15 -0700, Khem Raj wrote:
>> On Sun, May 10, 2015 at 7:28 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>> | tset.o:(.debug_loc+0xe8): undefined reference to `.LCL0'
>>> | tset.o:(.debug_loc+0xf7): undefined reference to `.LCL0'
>>>
>>> thanks Khem
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>   meta/recipes-devtools/rpm/rpm_5.4.14.bb | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
>>> index 03a24f0..22b111a 100644
>>> --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
>>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
>>> @@ -110,6 +110,9 @@ inherit autotools gettext
>>>
>>>   acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
>>>
>>> +FULL_OPTIMIZATION_powerpc_remove = "-O2"
>>> +FULL_OPTIMIZATION_append_powerpc = " -Os "
>>> +
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=741d3bf91144973d26de647039fa60b87a09edf1
>> fixes same issue for libx11
>>
>> I am wondering if we should make this change in some common config
>> metadata file to list all recipes that need this workaround
>> untill gcc is fixed for it may be arch-powerpc.inc, since then it will
>> be easy to remember to unbolt them once gcc is fixed.
>
> I like the idea of a common include to handle this a lot better.

Second that.

I will send a patch

- armin
>
> FWIW, I tried gcc 5 on the autobuilder. The results were 141 failures so
> far:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150
>
> Cheers,
>
> Richard
>

