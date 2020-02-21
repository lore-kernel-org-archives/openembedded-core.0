Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 988DD61741
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:43:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y11so3617117wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 13:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9ArLyfwGPAdKjscY7zrTS7qlWLZASWqNYntQhr7uh1A=;
	b=KeCbBjnf97nXBlV3x6ftL620jGPd5EIDK5XRqPG6fuble3N1W3A7hnYCVMbEA5qxI9
	vs14dQHmkbH39eLACfhkThcsGyQo0fkBCo9qFyzOaD8KoXGh2fLLUgyHpls775Ek008L
	cAUJlJ66iustRayLpa8BnTZQmO32lkG+Eh4TmCEtF0GTsL3cUVRGrS5s3CVqJFpbQ7GA
	EWdgTCVRJiFbFyYVKBijT8dFz+57HeXFFZDJseIix4iaklcAPbh+q8WFztWknjXhV1MN
	Apc3/RVOGiUNPiHtcdhCGoQIN9ZfwQkc80NyYebt3WS5KW8AAYkY9JgHb8tTKsCOIFYb
	tEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9ArLyfwGPAdKjscY7zrTS7qlWLZASWqNYntQhr7uh1A=;
	b=Zr1ggW68jgb8V1zXWoS1fgb5zxvr47gtm+atwUUySQsE+v17MxcBuW88nVVrAgdS8Q
	qU/c4IGRMP/m4PY+wE+2J/CFrrBQ6K+xQlDnGeFR0jK2zq39RSxH74ONMgdEOFSYV0HE
	wf+iJJ8W2pXHPuafS5MhCwOkmTeaeocfD4D3D4pON7jhKPyVysITAMBXiAYnwzE8pCfC
	VIzgF/7SESPLZaOOSkSFAHAOOtk/dMHu7Pp/rTWDndUc/sXTt9sbPLVLCjt8WcJ0aGPj
	gbFxjhKf6XfKOB7KdfgYBOy0cejlI9/g0wqI/gXIoMMKcHqyrAWEdAzPcYa/PJ6HMFAy
	9jrQ==
X-Gm-Message-State: APjAAAVt5P2rKA/EkkYdkGFb8VTLVve8mrwBPEQvk5MJPXz6xrGm5PeM
	v+w+zcdQBBsf/Cr510QatMnpmEea/0qLxuCiafM=
X-Google-Smtp-Source: APXvYqy7G7iTWDgNx1p/2soltYnxch2ljCg/HHhYG03+t3Kc3i6oRmpPeqSMc4YDN3mCI7nkM56/sXpGTKMFbRTGN/s=
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr50812087wrq.361.1582321390983; 
	Fri, 21 Feb 2020 13:43:10 -0800 (PST)
MIME-Version: 1.0
References: <20200214035737.9975-1-zhe.he@windriver.com>
In-Reply-To: <20200214035737.9975-1-zhe.he@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 21 Feb 2020 15:43:00 -0600
Message-ID: <CAJdd5GZPffGwjXH+RWxBtLwDcgR2p+4KbsNLqc7WUBWKo1fGQQ@mail.gmail.com>
To: zhe.he@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Fri, 21 Feb 2020 21:43:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 9:58 PM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> To make the native python3 is always used,
>
> - Use sed one-liner instead
> - Add substitution for ${S}/scripts/bpf_helpers_doc.py to fix the
>   following warning.
>
> File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
> _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
> ModuleNotFoundError: No module named '_sysconfigdata'
>
> This issue is first reported by Joel Stanley <joel@jms.id.au>
> The sed one-liner is credited to Anuj Mittal <anuj.mittal@intel.com>
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 6d1b06693d..a6fb51d3db 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -239,11 +239,8 @@ do_configure_prepend () {
>      fi
>
>      # use /usr/bin/env instead of version specific python
> -    for s in `find ${S}/tools/perf/ -name '*.py'`; do
> -        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
> -        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
> -        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
> -        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
> +    for s in `find ${S}/tools/perf/ -name '*.py'` ${S}/scripts/bpf_helpers_doc.py; do

Do we have to hard code bpf_helpers_doc.py? It doesn't exist in older
versions (e.g. 4.14) and causes do_configure to fail.

> +        sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
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

