Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE786079F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 08:52:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3J8qF36023925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 01:52:15 -0700 (PDT)
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 19 Apr 2018 01:52:14 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <1524037571-3202-1-git-send-email-hongxu.jia@windriver.com>
	<1524061974-26633-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <5e97002a-ead8-3afd-f7c9-1a651c03aad0@windriver.com>
Date: Thu, 19 Apr 2018 16:52:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1524061974-26633-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH V2] openssh: disable ciphers not supported by OpenSSL DES
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
X-List-Received-Date: Thu, 19 Apr 2018 08:52:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Upstream accept the fix
...
commit cec338967a666b7c8ad8b88175f2faeddf268116
Author: Darren Tucker <dtucker@dtucker.net>
Date:   Thu Apr 19 09:53:14 2018 +1000

     Omit 3des-cbc if OpenSSL built without DES.

     Patch from hongxu.jia at windriver.com, ok djm@
...

//Hongxu

On 2018年04月18日 22:32, Hongxu Jia wrote:
> While compiling openssl with option `no-des', it caused the openssh
> build failure
> ...
> cipher.c:85:41: error: 'EVP_des_ede3_cbc' undeclared here (not in a function);
> ...
>
> OpenSSL configured that way defines OPENSSL_NO_DES to disable des
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...able-ciphers-not-supported-by-OpenSSL-DES.patch | 39 ++++++++++++++++++++++
>   meta/recipes-connectivity/openssh/openssh_7.6p1.bb |  1 +
>   2 files changed, 40 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch b/meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch
> new file mode 100644
> index 0000000..8a2d1a0
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch
> @@ -0,0 +1,39 @@
> +From 265eaab8b39d8d8721224a48eefed5bf1696d353 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 18 Apr 2018 21:58:32 +0800
> +Subject: [PATCH] disable ciphers not supported by OpenSSL DES
> +
> +While compiling openssl with option `no-des', it caused the openssh
> +build failure
> +...
> +cipher.c:85:41: error: 'EVP_des_ede3_cbc' undeclared here (not in a function);
> +...
> +
> +OpenSSL configured that way defines OPENSSL_NO_DES to disable des
> +
> +Suggested by dtucker@
> +
> +Upstream-Status: Submitted [openssh-unix-dev@mindrot.org]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + cipher.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/cipher.c b/cipher.c
> +index c3cd5dc..86558e1 100644
> +--- a/cipher.c
> ++++ b/cipher.c
> +@@ -82,7 +82,9 @@ struct sshcipher {
> +
> + static const struct sshcipher ciphers[] = {
> + #ifdef WITH_OPENSSL
> ++#ifndef OPENSSL_NO_DES
> + 	{ "3des-cbc",		8, 24, 0, 0, CFLAG_CBC, EVP_des_ede3_cbc },
> ++#endif
> + 	{ "aes128-cbc",		16, 16, 0, 0, CFLAG_CBC, EVP_aes_128_cbc },
> + 	{ "aes192-cbc",		16, 24, 0, 0, CFLAG_CBC, EVP_aes_192_cbc },
> + 	{ "aes256-cbc",		16, 32, 0, 0, CFLAG_CBC, EVP_aes_256_cbc },
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
> index a2288df..e11e8d7 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
> @@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>              file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
>              file://sshd_check_keys \
>              file://add-test-support-for-busybox.patch \
> +           file://disable-ciphers-not-supported-by-OpenSSL-DES.patch \
>              "
>   
>   PAM_SRC_URI = "file://sshd"



