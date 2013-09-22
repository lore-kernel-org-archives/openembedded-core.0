Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 381A46CA13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 03:13:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8M3DASe000368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Sep 2013 20:13:10 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sat, 21 Sep 2013 20:13:08 -0700
Message-ID: <523E6042.8080403@windriver.com>
Date: Sun, 22 Sep 2013 11:13:06 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1379038097.git.Qi.Chen@windriver.com>
	<5623d6e9d394f968e15d165d65ce3748008be05d.1379038097.git.Qi.Chen@windriver.com>
In-Reply-To: <5623d6e9d394f968e15d165d65ce3748008be05d.1379038097.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH 1/1] image.bbclass: do not automatically remove update-rc.d
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
X-List-Received-Date: Sun, 22 Sep 2013 03:13:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 09/13/2013 10:09 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> In rootfs_uninstall_unneeded function, the update-rc.d package would
> be removed if no 'package-management' and no delayed postinsts.
>
> However, in update-rc.d.bbclass, the update-rc.d package is only
> recommended. Thus, if NO_RECOMMENDATIONS is enabled or 'update-rc.d'
> is added to BAD_RECOMMENDATIONS, the update-rc.d package will not
> be installed at the first place. Tring to remove it will result in an
> error.
>
> Also this function assumes that update-rc.d is only used by postinsts.
> This assumption isn't always true. Users may want to write their own
> init scripts and use the update-rc.d tool to manage them.
>
> [YOCTO #5169]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/image.bbclass |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index f1e62f14..f37cd90 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -505,12 +505,12 @@ rootfs_uninstall_unneeded () {
>   	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
>   		if [ -z "$(delayed_postinsts)" ]; then
>   			# All packages were successfully configured.
> -			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
> +			# base-passwd, run-postinsts are no further use, remove them now
>   			remove_run_postinsts=false
>   			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
>   				remove_run_postinsts=true
>   			fi
> -			rootfs_uninstall_packages update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
> +			rootfs_uninstall_packages base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
>   
>   			# Need to remove rc.d files for run-postinsts by hand since opkg won't
>   			# call postrm scripts in offline root mode.


