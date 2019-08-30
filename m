Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 41F877ECF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 03:39:25 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id l14so5065629ljj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 20:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6sqoye/6+pNhaVrvxpOmciYT4xLB+LTi+0A+w+7B6TU=;
	b=oyJ6bYfjaBoq/fy8e15YuU03L5g+AaxF0DQKzNA3xImpwA33uvGPNf1IF10gKSSRPZ
	URqR/9RJtyrk398IYs7xj+3ZtmBs9xFLYtOCGiSPhV4047zqRDcB3Tuv3i+UEJyuKc1Z
	2ZrZN3AtL2XK4Wm8Od1xm3oA12YBW05EA+Nc0weGVg2v9HdgZcFRUPGsxi2gXCAU36ym
	frhygX2+HlKQbN7PCgNvPMWylCGeIzPDxOXqPj1Wn3MICtPfaaQ/A+uC24oQ0gbQQV50
	aYAUGWOM4uKf6ZZylzAOuF7p5cDhnDFe8GgFNzyfWd7WFLyeGYrNETjyqMHstGLJz2oP
	+XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6sqoye/6+pNhaVrvxpOmciYT4xLB+LTi+0A+w+7B6TU=;
	b=MnxwypqbVdfAbTOAaDe54f5Ddoj8sGNHvODuGVyjjoVGXs2TERZXodGpRx0hbgLRpW
	zgSXbyeZ3u52pYMFoZH/lOE7w5UGBAk9N3255WQGjTUM/INHDTZRKMDkTilDGFN/1jcQ
	yJOmKsVdslpHYc9LpSc3vHAstSYpeDukxURDiz1aZpchx6FIauP5tZ5bqx0D/vDjlXn/
	vQ83T3ZXGYH0yJu84QUWKwagw3v+hvoV8MqHiXr26yICUkYixYzsiPE5lVARNTeyWSMT
	Tu1Pjv8LjFiJfqasDZ4Z9TMpevtxSDkFOGbGA3V1VOcXXaQKmwCExAuLUqq+OhweCaA5
	n7tw==
X-Gm-Message-State: APjAAAUgk6DR8EPSo+JbA1bOj3E6oJw3iMTS9O+iJlCYYkiFWAT7qyzg
	ueCmQlDbo1uFevbZcCBcBvtnvavz05dKQWinDb9JlZxW
X-Google-Smtp-Source: APXvYqw8QI4LUi82qSN/B6caen169AU7O0014xtdgin78b4xzWNXN5f3TAN5h/8+u5Ayd7rk0bm6MDmdYwW0v3uilAI=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr526977lje.118.1567136365513; 
	Thu, 29 Aug 2019 20:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <1567132763-12581-1-git-send-email-zhangzl2013@126.com>
In-Reply-To: <1567132763-12581-1-git-send-email-zhangzl2013@126.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Aug 2019 23:39:14 -0400
Message-ID: <CADkTA4MEpVJZ-fH0RK+xxy8hUXcKHEsJbUAWXqufySu4O3_6hw@mail.gmail.com>
To: Zhaolong Zhang <zhangzl2013@126.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] spp: optimize strip_common_prefix function
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
X-List-Received-Date: Fri, 30 Aug 2019 03:39:25 -0000
Content-Type: text/plain; charset="UTF-8"

This needs to go to the linux-yocto list.

Cheers,

Bruce

On Thu, Aug 29, 2019 at 10:42 PM Zhaolong Zhang <zhangzl2013@126.com> wrote:
>
> strip_common_prefix() is the hot path that executes on every input file.
> This patch sorts and uniqs the $include_paths by length descreasingly.
> And with the sorted $include_paths, the for-loop inside strip_common_prefix
> can break earlier, thus kernel_metadata task can be sped up by multiple times.
>
> Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
> ---
>  tools/spp | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/tools/spp b/tools/spp
> index 1150ff3..cba52bb 100755
> --- a/tools/spp
> +++ b/tools/spp
> @@ -125,6 +125,7 @@ strip_common_prefix()
>         if [ $this_len -lt $out_len ]; then
>             relocated_name=$t
>             out_len=$this_len
> +           break
>         fi
>         # add a trailing slash to get corner cases where one may
>         # have been added or not dropped
> @@ -133,6 +134,7 @@ strip_common_prefix()
>         if [ $this_len -lt $out_len ]; then
>             relocated_name=$t
>             out_len=$this_len
> +           break
>         fi
>      done
>
> @@ -297,6 +299,16 @@ infiles=$@
>
>  processed_files=""
>
> +# this function also removes duplicated lines by `sort -u`
> +sort_by_len_dec()
> +{
> +        for i in $@; do
> +                echo $i
> +        done | sort -u | awk '{ print length($0) " " $0; }' | sort -nr | cut -d ' ' -f 2-
> +}
> +
> +include_paths=$(sort_by_len_dec $include_paths)
> +
>  ##
>  ## create variables for use in scripts
>  ##
> --
> 1.9.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

