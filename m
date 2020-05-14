Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.8089.1589442948615531218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 00:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HUAwq6PD;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id e25so2439200ljg.5
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=kyyZuludvfRh34DGV+QDjkOCt6lrzXtpi0rqo8A5Nmg=;
        b=HUAwq6PD3xJZQD2J0puyG0eQovZudrr7a1Ds7r/2oJx6oHS3FGE5SJrfT/KZcSRsep
         qaRTJ+tiKkFT5c3snEWYZyLv+sT6gJ3X+GbNsL9w5Ud41mb2zOYKyrHS4f5CcfiGoYKH
         3sISCRMHEq52AtV5tGlmaafBl3b93SedsbANDO8U5UC5a5ZIbK5Gs5qUVdTS5fAr69FN
         MO6z9GUPhICTbkXiT4bqncNa2zs7RS8gkW8I91fs0Yw97V2/ptwQqmcTM5PBqS4wXE8A
         QEn7N8GW9D0yOrnVG+Kdv5WX3ZfSjRPkzmBldKIR+Etr9omVN/kzCH63rtb5ordp+W5t
         o2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kyyZuludvfRh34DGV+QDjkOCt6lrzXtpi0rqo8A5Nmg=;
        b=Oo3sHNVkElJtbK0o0ymmF2vYd2gHZsRe8KtPqdf/zvUPKOBzTxKUxWeb/WPPdojkaC
         g/D+6wUCARwGS9N+4mK/SVVDX6gqjnJdlH9WT2cP/uOUsaCn1FqA94QuY8hvQqL7Udy9
         prl/Pb7yO1igQNi9E9meXxQPJ4jILYJ2b+AXnqVvasYxEef22Zg/UlFBoxZkWYxq7/k4
         iBlbTkK7UU+xzmF25sqrxBpbJWaVuUTQDaXyOheolr17tOu88DyxTdYIzPAcOG4MdZ06
         LrmDaMlkUl+Sz2hPgiTtV8+x8fr/Bsb7FVpM9FWhapJHEWuSTvHhfCPhL1mmAXVnwXuJ
         TXSg==
X-Gm-Message-State: AOAM532+cEwTjgmXzZg+m3+YURq4FelV7zAcSrv+p946xc1CcZF7Yr9j
	y8W9F6OJaSBd567sY7/QkyOzGYiDzAk=
X-Google-Smtp-Source: ABdhPJzczDw5u84PT6FAXeVrjlfEvCpBVUuW16TU1neRX9XgYy4nu4xlw+aeEK3ssyo+OczXFa5P3g==
X-Received: by 2002:a2e:9795:: with SMTP id y21mr998472lji.115.1589442946074;
        Thu, 14 May 2020 00:55:46 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id y19sm1258731lfg.25.2020.05.14.00.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 00:55:45 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] bison: fix the parallel build
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200514073936.40572-1-mingli.yu@windriver.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <17e2ea0e-6588-355a-9f5a-b570a0e4cf87@gmail.com>
Date: Thu, 14 May 2020 09:55:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514073936.40572-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Mingli,

On 5/14/20 9:39 AM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Explicitly make the BUILT_SOURCES which
> are the generated headers such as stdio.h,
> fcntl.h and etc to be the dependencies of
> the gl_LIBOBJS such as libbison_a-sprintf.o,
> libbison_a-printf.o and etc to guarantee the
> BUILT_SOURCES is generated before begin to
> compile EXTRA_lib_libbison_a_SOURCES such as
> fprintf.c in parallel builid, otherwise there
> may come below error:
>   | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
> 
> It does the same for src_bison_OBJECTS and
> lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
> generated before begin to compile src_bison_SOURCES
> which contains AnnotationList.c and etc.
> 
> BTW, the MOSTLYCLEANFILES also contains the
> generated header needs to be created early
> in the build process, so add it also in to
> avoid below error:
>   | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such file or directory
> 
> [YOCTO #13825]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../0001-bison-fix-the-parallel-build.patch   | 63 +++++++++++++++++++
>   meta/recipes-devtools/bison/bison_3.5.4.bb    |  1 +
>   2 files changed, 64 insertions(+)
>   create mode 100644 meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
> 
> diff --git a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
> new file mode 100644
> index 0000000000..c3be91a109
> --- /dev/null
> +++ b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
> @@ -0,0 +1,63 @@
> +From e0dbcee6e25b3c0cb11a627bbfe3af45ef67ec30 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Thu, 14 May 2020 15:23:16 +0800
> +Subject: [PATCH] bison: fix the parallel build
> +
> +Explicitly make the BUILT_SOURCES which
> +are the generated headers such as stdio.h,
> +fcntl.h and etc to be the dependencies of
> +the gl_LIBOBJS such as libbison_a-sprintf.o,
> +libbison_a-printf.o and etc to guarantee the
> +BUILT_SOURCES is generated before begin to
> +compile EXTRA_lib_libbison_a_SOURCES such as
> +fprintf.c in parallel builid, otherwise there
> +may come below error:
> + | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
> +
> +It does the same for src_bison_OBJECTS and
> +lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
> +generated before begin to compile src_bison_SOURCES
> +which contains AnnotationList.c and etc.
> +
> +BTW, the MOSTLYCLEANFILES also contains the
> +generated header needs to be created early
> +in the build process, so add it also in to
> +avoid below error:
> + | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such file or directory
> +
> +Upstream-Status: Submitted [bison-patches@gnu.org maillist]
> +

I can't find the patch email in the bison-patches mailing list archive, 
do you have a link url ?

/Jacob
