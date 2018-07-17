Return-Path: <rv@rasmusvillemoes.dk>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A03D71957
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 08:13:28 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v9-v6so215658ljk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rasmusvillemoes.dk; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3WbaT+Gtct4r8G9ZpkclIsp0oPv781gK5RuWJySEiLE=;
	b=HVPIfiTHnlY9GCrv1NAIemYiiNWMeFwfOUypeF5MJDjN8dajxKY7xw1Ivi+nOAUsaO
	tXXuo9EKEcdTGAfOfWuNYs2QkyyZ/RzxfKOLW5PhC6mCJKrDa60YivEIDnMl16AgLeMg
	NL0Yi4qJjpatWrhvQKqOnzXRdAPxQy7qIL8aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3WbaT+Gtct4r8G9ZpkclIsp0oPv781gK5RuWJySEiLE=;
	b=ajvdKTsjgbsOhVu8S2qXL0BwFexu6qS3QHmLWuOSu+qeQO4wxo3S1zo8FijjHhAFQ4
	43JC6AAewSUougCqmlDL78hYzlUZf+NLiM0cEB9ts8o2kvwI6yYFb0+k3ZtRysNJNJwK
	0PGObrNoDiIVZYgbA66/DauFRtA5MzLN5cQaM7SbDTJJwZX7y18dp3aOKMT+B+IMAPyY
	8o0QI2BjAmDM+N8zn32DH917iSaEWKPJ6YHm4X0x5yI1q2Z2AWijO8+xqy8lh3rKvcxe
	npZNjaqZsw8NFwFn78aXjmnjaSqsX9P/W+pO8iGjvLxaQgU8IMZxNwg7FmQdN9exrV+4
	hZpA==
X-Gm-Message-State: AOUpUlGX00y2B6GYVX/ypRmRnBnfkQyN08NlCCsf5Dyz9F051oU4SiTi
	n9WvRqHaVXk8BhPF/DiwGGDelA==
X-Google-Smtp-Source: AAOMgpeuzjtywEhda/6fzz2SIWw/sN4cyyez2JdhDSSLIOd5yzHND9moT3f62PgJY0QDO2o1CRTZdw==
X-Received: by 2002:a2e:557:: with SMTP id 84-v6mr640846ljf.152.1531815208742; 
	Tue, 17 Jul 2018 01:13:28 -0700 (PDT)
Received: from [172.16.11.32] ([81.216.59.226])
	by smtp.gmail.com with ESMTPSA id
	t2-v6sm68501ljj.46.2018.07.17.01.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 01:13:28 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20180711113856.7518-1-rasmus.villemoes@prevas.dk>
From: Rasmus Villemoes <rv@rasmusvillemoes.dk>
Message-ID: <0e5d44c6-25f9-39dc-2743-db0359ac9eeb@rasmusvillemoes.dk>
Date: Tue, 17 Jul 2018 10:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180711113856.7518-1-rasmus.villemoes@prevas.dk>
Cc: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
Subject: Re: [RFC PATCH] package.bbclass: improve -dbg and -src package ordering
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
X-List-Received-Date: Tue, 17 Jul 2018 08:13:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

ping...

On 2018-07-11 13:38, Rasmus Villemoes wrote:
> nativesdk-gpgme fails package_qa when setting PACKAGE_DEBUG_SPLIT_STYLE
> = "debug-with-srcpkg".
> 
> ERROR: nativesdk-gpgme-1.10.0-r0 do_package_qa: QA Issue: non debug package contains .debug directory: nativesdk-python3-gpg path /work/x86_64-nativesdk-oesdk-linux/nativesdk-gpgme/1.10.0-r0/packages-split/nativesdk-python3-gpg/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python3.5/site-packages/gpg/.debug/_gpgme.cpython-35m-x86_64-linux-gnu.so [debug-files]
> 
> This turns out to be because the automatic moving of the -dbg package to
> the beginning of the package list is disabled in that case, so the
> python3-gpg packages that the recipe prepends to PACKAGES ends up before
> the -dbg package.
> 
> It's not clear why the "and not split_source_package" was added when
> debug-with-srcpkg was introduced. Presumably the intention was to
> prevent the -dbg package to end up before the -src package, which we of
> course need to. But at the same time, we still need -dbg packages to end
> up before all other packages.
> 
> Using list.insert(0, ...) also means that if there happens to more than
> one -dbg package, their relative ordering gets inverted in the new list.
> 
> This tries to fix these issues by sorting the packages by (priority,
> original position), where priority is 10 for -src, 30 for -dbg and 50
> for everything else. That guarantees that packages of the same "type"
> preserve their relative ordering, while also ensuring that -dbg always
> preceed other packages. This scheme is also quite extensible, and,
> should the need arise, one could even expose the priorities as a knob
> the recipe author could use to ensure specific orderings of packages
> instead of the somewhat fragile and coarse-grained method of "prepend or
> append, and ensure you do that in a proper order".
> 
> Probably the autodebug condition needs to stay, but I think the
> split_source_package condition in the preceding elif should be removed,
> so that that logic applies to all packages called -src, not just the one
> we might have created a few lines above.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/classes/package.bbclass | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 8276046369..72b9c66c3b 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1151,21 +1151,22 @@ python populate_packages () {
>  
>      # Sanity check PACKAGES for duplicates
>      # Sanity should be moved to sanity.bbclass once we have the infrastructure
> -    package_list = []
> +    package_dict = {}
>  
> -    for pkg in packages.split():
> -        if pkg in package_list:
> +    for i, pkg in enumerate(packages.split()):
> +        if pkg in package_dict:
>              msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
>              package_qa_handle_error("packages-list", msg, d)
>          # If debug-with-srcpkg mode is enabled then the src package will have
>          # priority over dbg package when assigning the files.
>          # This allows src package to include source files and remove them from dbg.
>          elif split_source_package and pkg.endswith("-src"):
> -            package_list.insert(0, pkg)
> -        elif autodebug and pkg.endswith("-dbg") and not split_source_package:
> -            package_list.insert(0, pkg)
> +            package_dict[pkg] = (10, i)
> +        elif autodebug and pkg.endswith("-dbg"):
> +            package_dict[pkg] = (30, i)
>          else:
> -            package_list.append(pkg)
> +            package_dict[pkg] = (50, i)
> +    package_list = sorted(package_dict.keys(), key=package_dict.get)
>      d.setVar('PACKAGES', ' '.join(package_list))
>      pkgdest = d.getVar('PKGDEST')
>  
> 


