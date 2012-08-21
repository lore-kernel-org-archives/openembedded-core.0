Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3taK-0004Pc-3l
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:53:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by orsmga101.jf.intel.com with ESMTP; 21 Aug 2012 11:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,803,1336374000"; d="scan'208";a="136584075"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2012 11:41:44 -0700
Message-ID: <5033D668.3070909@linux.intel.com>
Date: Tue, 21 Aug 2012 11:41:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
	<CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
	<CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
	<CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
In-Reply-To: <CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Aug 2012 18:53:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 11:30 AM, Khem Raj wrote:
> On Tue, Aug 21, 2012 at 11:10 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Tue, Aug 21, 2012 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Tue, Aug 21, 2012 at 10:59 AM, McClintock Matthew-B29882
>>> <B29882@freescale.com> wrote:
>>>> On Tue, Aug 21, 2012 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock <msm@freescale.com> wrote:
>>>>>> +
>>>>>> +do_configure_prepend (){
>>>>>> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; then
>>>>>> +               export CFLAGS="$CFLAGS -D O_CLOEXEC=0"
>>>>>> +       fi
>>>>>> +}
>>>>>
>>>>>
>>>>> IMO It would be safer to create a patch for kmod itself where you
>>>>> define O_CLOEXEC if it
>>>>> was not defined before. The above seems a bit risky
>>>>
>>>> Why is it risky? I only wanted to do this for affected systems. There
>>>> is not an easy way to do this with a patch, unless of course I apply
>>>> the patch manually.
>>>
>>> manually gripping at the host installation and then if O_CLOEXEC might
>>> be in comments
>>
>> How about grep define.*O_CLOEXEC -r ${includedir_native}/bits/fcntl.h
>>
>>> and furthermore it if it comes from fcntl.h which is not where you are
>>> looking for
>>
>> I am grepping this file though?
>
> I would go into the specific file where its asking for O_CLOEXEC
>
> and add
>
> #ifndef O_CLOEXEC
> # define O_CLOEXEC 0
> #endif
>
> and be done with it
>
Wasn't this proposed back a month ago:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026343.html

And there was discussion about that approach then? I think it was 
rejected due to lack of testing.

Sau!

>>
>>> there are few variables like that where its impacting more than
>>> affected systems.
>>
>> I don't follow...
>>
>> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


