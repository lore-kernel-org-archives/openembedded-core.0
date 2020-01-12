Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id B9B3372EB7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 16:24:01 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id 5so7017206qtz.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 08:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OJTmLzbgwfMlVL8Y1xv1Xnrzhp6RzHotwGQ2QWOSrHg=;
	b=MHFFZW1yoLA269OHF1UVgIGh0P+4k1MNi5PgyGn/1yBDcrQuBxYflJikVJWZa8jC/g
	VQycQ3+Z3p4vL0lRH/ihPqbFHkJsgg7uB8d93CbgV1FybodLK7QznrAcf9lFzUM+yOnT
	oqfyOuFctTcwgJNaJh4uegQmOiiU4MaE+Pa38kX7arq4J8cFCwANa/cqJaNlm4ATGLyn
	lOcQTn3igg+1FT7ugOUAs6hFg1af1QFJeQ5cKckG9vzMJXNm6ZX04fXxJ57FG/wRixaj
	OVOzS8cP5L4S2KoXpd4G+tGFlwcqsMpH6NWNYgU7AHOPcYcc0E7hQqm6e7ldOScje+jB
	weFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OJTmLzbgwfMlVL8Y1xv1Xnrzhp6RzHotwGQ2QWOSrHg=;
	b=smQJYCBK/Q0JU+9dKHfhWTWuwxdmBW1qkromibwRAnAVKNz1vBk4nnAT+k+KD9XAGP
	5DZ4uSoNUFeav6bMf36zHBzyeOUaA5FfP8gE2RjPeb5ukvC9uvERdTCZA74adnq1NEmo
	oPMQIpd/kJcmn48Kcd58lpb0BFhPUUMsk+pVNrqa1lSy4oBWRoS3J7GK/Uq89I0ipRla
	DUTS9p89SH10eqIw1rxzn/UXF5do3Zf0pE3fS5hHbfNPidChkj6v4W0R+AJkrMLF60eO
	lo6yghDZL3Fv/5ttO3cjivl4sMsgDJ1Dx2oKwiWX3O0xdW1bcdLPO2wu0B+fO8R8VpZO
	xzxg==
X-Gm-Message-State: APjAAAWUBh3paz4jdhLsf+slkfZ15Qd3yqX1SqmzmfNXU3+lY7VnwlMQ
	3LOFDts25F8Q1h/YIL+WGNdSJ7soXxbD4wVbG9f1Az3f
X-Google-Smtp-Source: APXvYqzFawvMKJRDhUV9DBQWpmMflX2Yun0w1z2cwnA+yvgbo/Ku/WayUedCDDfydcgKhEF/r9kqkqCv0jTWiaHPPOI=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr6967479qtq.53.1578846242518; 
	Sun, 12 Jan 2020 08:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20200112144530.29417-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200112144530.29417-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Jan 2020 08:23:35 -0800
Message-ID: <CAMKF1sqKaAoyuM5sPXXjRAAz8UK+TaN4qedk7w1OX4OAZqgGOw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] sstate: Improve move into place op and touch file
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
X-List-Received-Date: Sun, 12 Jan 2020 16:24:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 12, 2020 at 7:42 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Depending on the kernel and coreutils cersion, mv operations test for existence

typo version -> version
> of files and can potentially race. It also leads to the file always changing which
> leads to potential problems if using and NFS share and there are other readers.
>
> Using ln instead means we don't overwrite the file if it already exists meaning
> other readers aren't disrupted and should work more reliably on NFS which is used
> for sstate on the autobuilder.
>
> Since we're not overwriting files, touch the file to show activity as would have
> been done it it were reused from sstate.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sstate.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 356fe7ec180..b4ffffcd98b 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -776,6 +776,7 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
>  sstate_create_package () {
>         # Exit early if it already exists
>         if [ -e ${SSTATE_PKG} ]; then
> +               touch ${SSTATE_PKG}
>                 return
>         fi
>
> @@ -803,10 +804,13 @@ sstate_create_package () {
>         chmod 0664 $TFILE
>         # Skip if it was already created by some other process
>         if [ ! -e ${SSTATE_PKG} ]; then
> -               mv -f $TFILE ${SSTATE_PKG}
> +               # Move into place using ln to attempt an atomic op.
> +               # Abort if it already exists
> +               ln $TFILE ${SSTATE_PKG} && rm $TFILE
>         else
>                 rm $TFILE
>         fi
> +       touch ${SSTATE_PKG}
>  }
>
>  python sstate_sign_package () {
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

