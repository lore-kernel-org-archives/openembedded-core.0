Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 918F160557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 08:04:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1G84dCc019992
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Feb 2017 00:04:39 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Feb 2017 00:04:38 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1484866395-17971-33-git-send-email-richard.purdie@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <cccd1157-effb-d234-b339-0464f40e5d3f@windriver.com>
Date: Thu, 16 Feb 2017 16:04:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1484866395-17971-33-git-send-email-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 33/33] kernel.bbclass: Add PACKAGE_WRITE_DEPS for postinst
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
X-List-Received-Date: Thu, 16 Feb 2017 08:04:41 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/20/2017 06:53 AM, Richard Purdie wrote:
> From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>
> The depmodwrapper dependency is not actually used by the class but
> anyone using pkg_postinst_kernel-base() will need it.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/classes/kernel.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3630042..f462b2f 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,8 @@
>  inherit linux-kernel-base kernel-module-split
>
>  PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native lzop-native"
> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
> +PACKAGE_WRITE_DEPS += "depmodwrapper-cross virtual/update-alternatives-native"

do_deploy depends depmodwrapper-cross, so this patch may cause do_deploy failed:

run.do_deploy.27809: line 155: depmodwrapper: command not found

I will send a patch to fix the issue.

// Robert

>
>  S = "${STAGING_KERNEL_DIR}"
>  B = "${WORKDIR}/build"
>

