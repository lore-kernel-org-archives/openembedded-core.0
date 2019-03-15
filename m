Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 204FC7BF70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 04:39:52 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id z25so8721076qti.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 21:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l4qEdObCcG5SqCy/4RiqAuL97In1ee5fjNFBiqKReNc=;
	b=pPTHjUHUjcNfKFjqs9c25jzG7C0Qkoe8lb8fMmVJXWqAtXqNejD8ar6Q+jzVSTH98z
	tfp1VC1s/kPTC6QE3aSaR6KFuh4oN3kCYWRm6o2nQvbs5nfTC0E25t6KhoYV7zOD3Ctc
	OsLHqKRi4GhcdyWj8J36r6O7o0Lsf8TOLVrOMutlb+4364PKOAYm1xQz3rR35DjDuCHM
	Wq942lK2oIhFTrfVEMOb/oMyCB+2zxJAHc+hwhqYNhj63z9p9VShg4YzMRVvZLsptHur
	tNIYYnwpac8sMt5X1QyzUzCSsn28jbhsTuWpKiS+ikg9aUm4Gv+6XHtXUZvzVF+GeL18
	vs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l4qEdObCcG5SqCy/4RiqAuL97In1ee5fjNFBiqKReNc=;
	b=Llif9rgZtRW1MxggrEgXnbU4LWzPqekUSN1Z/enLzpql1ISNMjuUXK+PKoB9x/HR59
	JR7nyxcI38RdpiqBGUHuju7fO8QkiTlnDA6ZnVxPTscYWlUVEmUwu39Ge0SwgmbMP15x
	aTVqHfvYbpVIla+aSuwN3I/wAGjNhfZDp5YNNs6rBdTgT5CliV7GkM54IO59b3p5wtIT
	coRcd4qFY28w0EreqJe2u7pbQwWbZlRCbGWFCD9nbOkaHjHIiq14ypSNLZoal76Ir3IR
	wUpol4P4CLkEABQGJCPoT9FJJkZlq6t4xQGvlEtwF9OJh2iU0e016G+uvzIvYfqFP2PG
	FDuw==
X-Gm-Message-State: APjAAAVWTDug4GYF4UxHp05/O6o7ZKSEYD8g+PcZCZzaxmMGmVOgzeaI
	4Z2xhYFbdXz7vILbDGIcJDGxRiLb4/slTMo/jZY=
X-Google-Smtp-Source: APXvYqxk/zZa88+WmzWz0p9andtdP2ozMyJRCLWW8U1PgjUL0Tg/EknNExZVwWsJWiGYagSr4L2Wu/W8V7rUZHphb7o=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr1262865qte.196.1552624792797; 
	Thu, 14 Mar 2019 21:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <1552593854-14059-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1552593854-14059-1-git-send-email-mark.asselstine@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 21:39:26 -0700
Message-ID: <CAMKF1srhabVFoLY8Wym7AN-K=rc8ckPjCUKHG-XwQQLsmkEMUg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [v2][PATCH 1/2] go.bbclass: Export GOARM
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
X-List-Received-Date: Fri, 15 Mar 2019 04:39:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 14, 2019 at 1:05 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> When building GO packages for ARM (v5, v6, v7) it is expected that the
> GOARM env variable is set during the build. Not having GOARM exported
> will result in GO binaries which can't be executed on the target
> (terminate with segfault). Per https://github.com/golang/go/wiki/GoArm
>
> We already have the logic in goarch.bbclass to determine the correct
> value of GOARM (see GOARM_TARGET), but currently this is only used to
> build go itself (go-cross_1.*.bb requires go-cross.inc --> export
> GOARM = "${TARGET_GOARM}").
>
> Here we export GOARM but we do it such that it is only exported if we
> are building for 'arm' and only when recipes requiring/inheriting
> go.bbclass are be used to build for the target.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> V2
> * Avoid potential undefined situations
>
>  meta/classes/go.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index af331f8..5af4c3e 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -8,6 +8,10 @@ GOROOT = "${STAGING_LIBDIR}/go"
>  export GOROOT
>  export GOROOT_FINAL = "${libdir}/go"
>
> +GOARM[export] = "0"
> +GOARM_arm_class-target = "${TARGET_GOARM}"
> +GOARM_arm_class-target[export] = "1"
> +

while this works, I think it would be nicer to handle it for all

export GOHOSTOS = "${BUILD_GOOS}"
export GOHOSTARCH = "${BUILD_GOARCH}"
export GOOS = "${TARGET_GOOS}"
export GOARCH = "${TARGET_GOARCH}"
export GOARM = "${TARGET_GOARM}"
export GO386 = "${TARGET_GO386}"
export GOMIPS = "${TARGET_GOMIPS}"

these should all be replicated into bbclass.

>  DEPENDS_GOLANG_class-target = "virtual/${TUNE_PKGARCH}-go virtual/${TARGET_PREFIX}go-runtime"
>  DEPENDS_GOLANG_class-native = "go-native"
>  DEPENDS_GOLANG_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk virtual/${TARGET_PREFIX}go-runtime"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

