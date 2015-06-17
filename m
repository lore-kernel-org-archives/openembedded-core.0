Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 620CF7589E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 11:52:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 54A466002DD
Message-ID: <55815F85.4020300@collabora.co.uk>
Date: Wed, 17 Jun 2015 12:52:37 +0100
From: Joshua Lock <joshua.lock@collabora.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1433946366-54477-1-git-send-email-martin.stolpe@gmail.com>
In-Reply-To: <1433946366-54477-1-git-send-email-martin.stolpe@gmail.com>
Subject: Re: [PATCH] [fido] binutils: fix native builds when host has gcc5
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
X-List-Received-Date: Wed, 17 Jun 2015 11:52:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

Instead of taking this I've queued a patch in my fido/next branch from 
George McCollister's patch[2] which backports a fix from upstream instead.

With this I'm able to build binutils-native on a Fedora 22 laptop.

Cheers,

Joshua

1. 
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next
2. 
http://lists.openembedded.org/pipermail/openembedded-core/2015-June/106168.html

On 10/06/15 15:26, Martin Stolpe wrote:
> Problem is that when building binutils using GCC >=5.0
> warnings will be treated as errors which will cause
> the build to fail.
>
> Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>
> ---
>   meta/recipes-devtools/binutils/binutils_2.24.bb | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils_2.24.bb b/meta/recipes-devtools/binutils/binutils_2.24.bb
> index 738aaee..bc34a14 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.24.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.24.bb
> @@ -7,12 +7,15 @@ EXTRA_OECONF += "--with-sysroot=/ \
>                   --enable-install-libbfd \
>                   --enable-install-libiberty \
>                   --enable-shared \
> +                --disable-werror \
>                   "
>
>   EXTRA_OECONF_class-native = "--enable-targets=all \
>                                --enable-64-bit-bfd \
>                                --enable-install-libiberty \
> -                             --enable-install-libbfd"
> +                             --enable-install-libbfd \
> +                             --disable-werror \
> +                             "
>
>   do_install_class-native () {
>   	autotools_do_install
>


