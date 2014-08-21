Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D16AD65D56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 09:28:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7L9Srad022323
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 02:28:53 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 21 Aug 2014 02:28:52 -0700
Message-ID: <53F5BBD1.1050203@windriver.com>
Date: Thu, 21 Aug 2014 17:28:49 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1408604060.git.Qi.Chen@windriver.com>
	<7f14cd53dd0190a96a4f4c3a7f1355f973405aa3.1408604060.git.Qi.Chen@windriver.com>
In-Reply-To: <7f14cd53dd0190a96a4f4c3a7f1355f973405aa3.1408604060.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] sudo: remove volatile configuration file
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
X-List-Received-Date: Thu, 21 Aug 2014 09:28:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

We should remove volatiles.99_sudo file also.

//Hongxu

On 08/21/2014 02:55 PM, Chen Qi wrote:
> The new version of sudo has fixed the problem and will create the
> directory if it doesn't exist. So the configuration file is no longer
> needed.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-extended/sudo/sudo_1.8.10p3.bb |    7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-extended/sudo/sudo_1.8.10p3.bb b/meta/recipes-extended/sudo/sudo_1.8.10p3.bb
> index 46d4781..4c53032 100644
> --- a/meta/recipes-extended/sudo/sudo_1.8.10p3.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.8.10p3.bb
> @@ -2,7 +2,7 @@ require sudo.inc
>   
>   SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
> -           file://volatiles.99_sudo"
> +          "
>   
>   PAM_SRC_URI = "file://sudo.pam"
>   
> @@ -22,9 +22,6 @@ do_install_append () {
>   	chmod 4111 ${D}${bindir}/sudo
>   	chmod 0440 ${D}${sysconfdir}/sudoers
>   
> -	# Explicitly remove the ${localstatedir}/run directory as we can
> -	# manage it by a configuration file under ${sysconfdir}/default/volatiles/
> +	# Explicitly remove the ${localstatedir}/run directory to avoid QA error
>   	rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
> -	install -d ${D}/${sysconfdir}/default/volatiles
> -	install -m 644 ${WORKDIR}/volatiles.99_sudo ${D}/${sysconfdir}/default/volatiles/99_sudo
>   }


