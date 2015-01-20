Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 556B671353
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:01:38 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id hs14so35074544lab.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 08:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9UvHnmHX7EBoKSyVoMMYqXkrB+BaIOyxj6QYGnICytg=;
	b=jTBaHO+Qhl+g8ZXrfL9ODrPVAFnOtFUse4YEJQjuX/An6HnMNMFxRuGnFoeQ/SXxTz
	kUTj/3WGJ14yN1PqCGYTqPf9dvc+foJNtXtP67xNvH27W+Ozg9FxRmjvhqkgvqxTitK4
	o7hm+PivbydnTBp1EC1ZXB/gQ7XFNu1nvu274FfmBTRM03oB6xz986YbXBgv367AJo2c
	G0Leeh6+3U5eVgCCEs88SPOwmhaickTC1Va0wo9vhlxnuD7NAAqpkBHNe3V5QQkE+Zc2
	QQ9qf/HQyhaS0jj0qf+es4OBgTR7lL9ewNon0NMYi0IS1wxNVBKKlweIsJBkDFabK1pW
	xXQQ==
MIME-Version: 1.0
X-Received: by 10.152.238.1 with SMTP id vg1mr39637086lac.83.1421769697671;
	Tue, 20 Jan 2015 08:01:37 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Tue, 20 Jan 2015 08:01:37 -0800 (PST)
In-Reply-To: <bc679bdfe35b8c0740f66a5e5f03d8ac69c59309.1421651378.git.liezhi.yang@windriver.com>
References: <cover.1421651378.git.liezhi.yang@windriver.com>
	<bc679bdfe35b8c0740f66a5e5f03d8ac69c59309.1421651378.git.liezhi.yang@windriver.com>
Date: Tue, 20 Jan 2015 11:01:37 -0500
Message-ID: <CADkTA4MRQ+GaDCxQNiS91=qRT4QVAk0cvupzf8TBRaHnwwXgvg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] perf: fix for rebuilding
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
X-List-Received-Date: Tue, 20 Jan 2015 16:01:41 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 19, 2015 at 2:11 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Fix for rebuilding error:
> make[3]: *** No rule to make target `/path/to/sysroots/qemuarm64/usr/src/kernel/tools/lib/traceevent//trace-seq.c',

The kernel source is no longer in this location .. so at a minimum the header
needs to be updated to log the work-shared directory .. and better, make sure
that this is still happening with the latest master changes.

Bruce

> needed by `.trace-seq.d'.  Stop.
> make[2]: *** [sub-make] Error 2
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index bd57c6c..ab7075e 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -115,6 +115,9 @@ do_install() {
>  }
>
>  do_configure_prepend () {
> +    # Fix for rebuilding
> +    rm -rf ${B}/.*.d
> +
>      #kernels before 3.1 do not support WERROR env variable
>      sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
>      if [ -e "${S}/tools/perf/config/Makefile" ]; then
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

