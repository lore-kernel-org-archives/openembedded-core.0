Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 662256FE2F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 15:30:07 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 19so2140450ykq.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=wl1jdpiwp5bUpkS1C7Ju7VqHHD9w5d8oBJTdeeszWd8=;
	b=TS4cYns423MFmfMvc8iMSM7V2keCTmOVCR+M6aUMG76hOaR2AE20UEh/oAu6HYIxEn
	9dHBWVqyHHXyMCQDVAMWor3xYHBnhlwHeDotbfX60DE0q20+VWqHESgZ2CL+UN9sOLJz
	pA/FZLZTzqiFRlW67LoqWEOhfhdAO9t3ykN9ScmVgRoywU+tSYSo5Npb59Jh84CwNAwG
	8r6CBEpaAPffaPu7EnultnkP6fqH+MaoFM2dHTTCYncauQ8trlxXcbabtBw6WYqbFiGI
	0XHIlT96B6VJ32sFWFPPdM/Irdvp3kh+MQabaudYKYElEqMPzDWWPPWmS9/TcFr5BhcV
	ATeQ==
MIME-Version: 1.0
X-Received: by 10.236.230.6 with SMTP id i6mr5609301yhq.14.1402673408611; Fri,
	13 Jun 2014 08:30:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Fri, 13 Jun 2014 08:30:08 -0700 (PDT)
In-Reply-To: <1402646797.12440.477.camel@ted>
References: <cover.1402552609.git.sgw@linux.intel.com>
	<37280175766b34129a22d2602f057511e90263b1.1402552609.git.sgw@linux.intel.com>
	<CAP9ODKobCoJiCmLZ+-JwoZB8hBZdTSn0jX0bbmgFtosWXVJ2WQ@mail.gmail.com>
	<1402646797.12440.477.camel@ted>
Date: Fri, 13 Jun 2014 12:30:08 -0300
X-Google-Sender-Auth: wOtxNun7sdS8OKEdTsLLMO9RUKs
Message-ID: <CAP9ODKr_oLKick6wKscWpzq7r88G4ekB1CURxiJ_Oxqe5AJHnA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC - WIP v2 01/10] conf-files: New recipe to create single recipe for config files
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
X-List-Received-Date: Fri, 13 Jun 2014 15:30:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 13, 2014 at 5:06 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-06-12 at 10:57 -0300, Otavio Salvador wrote:
>> On Thu, Jun 12, 2014 at 2:56 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> > This recipe will create 1 package for config files, we could optionally add
>> > a bbclass file to ensure consistency with RRECOMMENDS_ = =conf
>> >
>> > This is a work in progress, the do_install might even beable to automagically
>> > generated.  We don't want to create a bbclass for these since it will cause
>> > the actual recipe/packaging to become machine specific, using this recipe will
>> > ioslate that.
>> >
>> > [YOCTO #4011]
>> >
>> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> I think the configuration file, nowadays, already made those machine
>> specific in every BSP which has those overriden so I don't see why use
>> a single recipe to provide several configuration files.
>>
>> I think it will be confusing and this recipe will fast grow.
>
> There are a few good reasons to do this.
>
> Machine customisation is spread around a whole load of different recipes
> at the moment and its hard to obtain a good view of what files are
> available and which ones a BSP author may need to provide.
>
> Its rather ugly to have to provide and maintain multiple bbappend files
> with rather ugly syntax within them. Its also rather inefficient from a
> build process standpoint to have 15-20 recipes just packaging
> configuration files.
>
> The intent isn't to mandate *every* config file should be in this
> recipe, you will as now be able to add additional ones. Where we see the
> same files being added in many layers, adding something common and
> shared makes sense though.
>
> It should in some cases also allow the "core" recipe to stop being
> machine specific and shared, improving build efficiency. There is little
> point in a recipe becomming machine specific over a config file.
>
> So I'd consider this move a consolation which we can improve over time.
> For new users I'd suggest that one more common place for the majority of
> machine specific files would be more understandable too.

I understand and mostly agree. However I don't want to have a recipe
with 20 configuration files where I'd need just two.

So I think we'd need to have a way to 'enable/disable' each
configuration override. Does it makes sense?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

