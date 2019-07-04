Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id DD4D47E951
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 12:48:34 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id p17so6084723ljg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 05:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ru8CNICY9JfVacyxQSwaCZigcBrJ5DhibBRYoRuyOOg=;
	b=pMUtj5+Qs6ha5lRo+6Ywv+jRGekCUm2WIEnH4yULDW9njjO8RtuQptsvpI1+7HbaFW
	sojKfXtCn7kkZSyqf1mkyaPnVPnORofs6+qlGbL9yW6ISuk+up2idX9SIgOQkXfpr4cv
	nuci0kAeUy+GXT174c+09TcL9VwPEKOmCWBS3siEsdESXTkn4cfM14UXoI48UivHeyxW
	XRlCQFNgcQLH3wd6Nz9hlC4JZK2sk8uIzXNPtOUudM8pv795pHP1+PJBQxCw2cM/XZ2G
	bSGfplvryQ0AKwsAzXHRGQ/stSAk9u3gLY2aJ89XXiPdaqh/DL0IPi1C0OCaDUbRtfYI
	xD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ru8CNICY9JfVacyxQSwaCZigcBrJ5DhibBRYoRuyOOg=;
	b=C4rELqsPec6h/nn48NGcO8Kz837JAHBWo+Ygmuf2G9CYt4iUX3iM7ZP+Uy1b/3J/FD
	HKrxZUu2faq+DA5sopvpcFlM1HSWrG+tS9QLczrFXfw5qqcadVArcOawIx1sgbC0qUuF
	ln12c61Icn25MIsVhxPqFO4D6MAcH3Dlc/g1//sZTfFtGid+sETuIaFBEeNxpruCkKFC
	VdaEfxOVnXxJZ8GMM/oaRHXbfGrbVQJS4yUY4Rnm/878T+cHAcV/WvsqNqKmgK5gdzrU
	VFpB1HzkCmZqiszFGzzDGKVFQZ7fpEr7u9UxZ3PEtwkZYlxYF44ciq/n+xab5nk5YIgw
	azTQ==
X-Gm-Message-State: APjAAAWE2MrhGB3R2EhpfgEu+XViy/qM6iK0ju9q53FXKQDDZYLm3Z9I
	Eyv9KZApYYrA01CAAmIukF6eATDtW5n+S1+f7xM=
X-Google-Smtp-Source: APXvYqxz71qWUS+/aERn7+su8s90tr6K8LuX3UxBP0gIfsx9uHNHNp0Hou6BRiSEgvg1udqPR64egvaZcgryIcyFOb8=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr23876096lja.87.1562244515287; 
	Thu, 04 Jul 2019 05:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <1562236183-6069-1-git-send-email-zhangzl2013@126.com>
In-Reply-To: <1562236183-6069-1-git-send-email-zhangzl2013@126.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Jul 2019 08:48:23 -0400
Message-ID: <CADkTA4P-jyrFNf+vKQwDuyxD8sW=20MO+2Tus3AvaoKPjbJFvQ@mail.gmail.com>
To: Zhaolong Zhang <zhangzl2013@126.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: checksum indirect cfg and scc files
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
X-List-Received-Date: Thu, 04 Jul 2019 12:48:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 4, 2019 at 7:02 AM Zhaolong Zhang <zhangzl2013@126.com> wrote:
>
> Currently, Yocto can not realize the modification of the cfg/scc files indirectly
> introduced by scc files in custom layers.
>
> Instead of introducing complicated scc parser code, this patch walks though
> FILESEXTRAPATHS and takes all the cfg/scc files into account when calculating
> checksums.

There used to be a bugzilla around for this .. but I can't find it now.

While the approach isn't wrong, I think it is too heavy, since it is
looking at *all* the .scc and .cfg files that can be located in the
search paths, not just the ones that are actually used.

I do have some old code from the existing bugzilla that I can try and
locate. The right approach is to have the kern-tools emit the list of
files, since that's where we know the includes, etc, and what is
actually going to be used. What you have will also conflict a bit with
some changes that I'm making to tweak the config handling.

Since I can't find the old bugzilla, can you open a new one, put the
patch there and I can find the code to dump the list of files from the
tools.

Bruce

>
> Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index ed9bcfa57c..a9aac8a9d9 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -69,6 +69,24 @@ def get_machine_branch(d, default):
>
>      return default
>
> +def get_files_in_filesextrapaths(d):
> +    extrapaths = []
> +    extrafiles = []
> +    extrapathsvalue = (d.getVar("FILESEXTRAPATHS") or "")
> +    # Remove default flag which was used for checking
> +    extrapathsvalue = extrapathsvalue.replace("__default:", "")
> +    extrapaths = extrapathsvalue.split(":")
> +    for path in extrapaths:
> +        for root, dirs, files in os.walk(path):
> +            for name in files:
> +                base, ext = os.path.splitext(name)
> +                if ext and ext in [".scc", ".cfg"]:
> +                    filepath = os.path.join(root, name)
> +                    extrafiles.append(filepath + ":" + str(os.path.exists(filepath)))
> +    return " ".join(extrafiles)
> +
> +
> +
>  do_kernel_metadata() {
>         set +e
>         cd ${S}
> @@ -296,6 +314,7 @@ do_kernel_checkout[dirs] = "${S}"
>  addtask kernel_checkout before do_kernel_metadata after do_unpack
>  addtask kernel_metadata after do_validate_branches do_unpack before do_patch
>  do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
> +do_kernel_metadata[file-checksums] = " ${@get_files_in_filesextrapaths(d)}"
>  do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
>
>  do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

