Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id EA63D60618
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 23:16:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a25so219354wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 16:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=E/CszZ8rjaD+6ZuEs2/LCGi3LWNZgVQYg+EwyXzqFMs=;
	b=A72niFT15lq3MS7ua2i4S0ghEWsF3xstHuONgOOkXIfm12F8i69HkgJ9uproWdHa/E
	+ybOepJu3Ody1IymCx6scVdzuEz1PEtFX2N9DI70aTJKFGQ3hSuwobkS7cm8qkIZKB4z
	1j+XL6AYhsjcl2wF9K9HNsphE1la7oO5iTCBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=E/CszZ8rjaD+6ZuEs2/LCGi3LWNZgVQYg+EwyXzqFMs=;
	b=JHlfY68uU28M4E6N4jVwzCPiTMLuJ8Kq8odefGnrfvAQw60um1dLiLIErDeOLNYU1Y
	t8f8JgdLsiwkHDUoix9nDrUZ50wUV1ltPqkMIftFRU+RDCPZGplONoY0bNWB3TnWT/1Q
	SFbzMBDMZ0xz9ZaW5GLyggD3f5ZJj6oPM5l7VixGamqO8apHp1kRBjDXoK7ZPO1lDm+m
	4TA0Da8fjnOw7T5jIHT40f7N7g8NzRBqLUwgu2fdJkrt9FFFssWbKLiVBpwwyGzydwO+
	Lq3IUrRoCUQvMZ5im8jl1ymvWquHO+iFKkM9Ek2j55N12CfrDmjmzqeNyfpIgIgm4WeH
	l3Zw==
X-Gm-Message-State: ANhLgQ07ytGgZ0pbZspM8hifCQOFtnPlQQi2g05ZYLJsALipo1dHGI7R
	A0PFe+X09fiKYi0RXS5PLP2DRA==
X-Google-Smtp-Source: ADFU+vt8zG6iNm6bFeBqvYGHKK1OwJdH7k9QmYGh3CM0VrqoAZA/2Veto/mAiDPi6UP+tJ/dXWo9fw==
X-Received: by 2002:a5d:5286:: with SMTP id c6mr201034wrv.418.1583882200436;
	Tue, 10 Mar 2020 16:16:40 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w4sm16837231wrl.12.2020.03.10.16.16.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 16:16:39 -0700 (PDT)
Message-ID: <e3d926c01221fdbfe47df3d3b05a54015f3564ca.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 23:16:38 +0000
In-Reply-To: <20200309142139.15741-2-pbarker@konsulko.com>
References: <20200309142139.15741-1-pbarker@konsulko.com>
	<20200309142139.15741-2-pbarker@konsulko.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] archiver.bbclass: Handle gitsm URLs in the mirror archiver
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
X-List-Received-Date: Tue, 10 Mar 2020 23:16:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-09 at 14:21 +0000, Paul Barker wrote:
> To fully archive a `gitsm://` entry in SRC_URI we need to also capture
> the submodules recursively. If shallow mirror tarballs are found, they
> must be temporarily extracted so that the submodules can be determined.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  meta/classes/archiver.bbclass | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 013195df7d..fef7ad4f62 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -306,7 +306,7 @@ python do_ar_configured() {
>  }
>  
>  python do_ar_mirror() {
> -    import subprocess
> +    import shutil, subprocess, tempfile
>  
>      src_uri = (d.getVar('SRC_URI') or '').split()
>      if len(src_uri) == 0:
> @@ -337,12 +337,10 @@ python do_ar_mirror() {
>  
>      bb.utils.mkdirhier(destdir)
>  
> -    fetcher = bb.fetch2.Fetch(src_uri, d)
> -
> -    for url in fetcher.urls:
> +    def archive_url(fetcher, url):
>          if is_excluded(url):
>              bb.note('Skipping excluded url: %s' % (url))
> -            continue
> +            return
>  
>          bb.note('Archiving url: %s' % (url))
>          ud = fetcher.ud[url]
> @@ -376,6 +374,29 @@ python do_ar_mirror() {
>          bb.note('Copying source mirror')
>          cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
>          subprocess.check_call(cmd, shell=True)
> +
> +        if url.startswith('gitsm://'):
> +            def archive_submodule(ud, url, module, modpath, workdir, d):
> +                url += ";bareclone=1;nobranch=1"
> +                newfetch = bb.fetch2.Fetch([url], d, cache=False)
> +
> +                for url in newfetch.urls:
> +                    archive_url(newfetch, url)
> +
> +            # If we're using a shallow mirror tarball it needs to be unpacked
> +            # temporarily so that we can examine the .gitmodules file
> +            if ud.shallow and os.path.exists(ud.fullshallow) and ud.method.need_update(ud, d):
> +                tmpdir = tempfile.mkdtemp(dir=d.getVar("DL_DIR"))
> +                subprocess.check_call("tar -xzf %s" % ud.fullshallow, cwd=tmpdir, shell=True)
> +                ud.method.process_submodules(ud, tmpdir, archive_submodule, d)
> +                shutil.rmtree(tmpdir)
> +            else:
> +                ud.method.process_submodules(ud, ud.clonedir, archive_submodule, d)
> +
> +    fetcher = bb.fetch2.Fetch(src_uri, d, cache=False)
> +
> +    for url in fetcher.urls:
> +        archive_url(fetcher, url)
>  }

I can't help feeling that this is basically a sign the fetcher is
broken.

What should really happen here is that there should be a method in the
fetcher we call into.

Instead we're teaching code how to hack around the fetcher. Would it be
possible to add some API we could call into here and maintain integrity
of the fetcher API?

Cheers,

Richard



