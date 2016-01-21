Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05E1E7316D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:42:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0L7gUH8014388
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jan 2016 23:42:30 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 23:42:29 -0800
To: Koen Kooi <koen.kooi@linaro.org>,
	<openembedded-core@lists.openembedded.org>
References: <1453360859-16992-1-git-send-email-koen.kooi@linaro.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56A08BE4.1090306@windriver.com>
Date: Thu, 21 Jan 2016 15:42:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453360859-16992-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [PATCH] e2fsprogs: disable libblkid again
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
X-List-Received-Date: Thu, 21 Jan 2016 07:42:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/21/2016 03:20 PM, Koen Kooi wrote:
> We use the util-linux one and do_install deletes it anyway.
>
> See OE-core commit fb8e776ea91c39d586b46400ad30aeea8dead1c4 for more info.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>   meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> index c82e99a..f244473 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> @@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>
>   EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
>                   --enable-elf-shlibs --disable-libuuid --disable-uuidd \
> -                --enable-libblkid --enable-verbose-makecmds"
> +                --disable-libblkid --enable-verbose-makecmds"

Thanks, maybe we also need cleanup other codes like:

     # We use blkid from util-linux now so remove from here
     rm -f ${D}${base_libdir}/libblkid*

And:

ALTERNATIVE_${PN}-doc = "libblkid.3 blkid.8"
ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"

// Robert

>
>   EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
>
>

