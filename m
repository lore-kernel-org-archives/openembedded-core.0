Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id A8D406E2C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 03:27:25 +0000 (UTC)
Received: by iejt8 with SMTP id t8so31403605iej.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 20:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jpJA/hB/XKPW80baH/syOJPFStD/BJl5eOxHzrFOe+k=;
	b=Q66R9hI7MGQMTCfw26saRe/MEawugIR89hN+EJFYYw/lruAlKCKtkZZ3mnvaVW35Cq
	vrbNXMuUH95X+KmAfULFI0Jm2LtBtooxP9FWeaTU3dQ7batpnamO0ZhXvH87NlzppWUY
	AkFjLGNKqr7po4CtD45ATwLiqpTwSNXmCXRlajv8JS8dWfTdGolHP6sgdYRSAPAe5XhO
	I3Jiqw05HD1bduoA7oKsh7P0YHPc/n5CsJZkSkcwxed8B0KjLyM3ZLkIN7g84zGsLvkK
	ohUeDCdTFqfpGRpkZ6X8Ekha8FJNIrt3imKlHE188OV+82wC+ugo6QHSgxOsLLWhY8eq
	a8Mg==
MIME-Version: 1.0
X-Received: by 10.42.111.68 with SMTP id t4mr7409805icp.36.1428722846968; Fri,
	10 Apr 2015 20:27:26 -0700 (PDT)
Received: by 10.107.158.20 with HTTP; Fri, 10 Apr 2015 20:27:26 -0700 (PDT)
In-Reply-To: <1428715039-4209-1-git-send-email-arun@gumstix.com>
References: <1428715039-4209-1-git-send-email-arun@gumstix.com>
Date: Fri, 10 Apr 2015 23:27:26 -0400
Message-ID: <CADkTA4PROF_Ho-az9isuCb+Q29cptOLOfQ14cC38CE-R7ZoQ2g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Arun Bharadwaj <arun@gumstix.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Do not always checkout master branch in the kernel repository
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
X-List-Received-Date: Sat, 11 Apr 2015 03:27:28 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 10, 2015 at 9:17 PM, Arun Bharadwaj <arun@gumstix.com> wrote:
> It seems like we are checking if a particular branch exists and
> then we still go ahead and set the machine_branch as master.
> This doesn't seem correct to me as it would work only for
> repositories which contain a branch called "master" but would
> fail in other cases.

In kernel checkout, we are simply creating the tree from a bare clone, or
a reference clone. So in fact, we do want to want to check out a consistent
branch to bring the working files into existence.

Anyone building a repository without master is already using a fairly
broken workflow .. so I'm not particularly concerned about that case.

I have an whole set of pending changes to linux-yocto, so I'll grab this
and throw it on my queue.

Cheers,

Bruce

> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index f42a5c2..410a6e8 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -211,7 +211,7 @@ do_kernel_checkout() {
>         # Create a working tree copy of the kernel by checking out a branch
>         machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
>         git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
> -       if [ $? -eq 0 ]; then
> +       if [ $? -ne 0 ]; then
>                 machine_branch="master"
>         fi
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

