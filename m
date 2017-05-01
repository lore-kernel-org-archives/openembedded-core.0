Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2D14271DDE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 22:26:12 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y10so525112wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 May 2017 15:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gXlYYdRpl2047DyN24Rw4lcWVocTC0it/Aiv88U0NYg=;
	b=FeFR0evHTlpcgRYm+ZohZV8BtPl+Mrpd6uJpk6KN4hCapnYY1l9aZY6RTa8DZ4Q2Bl
	mQvGQlNZOmJhOuYAyTHUGkdexVSYqUjhz8tvdGwnm5NputuwbgXMPvyhI2FVz4aC9FP0
	lkirKJ8TjuuEkPoqMUKNYrnfx5bom+KrfaDjK+JdA+lA1vPva1RDXqOlczK+QL5/8yos
	NsFP+bP0LNcguCP0St4pVDfkJGNt5kr+zP5NrUDu2IS0IZyE0wGJshUfGveXf++ZwyiI
	nZm+W0oPn8NAI8QcNb1Xw+SIpD2SQoAPCMsNK84ZQU3QMUFIXInrt53gP5nXV0pJmc3N
	rzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gXlYYdRpl2047DyN24Rw4lcWVocTC0it/Aiv88U0NYg=;
	b=TCtzyyMv4MB9HhqYhGo09AuWEL6SIIfV77vo712/PET89xY+OVX9kE0lCR4Q+tP3dN
	MEIRmuyMT9cA3vf7NxXKv2ZIB1AItdBCaohv6MOOQBYRaeGqeZrvtInnBzY+nZEIaD0/
	zkGn3GnQICi/yLtogOSpqKOkWfng91bsRC/mhL223HGxKW65Dl0CXXFA0jCaYTDoo+77
	BOgJRJA/uteWuh7QX4W5KGpx/qLjdySHaHB4pCcdMTodiN6flYupY8djia7/QS3Jo1wy
	FbcxiwrWvs90uZjTAIBBftQyl8CtPxO5c+vnUtoenSmYpRPUh7WmD/oX9kPhj28ddlcP
	pISQ==
X-Gm-Message-State: AN3rC/7NvvcNzsZ+a+TWq4N6AJ8Cuvdr6BVUS0MSP93AaBhYEWbPUVul
	hgJtmaWtcs4RYfTYioU6Vv2kv7a1xw==
X-Received: by 10.28.222.70 with SMTP id v67mr228177wmg.65.1493677573495; Mon,
	01 May 2017 15:26:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.100 with HTTP; Mon, 1 May 2017 15:26:13 -0700 (PDT)
In-Reply-To: <20170501194223.16344-1-dev@codyps.com>
References: <20170501194223.16344-1-dev@codyps.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 1 May 2017 15:26:13 -0700
Message-ID: <CAJ86T=X4VYZTkCmeF1tsoKbXxYGJO-i1VPfVa36K38S1Qf-+zw@mail.gmail.com>
To: Cody P Schafer <dev@codyps.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: use `cmake --build` to build & install
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
X-List-Received-Date: Mon, 01 May 2017 22:26:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 1, 2017 at 12:42 PM, Cody P Schafer <dev@codyps.com> wrote:
> Rather than presuming `make` is the generator, use cmake's generic
> `cmake --build` feature (which knows to call the appropriate generator).
>
> Both DESTDIR and VERBOSE still behave as intended when used as
> environment variables instead of make variable-arguments.
>
> This makes it more straight forward for others to select other cmake
> generators (many folks have been reaching for `ninja` lately).
>
> Signed-off-by: Cody P Schafer <dev@codyps.com>
> ---
>  meta/classes/cmake.bbclass | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 12df617ad8..05ec50d385 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -135,13 +135,11 @@ cmake_do_configure() {
>
>  do_compile[progress] = "percent"
>  cmake_do_compile()  {
> -       cd ${B}

Removing the redundant "cd ${B}" should perhaps be a separate commit?

> -       base_do_compile VERBOSE=1
> +       VERBOSE=1 cmake --build '${B}'

This looks like it will cause parallel make and EXTRA_OEMAKE options
to be ignored?

>  }
>
>  cmake_do_install() {
> -       cd ${B}
> -       oe_runmake 'DESTDIR=${D}' install
> +       DESTDIR='${D}' cmake --build '${B}' --target install
>  }
>
>  EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

