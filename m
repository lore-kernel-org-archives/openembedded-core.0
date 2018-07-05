Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 50FF27885D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 22:18:04 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id u8-v6so6390012uao.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 15:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B1zZgOL1MVtEn0PvvGPakSrL+AMa+CXANP4urU7jaNc=;
	b=fY886D7EATX060hC2bcKrgROzKnsfZrpUxKcmFCr9z7QbrodZyuEbooCVFXFlJpghP
	B5abWQYklkg62h5gakpt3y3cOxir9YqUn1n3uaWuj/JSQI9DbPB9vsA5tJBUNrE6E7Re
	GTwla/l4OBuGbP4vcYKBzdBStmLQJ42y7Iuh167Znk181Aq3QwT150cTg+uF3LtPgWbV
	qnjuBE9d5DPGjLgpZLssgfIfbiX3Mf44q8IGfL2qrrEoSb+XibGixdDIIu7oncTYCRA3
	dXgTf1j8pZYZCXJSfnnmioqyIKED04fGuH51nZ6pmsv4SxaMFI7SU46B66zTlD3WWhgZ
	/JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B1zZgOL1MVtEn0PvvGPakSrL+AMa+CXANP4urU7jaNc=;
	b=sAPxpRJM6wyKT6q46eaoIxjv7U2tuzcvusheUGFpDDiQ5QCsQkd2fAfeKUOyDa5DvA
	64QAxjnvvDH2VpgZHztzFoXxY+x5yzdGGMT/le6U7GDVD798k3AP1x2BSAEQo3yLea97
	0cML1sNsroo68M+lhVDTFKnfe0u+0O/K/+ktmvGmnx6oCmwq8/2zpJcKbmbBs50TxbPb
	p68TIZNOhZL+u4gB6XKpX38QWIBeuCuKi1XvlSyfMq0/FP90mC/nqx//vGkaRrErypdg
	/+yvWAOJbt8EmQHbwp0dqaitktgFAjwl9ndtXQmzTMF0Um8OxcRS+gRJE3GimC0yb84r
	5wwA==
X-Gm-Message-State: APt69E1ZoxiNXVAH4u+YR+YeLZ9NzyVU3g1D/RnBrIzFZsUlknrmMp6D
	UtS3OUhA20Ez4pVY1rGP7N8Bo/koyd8Gz1iYWThVng==
X-Google-Smtp-Source: AAOMgpe/NBJ6Lx8tvNpCpn9edBNs7WoFPmzc3yqrMQuh0f0uJCxAkee24+LCZeD/6lLVW7YgSVdN0VpSVUtKmkcFsRE=
X-Received: by 2002:ab0:e3:: with SMTP id 90-v6mr4392286uaj.52.1530829085109; 
	Thu, 05 Jul 2018 15:18:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 15:18:04 -0700 (PDT)
In-Reply-To: <20180705205544.24546-1-rasmus.villemoes@prevas.dk>
References: <20180705205544.24546-1-rasmus.villemoes@prevas.dk>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 5 Jul 2018 15:18:04 -0700
Message-ID: <CAJ86T=Uya2FV32fUVWfefiQQ8Mc6sgKZ4H30N2rav6tC2J3bJg@mail.gmail.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: disable parallelism for 'make clean'
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
X-List-Received-Date: Thu, 05 Jul 2018 22:18:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 5, 2018 at 1:55 PM, Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
> Whenever perf got rebuilt, I was consistently getting errors such as
>
> | find: '[...]/perf/1.0-r9/perf-1.0/plugin_mac80211.so': No such file or directory
> | find: '[...]/perf/1.0-r9/perf-1.0/plugin_mac80211.so': No such file or directory
> | find: find: '[...]/perf/1.0-r9/perf-1.0/libtraceevent.a''[...]/perf/1.0-r9/perf-1.0/libtraceevent.a': No such file or directory: No such file or directory
> |
> [...]
> | find: cannot delete '/mnt/xfs/devel/pil/yocto/tmp-glibc/work/wandboard-oe-linux-gnueabi/perf/1.0-r9/perf-1.0/util/.pstack.o.cmd': No such file or directory
>
> breaking the whole build. The root cause seems to be that the implicit
> 'make clean' done during do_configure ends up running in parallel, and
> thus multiple find commands attempt to stat and/or delete the same
> file.
>
> This patch of tools/perf/Makefile has been ack'ed
> upstream (lkml.kernel.org/r/20180705134955.GB3686@krava). Since the sed
> script matches exactly the lines
>
> clean:
>         $(make)
>
> it should be harmless to have this even with a fixed kernel, and it can
> be removed if and when all relevant -stable kernels have it.

If it works, then something like this might be a cleaner solution:

  EXTRA_OEMAKE_append_task-configure = " -j1"

(and if it doesn't work, it would be good to understand why).

> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/recipes-kernel/perf/perf.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 51f5597eb9..1cf2666ee5 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -145,6 +145,11 @@ python copy_perf_source_from_kernel() {
>              bb.utils.copyfile(src, dest)
>  }
>
> +do_configure[prefuncs] += "disable_clean_parallelism"
> +disable_clean_parallelism () {
> +       sed -i '/^clean:$/{n;s/^\t\$(make)$/\t\$(make) -j1/}' ${S}/tools/perf/Makefile
> +}
> +
>  do_configure_prepend () {
>      # If building a multlib based perf, the incorrect library path will be
>      # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
> --
> 2.16.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

