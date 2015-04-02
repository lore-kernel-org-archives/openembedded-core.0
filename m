Return-Path: <zhengjunling@huawei.com>
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
	by mail.openembedded.org (Postfix) with ESMTP id F3A0C6AC56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 06:34:18 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJH01169; Thu, 02 Apr 2015 14:34:14 +0800 (CST)
Received: from [127.0.0.1] (10.111.55.101) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1; Thu, 2 Apr 2015
	14:34:09 +0800
Message-ID: <551CE2DA.70409@huawei.com>
Date: Thu, 2 Apr 2015 14:34:02 +0800
From: Junling Zheng <zhengjunling@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1427882425-19536-1-git-send-email-zhengjunling@huawei.com>
In-Reply-To: <1427882425-19536-1-git-send-email-zhengjunling@huawei.com>
X-Originating-IP: [10.111.55.101]
X-CFilter-Loop: Reflected
Subject: Re: [PATCH] uclibc: fix undefinition of '_dl_strchr' in libdl.a
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
X-List-Received-Date: Thu, 02 Apr 2015 06:34:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Cc Saul Wold <sgw@linux.intel.com>, who is the maintainer of uclibc's recipe.

On 2015/4/1 18:00, Junling Zheng wrote:
> The orign_path.patch introduced '_dl_strchr' into ldso/ldso/dl-elf.c, and
> caused the following undefined referencing compiling error:
> 
>   | .../libdl.a(libdl.os): In function `search_for_named_library':
>   | .../dl-elf.c:156: undefined reference to `_dl_strchr'
>   | collect2: error: ld returned 1 exit status
> 
> I found this problem when compiling gdb in static mode using uclibc.
> 
> Add the definition of '_dl_strchr' to fix it. The '_dl_strstr' is added
> as well.
> 
> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> ---
>  meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
>  ...-define-_dl_strchr-and-_dl_strstr-if-not-.patch | 39 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch
> 
> diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
> index a2b2353..68240dc 100644
> --- a/meta/recipes-core/uclibc/uclibc-git.inc
> +++ b/meta/recipes-core/uclibc/uclibc-git.inc
> @@ -25,5 +25,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
>  	file://0002-wire-setns-syscall.patch \
>  	file://0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch \
>  	file://0001-timex-Sync-with-glibc.patch \
> +	file://0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch \
>  	"
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch b/meta/recipes-core/uclibc/uclibc-git/0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch
> new file mode 100644
> index 0000000..e94fbba
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-git/0001-dl-string.h-define-_dl_strchr-and-_dl_strstr-if-not-.patch
> @@ -0,0 +1,39 @@
> +From eb1806f581a134599c1ef26975f514e35663f8c2 Mon Sep 17 00:00:00 2001
> +From: Junling Zheng <zhengjunling@huawei.com>
> +Date: Tue, 31 Mar 2015 12:00:58 +0000
> +Subject: [PATCH] dl-string.h: define _dl_strchr and _dl_strstr if not
> + IS_IN_rtld
> +
> +We should define _dl_strchr and _dl_strstr when not defining IS_IN_rtld.
> +Otherwise, if someone use _dl_strchr or _dl_strstr in the ldso/ldso/dl-
> +elf.c, libdl.a will lack the declaration of '_dl_strchr' or '_dl_strstr',
> +and there will be an compiling error like the following:
> +
> +  dl-elf.c:156: undefined reference to `_dl_strchr'
> +
> +So, add the definition of _dl_strchr and _dl_strstr.
> +
> +Upstream-Status: Submitted [http://lists.uclibc.org/pipermail/uclibc/2015-March/048888.html]
> +
> +Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> +---
> + ldso/include/dl-string.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/ldso/include/dl-string.h b/ldso/include/dl-string.h
> +index aacad10..14ae617 100644
> +--- a/ldso/include/dl-string.h
> ++++ b/ldso/include/dl-string.h
> +@@ -204,7 +204,9 @@ static __always_inline char * _dl_get_last_path_component(char *path)
> + # define _dl_strcat strcat
> + # define _dl_strcpy strcpy
> + # define _dl_strcmp strcmp
> ++# define _dl_strchr strchr
> + # define _dl_strrchr strrchr
> ++# define _dl_strstr strstr
> + # define _dl_memcpy memcpy
> + # define _dl_memcmp memcmp
> + # define _dl_memset memset
> +-- 
> +1.8.3.4
> +
> 



