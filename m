Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94A606E5E9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 13:13:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7QDD95o002978
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Aug 2018 06:13:10 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 26 Aug 2018 06:13:08 -0700
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
	<openembedded-core@lists.openembedded.org>
References: <1535100863-3331-1-git-send-email-mikko.rapeli@bmw.de>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <2b37bc24-2a64-4b86-9538-e3ab41858c07@windriver.com>
Date: Sun, 26 Aug 2018 21:12:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1535100863-3331-1-git-send-email-mikko.rapeli@bmw.de>
Subject: Re: [PATCH] nss: fix postinst script for nativesdk build
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
X-List-Received-Date: Sun, 26 Aug 2018 13:13:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月24日 16:54, Mikko Rapeli wrote:
> It's better to refer to binaries in postinst script with
> full path which also works on SDK when
> /opt/nativesysroot/usr/bin is not in PATH.
>
> Fixes install of nativesdk-nss:
>
> Configuring nativesdk-nss.
> /var/lib/opkg/info/nativesdk-nss.postinst: line 14: signlibs.sh: not found

It causes QA warning:

WARNING: core-image-sato-1.0-r0 do_rootfs: Intentionally failing 
postinstall scriptlets of ['nss'] to defer them to first boot is 
deprecated. Please place them into pkg_postinst_ontarget_${PN} ().
If deferring to first boot wasn't the intent, then scriptlet failure may 
mean an issue in the recipe, or a regression elsewhere.
Details of the failure are in 
/buildarea/kkang/yocto/ml-Aug25/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/temp/log.do_rootfs. 

WARNING: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato: 
found 2 warning messages in the logfile:
[log_check] warning: %post(nss-3.38-r0.core2_64) scriptlet failed, exit 
status 1
[log_check] WARNING: Intentionally failing postinstall scriptlets of 
['nss'] to defer them to first boot is deprecated. Please place them 
into pkg_postinst_ontarget_${PN} ().


Regards,
Kai

>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>   meta/recipes-support/nss/nss_3.38.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/nss/nss_3.38.bb b/meta/recipes-support/nss/nss_3.38.bb
> index f3e5170..90b6933 100644
> --- a/meta/recipes-support/nss/nss_3.38.bb
> +++ b/meta/recipes-support/nss/nss_3.38.bb
> @@ -227,13 +227,13 @@ pkg_postinst_${PN} () {
>               DN=`dirname $I`
>               BN=`basename $I .chk`
>               FN=$DN/$BN.so
> -            shlibsign -i $FN
> +            ${bindir}/shlibsign -i $FN
>               if [ $? -ne 0 ]; then
>                   exit 1
>               fi
>           done
>       else
> -        signlibs.sh
> +        ${bindir}/signlibs.sh
>       fi
>   }
>   


-- 
Regards,
Neil | Kai Kang


