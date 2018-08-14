Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id F04E979057
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 20:26:50 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id h1-v6so14650453uao.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 13:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6gbqik0CSTtavsI5vIf2G1nCU+/jZDSd1D3xsj1jOfo=;
	b=gF8lTGEnvTcWTB/KdmL763maCXDvB1GsVrYdjdbtYCq4rT81I3YmjVGN6UXPlng1kE
	l6SISjypsuZpBZSSpnuelFMaU/aU0D+Yp9UbQchNpwnToVOaRFKP6OrBZHDUjs5jdTcF
	C2/K2RzBfwqcWHa8hUapyxhnCG3S5KNWcseTPFj9B6CdVwgBRgKlH42ZsE+mqTyPudmN
	DGL2MUmw52c2/NJ1mNcXB7MKxaPfRtNbvLpe13FpsDGfbNWq73Gp5NUK7IAvtIlz0Dtz
	TtOaeKy/BqHNBwyZID9VMSPfnkB0VclShvM8zK1UMGTeI8+7pZuNskDXwrnH8cBijzmB
	UzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6gbqik0CSTtavsI5vIf2G1nCU+/jZDSd1D3xsj1jOfo=;
	b=lyrhqOcXUJQnnSLPyzSPipnXGkyZ0uNZJvSGijwBUBiZzfqYJ63+5RrYcY5yenfKSA
	vM4s/DoctFLKtQX6h/xs16xUg7cD7RUKLKL9YKntcfblm+g4cpZJpGKeoygwovO4kV4Q
	2sv3tpD2ODCH8Qzn4EeK4i1ll91D/lpx959Xw6StRCQ2XquK+f8HGxZ8xnhEd8ipBF7M
	uEm/6jz7EBmckZKXiP25qzVNxchXUhGzisA0DqL7W2aA1zLfmpBGXHPpAQiLhIadBdrr
	Fn6KbcFnofZPb3Q7HXXuLEN7uRNz4MhoJIUMEtSpVDwlDak1zAAkXx3ggu567ZWqvUVR
	Pkvw==
X-Gm-Message-State: AOUpUlGNfeMfa8w3/ZxCH/S9kBYpsNfJtlo0tc+IqNIjd2b/QSZCAxsK
	1IdL9IWPUVGOaekOKKjXGwc8Z14C93Yixd6v7uk=
X-Google-Smtp-Source: AA+uWPxepvH3m3SBUxUY5j49SkqOw55Muo4q+n7ZW0VocF4HFHBKGky12rG5KmWIk79zrrMLxB3qQ0QFWWeLLyb0NtA=
X-Received: by 2002:a1f:10ce:: with SMTP id
	75-v6mr14585075vkq.83.1534278411693; 
	Tue, 14 Aug 2018 13:26:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 14 Aug 2018 13:26:51 -0700 (PDT)
In-Reply-To: <20180814223321.158068-1-omar.ocampo.coronado@intel.com>
References: <20180814223321.158068-1-omar.ocampo.coronado@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 14 Aug 2018 13:26:51 -0700
Message-ID: <CAJ86T=UPzhm5RoWAO+oBxRSSG8kSP+gGZ8WCjgG3jZHh30aWzw@mail.gmail.com>
To: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] package: skip strip on signed kernel modules
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
X-List-Received-Date: Tue, 14 Aug 2018 20:26:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 14, 2018 at 3:33 PM,  <omar.ocampo.coronado@intel.com> wrote:
> From: foocampo <omar.ocampo.coronado@intel.com>
>
> Kernel module signatures are outside the defined ELF container,
> executing strip action on kernel modules removes the signature.
> In order to keep the signature on kernel modules, avoid any strip
> action on signed modules.
>
> Fore more information check kernel.org admin-guide/module-signing.

An earlier version of this patch has already been merged:

  http://git.openembedded.org/openembedded-core/commit/?id=4c47e5f171fa2603355e2f9183065ce8137a18c7

In general, you should always at least rebase to the latest upstream
master branch before (re)submitting a patch. Checking what's upcoming
in master-next is often useful too.

Also, when sending updates to a previously submitted patch, it's
helpful to provide a brief description of what's changed (via a
comment below the "---" line). In this case it looks like you only
added some comments and updated the commit message?

> Signed-off-by: Omar Ocampo <omar.ocampo.coronado@intel.com>

The Author and Signed-off-by lines in your patches are different.
Maybe double check your local git config before sending more patches.
Author should be your name, not a user name.

> ---
>  meta/lib/oe/package.py | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index fa3428ad61..e7eac19762 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -21,11 +21,15 @@ def runstrip(arg):
>          os.chmod(file, newmode)
>
>      stripcmd = [strip]
> -
> +    skip_strip = False
>      # kernel module
>      if elftype & 16:
> -        stripcmd.extend(["--strip-debug", "--remove-section=.comment",
> -            "--remove-section=.note", "--preserve-dates"])
> +        if is_kernel_module_signed(file):
> +            bb.debug(1, "Skip strip on signed module %s" % file)
> +            skip_strip = True
> +        else:
> +            stripcmd.extend(["--strip-debug", "--remove-section=.comment",
> +                "--remove-section=.note", "--preserve-dates"])
>      # .so and shared library
>      elif ".so" in file and elftype & 8:
>          stripcmd.extend(["--remove-section=.comment", "--remove-section=.note", "--strip-unneeded"])
> @@ -36,7 +40,8 @@ def runstrip(arg):
>      stripcmd.append(file)
>      bb.debug(1, "runstrip: %s" % stripcmd)
>
> -    output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
> +    if not skip_strip:
> +        output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
>
>      if newmode:
>          os.chmod(file, origmode)
> @@ -46,6 +51,15 @@ def is_kernel_module(path):
>      with open(path) as f:
>          return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
>
> +# Detect if .ko module is signed
> +def is_kernel_module_signed(path):
> +    with open(path, "rb") as f:
> +        # 'Module signature appended' the string confirms a signature is present.
> +        # 28 bytes is the size of the string, regardless of the architecture.
> +        f.seek(-28, 2)
> +        module_tail = f.read()
> +        return "Module signature appended" in "".join(chr(c) for c in bytearray(module_tail))
> +
>  # Return type (bits):
>  # 0 - not elf
>  # 1 - ELF
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

