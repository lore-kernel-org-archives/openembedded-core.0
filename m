Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3tPz-0003xs-0o
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:43:11 +0200
Received: by eaad12 with SMTP id d12so35859eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=w5hH7+TCjk2q+Pq7AWavL2ISRDqh8I1kN5hxFNWoomc=;
	b=k3ynILJCSkUW5OroTuljogBygsAR64ITn3izRRiFrj2rnOjAvHAIx9NqtzOmnP+CI+
	tIaCxSItXbqz1tINhPg/npZNbSEYpny9t1+zuSpbYp4TZOcexkKODnVt3GL+Ywc9jjHV
	0VvSh9ec6e20YZ3Z0HOIUsXUTyrdnJdo+HFdyVq9VcIYHTVIkLZiVGRR4YVaRABNAC4T
	Zj9dyseBuZ0NkO9/Yxh/Ci2MnookJ+/FZpgeV7qttpVS0sW5mdmtuXX2eXZxM+OFkGce
	7iRX+Wb+eTAOLMQ+MP4T1Jjom/nPXNHyK+rK5HCUGZyRq72xl2vchEy0ltBbeWXPJBAB
	x4Zg==
Received: by 10.14.4.201 with SMTP id 49mr14840595eej.0.1345573867088; Tue, 21
	Aug 2012 11:31:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 11:30:36 -0700 (PDT)
In-Reply-To: <CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
	<CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
	<CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 11:30:36 -0700
Message-ID: <CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Tue, 21 Aug 2012 18:43:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 11:10 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Tue, Aug 21, 2012 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Aug 21, 2012 at 10:59 AM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>> On Tue, Aug 21, 2012 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock <msm@freescale.com> wrote:
>>>>> +
>>>>> +do_configure_prepend (){
>>>>> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; then
>>>>> +               export CFLAGS="$CFLAGS -D O_CLOEXEC=0"
>>>>> +       fi
>>>>> +}
>>>>
>>>>
>>>> IMO It would be safer to create a patch for kmod itself where you
>>>> define O_CLOEXEC if it
>>>> was not defined before. The above seems a bit risky
>>>
>>> Why is it risky? I only wanted to do this for affected systems. There
>>> is not an easy way to do this with a patch, unless of course I apply
>>> the patch manually.
>>
>> manually gripping at the host installation and then if O_CLOEXEC might
>> be in comments
>
> How about grep define.*O_CLOEXEC -r ${includedir_native}/bits/fcntl.h
>
>> and furthermore it if it comes from fcntl.h which is not where you are
>> looking for
>
> I am grepping this file though?

I would go into the specific file where its asking for O_CLOEXEC

and add

#ifndef O_CLOEXEC
# define O_CLOEXEC 0
#endif

and be done with it

>
>> there are few variables like that where its impacting more than
>> affected systems.
>
> I don't follow...
>
> -M


