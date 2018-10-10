Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB6779A68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 19:54:36 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j46-v6so7165925qtc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 12:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T1/hd6fXKXto8Cv5dl2AdIckKcJ6GmQPPKy0EMxXCyU=;
	b=O4AWdUHibQSwunPCyDlxUzFYwUU49wM0usfwTNZGvV9qGiz7ke33WraG2E95BqXZX9
	i/9v2HHLuss0NLW348ueYI9IZ7FHGKmk7Bc3hmR7vchiCumE+X5C6yR9aQZO8DZ1vfNX
	Ht3VSLLhsihNYTvRh8efFG7Xwe8KdeTK+rqsRIhqLDkLAOrns0n2Wkf6XmAbqgYcJBau
	szL5jWdHTQgx8a0Xn6rjZ/R3n91woRRy7avUC4D7v8S3hI30Sw8GZhuXngNDTHT+v1Cs
	gmpVoX0ryop9HWFlodA3uQO8pk7SnXIpBwWlduUqIaB/0FMMslb3PDAmlwd5z1XbJ50N
	GtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T1/hd6fXKXto8Cv5dl2AdIckKcJ6GmQPPKy0EMxXCyU=;
	b=MI1Mi+43wrYVvLvzU40l3LqMxtFCbULgEv9P21QeFKQxOKBVQdNlhvrbvaOhZutKJv
	nMZAe3ic5QUFUgIbHzKB/Kigrir4lIDFSQbm1tS0dRJL3sUwi0fXaW4hZZSBkGX3y+Q+
	7IIKm21QAjh3arpqXftqdXz6XwahlSifBnL6F4jj3XAhy5GyOqfCOYkwya3k5f08mPI1
	dt8v9neQoMd32dtROjVSOq50508Uu/tzml/krwZVsoaFf4uVzj6Qf4mKLAssfZhDmZcb
	uYSdqjFfreu8nJCF8u6h8Lj0yeuBsngO3D5CBCw7GwTtB6jxHJAAlAI7P5AJIQ+x4vov
	XyBQ==
X-Gm-Message-State: ABuFfojFRpaPY5KMGN1YTLe10gw6sdTXHiGzuCN0QhXj5S9YuYChlrWJ
	t14NGiPufbmyeApeGe8KI8FTikaVWgJeuWifRb0kkQ==
X-Google-Smtp-Source: ACcGV60M4md1hunVe1bqn7l/ly4V3e1k/V4uYCJ6RqeiN2a294sRseghY83h+CFQjcDWYj6UtCc8O+o7e9nU+EUZ7so=
X-Received: by 2002:a0c:c311:: with SMTP id
	f17-v6mr28966147qvi.228.1539201277106; 
	Wed, 10 Oct 2018 12:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <1539200144-19028-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1539200144-19028-1-git-send-email-mark.asselstine@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Oct 2018 12:54:10 -0700
Message-ID: <CAMKF1soH-xPSv2mrkALN94z=6xow28YZ5JqYELmS+N9k6Et9Rg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson.bbclass: Fix build issues with /tmp mounted with noexec
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
X-List-Received-Date: Wed, 10 Oct 2018 19:54:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 10, 2018 at 12:36 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> Since commit d297f7ebf3f6 [fribidi: use Meson instead of autotools]
> build failures have been observed with this package. The immediate
> issue was related to improperly named #defines per
> https://github.com/fribidi/fribidi/commit/46f52d588ab5, however, the
> root cause was FRIBIDI_SIZEOF_INT getting a value of "-1".
>
> After searching the meson logs the following was found:
>
>   Could not run: /tmp/tmp2fxe6ha1/output.exe (error: [Errno 13] Permission denied)
>   Checking for size of "int": -1
>
> Which pointed to the real root cause being /tmp mounted with noexec, a
> common configuration on Redhat and other distros. This issues has been
> raised in the meson community:
> https://github.com/mesonbuild/meson/issues/2972 but is yet to be
> addressed.
>
> Using the discussion from issue#2972 and the fact that the underlying
> code makes use of python 'tempfile' we can simply create a 'tmp'
> directory and make use of TMPDIR to avoid this issue.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta/classes/meson.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index ed08a40..7e63e12 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -109,6 +109,9 @@ EOF
>  CONFIGURE_FILES = "meson.build"
>
>  meson_do_configure() {
> +    # Work around "Meson fails if /tmp is mounted with noexec #2972"

I would call it a bug in meson not a workaround.

> +    mkdir -p "${B}/meson-private/tmp"
> +    export TMPDIR="${B}/meson-private/tmp"
>      bbnote Executing meson ${EXTRA_OEMESON}...
>      if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
>          bbfatal_log meson failed
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

