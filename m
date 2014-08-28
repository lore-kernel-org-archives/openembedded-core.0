Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82CA46AC85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 09:38:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7S9cQD0029301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 02:38:26 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 28 Aug 2014 02:38:26 -0700
Message-ID: <53FEF856.4060402@windriver.com>
Date: Thu, 28 Aug 2014 17:37:26 +0800
From: Wenlin Kang <wenlin.kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1396941362-27622-1-git-send-email-wenlin.kang@windriver.com>
In-Reply-To: <1396941362-27622-1-git-send-email-wenlin.kang@windriver.com>
X-Originating-IP: [128.224.162.182]
Subject: Re: [PATCH] busybox: fix a sh link wrong
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
X-List-Received-Date: Thu, 28 Aug 2014 09:38:31 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年04月08日 15:16, Wenlin Kang wrote:
> When both bash and busybox be installed, without ash support
> in busybox,if bash is installed before busybox in the final stage,
> even if ALTERNATIVE_PRIORITY of bash > ALTERNATIVE_PRIORITY of busybox,
> the symlink from /bin/sh to bash can be yet overwritten by busybox.
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   meta/recipes-core/busybox/busybox.inc |    8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 69b9b0c..bf2ddc1 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -188,7 +188,9 @@ do_install () {
>   			install -m 0755 ${B}/busybox.nosuid ${D}${base_bindir}
>   			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
>   			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
> -			ln -sf busybox.nosuid ${D}${base_bindir}/sh
> +			if grep -q "CONFIG_FEATURE_SH_IS_ASH=y" ${B}/.config; then
> +				ln -sf busybox.nosuid ${D}${base_bindir}/sh
> +			fi
>   			# Keep a default busybox for people who want to invoke busybox directly.
>   			# This is also useful for the on device upgrade. Because we want
>   			# to use the busybox command in postinst.
> @@ -200,7 +202,9 @@ do_install () {
>   				install -m 0755 ${B}/busybox ${D}${base_bindir}
>   			fi
>   			install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
> -			ln -sf busybox ${D}${base_bindir}/sh
> +			if grep -q "CONFIG_FEATURE_SH_IS_ASH=y" ${B}/.config; then
> +				ln -sf busybox ${D}${base_bindir}/sh
> +			fi
>   			# We make this symlink here to eliminate the error when upgrading together
>   			# with busybox-syslog. Without this symlink, the opkg may think of the
>   			# busybox.nosuid as obsolete and remove it, resulting in dead links like


ping ...

-- 
Thanks,
Wenlin Kang


