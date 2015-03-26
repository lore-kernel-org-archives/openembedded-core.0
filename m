Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id C88206013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 13:43:18 +0000 (UTC)
Received: by igcxg11 with SMTP id xg11so54033341igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 06:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=nWYdE8TwaTB606vQOAIYO4UYtIYIIdldZnVHrYPul7c=;
	b=o+OYWmARBG0n0WpxqSGCd7uGQDjfyrznpeT7qLpIFOfa7EZpWvZG7tfl1Ybuoxq64V
	HMIpiup7jebPEvGDXNxG6nqJu0TRRGUC0yRmN6HCflBFn9KC9YlhQLosHgjuONGMXvfE
	vhdE9T5SDXpzE484iqwHDPUyvF5H75ASGLQUYMEKDBd8PhpDO743ak8MdMoRDX3HM177
	EYz94o21G2BMwSbKxOiRnHXTTpE+E3XxQmzMzf4emfwhsHWB1tO3rrvFnL3jnNJuhrtF
	UTwjiNmx5a+SAPFLk9JcW6qQJj2S4KJewbl8oCqu17P6OMExqJuavngQl/qTXbn0VP73
	RXPw==
MIME-Version: 1.0
X-Received: by 10.42.94.65 with SMTP id a1mr37223114icn.1.1427377399729; Thu,
	26 Mar 2015 06:43:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.133.21 with HTTP; Thu, 26 Mar 2015 06:43:19 -0700 (PDT)
In-Reply-To: <1427377220.2918.8.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-4-git-send-email-bruno.bottazzini@intel.com>
	<20150326082923.GA7370@ad.chargestorm.se>
	<CAP9ODKr7QnmGCFfh+HnB1d_TE0CDCkqSgG75if11E_Z+CMq5sA@mail.gmail.com>
	<1427377220.2918.8.camel@bottazzini-ThinkPad-T430>
Date: Thu, 26 Mar 2015 10:43:19 -0300
X-Google-Sender-Auth: kRAnu4wLI2dD-P7JK0F9_7A-S20
Message-ID: <CAP9ODKoLq6NUSMsAj8vow_kVoF+erxkF2+PRKpeDqmEqwEG_yw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: split modules into packages
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
X-List-Received-Date: Thu, 26 Mar 2015 13:43:20 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 26, 2015 at 10:40 AM, Bottazzini, Bruno
<bruno.bottazzini@intel.com> wrote:
> On Qui, 2015-03-26 at 08:56 -0300, Otavio Salvador wrote:
>> On Thu, Mar 26, 2015 at 5:29 AM, Anders Darander <anders@chargestorm.se> wrote:
>> > * Bruno Bottazzini <bruno.bottazzini@intel.com> [150325 22:50]:
>> >
>> >> if one wants to launch a simple deamon, most modules are not
>> >> required.
>> >> He will be able to save space and exclude unwanted packages
>> >> from the final image.
>> >
>> > I like this, though I've got a few questions that I just noticed.
>> >
>> >> -PACKAGECONFIG ??= "xz ldconfig \
>> >> +PACKAGECONFIG ??= " \
>> >> +                   gcrypt \
>> >> +                   kmod \
>> >> +                   ldconfig \
>> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
>> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
>> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
>> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xz', 'xz', '', d)} \
>> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
>> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>> >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>> >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
>> >
>> > It might be worth noting that xz has gone from being explicitly enabled,
>> > to depend on a DISTRO_FEATURES.
>>
>> Agreed and we shouldn't explode the number of possible dsitro
>> features. I'd also prefer if xz were kept enable by default so we
>> don't make a behavior change under the hood.
>>
>> ...
>> >>  PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
>> >> -PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
>> >
>> > Why do you remove networkd as a PACKAGECONFIG?
>>
>> If there is a real reason for this, it must be recorded in commit log as well.
>
> Firstly,
>
> Thank you a lot for reviewing this Patch. I'd like to ask you guys to
> review the others patches too.
> I know this on will be the more complicated but there others will be
> faster to review.
>
>
> Now:
>
> Guys, if you continue this patch you will see that networkd will always
> be enabled. Systemd will always configure/make it however, the package
> will not be installed if the user wants to.
>
> With PACKAGECONFIG, we may not get everything "for free" as some data
> files will be installed regardless as well as some components from
> systemd cannot be disabled by their build system but we can run without
> them, for instance we can run without journald.
>
> The problem is understanding that although systemd is a single
> repository it contains multiple services and daemons in it that can run
> even without the core PID1, udev or the many helpers used to configure
> the system such as resolved,
> timedated, localed...
>
> All of these components are runtime independent, we can install or
> remove them and they should not create problems.

I understand however you can remove the files if networkd, for
example, is not in PACKAGECONFIG.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

