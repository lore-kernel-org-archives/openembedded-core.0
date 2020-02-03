Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C020A60234
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 07:07:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z9so4260624wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 23:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K/mOo8RlT9vK1RLb5Vx6UyAd2oLcJ4DGpM6PrWVKYMA=;
	b=q1ot4i7UmCGm9LKe6g2xQlp2SPnkA6flKZ7ECU11JFbbupDDmqetyEYFa/F3IZb2oC
	fRaxudGF9nTO9FJh7Q+hzuY+qA3/uZDuy7oJu3rutnO7jGCTDJt+/AYmZlJ+oowRK7ue
	ly+uDGHVndWjPfEON180ajmUM5wRspEAOiInK1nw5veB804YrzI4EQmzvafQNo1gFOaZ
	NqLpQc53zb4e8Xy1qjt6Nx7kU4QAkTylBH9MmEC9D9YrH4YRneGpu+piIbsXpHB+261R
	QXqPstPXV14vCvKLkKMNZ6DEx/2YMxQTcd29yY82j/0N8wYDMA5WEFq4z9vfRQLS5F5y
	qpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K/mOo8RlT9vK1RLb5Vx6UyAd2oLcJ4DGpM6PrWVKYMA=;
	b=jSWmNo9fbkZ4BBUYpBdpjSAbBhL997WRIkvhC5Sqi+d+c/BXToaG4Sfgp09Q/coSyi
	sjg3A/5ito8W6Kux3CvKGeOAyCxxNi7uLYTINjx7nv4bbJ0SMWXDMRFkVawglq7vyMWg
	DAXsRV6fX+UOahzlnpwN5Kq1ULzH80W+qmgWJUyrCUz+frZfo7c5HoXLCBNK4JmSR8kJ
	HdYrhedkJxlP5/89+lA9ehqHiFDi5MUmmnl0On6qw5AtCsYBYBiuLNE0R3JyPzZnsahl
	z3+rZMBNZ1CbBsAWVgdxVJRougxyW+GCI+uxL+FEoycuATJ31FBxzIa3Y4csBHQNpY6O
	0yVQ==
X-Gm-Message-State: APjAAAXZg5g+aOWyR6Rm/KDIS16sBVz7Jl2PPU3UyzcaDQUD/yT9qEJw
	mTCd+0JZmakNHZjLH9Ndz/g5VUeJAoAllqb6VAg=
X-Google-Smtp-Source: APXvYqzt2tWkxbVrb69/yIpEjcYT4yJQbCd50h49TZ7RCnukrV9xEYWjvaBRPDTFlkADiw2+KgqsJxlJGBjt7acNIDo=
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr14208187wrr.73.1580713671391; 
	Sun, 02 Feb 2020 23:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20200203063455.417119-1-joel@jms.id.au>
In-Reply-To: <20200203063455.417119-1-joel@jms.id.au>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 3 Feb 2020 08:07:40 +0100
Message-ID: <CAHtQpK4W2PgPqdweMx7RZ8WzG4YgcJXeREHr+VcP+gGj9HrmCQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 03 Feb 2020 07:07:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 3, 2020 at 7:35 AM Joel Stanley <joel@jms.id.au> wrote:
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

bpf_helpers_doc.py script is already python3, and according to the GIT
[1] - it was created like that. Do we really need to include it in the
list? Besides, provided this is really needed - does it make sense to
check all scripts instead of explicitly supplying just one here?

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

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/scripts/bpf_helpers_doc.py?h=v5.5

-- 
Regards,
Andrey.

