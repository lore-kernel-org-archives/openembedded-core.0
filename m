Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7221F6D7A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 05:41:58 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id k2so8897001qtm.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 22:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oonsKdCCwBz95VRzIMltnCTn1Z2mOqnKnn+EsgdCIKY=;
	b=X1xHhZsYvDd1mVL0h1TBhQqmRwf8r+EnnLnZp1BM/RYMTemJtUz1oL9aVZn3ScPTz5
	kT7ODWU4UJeH4nqubE4Nm0tTaQCakG/d4RGOMgyhDZgM9SUba6mSLluHpPv3mHFdLMCe
	TVlcHwCwT+TyS56Ni0ePFahI/+FGddtn3w4hxJIqJ+nH20FJB1DIBNvv0WygH9Kp7JG2
	KkB+1ZCK4dYGilqc3YfjiCAFt13f3VwKUZ4ghMyKCfnidHuGM7U+HspakLlZuXw2alFt
	pyO7lOGyD/Grt2i/eY+agg50FE5c1GoUzcPNyawpzaZwCX4XxbSccfouYJ1LaP7d0Y7q
	BGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oonsKdCCwBz95VRzIMltnCTn1Z2mOqnKnn+EsgdCIKY=;
	b=KLCXLfVrkK8Up1C2MOlqNQ7MhBdjLHUm1kbT1nPleGcbGjCRjuCSZ9ra7HFlMBS0ox
	cvQV70Cx42fnmu2CJOnkX9ArNXYIDktjaM26gcZ+MouYVYqTTwyY3ILliT6nzKDZLnb+
	c63kx/Zzifc+FPUZ8DjTsP302+zTGuyAtd7M/1QmuM6w+QCbLrGUsmu51jPTJ6R+M6vH
	3FdQbPo3BXTNkt74+9NnlHN2pz9wMU54VWldJduMvPtNvkkiAFFjqqJ4LR1uPQXJKyTf
	Gte4iqq+7a1tjtoGQ/raStZyHErA7CexX9XRNrgMPfHP7hfgvmgVBvzZKcQGpc5DLUtV
	Ikqw==
X-Gm-Message-State: APjAAAUMeBS56eCKG0xR3xzfeCn8ddNsrtC0QEiccQqvptS2EaHnW7We
	nq1mphIZ5CTodwBRFr4RplnHsKrqXQXVS6NIURoGb8Ej
X-Google-Smtp-Source: APXvYqx1cSYqNOEY3kQmB3xwEPZOfMkly9q9iWRK94CeVHz19/at+qS69/7HxyDfPLkf4gQVledXzlxELH5lsLaAsDY=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr1371516qta.254.1552628519145; 
	Thu, 14 Mar 2019 22:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190314191924.44162-1-joe.slater@windriver.com>
In-Reply-To: <20190314191924.44162-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 22:41:33 -0700
Message-ID: <CAMKF1sq-TLT=+TTMFiYP0SvsRoMkud8z8CFsMdf8V-2futbt9A@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] puzzles: fix uninitialized variable compiler error
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
X-List-Received-Date: Fri, 15 Mar 2019 05:41:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 14, 2019 at 12:20 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> In tree234.c, change a while() loop to a for() loop so
> that the compiler will realize we loop at least once.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../puzzles/files/fix-ki-uninitialized.patch       | 25 ++++++++++++++++++++++
>  meta/recipes-sato/puzzles/puzzles_git.bb           |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
>
> diff --git a/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch b/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
> new file mode 100644
> index 0000000..7218d62
> --- /dev/null
> +++ b/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
> @@ -0,0 +1,25 @@
> +puzzles: avoid compiler unitialized variable error
> +
> +The compiler does not realize that we must go through the while()
> +loop at least once, so we replace it with a for() loop.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +--- a/tree234.c
> ++++ b/tree234.c
> +@@ -326,8 +326,11 @@ static void *add234_internal(tree234 *t,
> +       return orig_e;
> +     }
> +
> +-    n = t->root;
> +-    while (n) {
> ++    /*
> ++     * We know t->root is not NULL.  The logic
> ++     * to break out of this is at the end of the loop.
> ++     */
> ++    for (n = t->root;;) {

may do .. while () is better

> +       LOG(("  node %p: %p/%d \"%s\" %p/%d \"%s\" %p/%d \"%s\" %p/%d\n",
> +            n,
> +            n->kids[0], n->counts[0], n->elems[0],
> diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
> index 0766bd4..59b9525 100644
> --- a/meta/recipes-sato/puzzles/puzzles_git.bb
> +++ b/meta/recipes-sato/puzzles/puzzles_git.bb
> @@ -14,6 +14,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
>             file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
>             file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
>             file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
> +           file://fix-ki-uninitialized.patch \
>             "
>
>  UPSTREAM_CHECK_COMMITS = "1"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

