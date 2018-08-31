Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD9779558
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:34:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7V6Ygvm028168
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 23:34:43 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 30 Aug 2018 23:34:42 -0700
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1535618185-236305-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B88E0EA.9070107@windriver.com>
Date: Fri, 31 Aug 2018 14:32:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1535618185-236305-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [PATCH] kexec-tools: fix for "Unhandled rela relocation: R_X86_64_PLT32" error
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
X-List-Received-Date: Fri, 31 Aug 2018 06:34:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping.

On 2018年08月30日 16:36, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> In response to a change in binutils, commit b21ebf2fb4c
> (x86: Treat R_X86_64_PLT32 as R_X86_64_PC32) was applied to
> the linux kernel during the 4.16 development cycle and has
> since been backported to earlier stable kernel series. The
> change results in the failure message as below when rebooting
> via kexec.
>   # kexec -l /boot/bzImage --append="console=ttyS0,115200 root=/dev/sda1"
>   Unhandled rela relocation: R_X86_64_PLT32
>
> Fix this by replicating the change in kexec.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   ...or-Unhandled-rela-relocation-R_X86_64_PLT.patch | 41 ++++++++++++++++++++++
>   meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb    |  1 +
>   2 files changed, 42 insertions(+)
>   create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch
>
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch
> new file mode 100644
> index 0000000..e0cced5
> --- /dev/null
> +++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch
> @@ -0,0 +1,41 @@
> +From b9de21ef51a7ceab7122a707c188602eae22c4ee Mon Sep 17 00:00:00 2001
> +From: Chris Clayton <chris2553@googlemail.com>
> +Date: Mon, 20 Aug 2018 12:00:31 +0100
> +Subject: [PATCH] kexec: fix for "Unhandled rela relocation: R_X86_64_PLT32" error
> +
> +In response to a change in binutils, commit b21ebf2fb4c
> +(x86: Treat R_X86_64_PLT32 as R_X86_64_PC32) was applied to
> +the linux kernel during the 4.16 development cycle and has
> +since been backported to earlier stable kernel series. The
> +change results in the failure message in $SUBJECT when
> +rebooting via kexec.
> +
> +Fix this by replicating the change in kexec.
> +
> +Upstream-Status: Backport[https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=b9de21ef51a7ceab7122a707c188602eae22c4ee]
> +
> +Signed-off-by: Chris Clayton <chris2553@googlemail.com>
> +Acked-by: Baoquan He <bhe@redhat.com>
> +Tested-by: Bhupesh Sharma <bhsharma@redhat.com>
> +Acked-by: Bhupesh Sharma <bhsharma@redhat.com>
> +Signed-off-by: Simon Horman <horms@verge.net.au>
> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> +---
> + kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> +index 7fdde73..db85b44 100644
> +--- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> ++++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> +@@ -79,6 +79,7 @@ void machine_apply_elf_rel(struct mem_ehdr *UNUSED(ehdr),
> + 			goto overflow;
> + 		break;
> + 	case R_X86_64_PC32:
> ++	case R_X86_64_PLT32:
> + 		*(uint32_t *)location = value - address;
> + 		break;
> + 	default:
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
> index f4ec586..dd46901 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
> @@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
>              file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
>              file://kexec-x32.patch \
>              file://0001-Disable-PIE-during-link.patch \
> +           file://0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch \
>              "
>
>   SRC_URI[md5sum] = "8e071ca473694a71e4ae60ed7ef6f377"
>

