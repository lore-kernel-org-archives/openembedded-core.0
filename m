Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4624B606D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 07:47:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6E7lkIJ008895
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 00:47:46 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jul 2016 00:47:45 -0700
To: Alexandru Moise <alexandru.moise@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1459962072-11756-1-git-send-email-alexandru.moise@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5787439F.5050701@windriver.com>
Date: Thu, 14 Jul 2016 15:47:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459962072-11756-1-git-send-email-alexandru.moise@windriver.com>
Subject: Re: [PATCH] STIG: The system default umask in /etc/login.defs must be 077
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
X-List-Received-Date: Thu, 14 Jul 2016 07:47:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年04月07日 01:01, Alexandru Moise wrote:
> The umask value influences the permissions assigned to files when they
> are created. A misconfigured umask value could result in files with
> excessive permissions that can be read and/or written to by unauthorized
> users.
>
> Also modify /etc/profile in base-files because the /etc/profile file
> overloads the behavior of /etc/login.defs, so if we desire the
> functionality provided by setting umask to 077 we should set it in
> login.defs to adhere to STIG but also set it in /etc/profile to have the
> intended functionality.
>
> Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
> ---

Ping.


>   meta/recipes-core/base-files/base-files/profile    |  2 +-
>   ...stem-default-umask-in-etc-login.defs-to-0.patch | 29 ++++++++++++++++++++++
>   meta/recipes-extended/shadow/shadow.inc            |  1 +
>   3 files changed, 31 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/shadow/files/0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch
>
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
> index 53c2680..f48a3c0 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -32,5 +32,5 @@ fi
>   
>   export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>   
> -umask 022
> +umask 077
>   
> diff --git a/meta/recipes-extended/shadow/files/0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch b/meta/recipes-extended/shadow/files/0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch
> new file mode 100644
> index 0000000..c0d6ee7
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch
> @@ -0,0 +1,29 @@
> +From dd2295715fabd823f01656cef0393cedc5a4bc34 Mon Sep 17 00:00:00 2001
> +From: Alexandru Moise <alexandru.moise@windriver.com>
> +Date: Wed, 6 Apr 2016 05:45:58 +0000
> +Subject: [PATCH] STIG: set system default umask in /etc/login.defs to 077
> +
> +Conform to STIG standard:
> +https://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2015-05-26/finding/V-38645
> +
> +Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
> +---
> + etc/login.defs | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/etc/login.defs b/etc/login.defs
> +index 8dd7c44..e2a8a65 100644
> +--- a/etc/login.defs
> ++++ b/etc/login.defs
> +@@ -190,7 +190,7 @@ KILLCHAR	025
> + # 022 is the default value, but 027, or even 077, could be considered
> + # for increased privacy. There is no One True Answer here: each sysadmin
> + # must make up his/her mind.
> +-UMASK		022
> ++UMASK		077
> +
> + #
> + # Password aging controls:
> +--
> +2.5.0
> +
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index 4313ffe..9337493 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -16,6 +16,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
>              file://fix-installation-failure-with-subids-disabled.patch \
>              file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
>              file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
> +	   file://0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch \
>              ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
>              "
>   


-- 
Regards,
Neil | Kai Kang


