Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 270CC7710B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:02:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G62x3d000101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 23:02:59 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 15 Oct 2015 23:02:58 -0700
Message-ID: <562091F8.40805@windriver.com>
Date: Fri, 16 Oct 2015 13:58:16 +0800
From: Liu Jian <jian.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1444286871-8615-1-git-send-email-jian.liu@windriver.com>
In-Reply-To: <1444286871-8615-1-git-send-email-jian.liu@windriver.com>
Subject: Re: [PATCH] base.bbclass: considering multilib when setting LICENSE_EXCLUSION
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
X-List-Received-Date: Fri, 16 Oct 2015 06:02:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

Will you going to merge this patch?
I have ever discuss with Robert Yang and he agreed to integrated it.

Thanks!
Jian


于 2015年10月08日 14:47, Jian Liu 写道:
> The PACKAGES is not mapped with MLPREFIX when setting LICENSE_EXCLUSION
> in base.bbclass. For example,
>    For libgcc-dev,
>      LICENSE_EXCLUSION-libgcc-dev=1
>     but for lib32-libgcc-dev,
>      LICENSE_EXCLUSION-libgcc-dev=1
> Obviously it is wrong for lib32-libgcc-dev.
>
> Add MLPREFIX before the package name during setting LICENSE_EXCLUSION
>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>   meta/classes/base.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index f078001..89c8f04 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -512,7 +512,8 @@ python () {
>                   if unskipped_pkgs:
>                       for pkg in skipped_pkgs:
>                           bb.debug(1, "SKIPPING the package " + pkg + " at do_rootfs because it's " + recipe_license)
> -                        d.setVar('LICENSE_EXCLUSION-' + pkg, 1)
> +                        mlprefix = d.getVar('MLPREFIX', True)
> +                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, 1)
>                       for pkg in unskipped_pkgs:
>                           bb.debug(1, "INCLUDING the package " + pkg)
>                   elif all_skipped or incompatible_license(d, bad_licenses):

-- 
Jian Liu
Email: jian.liu@windriver.com
Office Phone: 86-10-84778539


