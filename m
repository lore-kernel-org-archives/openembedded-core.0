Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 69EE66E7D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 20:06:37 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id 10so1076976lbg.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 12:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uKoYv2+wstAIQy20dD7Q8/CXHiIrSKQ14xYFeAfdzw8=;
	b=w7Wp20eoJiYSrWdaveCfBMQivwwPbRbyzfwKK6BT+dNfM+hfSBMGCOM3/ZoyugabwR
	oaYTIJyhm/3E0/GI6dXu5/DgQUg6t0GOvd/eBEzbFe141EE5FfWKrLmuOPDmaVFkWNJP
	fjRcC10wWpCstgzLXJeu6XLpY9mexk+hW3HYDn/dutq7czBxNpCph3gfQkaYF69a3Dow
	GgyPGq75o161zJ7wxBZMz6WFyn6R8AJAf6VkH63ZXCPz/M/lh7VSZsu7Sx4SJQ3oNHv2
	UI1EwLvVv8r4uVrjIG1H2B28bu5DVG7OBitC3FR8e3dUuEyu+rahMT3pG7N/RskbNMYN
	q2uQ==
MIME-Version: 1.0
X-Received: by 10.112.143.228 with SMTP id sh4mr37414lbb.57.1394049997614;
	Wed, 05 Mar 2014 12:06:37 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 5 Mar 2014 12:06:37 -0800 (PST)
In-Reply-To: <CABcZAN=E+XFNCegQy+foqsfqdn+NjfgUKrvTjBFvDZK2nNFe5g@mail.gmail.com>
References: <1394038191-26474-1-git-send-email-matt@console-pimps.org>
	<1394041627.31845.127.camel@ted>
	<CABcZAN=E+XFNCegQy+foqsfqdn+NjfgUKrvTjBFvDZK2nNFe5g@mail.gmail.com>
Date: Wed, 5 Mar 2014 15:06:37 -0500
Message-ID: <CADkTA4Obe_kcN71A=K0OqkL0XP27PHJLGgOfD+tiE5rGACMdoA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: Matt Fleming <matt.fleming@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: Inspect remote branches with git ls-remote
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
X-List-Received-Date: Wed, 05 Mar 2014 20:06:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 5, 2014 at 2:53 PM, Chris Larson <clarson@kergoth.com> wrote:
>
> On Wed, Mar 5, 2014 at 10:47 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Wed, 2014-03-05 at 16:49 +0000, Matt Fleming wrote:
>> > From: Matt Fleming <matt.fleming@intel.com>
>> >
>> > 'git branch' may use ANSI escape codes in its output (to provide colour)
>> > which doesn't play well with commands expecting pure plain text, e.g.
>> >
>> >     fatal: '^[[31mmaster^[[m' is not a valid branch name.
>> >
>> > Furthermore, the output of 'git branch' is subject to change and trying
>> > to parse it could potentially lead to breakage in the future.
>> >
>> > Signed-off-by: Matt Fleming <matt.fleming@intel.com>
>> > ---
>> >  meta/classes/kernel-yocto.bbclass | 10 +++++-----
>> >  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> My worry with this change is that it will cause the system to hit the
>> network. We specifically support builds from archives of the
>> repositories so I'd worry about using ls-remote like this :/.
>
>
> What about git for-each-ref? If we just need a list of refs, that's what
> for-each-ref is ideal for.

Good suggestion, that can definitely work. With the format, it saves the
awkward awking and cutting :

I've used this in the past:

   git for-each-ref --shell --format="%(refname)"  refs/heads/ refs/remotes

The minimum footprint change is still just --no-color, that way we don't change
just for the sake of changing.

Cheers,

Bruce


> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

