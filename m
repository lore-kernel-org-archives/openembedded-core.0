Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2471B7F3DD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 15:12:34 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 44so45929196qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UHSaXHxLo0vIs+A686+k6o28zNLey4cwFpQ0b0eqIog=;
	b=RFBYW2zipevbIn9MnWqZvRngM5dk/mXC58cPUfkDdFhAITjFyJ4FhDwKWa+yGLatXo
	GCNHnQn9XomEH64wj0TK4y9otUzn7Hcnk9OZi+7/qgPujSCefk0wXaJWFLTKRIBrg1Y+
	bdf0mcodQLZ/IxghK7yZoSD+1tCCPIHcTY/tu5dD8rz4k01STCm65Wdm4FXhRp87OV2r
	jIlNHoaU4fG1kDVhOpokueXR4IemUlN0YQyTbcfddfkcbE5cpEhjn0B6biEoDpGi9Sh7
	LDLWjqxsvRKge9afU316ADAbY6QM6Ssukyf85G8XBPOJcvHzKbY6a/N6/mdfvgrik8IP
	bEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UHSaXHxLo0vIs+A686+k6o28zNLey4cwFpQ0b0eqIog=;
	b=FrrHfwCYmE/xnC/UaiJ8IpM8TwjfBXUK4XPWjSXfTqzchowzzDx1afmmPE8n9BR5zc
	ri/F41iYQhS4fCRHdrRd6qi+mfIKN2Zhfss7HI8vGsJbp7W6Gel6PrJ0oQ+uBHtb79Ep
	VMn4Tpt6IUXopVTSlVah9PZxb+FBGPw1XybnsJquq6F4uXYpu7erNrXmVJkTu71qp16+
	7WCphF5oxtIEkg2g37+l74e8beOaz3zlEKG0+0mLld+pOOGfDYY0Al4VGMUo7rjIMavB
	hNzqlHEklXJc8cc1ZeHVuN9JvHe+iuhgSKyjWlQxJb8R/jbfB8icrIzOkXu0efp5GenR
	jPJQ==
X-Gm-Message-State: APjAAAXVN0vF8qh17Oorxak6zEGJNSe/qRzfIU/Nug8Upa77sSJXiELZ
	EEJzwZfjQb7tRnrxoBsf6xYmsLYve0mD4BDUZWg=
X-Google-Smtp-Source: APXvYqxLiv2GhyKqOnUyQ6AJgWzqn7ZZB+MTQfFvjeiLhbUDfJj49/eI+EHvVX0fq2kPXyap8E8hwneQ9joySuQkTik=
X-Received: by 2002:a0c:b115:: with SMTP id q21mr102806105qvc.68.1564845154810;
	Sat, 03 Aug 2019 08:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190803133517.7199-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190803133517.7199-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Aug 2019 08:12:18 -0700
Message-ID: <CAMKF1soTU=xpRVha2DAVAUKku-_egwbtPKNm7b8F1yGaWV5S6g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Reduce race windows
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
X-List-Received-Date: Sat, 03 Aug 2019 15:12:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 3, 2019 at 6:35 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> When we write to the sstate directory we try to do so atomically so
> consumers either see one version or another but never an imcomplete file.

                                 ^^^^
typo .

> Unfortunately this is reliant on filesystem support and with some NFS
> configurations a replaced file would be lost from memory even if users held
> open descriptors.
>
> It makes sense to try and avoid replacing existing files where we can.
>

yes this is helpful. Change looks good.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sstate.bbclass | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index aa5841446c9..11222223a9b 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -755,6 +755,11 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
>  sstate_create_package () {
>         TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>
> +       # Exit earlu if it already exists
                       ^^^
typo


> +       if [ -e ${SSTATE_PKG} ]; then
> +               return
> +       fi
> +
>          # Use pigz if available
>          OPT="-czS"
>          if [ -x "$(command -v pigz)" ]; then
> @@ -774,7 +779,12 @@ sstate_create_package () {
>                 tar $OPT --file=$TFILE --files-from=/dev/null
>         fi
>         chmod 0664 $TFILE
> -       mv -f $TFILE ${SSTATE_PKG}
> +       # Skip if it was already created by some other process
> +       if [ ! -e ${SSTATE_PKG} ]; then
> +               mv -f $TFILE ${SSTATE_PKG}
> +       else
> +               rm $TFILE
> +       fi
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

