Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED0E97DB51
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 09:32:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x849WNej018882
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Sep 2019 02:32:34 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 4 Sep 2019 02:32:13 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190904085659.30305-1-kai.kang@windriver.com>
	<20190904090134.30800-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <3746af29-7c63-a660-ca50-e1e5dd2f4b8f@windriver.com>
Date: Wed, 4 Sep 2019 17:30:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904090134.30800-1-kai.kang@windriver.com>
Subject: Re: [PATCH 3/3] sysstat: 12.1.3 -> 12.1.6
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
X-List-Received-Date: Wed, 04 Sep 2019 09:32:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/9/4 下午5:01, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Update sysstat from 12.1.3 to 12.1.6.
>
> * remove sysstat.service and use the one from sysstat itself

After Qi's reminder, I checked the history that sysstat.service should 
not be removed.

v2 will be sent.

Regards,
Kai


> * make sa_lib_dir refer to ${libexecdir}/sa to fix conflictions when
>    multilib is enabled
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-extended/sysstat/sysstat.inc            |  5 ++---
>   .../recipes-extended/sysstat/sysstat/sysstat.service | 12 ------------
>   .../sysstat/{sysstat_12.1.3.bb => sysstat_12.1.6.bb} |  4 ++--
>   3 files changed, 4 insertions(+), 17 deletions(-)
>   delete mode 100644 meta/recipes-extended/sysstat/sysstat/sysstat.service
>   rename meta/recipes-extended/sysstat/{sysstat_12.1.3.bb => sysstat_12.1.6.bb} (53%)
>
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
> index 592cbf4574..c3cc2c3374 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -4,9 +4,8 @@ HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
>   LICENSE = "GPLv2+"
>   SECTION = "console/utils"
>   
> -SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
> +SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
>              file://99_sysstat \
> -           file://sysstat.service \
>             "
>   
>   UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
> @@ -29,7 +28,7 @@ SYSTEMD_SERVICE_${PN} = "sysstat.service"
>   SYSTEMD_AUTO_ENABLE = "enable"
>   
>   do_configure_prepend() {
> -    export sa_lib_dir=${libdir}/sa
> +    export sa_lib_dir=${libexecdir}/sa
>   }
>   
>   do_install() {
> diff --git a/meta/recipes-extended/sysstat/sysstat/sysstat.service b/meta/recipes-extended/sysstat/sysstat/sysstat.service
> deleted file mode 100644
> index aff07109f5..0000000000
> --- a/meta/recipes-extended/sysstat/sysstat/sysstat.service
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -[Unit]
> -Description=Resets System Activity Logs
> -
> -[Service]
> -Type=oneshot
> -RemainAfterExit=yes
> -User=root
> -ExecStart=@LIBDIR@/sa/sa1 --boot
> -
> -[Install]
> -WantedBy=multi-user.target
> -
> diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.3.bb b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
> similarity index 53%
> rename from meta/recipes-extended/sysstat/sysstat_12.1.3.bb
> rename to meta/recipes-extended/sysstat/sysstat_12.1.6.bb
> index 5daf3f45f5..8cf8c36d9b 100644
> --- a/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
> +++ b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
> @@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
>   
>   SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
>   
> -SRC_URI[md5sum] = "0f9b73f60aba6fd49de346bc384902c3"
> -SRC_URI[sha256sum] = "55498bf82755ba9fed3e7df61fd26f8f50dd3e7b3b229c731029a4c8ab51a1aa"
> +SRC_URI[md5sum] = "d8e3bbb9c873dd370f6d33664e326570"
> +SRC_URI[sha256sum] = "f752f3c406153a6fc446496f1102872505ace3f0931d975c1d664c81ec09f129"


-- 
Kai Kang


