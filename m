Return-Path: <raj.khem@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 952E660778
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 20:49:23 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id t67so1203476ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j1ZM5Dq/3Qcz4nMrQwopJtJJoAGJz3aCRT3e1wGe7tY=;
	b=H3P4M/D45/pzP0kgv2RWu/2pxsfhEq3J2rvMwXfu+CPXeI3068rb7rhj+JsiSi0PcN
	mSkb7SMkEA5ZAkTjXiriS+Kq4JjkQyYB185RXQRk2ocLcU8spmJhRpKEowGwHDk7e6eV
	o3HdE9ZepKZaN5n1jIGQ/E+CcWNjfzMzYy52YxTasrME9lVp81zByxew7DJbZdPX07bg
	E4pmzMrl+KxxcKv7A9I17x/ZpQZs2GEbRje2zeDgDKRnQJwE3x30RND/+/0pitFkrIOB
	VQilsRZYLEYG3yGfxQzCktbvP9rGHGkCNM7jZCx2Yvnl0wyKAZaFgg6oYNONw7VaKMRg
	+nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j1ZM5Dq/3Qcz4nMrQwopJtJJoAGJz3aCRT3e1wGe7tY=;
	b=B2QQrTYQKyriFlMlJKU/diRi13eVbN+d9c2fkTE9uJCvZ3vsKp4r4uemfvX1+e1hdc
	RbGpJ5Y+OIF+di5ZgnurLHBemPI5Wjc5sbfGQGJtdHNqQiDC0FFwV+rkrLeqaAMUi5ji
	TPcwYgz++tX+kmm4iQhRtGKyMJD5QsmUpJjaFOpZx+HuPGk31vgeEgSD1AxHAUCNcpm8
	xZJBYk+B/1ITdSZB9Ii4zsKdojOSpvT2dJuzs9DzJtfXl6dcGO7Z0o3RrE4fKmy0yNiw
	httgePmpqR9XxmRiSboTlqJ45X9IS4Wv67i1Od8hbxZrAARuDtfIRHebMWg6pfAiRANj
	m9rw==
X-Gm-Message-State: AE9vXwOq7aOsZ0XIS+e65afwGWmQgrUCKm6d2cQSwzCoxnc35h7QIRNuI2MMs0hs7a5s1X6Qxecmc+/MY1pzPw==
X-Received: by 10.129.121.7 with SMTP id u7mr30772214ywc.237.1474404565269;
	Tue, 20 Sep 2016 13:49:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Tue, 20 Sep 2016 13:48:54 -0700 (PDT)
In-Reply-To: <20160920091958.23448-1-Yuanjie.Huang@windriver.com>
References: <20160920091958.23448-1-Yuanjie.Huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Sep 2016 13:48:54 -0700
Message-ID: <CAMKF1sooPU-oSmeGuNQXjEUvgWfAXubQuKc6bk=L45WtRD4xjQ@mail.gmail.com>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-sanitizers: Fix libtool library files
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
X-List-Received-Date: Tue, 20 Sep 2016 20:49:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 20, 2016 at 2:19 AM, Yuanjie Huang
<Yuanjie.Huang@windriver.com> wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>
> Since libtool sysroot is not set when compiling sanitizers, the libtool
> does no prefix the dependency path correctly. Fix it, so that programs
> can link to sanitizer libraries without error.
>
> This patch changes the depenedency_libs line in libasan.la and
> libusan.la from
>         dependency_libs=' -lpthread -ldl '/usr/lib'/libstdc++.la '/usr/lib'/libstdc++.la'
> to
>         dependency_libs=' -lpthread -ldl =/usr/lib/libstdc++.la =/usr/lib/libstdc++.la'
>
> Upstream-Status: Inappropriate [embedded specific]
> (LOCAL REV; NOT UPSTREAM) -- sent to oe-core on 2016-09-20
>
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index c987ccb..5fe5eaf 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -50,6 +50,8 @@ do_install () {
>          rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>      fi
>      chown -R root:root ${D}
> +    # Fix broken libtool with stdc++, as sysroot is not set.
> +    find ${D} -name \*.la -exec sed -i "/^dependency_libs=/s@'/usr/lib'@=/usr/lib@g" {} \;

what happens if you remove the .la files completely.

>  }
>
>  INHIBIT_DEFAULT_DEPS = "1"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

