Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3C360234
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 07:26:56 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j17so14943842edp.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 23:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KoHBgKA9yXplr61bA6y6g6Dg1ZcSr2+ny54Qnw7WhPc=;
	b=Z/kUlfbPE0zSN2xJHlB4deODAeKZCJPR4H45b0PxGFJY6DpApXDRv19TvJCUfKtFX4
	QwkNDoIlMU1WmdNEeWtbC87JGp9BeEV1pyHSYD02/0bS7zC2mudcAciMrtju2qb6Hsby
	p2JbG7tDWCskapAms7KikiSxuJ9OswshzvAdvRK4w28cwF3VCqxdFU4zABbFcGssyVBQ
	FLGbFHT5XIavDswNMuQ8aBtvfZGB36VFSttc0p1AfiIWDBqjbbLcu0Ze7UzGcAbIxkCz
	740HQMqmB1nlD1g5rHT+yasMv5NI0dIQ4AKSega/tldLoDUfQ1T8qA+JjXWrHD3TCCrJ
	oG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KoHBgKA9yXplr61bA6y6g6Dg1ZcSr2+ny54Qnw7WhPc=;
	b=KkS7G2/OTl4axZl+r4XSlBh+uAC4UBou6pdXM8cQ9RlUT+bMAOoE+1ZlJRAa17Itv1
	3Nw2M3EM1Vf/cMugmD5fsmHqmxSIJXpd78IyVYuVm/U8ra7593JG840PRy18tk7mMA4J
	Cd1mfX7kuXnBNooDmOCXvMsjprvv4Jo0+svdG5IGSHJ8RTPnBu4hHgyal+2eBnuE6Yrv
	qO+2MbkjHwep4/7IIFZN6oTlL/GhKz/EikmmsyEVwF0e1ayLh9joKhRY6xwypv0jNWNS
	P4wCGyt7Qko0whHkW7guhqPJPG4rPE+s/zQKMjcdyGGw8ARsHWbrqzLSKd5NU52BimSc
	0F/g==
X-Gm-Message-State: APjAAAXPX9Mlivp5lVGxWOFKmkVmOgzw9xFWJ7x6yVyFi9dhW7mEC/4u
	51EZ99NyilFZbvQVQ7u638wuNV+Y1nec9JzeYcIcJQar
X-Google-Smtp-Source: APXvYqyCO7WKHqyv4WucwuyR5TwNULDfUixVUZ7blmbcIfr2qN3S2ZmbNlr2rmiM9q0d37hy7HJAXgccC7zP8GvUouA=
X-Received: by 2002:a17:906:260b:: with SMTP id
	h11mr19664444ejc.327.1580714816683; 
	Sun, 02 Feb 2020 23:26:56 -0800 (PST)
MIME-Version: 1.0
References: <20200203063455.417119-1-joel@jms.id.au>
In-Reply-To: <20200203063455.417119-1-joel@jms.id.au>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Feb 2020 02:26:45 -0500
Message-ID: <CADkTA4O68URSfv15COmx8ApRs+g_wB8VSVoEuf73j8gDF-TZog@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Additional fixes for 5.5+
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
X-List-Received-Date: Mon, 03 Feb 2020 07:26:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 3, 2020 at 1:35 AM Joel Stanley <joel@jms.id.au> wrote:
>
> In e5c4f3127521 ("perf: fix build for v5.5+") this recipe was fixed for
> 5.5 kernels, however testing shows that there's a few other changes
> required.
>
> perf's build system uses a file from the scripts/ directory to
> generate a bpf header, so this must be added to the list of files to
> perform a replace on.
>
> Additionally the replacement would run on all occurrences of
> /usr/bin/python first, resulting in lines that contained
> "/usr/bin/env python32". This re-orders the sed lines to avoid that.
>
> This fixes warnings such the following:
>
>    File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
>      _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
>  ModuleNotFoundError: No module named '_sysconfigdata'
>
> Change-Id: I8d0011908c87d5fbcf1c3aefb362fe6beb64d22e
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Found when attempting to use 5.5 with OpenBMC.
>
> The sed method of fixing this may be fragile, and moving to patching the
> source tree may be preferred in the future.

unfortunately, we cannot do patches. Since perf is a copy of the code
from the kernel source, you can't carry patches that apply everywhere.

Bruce

>
>  meta/recipes-kernel/perf/perf.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 6d1b06693d26..1e0be467c024 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -239,11 +239,11 @@ do_configure_prepend () {
>      fi
>
>      # use /usr/bin/env instead of version specific python
> -    for s in `find ${S}/tools/perf/ -name '*.py'`; do
> -        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
> +    for s in `find ${S}/tools/perf/ -name '*.py'` scripts/bpf_helpers_doc.py; do
>          sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>          sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>          sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>      done
>
>      # unistd.h can be out of sync between libc-headers and the captured version in the perf source
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

