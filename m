Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 10AC5609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 11:52:02 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so51102515pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=qAeEaOo5gUE3oXmwTNgnr3hvEHxcwO/vMlbRk1YPaVE=;
	b=lyqLMwrN6a+RmplHmFtuFR5sJUW3Zxhx2aKkksLpPBk7OOHBrXCs5AjNkROg8IgYqN
	WgyUt8wnu4Ur+tc8Ic+6/tWN6VoD6uMbC9jvUzHWLZ6pYLjavSnPt/9hJG0Ndb2ZeTDL
	stgkPmRu3vTsRYjt8dAzbC2wE1qxrkoh/0UzVcmhjbiEZnO840N+OidQrsjyV/C6vpXf
	LraOz5zfDbxfWMDt6r9GWmQ6e31YoZYA98+0IU2/RIjeNmFmbdiYod4Do1DuIL4RHJAV
	aUNq1dmU00FAQkIUcoiw0Zg9lmAFuWgSHtGwm8mhkY+RsJivzAvHIVm7vrKUMToWEvJN
	d51g==
MIME-Version: 1.0
X-Received: by 10.68.194.6 with SMTP id hs6mr43734594pbc.58.1431949924194;
	Mon, 18 May 2015 04:52:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Mon, 18 May 2015 04:52:04 -0700 (PDT)
In-Reply-To: <2117516.tkUI32xNOp@peggleto-mobl.ger.corp.intel.com>
References: <55555B65.80600@windriver.com>
	<1431812050.4956.5.camel@linuxfoundation.org>
	<555945F2.9020708@windriver.com>
	<2117516.tkUI32xNOp@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 18 May 2015 08:52:04 -0300
X-Google-Sender-Auth: ijEdDTW98jbI_jyUx02qDNyuV2I
Message-ID: <CAP9ODKqzPP=wSQFxO+0E1XFjbd6rZfqo_GZbQYzNgYEFpAzKuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe> ?
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
X-List-Received-Date: Mon, 18 May 2015 11:52:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 18, 2015 at 5:45 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Robert,
>
> On Monday 18 May 2015 09:52:50 Robert Yang wrote:
>> On 05/17/2015 05:34 AM, Richard Purdie wrote:
>> > On Fri, 2015-05-15 at 10:35 +0800, Robert Yang wrote:
>> >> Is is useful/possible if we add something like bitbake <recipe>
>> >> -cmenuconfig, just like kernel's make menuconfig ?
>> >>
>> >> We can use the menuconfig to config the vars such as MACHINE, DL_DIR,
>> >> DISTRO_FEATURES, MACHINE_FEATURES and all the variables which are
>> >> configurable, I think that this would help the newbie a lot.
>> >>
>> >> I think that we can add a menuconfig.bbclass (or other names) to do this,
>> >> and I'd like to work on it.
>> >
>> > Why would you want to specify a <recipe> when configuring MACHINE? I
>> > understand why you're thinking this but it isn't well thought out and in
>> > this form would confuse users more than help them.
>> >
>> > I don't think the system will even parse without a valid MACHINE, let
>> > alone execute tasks.
>>
>> I meant that we need something to help configure the build easier, it
>> can generate something like local.conf.append, not configure the recipe.
>>
>> The example "bitbake <recipe> -cmenuconfig" wasn't right enough, it's
>> just a rough thought, we can use the current default local.conf
>> (MACHINE = qemux86) to make system parse.
>>
>> The problem is that we have many bbclasses in oe-core, a lot of them
>> has specify configurations, and also a lot of vars in the conf file such
>> as bitbake.conf, it's not easy to know how and what to config, especially,
>> for newbies. The "bitbake -cmenuconfig" maybe not a good idea, I think that
>> we need something to help config the build (generate local.conf) easier,
>> do you have any suggestions, please ?
>
> This is likely the direction we will be going in with the Toaster web UI -
> with a web-based tool we can present a much friendlier interface and have the
> chance to link to other information, for example we can link to the
> appropriate manual section for individual variables (and in future error
> messages, classes, etc.), analyse the output of the build, manage multiple
> sets of configuration, etc. These are things that would be difficult to do
> practically from the command line.

Toaster is nice but we shouldn't stop improving cmdline use as the
first won't work for some use-cases.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

