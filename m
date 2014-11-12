Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA7A62252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 07:36:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAC7acl7004373
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Nov 2014 23:36:38 -0800 (PST)
Received: from [128.224.163.132] (128.224.163.132) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 11 Nov 2014 23:36:37 -0800
Message-ID: <54630E02.3070500@windriver.com>
Date: Wed, 12 Nov 2014 15:36:34 +0800
From: zhangxiao <xiao.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Peter A. Bigot" <pab@pabigot.com>
References: <1414861479-5493-1-git-send-email-pab@pabigot.com>
	<1414861479-5493-3-git-send-email-pab@pabigot.com>
In-Reply-To: <1414861479-5493-3-git-send-email-pab@pabigot.com>
X-Originating-IP: [128.224.163.132]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] pseudo: provide fallback passwd and group files
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
X-List-Received-Date: Wed, 12 Nov 2014 07:36:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年11月02日 01:04, Peter A. Bigot wrote:
> Normally pseudo is built with --without-passwd-fallback, which requires
> that somebody provide target passwd and group files.  Those come from
> base-passwd in OE, but base-passwd cannot be built without first
> invoking operations under pseudo that require getpw*/getgr*.
>
> Provide the absolute minimum stub files, matching in content what will
> eventually be on the target, that can be used in the cases where the
> target files are not yet available.  The requirements for minimum stub
> are the usernames and groups identified in meta/files/fs-perms.txt.
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>   meta/recipes-devtools/pseudo/files/fallback-group  | 2 ++
>   meta/recipes-devtools/pseudo/files/fallback-passwd | 1 +
>   meta/recipes-devtools/pseudo/pseudo_1.6.2.bb       | 8 ++++++++
>   3 files changed, 11 insertions(+)
>   create mode 100644 meta/recipes-devtools/pseudo/files/fallback-group
>   create mode 100644 meta/recipes-devtools/pseudo/files/fallback-passwd
>
> diff --git a/meta/recipes-devtools/pseudo/files/fallback-group b/meta/recipes-devtools/pseudo/files/fallback-group
> new file mode 100644
> index 0000000..81bf732
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/fallback-group
> @@ -0,0 +1,2 @@
> +root:*:0:

How about adding those two lines below?

daemon:*:1:
bin:*:2:

Thanks
Xiao

> +mail:*:8:
> diff --git a/meta/recipes-devtools/pseudo/files/fallback-passwd b/meta/recipes-devtools/pseudo/files/fallback-passwd
> new file mode 100644
> index 0000000..c1458dc
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/fallback-passwd
> @@ -0,0 +1 @@
> +root::0:0:root:/home/root:/bin/sh
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
> index fb85f89..95fd2b8 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
> @@ -5,9 +5,17 @@ SRC_URI = " \
>       file://0001-pseudo_client.c-protect-pwd_lck-against-magic.patch \
>       file://0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch \
>       file://0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch \
> +    file://fallback-passwd \
> +    file://fallback-group \
>   "
>
>   SRC_URI[md5sum] = "4d7b4f9d1b4aafa680ce94a5a9a52f1f"
>   SRC_URI[sha256sum] = "c72be92689511ced7c419149c6aaa1b1a9e4dfc6409d1f16ab72cc35bc1e376a"
>
>   PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
> +
> +do_install_append_class-native () {
> +	install -d ${D}${sysconfdir}
> +	install -m 644 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
> +	install -m 644 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
> +}
>

