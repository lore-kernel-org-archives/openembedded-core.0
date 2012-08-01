Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Swamn-00012E-JL
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:24:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71FCsrL019366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 08:12:54 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 08:12:54 -0700
Message-ID: <50194776.4080601@windriver.com>
Date: Wed, 1 Aug 2012 10:12:54 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
	<1343830340-25351-2-git-send-email-morgan.little@windriver.com>
In-Reply-To: <1343830340-25351-2-git-send-email-morgan.little@windriver.com>
Subject: Re: [PATCH 01/19] tinylogin: use new update-alternatives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 15:24:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/12 9:12 AM, Morgan Little wrote:
>
> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> ---
>   meta/recipes-core/tinylogin/tinylogin_1.4.bb |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/tinylogin/tinylogin_1.4.bb b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
> index 195f0c7..b86141f 100644
> --- a/meta/recipes-core/tinylogin/tinylogin_1.4.bb
> +++ b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
> @@ -7,7 +7,7 @@
>   and groups on an embedded system."
>   HOMEPAGE = "http://tinylogin.busybox.net/"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM="file://LICENSE;md5=f1060fa3a366f098b5b1d8c2077ba269"
> -PR = "r8"
> +PR = "r9"
>
>   inherit update-alternatives
>
> @@ -42,7 +42,7 @@
>   do_install_append () {
>           mv ${D}${base_sbindir}/getty ${D}${base_sbindir}/getty.${BPN}
>   }
>
> -ALTERNATIVE_NAME = "getty"
> -ALTERNATIVE_LINK = "${base_sbindir}/getty"
> -ALTERNATIVE_PATH = "${base_sbindir}/getty.${BPN}"
> +ALTERNATIVE_${PN} = "getty"
> +ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
> +ALTERNATIVE_TARGET[getty] =  "${base_sbindir}/getty.${BPN}"
>   ALTERNATIVE_PRIORITY = "80"
>

The above will work.. but it would be better to (perhaps a second commit?):

remove the do_install_append, it is no longer necessary

Once you do that, then you may remove the "ALTERNARTIVE_TARGET[getty]" that you 
added, as it will automatically be configured as such by the update-alternatives 
class.

--Mark


