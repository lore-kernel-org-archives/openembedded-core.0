Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD997CCBE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 01:52:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1S1qGCj011445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Feb 2019 17:52:16 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Wed, 27 Feb 2019 17:52:15 -0800
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <1551149425-254169-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5C774072.6070202@windriver.com>
Date: Thu, 28 Feb 2019 09:59:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1551149425-254169-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.194]
Subject: Re: [PATCH] libdazzle: add check for GTK3DISTROFEATURES
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
X-List-Received-Date: Thu, 28 Feb 2019 01:52:16 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping.

Thanks,

On 2019年02月26日 10:50, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> When do world buid, there comes below error:
> | ERROR: Nothing PROVIDES 'gtk+3' (but /build/layers/oe-core/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb DEPENDS on or otherwise requires it)
> | gtk+3 was skipped: one of 'x11 wayland' needs to be in DISTRO_FEATURES
>
> Add the check for GTK3DISTROFEATURES to make
> the world build work even without GTK3DISTROFEATURES.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
> index 5441c10..3779b15 100644
> --- a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
> +++ b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
> @@ -3,7 +3,7 @@ LICENSE = "GPLv3+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
>
>   GNOMEBASEBUILDCLASS = "meson"
> -inherit gnomebase upstream-version-is-even vala gobject-introspection
> +inherit gnomebase upstream-version-is-even vala distro_features_check gobject-introspection
>
>   DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
>
> @@ -14,5 +14,7 @@ SRC_URI[archive.sha256sum] = "78770eae9fa15ac5acb9c733d29459330b2540affbf7293311
>   GI_ENABLE_FLAG = "-Dwith_introspection=true"
>   GI_DISABLE_FLAG = "-Dwith_introspection=false"
>
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +
>   EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
>                                                                                          '${GI_DISABLE_FLAG}', d)} "
>

