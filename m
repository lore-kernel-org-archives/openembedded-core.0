Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4590074E49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 03:01:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P31gSQ008246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 20:01:42 -0700 (PDT)
Received: from [128.224.27.58] (128.224.27.58) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 24 May 2018 20:01:41 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<c862af8e549c89f50ee1fe5574582acde7cb9f65.1527216285.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <1f263e01-8167-8db7-1ece-85746c413aa2@windriver.com>
Date: Fri, 25 May 2018 11:01:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <c862af8e549c89f50ee1fe5574582acde7cb9f65.1527216285.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 13/24] dbus-test: sync x11 configure options with dbus
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
X-List-Received-Date: Fri, 25 May 2018 03:01:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Qi said that this one can be covered by the fix:

commit 2d3e09949732ed48c8c9a328d9ab6ebbf6889b13
Author: Juro Bystricky <juro.bystricky@intel.com>
Date:   Tue Feb 27 12:19:26 2018 -0800

     dbus-test_1.12.2: various fixes



So I dropped it from the PULL.

// Robert

On 05/25/2018 10:48 AM, Robert Yang wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Sync x11 related configure options with dbus and replace EXTRA_OECONF_X
> with PACKAGECONFIG for dbus-test.
> 
> Remove configure for native as well that no such native package.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-core/dbus/dbus-test_1.12.8.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.8.bb b/meta/recipes-core/dbus/dbus-test_1.12.8.bb
> index f33fbaf..020a340 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.8.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.12.8.bb
> @@ -25,8 +25,8 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
>   
>   inherit autotools pkgconfig gettext ptest upstream-version-is-even
>   
> -EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
> -EXTRA_OECONF_X_class-native = "--without-x"
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
>   
>   EXTRA_OECONF = "--enable-tests \
>                   --enable-modular-tests \
> @@ -39,7 +39,7 @@ EXTRA_OECONF = "--enable-tests \
>                   --disable-doxygen-docs \
>                   --disable-libaudit \
>                   --with-dbus-test-dir=${PTEST_PATH} \
> -                ${EXTRA_OECONF_X}"
> +                "
>   
>   EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
>   
> 

