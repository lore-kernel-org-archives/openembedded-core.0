Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5E773289
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 20:18:10 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id m62so6804438vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 13:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=+NB3jiZtT0uohlYyOXq9Zw91qApxc6gbZ6xN7zsj02w=;
	b=oOIoLEgOfBJ3aRK2t2FYo12hAtpd8xyo4OOO3E/dGU1Cfx80xg9dSTDumtA1I1j+bF
	VZZg6NQ4QBPlZo35iZOxDq7uSuitfbQ+hsFuXC62QVkFSB3LewgCXjUR+OAcWwuSnR+I
	bJY2Mkjn65koOYKsxIV+uZsEP4FJUVBaChqmz4B6qDxkwrGa+m/S5aRhjKplu3TtMU1q
	Lgcjgz9TmH5ghuKLfJjWNL61G60/UjYIxT8XD9XNiGRj0AMusLwOKXD4Yptwqsg3GA4V
	DAelB/0WmfU2bFgzFkANIMMDHaRikIjZkLF8+WRjqgwTJe6r/gByx+Ca9PhqBY2U20xw
	K2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=+NB3jiZtT0uohlYyOXq9Zw91qApxc6gbZ6xN7zsj02w=;
	b=catTC1yswl+ho4IjvUK4BPKL75eVyVyTUPwDVVHZyt2L7Q2gMhAJUbtVgog4Wn9UBP
	NbGh+N0OJBL49vz+AB/0VT3VkAEA3vn9LktvyE1HSEFG41pBclr8LGRoQjh3/SovuMDu
	VVHss2yxQ1u5cdr9cuesi/oqBX/J/DWzeMjYe0qtj/dQNxeFgkC8lQjvqTBJ2NfHsbtS
	mizDzpCLP0gxj9C+aTye6hk2vSfT+qdLRAhl544ehJusiHd84ZM01aSXtn0cMN19Q/ph
	Li9vfA3tMUu6N2zALxaJrBzPeh30TopZMhYFz2CUjfb4poiNvIwoh9oYR0rcuwAEDfLk
	dxIw==
X-Gm-Message-State: AE9vXwMu3juRB1qyJIi+j3qgwHGGlDCXCFGEeawZC9BsMMTPVAz1EdxnaXIJ0uYQvFbliUPS63rbNAXmxnRirQ==
X-Received: by 10.31.130.142 with SMTP id e136mr9703868vkd.145.1473711490328; 
	Mon, 12 Sep 2016 13:18:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.48.146 with HTTP; Mon, 12 Sep 2016 13:18:09 -0700 (PDT)
In-Reply-To: <1473711064-9680-1-git-send-email-ulfalizer@gmail.com>
References: <1473711064-9680-1-git-send-email-ulfalizer@gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Mon, 12 Sep 2016 22:18:09 +0200
Message-ID: <CAFkk2KQypEu2Ky4zbM1q2pJt6ngQSvm6hY932hwjp36Vx+REkw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: fetch2: Make SRCREV_FORMAT name substitution safer
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
X-List-Received-Date: Mon, 12 Sep 2016 20:18:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 12, 2016 at 10:11 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> Given two names "foo" and "foobar" and SRCREV_FORMAT = "foo_foobar",
> "foo" might currently get substituted twice. Work around the issue by
> sorting the list of names by length and substituting longer names first.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  bitbake/lib/bb/fetch2/__init__.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
> index 11c75cc..4ca024e 100644
> --- a/bitbake/lib/bb/fetch2/__init__.py
> +++ b/bitbake/lib/bb/fetch2/__init__.py
> @@ -764,7 +764,10 @@ def get_srcrev(d, method_name='sortable_revision'):
>      seenautoinc = False
>      for scm in scms:
>          ud = urldata[scm]
> -        for name in ud.names:
> +        # Sort the list of names and replace the longest names first. Given two
> +        # names "foo" and "foobar", this prevents "foo" being substituted twice
> +        # in "foo_foobar" (and "foobar" from not being substituted at all).
> +        for name in sorted(ud.names, key=len, reverse=True):
>              autoinc, rev = getattr(ud.method, method_name)(ud, d, name)
>              seenautoinc = seenautoinc or autoinc
>              if len(rev) > 10:
> --
> 2.5.0
>

Hrm... the bitbake-devel mailing list would be a better fit. Sent it there too.

Cheers,
Ulf

