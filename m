Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 531AE600FB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:31:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01F0VivW012118
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 14 Feb 2020 16:31:45 -0800 (PST)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 14 Feb 2020 16:31:44 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1578306533.git.liezhi.yang@windriver.com>
	<281727c8444cda2b543f94e43f947e1cdc018be0.1578306533.git.liezhi.yang@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fe971459-182b-d4de-8f0a-a7a8518d85d0@windriver.com>
Date: Fri, 14 Feb 2020 19:31:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <281727c8444cda2b543f94e43f947e1cdc018be0.1578306533.git.liezhi.yang@windriver.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [PATCH v2 1/1] gnupg: Read GNUPG_BINDIR from environment variables for nativesdk
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
X-List-Received-Date: Sat, 15 Feb 2020 00:31:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 1/6/20 5:30 AM, Robert Yang wrote:
> There is already a relocate.patch for native which is used for reading
> GNUPG_BINDIR from environment variables, now also enable it for nativesdk.
> Otherwise, command like the following one doesn't work for nativesdk:
> 
> $ gpg-connect-agent --homedir ../keys/ reloadagent /bye
> gpg-connect-agent: no running gpg-agent - starting '/opt/path/to/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/gpg-agent'
> gpg-connect-agent: failed to start agent '/opt/path/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/gpg-agent': No such file or directory
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>


This seems to have been missed.
Are there any comments?

Robert,
Please rebase and resend

../Randy

> ---
>   meta/recipes-support/gnupg/gnupg_2.2.17.bb | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-support/gnupg/gnupg_2.2.17.bb b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
> index bb8885f..0a939cf 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.2.17.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
> @@ -19,6 +19,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>   SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
>                                   file://relocate.patch"
>   
> +SRC_URI_append_class-nativesdk = " file://relocate.patch"
> +
>   SRC_URI[md5sum] = "1ba2d9b70c377f8e967742064c27a19c"
>   SRC_URI[sha256sum] = "afa262868e39b651a2db4c071fba90415154243e83a830ca00516f9a807fd514"
>   
> @@ -60,10 +62,17 @@ do_install_append() {
>   }
>   
>   do_install_append_class-native() {
> -	create_wrapper ${D}${bindir}/gpg2 GNUPG_BINDIR=${STAGING_BINDIR_NATIVE}
> -	create_wrapper ${D}${bindir}/gpgconf GNUPG_BINDIR=${STAGING_BINDIR_NATIVE}
> -	create_wrapper ${D}${bindir}/gpg-agent GNUPG_BINDIR=${STAGING_BINDIR_NATIVE}
> -	create_wrapper ${D}${bindir}/gpg-connect-agent GNUPG_BINDIR=${STAGING_BINDIR_NATIVE}
> +	create_wrappers ${STAGING_BINDIR_NATIVE}
> +}
> +
> +do_install_append_class-nativesdk() {
> +	create_wrappers ${SDKPATHNATIVE}${bindir_nativesdk}
> +}
> +
> +create_wrappers() {
> +	for i in gpg2 gpgconf gpg-agent gpg-connect-agent; do
> +		create_wrapper ${D}${bindir}/$i GNUPG_BINDIR=$1
> +	done
>   }
>   
>   PACKAGECONFIG ??= "gnutls"
> 


-- 
# Randy MacLeod
# Wind River Linux

