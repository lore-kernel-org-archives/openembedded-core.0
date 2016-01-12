Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 829B76FF9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 08:49:44 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 77so345397667ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 00:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AW06YBi1VmPPWk+80cp3xPCn1B+yCvlJcM954glUPbo=;
	b=cbIAuPdvNWmfKURdQoOlc0AVhhP5JaBXp7cW6MZ4sd9BtTSlCDWfb3gx5ZUGLdCtOS
	lKSGRdvJRlKEsNg7XrIt+l3wSw5+UziwdNgQKdhNSRd7vRV3e7QRHA6C6H9bakwiDnys
	lzHhOZEVcAJfkiixzUb/2mqSsHAbr5ZnspX5Tos6M5ffyt+HQmBxMo6oKeWmVcz2eqWx
	9MdKSOyU5my8xkCMZgpfdVw8zDdt0hKbIaEbOCcIqAT9YYLjsAexOWLVbKLObAuiWlMN
	zMerQeDmKs75EYtA9DWjJgqYwS4N98UjZZZC8pwA7yrrK1zNdqoaclfU+eQkqV2YuOwO
	WBxg==
X-Received: by 10.107.165.14 with SMTP id o14mr29008452ioe.49.1452588585835;
	Tue, 12 Jan 2016 00:49:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Tue, 12 Jan 2016 00:49:16 -0800 (PST)
In-Reply-To: <1452574934-2053-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1452574934-2053-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jan 2016 00:49:16 -0800
Message-ID: <CAMKF1spJJxLbhWd5Hpv7EzYYve9Y0mASmsAHdZ0XpAU970CJgA@mail.gmail.com>
To: Li Xin <lixin.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] net-tools_1.60-26.bb: Error fix
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
X-List-Received-Date: Tue, 12 Jan 2016 08:49:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 11, 2016 at 9:02 PM, Li Xin <lixin.fnst@cn.fujitsu.com> wrote:
> when set PATCHTOOL = "patch" in conf/local.conf,error will occur
> in the step of do_patch.
> The error is: "quilt: command not found",so fix it.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> index 923d048..e173f54 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> @@ -30,6 +30,7 @@ SRC_URI[patch.sha256sum] = "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e4
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
>
>  inherit gettext
> +DEPENDS = "quilt-native"
>
>  # The Makefile is lame, no parallel build
>  PARALLEL_MAKE = ""
> @@ -40,7 +41,7 @@ PARALLEL_MAKE = ""
>  # up all previously applied patches in the start
>  nettools_do_patch() {
>         cd ${S}
> -       quilt pop -a || true
> +       ${STAGING_BINDIR_NATIVE}/quilt pop -a || true

Can you see if this change is sstate safe ?

>         if [ -d ${S}/.pc-nettools ]; then
>                 rm -rf ${S}/.pc
>                 mv ${S}/.pc-nettools ${S}/.pc
> --
> 1.8.4.2
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

