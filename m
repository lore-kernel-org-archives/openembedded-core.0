Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4562471C72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 22:17:48 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id w64so49900989wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 15:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qdMH50vM7IyNIICgxpyd9MvldW3VQ5DupA7ZDy9GF7k=;
	b=ow4bxnTKabQsywe0IA+yn4tPVotjhzv4Wg/o4Q7c/u1U32cPi86NBkrAqCtyVRrqHH
	nuPOZG1zXYi4O0rEjqxdhISnxVyx9cJYetTwHPl0sapx+3dZ6MBoFtHM9oYf/DVsyuKm
	f85vWdAWF185v0p+o4AwroZWK5e6Ut3KmVVq6B6rmvnUFpTeFmEPCZEfAwevzKA5KA08
	jarNfMOzGnMFWvsqGxSvZxXRWlIYOjr/LC211zduRAKh3WkveHqgLsVYJe2190UXI/AC
	4xALVwIr52dzhG7feYJxBkY4SC6ki34hpcp2FUmF6UyqwZw1fMjLGZeBqMdfXWo79ILF
	CRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qdMH50vM7IyNIICgxpyd9MvldW3VQ5DupA7ZDy9GF7k=;
	b=obsUo9jm/N6fi0TjadEpSgey2d76FPuNr0XpodJoCHhxvrR9rZPUYm02mIYcZoOHuz
	TOB5b5A4UeMieIy8Ai1bCF8fNjexSFeagS2WwuS4yZr3r6ALHXEELsYThTd7bm+TAEMe
	PMcsBtyp+2x1IwZAjgYsL4ZfEd+oJjwoRs1lOn1JReDH3bTiMond5Ba/+3ZYtD/rviyr
	F1444S34lS3EvrFu8n4sEJpfciHC6B3sr/LRqg9v4RYVjdJt4wBh82JN7Peaa1x7VS3d
	KGIGM1IP3sKJ1Um3oFbi3UmkbkOxXMaV5C0SdZoI+tocg6QYgdZP7AeZWKFTOa3OtM2L
	MHQg==
X-Gm-Message-State: AN3rC/7anfqUj5Y+pMAxpAB18zTf7Pppe+MCXKD1gZRtgymHFXCSmzEq
	uDeg3ZLSekkQIQ4igaTqYMJrGldsY25t
X-Received: by 10.28.47.205 with SMTP id v196mr13025687wmv.20.1491862669192;
	Mon, 10 Apr 2017 15:17:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.248 with HTTP; Mon, 10 Apr 2017 15:17:48 -0700 (PDT)
In-Reply-To: <1491857173-7167-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1491857173-7167-1-git-send-email-ed.bartosh@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 10 Apr 2017 15:17:48 -0700
Message-ID: <CAJ86T=WQ8r2VSt8wnqhgJwLRAmOUgAG1fyMeWAoxQ3WLq9QaxQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: prevent rm_work to remove native RSS
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
X-List-Received-Date: Mon, 10 Apr 2017 22:17:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 10, 2017 at 1:46 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Added recipe-sysroot-native directory to RM_WORK_EXCLUDE_ITEMS
> for image recipes.
>
> This should keep qemu and other useful tools in the native sysroot of
> the image recipe even if rm_work is enabled.
>
> [YOCTO #11266]
> [YOCTO #11193]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/image.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 405fd73..7165bb4 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -17,6 +17,8 @@ RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
>
>  INHIBIT_DEFAULT_DEPS = "1"
>
> +RM_WORK_EXCLUDE_ITEMS += " recipe-sysroot-native"

Either _append with a space or += without a space.

> +
>  TESTIMAGECLASS = "${@base_conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
>  inherit ${TESTIMAGECLASS}
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

