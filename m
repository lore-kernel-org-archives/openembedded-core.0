Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB267F742
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 22:58:07 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id q11so845096lfc.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 15:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mN/wdH77LhE5ZJVLUUwvJy+0WnXNLPS2OQgg0gh/dGI=;
	b=zZYuq7AESIVM8is4VnBRzFPrcLr0M+yKKEGn9URunUyMYdD4wiANa8r4PBmd6ZftQ8
	CKIGfY+UC91iCo1P5BkezDBkcwDA2l+h48XBVvBJv+k/61WWvLqRqhIi4oi6iSyfbhcV
	gi0MPnBvd5t0jfQX6Sb8ZVFIxuC6Jy8oxdBVDlDwSEoBF2u1sroob8+zyls9vbw5xodW
	R+3O+bpIKZalf+/drQMH94AUbkIGhuoBF30dpTCpKFKhQCCq4SSJMfpwET8w0gqAZwkv
	qOjaEj5v3CQn1TNxcJN9s1InNdXaDHIHrtTguIwI+EsjPm7DmYsdrAgdQ7bkAkrETTha
	4HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mN/wdH77LhE5ZJVLUUwvJy+0WnXNLPS2OQgg0gh/dGI=;
	b=m5LOa/U4aiYXYECfrfgmsC++8QUgG4qViMSuM/4p5/YWXAuUJgc1VW8Up6IMKTxLLh
	lCK23ei5wdgW3By84bHlhXmGYiElfvZR5eA6c/0oaRdv7IS2qBuXERDyMl+z8sCCWC5f
	TlhoGXViwsNMcgnzCdhKTaFdMRBwOxkUs/7VUAIlWWKrcJ9LqtnDlb8ex7gfvZjeEQnd
	nyBTxw9GMz2OqGN6P5yl9uYALxI7B8WnVYDi5z8AZ4dnFxK+hD+7fF2VDc0k9OGQ3Uhu
	knkRU1RrG05DgTHj/KMQwg7x1cJ65/Qb+W6Tq/7QrPd/KwCLNLMWN2WV0W7RNUWA+5Ct
	pRVQ==
X-Gm-Message-State: APjAAAUfPwbuCDsI9W7uoze0iQkCpxPM9pr9wi8HQuXTB98zPGuE0y8O
	mTnthb1VwM1U9DxsEKE7PqyvRpf1jQsoKwzJF/DOhg==
X-Google-Smtp-Source: APXvYqxU/g9C30ONfoQh2WgmwFLpH6w+5tFZEYrE2+vo5a2BilCePnJanqsp96ezy4SKQq6SiPj4XqsuZiEXQYSvZ2s=
X-Received: by 2002:a19:cc15:: with SMTP id c21mr3306004lfg.64.1568847487896; 
	Wed, 18 Sep 2019 15:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190728100103.21136-1-dbaryshkov@gmail.com>
In-Reply-To: <20190728100103.21136-1-dbaryshkov@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 19 Sep 2019 00:57:54 +0200
Message-ID: <CAP71WjzkvtaK7i7Edk7Hg-2iReYLGkLbLd3eBXD_Wqk0Lo9Sew@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: fix installation of modules signing certificates
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
X-List-Received-Date: Wed, 18 Sep 2019 22:58:07 -0000
Content-Type: text/plain; charset="UTF-8"

hi Armin,

On Sun, Jul 28, 2019 at 12:01 PM Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
>
> From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
>
> If one has provided external key/certificate for modules signing, Kbuild
> will skip creating signing_key.pem and will write only signing_key.x509
> certificate. Thus we have to check for .x509 file existence rather than
> .pem one.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

This patch applies cleanly on warrior and thud, and it's a bug fix,
when the use provides its own private certificate to sign kernel
modules. I have spent quite a bit of time in this area this week,
sadly i was working with thud branch, fixed my issue and found out
that master didn't have the issue!

Any chance this can be pulled in thud and warrior? Feel free to add my
Signed-off tag , once again cherry-pick just works.

>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a60e15b57814..bf3674238f02 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -454,7 +454,7 @@ do_shared_workdir () {
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> -       if [ -e certs/signing_key.pem ]; then
> +       if [ -e certs/signing_key.x509 ]; then
>                 # The signing_key.* files are stored in the certs/ dir in
>                 # newer Linux kernels
>                 mkdir -p $kerneldir/certs
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

