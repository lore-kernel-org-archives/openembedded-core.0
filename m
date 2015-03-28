Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5423E723B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Mar 2015 08:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2S8reRi006016; Sat, 28 Mar 2015 08:53:40 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zNoo9uIAk38I; Sat, 28 Mar 2015 08:53:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2S8rO25006012
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 28 Mar 2015 08:53:35 GMT
Message-ID: <1427532804.14020.220.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Junling Zheng <zhengjunling@huawei.com>
Date: Sat, 28 Mar 2015 08:53:24 +0000
In-Reply-To: <551613A2.10506@huawei.com>
References: <1427361482-5775-1-git-send-email-zhengjunling@huawei.com>
	<1427363666.14020.62.camel@linuxfoundation.org>
	<5513EE0B.5070802@huawei.com> <5513F450.1010701@communistcode.co.uk>
	<5514025A.4080004@huawei.com>
	<CAJTo0LYk7tA=5Vos6BC4j8cC5V=9TK4BZ9H0j0RQeajQuo=D0A@mail.gmail.com>
	<5514CF16.2020804@huawei.com>
	<CAJTo0Latp9ifgWHDAJGb=m4tuj3ChahC4sxEOwy+pNjE0RkYSA@mail.gmail.com>
	<551613A2.10506@huawei.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "peifeiyue@huawei.com" <peifeiyue@huawei.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] file: remove the original magic.h
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
X-List-Received-Date: Sat, 28 Mar 2015 08:53:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-03-28 at 10:36 +0800, Junling Zheng wrote:
> I backport some commits from upstream to fix CVE-2014-9620, and some of them involve the modifying of magic.h.in:
> 
> 90018fe22ff8b74a22fcd142225b0a00f3f12677
> 6ce24f35cd4a43c4bdd249e8e0c4952c1f8eac67
> 0056ec32255de1de973574b0300161a1568767d6
> 09e41625c999a2e5b51e1092f0ef2432a99b5c33
> ce90e05774dd77d86cfc8dfa6da57b32816841c4
> 
> And the final difference between magic.h and magic.h.in is:
> 
> z00238152@Patch-Test:file-5.14>0$ diff -u src/magic.h src/magic.h
> magic.h     magic.h.in
> z00238152@Patch-Test:file-5.14>0$ diff -u src/magic.h src/magic.h.in
> --- src/magic.h	2015-03-28 02:01:46.000000000 +0000
> +++ src/magic.h.in	2015-03-28 02:01:47.000000000 +0000
> @@ -74,7 +74,7 @@
>  #define	MAGIC_NO_CHECK_FORTRAN	0x000000 /* Don't check ascii/fortran */
>  #define	MAGIC_NO_CHECK_TROFF	0x000000 /* Don't check ascii/troff */
> 
> -#define MAGIC_VERSION		514	/* This implementation */
> +#define MAGIC_VERSION		X.YY	/* This implementation */
> 
> 
>  #ifdef __cplusplus
> @@ -100,7 +100,12 @@
>  int magic_list(magic_t, const char *);
>  int magic_errno(magic_t);
> 
> -#define MAGIC_PARAM_MAX_RECURSION	0
> +#define MAGIC_PARAM_INDIR_MAX		0
> +#define MAGIC_PARAM_NAME_MAX		1
> +#define MAGIC_PARAM_ELF_PHNUM_MAX	2
> +#define MAGIC_PARAM_ELF_SHNUM_MAX	3
> +#define MAGIC_PARAM_ELF_NOTES_MAX	4
> +
>  int magic_setparam(magic_t, int, const void *);
>  int magic_getparam(magic_t, int, void *);
> 
> 
> So, if Makefile doesn't generate a new magic.h, there will be some "symbol undeclared" errors during compiling.
> 
> By the way, the upstream code has only magic.h.in, and no magic.h, which only exists in release version tarballs.
> 
> And I think the original magic.h is redundant.

We ran into this problem in our branches. You need to ensure that your
CVE patches just touch magic.h.in and *not* magic.h. If you do that, the
timestamp of magic.h.in will be more recent that magic.h and your build
will function correctly.

The problem is that patch can patch those two files "at the same time"
on fast machines. You should never patch generated filed in patches in
OE in general.

Cheers,

Richard




