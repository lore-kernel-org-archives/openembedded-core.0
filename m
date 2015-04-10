Return-Path: <zhengjunling@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [58.251.152.64])
	by mail.openembedded.org (Postfix) with ESMTP id 550A1724DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 13:56:24 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CLY45121; Fri, 10 Apr 2015 21:56:23 +0800 (CST)
Received: from [127.0.0.1] (10.111.55.101) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 10 Apr 2015 21:56:19 +0800
Message-ID: <5527D67E.7050208@huawei.com>
Date: Fri, 10 Apr 2015 21:56:14 +0800
From: Junling Zheng <zhengjunling@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1428661108-7670-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1428661108-7670-1-git-send-email-Martin.Jansa@gmail.com>
X-Originating-IP: [10.111.55.101]
X-CFilter-Loop: Reflected
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] elfutils: fix build with -Os
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
X-List-Received-Date: Fri, 10 Apr 2015 13:56:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Good, I encounter this problem today, and prepare to fix it:)

Thanks for your patch,

On 2015/4/10 18:18, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...m-Silence-Werror-maybe-uninitialized-fals.patch | 35 ++++++++++++++++++++++
>  meta/recipes-devtools/elfutils/elfutils_0.161.bb   |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
> new file mode 100644
> index 0000000..3754c1c
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
> @@ -0,0 +1,35 @@
> +From 668accf322fd7185e273bfd50b84320e71d9de5a Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Fri, 10 Apr 2015 00:29:18 +0200
> +Subject: [PATCH] elf_getarsym: Silence -Werror=maybe-uninitialized false
> + positive
> +
> +Upstream-Status: Pending
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + libelf/elf_getarsym.c | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/libelf/elf_getarsym.c b/libelf/elf_getarsym.c
> +index d0bb28a..08954d2 100644
> +--- a/libelf/elf_getarsym.c
> ++++ b/libelf/elf_getarsym.c
> +@@ -165,8 +165,13 @@ elf_getarsym (elf, ptr)
> +       int w = index64_p ? 8 : 4;
> + 
> +       /* We have an archive.  The first word in there is the number of
> +-	 entries in the table.  */
> +-      uint64_t n;
> ++	 entries in the table.
> ++	 Set to SIZE_MAX just to silence -Werror=maybe-uninitialized
> ++	 elf_getarsym.c:290:9: error: 'n' may be used uninitialized in this function
> ++	 The read_number_entries function doesn't initialize n only when returning
> ++	 -1 which in turn ensures to jump over usage of this uninitialized variable.
> ++	 */
> ++      uint64_t n = SIZE_MAX;
> +       size_t off = elf->start_offset + SARMAG + sizeof (struct ar_hdr);
> +       if (read_number_entries (&n, elf, &off, index64_p) < 0)
> + 	{
> +-- 
> +2.3.5
> +
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.161.bb b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
> index a3c1f36..d8c27f5 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.161.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
> @@ -15,6 +15,7 @@ SRC_URI += "\
>          file://dso-link-change.patch \
>          file://Fix_elf_cvt_gunhash.patch \
>          file://fixheadercheck.patch \
> +        file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
>  "
>  
>  # pick the patch from debian
> 



