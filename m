Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8F060125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 00:54:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6R0sg7w022601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 17:54:42 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 26 Jul 2015 17:54:28 -0700
Message-ID: <55B58150.7010801@windriver.com>
Date: Mon, 27 Jul 2015 08:54:40 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1436752356-6508-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1436752356-6508-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][resend] elfutils: fix stack usage warning
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
X-List-Received-Date: Mon, 27 Jul 2015 00:54:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-R

On 2015年07月13日 09:52, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../0001-fix-a-stack-usage-warning.patch           | 28 ++++++++++++++++++++++
>   meta/recipes-devtools/elfutils/elfutils_0.163.bb   |  1 +
>   2 files changed, 29 insertions(+)
>   create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch
> new file mode 100644
> index 0000000..6923bf7
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/elfutils-0.163/0001-fix-a-stack-usage-warning.patch
> @@ -0,0 +1,28 @@
> +[PATCH] fix a stack-usage warning
> +
> +Upstream-Status: Pending
> +
> +not use a variable to as a array size, otherwise the warning to error that
> +stack usage might be unbounded [-Werror=stack-usage=] will happen
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + backends/ppc_initreg.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
> +index 64f5379..52dde3e 100644
> +--- a/backends/ppc_initreg.c
> ++++ b/backends/ppc_initreg.c
> +@@ -93,7 +93,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
> + 	return false;
> +     }
> +   const size_t gprs = sizeof (user_regs.r.gpr) / sizeof (*user_regs.r.gpr);
> +-  Dwarf_Word dwarf_regs[gprs];
> ++  Dwarf_Word dwarf_regs[sizeof (user_regs.r.gpr) / sizeof (*user_regs.r.gpr)];
> +   for (unsigned gpr = 0; gpr < gprs; gpr++)
> +     dwarf_regs[gpr] = user_regs.r.gpr[gpr];
> +   if (! setfunc (0, gprs, dwarf_regs, arg))
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.163.bb b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
> index c4fdabd..e391813 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.163.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
> @@ -17,6 +17,7 @@ SRC_URI += "\
>           file://fixheadercheck.patch \
>           file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
>           file://0001-remove-the-unneed-checking.patch \
> +        file://0001-fix-a-stack-usage-warning.patch \
>   "
>
>   # pick the patch from debian
>

-- 
Best Reagrds,
Roy | RongQing Li

