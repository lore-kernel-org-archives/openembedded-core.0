Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0497C65CAF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 16:10:37 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 9so1144807ykp.39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Dec 2014 08:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DaBocyknbfFDC4/mtDzQemf1856flLYPfIThT8YGVBg=;
	b=OulssRL5202q6INm+3aoKxo+VXwfjW70oc61lwWBMha0jFj7yLjQFxD5UOqhWbeKdm
	yosqJeAPlhkE2VY//WqEHZUUk41gAhOgqcLFzc5fxet4VdolGt81yzcw1bpM/KA8q/Y1
	k82QZjw8o4/kqpmZu2w1dGxGOS38M53TfmrxoNE9xOCs7RvcWASm6BwQQpF/NxUCAXZg
	NH5bM5PHf1XoYsXAta2UpDhZOJdDi/I5YoGE7xVZLNJXXcNcUWLUH7DeiwJGRzjUMJHR
	kY1Q+KwhLMrPo1syeHfhqxIlTzPfRHJVv1a5Dj2dVcAhdmY9WqSn3pXaB3bkekvJDsKu
	66rQ==
MIME-Version: 1.0
X-Received: by 10.170.129.147 with SMTP id v141mr27284320ykb.110.1417882237840;
	Sat, 06 Dec 2014 08:10:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Sat, 6 Dec 2014 08:10:37 -0800 (PST)
In-Reply-To: <1417876633.5102.23.camel@linuxfoundation.org>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
	<b16b90e4646b1eb5ae59f98fca123f2f55f7ad3c.1417802944.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqGkqK7rMKudFGcjcEyXc+VquhtRPZpioXbXhTOc-kt2Q@mail.gmail.com>
	<2398845.3Ch9h31VYL@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
	<1417876633.5102.23.camel@linuxfoundation.org>
Date: Sat, 6 Dec 2014 14:10:37 -0200
X-Google-Sender-Auth: JZ5eMpq9TRF391Fw5WVbokwJFPk
Message-ID: <CAP9ODKrs_-Ed7J3ra2u1nVvC9QMkToNpBsefvufJSepaZB0O2g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Sat, 06 Dec 2014 16:10:41 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 6, 2014 at 12:37 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2014-12-06 at 11:01 -0200, Otavio Salvador wrote:
>> On Fri, Dec 5, 2014 at 11:39 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > On Friday 05 December 2014 16:30:44 Otavio Salvador wrote:
>> >> On Fri, Dec 5, 2014 at 4:09 PM, Paul Eggleton
>> >>
>> >> <paul.eggleton@linux.intel.com> wrote:
>> >> > Since the split out of git-perltools, some git tools (such as "git am",
>> >> > "git send-email" and "git-submodule") have no longer been part of the
>> >> > buildtools. We need these, so add them back in.
>> >> >
>> >> > However, adding git-perltools to buildtools triggers perl itself being
>> >> > brought into buildtools as well, and we don't want that; but we also
>> >> > don't want to have to hack the git recipe or indeed anything else that
>> >> > starts depending on perl. Thus, add a dummy package which gets installed
>> >> > in its place, in a separate package architecture that is only enabled
>> >> > for buildtools to ensure it doesn't start appearing in place of
>> >> > nativesdk-perl anywhere else.
>> >> >
>> >> > Fixes [YOCTO #7033].
>> >> >
>> >> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> >>
>> >> This dummy thing looks like a hack to me :-(
>> >
>> > Perhaps - I'm all ears for an alternative solution, but it absolutely has to
>> > be fixed, and soon. Shipping an incomplete git (or incomplete perl) in
>> > buildtools basically defeats a major part of having the thing in the first
>> > place.
>>
>> We should split out the tools we really want (so we skip the perl
>> runtime dependency) or include perl. Use a dummy package for it is
>> wrong in my opinion. You cannot guarantee host perl will work as
>> expected for our git release.
>
> There needs to be a mechanism where we draw the line on which
> dependencies a given thing has. Perl is arguable both ways. In all cases
> I'm aware of, the host perl is generally API stable and works fine with
> buildtools.
>
> If you don't buy the perl argument, think about bash. Should we ship
> bash in case anything in the buildtools tarball? Should we alter all
> script paths to point at our own "sh"?
>
> At some point you have to depend on the host system, be it perl, sh or
> other things. The exact line should be configurable, Paul is simply
> adding a mechanism here that allows us to control that. He's needed a
> default and I think perl is API stable enough that we should be ok here.

I understand but the provided mechanism is ugly and hackish.

Maybe a mechanism like 'ASSUME_PROVIDED' could be made and use for
this use-case. A dummy package looks like a workaround.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

