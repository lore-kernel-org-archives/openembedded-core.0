Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3tgq-0004yw-5x
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:00:36 +0200
Received: by eekb57 with SMTP id b57so40050eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ijTnz2/myMIdGTOcf18ubmZkxC4iPrDs8x9gyE1p2iM=;
	b=rndg1GNzw6+q50xtKnGkI+A2ZRa/b3HkK2VRq6uc19YiW4sokcmSnsqojqFni+eAq9
	R/tU5oU/4r3kaVWSnjNWsE1Rk/UH1xs/ChT3T4oVDZR0c1cmnWiFjngVZZIw3TT7Qgm0
	IBVDUidUI/SlaTuHiW2PbaLI8RbJIBsSjLT5Pc4uh6QxYl1rq1pHTrIS+vuVtfIlsXAD
	p8LYv/r03nizwxwIgL/k14fUvu25lgFWnxvuXNjOdzBIQWXSjqDFAt8aS5ZPpkaUgG7m
	mnz/EFXf+bRxwgvLwpDNC5+X8M6B6TAnsr+pWsJt+q1lVeb7CF64s6UuwzvEMU1ml6kl
	sVGg==
Received: by 10.14.211.3 with SMTP id v3mr14678864eeo.43.1345574912428; Tue,
	21 Aug 2012 11:48:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 11:48:02 -0700 (PDT)
In-Reply-To: <5033D668.3070909@linux.intel.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
	<CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
	<CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
	<CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
	<5033D668.3070909@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 11:48:02 -0700
Message-ID: <CAMKF1spHrm52LmxO=b7G4i_DmSY+eNVR_2=LUX2bqKUGTyxgaQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 19:00:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 11:41 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/21/2012 11:30 AM, Khem Raj wrote:
>>
>> On Tue, Aug 21, 2012 at 11:10 AM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>>
>>> On Tue, Aug 21, 2012 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> On Tue, Aug 21, 2012 at 10:59 AM, McClintock Matthew-B29882
>>>> <B29882@freescale.com> wrote:
>>>>>
>>>>> On Tue, Aug 21, 2012 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>
>>>>>> On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock
>>>>>> <msm@freescale.com> wrote:
>>>>>>>
>>>>>>> +
>>>>>>> +do_configure_prepend (){
>>>>>>> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h;
>>>>>>> then
>>>>>>> +               export CFLAGS="$CFLAGS -D O_CLOEXEC=0"
>>>>>>> +       fi
>>>>>>> +}
>>>>>>
>>>>>>
>>>>>>
>>>>>> IMO It would be safer to create a patch for kmod itself where you
>>>>>> define O_CLOEXEC if it
>>>>>> was not defined before. The above seems a bit risky
>>>>>
>>>>>
>>>>> Why is it risky? I only wanted to do this for affected systems. There
>>>>> is not an easy way to do this with a patch, unless of course I apply
>>>>> the patch manually.
>>>>
>>>>
>>>> manually gripping at the host installation and then if O_CLOEXEC might
>>>> be in comments
>>>
>>>
>>> How about grep define.*O_CLOEXEC -r ${includedir_native}/bits/fcntl.h
>>>
>>>> and furthermore it if it comes from fcntl.h which is not where you are
>>>> looking for
>>>
>>>
>>> I am grepping this file though?
>>
>>
>> I would go into the specific file where its asking for O_CLOEXEC
>>
>> and add
>>
>> #ifndef O_CLOEXEC
>> # define O_CLOEXEC 0
>> #endif
>>
>> and be done with it
>>
> Wasn't this proposed back a month ago:
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026343.html
>
> And there was discussion about that approach then? I think it was rejected
> due to lack of testing.

I think if it worked fine on a system like cents 5.8 then that would
cover the case
as well try it on newer systems where O_CLOEXEC is available that should do it.

>
> Sau!
>
>>>
>>>> there are few variables like that where its impacting more than
>>>> affected systems.
>>>
>>>
>>> I don't follow...
>>>
>>> -M
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>


