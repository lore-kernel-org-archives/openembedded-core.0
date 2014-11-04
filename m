Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D49F65D3C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 14:52:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA4EqGau002359
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Nov 2014 06:52:16 -0800 (PST)
Received: from msp-dhcp41.wrs.com (172.25.34.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Nov 2014 06:52:16 -0800
Message-ID: <5458E821.40502@windriver.com>
Date: Tue, 4 Nov 2014 08:52:17 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1415108447-16821-1-git-send-email-koen.kooi@linaro.org>
	<1415108447-16821-2-git-send-email-koen.kooi@linaro.org>
In-Reply-To: <1415108447-16821-2-git-send-email-koen.kooi@linaro.org>
Subject: Re: [PATCH 2/3] lsb 4.1: fix /usr/lib/ hardcodes
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
X-List-Received-Date: Tue, 04 Nov 2014 14:52:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/14, 7:40 AM, Koen Kooi wrote:
> Also collapse do_install and do_install_append.

/usr/lib is hard coded for a reason.  The LSB specification says the files must 
be installed in /usr/lib/lsb.  (If this has changed, great, but it was true 
through at least early last year.)

--Mark

> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>   meta/recipes-extended/lsb/lsb_4.1.bb | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
> index 34a70d0..897520a 100644
> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -72,9 +72,7 @@ do_install(){
>   		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc64
>   		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc64
>   	fi
> -}
>
> -do_install_append(){
>          install -d ${D}${sysconfdir}/core-lsb
>          install -d ${D}/${baselib}/lsb
>          for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
> @@ -84,9 +82,9 @@ do_install_append(){
>          install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
>
>          # creat links for LSB test
> -       install -d ${D}/usr/lib/lsb
> -       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/install_initd
> -       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/remove_initd
> +       install -d ${D}${libdir}/lsb
> +       ln -sf ${sbindir}/chkconfig ${D}${libdir}/lsb/install_initd
> +       ln -sf ${sbindir}/chkconfig ${D}${libdir}/lsb/remove_initd
>          install -d ${D}/${libdir}
>          ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
>
> @@ -120,8 +118,9 @@ do_install_append(){
>                  ln -sf ld.so.1 ld-lsb-ppc32.so.3
>          fi
>   }
> +
>   FILES_${PN} += "/lib64 \
> -		/usr/lib/lsb \
> +		${libdir}/lsb \
>                   ${base_libdir}/lsb/* \
>   		${libdir}/sendmail \
>                  "
>


