Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF4A27F8B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 02:58:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAQ2x0so032626
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 18:59:00 -0800
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 25 Nov 2019 18:59:00 -0800
To: <openembedded-core@lists.openembedded.org>
References: <20191119031514.10105-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <f84b3ed1-78eb-5b89-836a-c4c5f2fa1b0a@windriver.com>
Date: Tue, 26 Nov 2019 10:58:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119031514.10105-1-kai.kang@windriver.com>
Subject: Re: [PATCH] multilib.bbclass: fix qa warning of kernel-devicetree
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
X-List-Received-Date: Tue, 26 Nov 2019 02:59:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/11/19 上午11:15, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> When kernel-devicetree is in RRECOMMENDS such as via variable
> MACHINE_EXTRA_RRECOMMENDS for some bsp, it shows QA warning of multilib:
>
> | WARNING: lib32-packagegroup-base-1.0-r83 do_package: QA Issue:
> | lib32-packagegroup-base package lib32-packagegroup-machine-base
> | - suspicious values 'kernel-devicetree' in RRECOMMENDS [multilib]
>
> Add kernel-devicetree to exceptions to fix the QA issue. Because there
> are already 3 kernel related criteria, simplify them by judging package
> names whether start with 'kernel-'. And also refactor to remove
> duplicate 'not'.

Any comment please?

Regards,
Kai


>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/classes/multilib.bbclass | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index 1a9295d36f..ee677da1e2 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -184,11 +184,12 @@ python do_package_qa_multilib() {
>           for i in values:
>               if i.startswith('virtual/'):
>                   i = i[len('virtual/'):]
> -            if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and \
> -                (not 'cross-canadian' in i) and (not i.startswith("nativesdk-")) and \
> -                (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')) \
> -                and (not i.startswith("kernel-image")) and (not i.startswith("/")):
> +
> +            if (not (i.startswith(mlprefix) or i.startswith("kernel-") \
> +                    or ('cross-canadian' in i) or i.startswith("nativesdk-") \
> +                    or i.startswith("rtld") or i.startswith("/"))):
>                   candidates.append(i)
> +
>           if len(candidates) > 0:
>               msg = "%s package %s - suspicious values '%s' in %s" \
>                      % (d.getVar('PN'), pkg, ' '.join(candidates), var)


-- 
Kai Kang


