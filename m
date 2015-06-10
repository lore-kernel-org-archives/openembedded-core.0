Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id F384F60670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 15:43:15 +0000 (UTC)
Received: by igbzc4 with SMTP id zc4so38707701igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GJGTcwXpSCzXEiTDJ8/mG6mOkMu9DB0JJDdJlOy75Pc=;
	b=wBmQPqrewNgka6AyhL/YlYthgr9IKenx1BpGRYfCpFUuJvOFhVNwgGVWwJL3CliM8M
	NRGg7LcM1Z6iIH+XqaRCv3TnOLiLP7rYxhs4eAYPlSrtOF/x3xgih6ddtaSW5neYiZbI
	w72dwbeAx+YuZy6ZX2vZhJg6ImY3boxwbUhw9rWQcC6v1XkrJ8dvboMlwI1O3XTspOta
	Pjobl8xmw6D1ciBuR923vBoJfUglkNY+kEbH1qPdYOEa13nRehB2oQbuC52AcmZOPuqu
	sfDiSPpT+DudCCdQf4ZfCF/JXUOvc5XYU0lkoUCligq1KKbMQ4DRKSkSskuMZ4yq1Qdp
	Xu2A==
X-Received: by 10.107.157.205 with SMTP id g196mr5209960ioe.57.1433950996936; 
	Wed, 10 Jun 2015 08:43:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Wed, 10 Jun 2015 08:42:46 -0700 (PDT)
In-Reply-To: <1433946366-54477-1-git-send-email-martin.stolpe@gmail.com>
References: <1433946366-54477-1-git-send-email-martin.stolpe@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jun 2015 11:42:46 -0400
Message-ID: <CAMKF1srsEC8EmOzDPAowKozKPADozZn+QqtNsBtMTt-sexDyjg@mail.gmail.com>
To: Martin Stolpe <martinstolpe@gmail.com>
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 10 Jun 2015 15:43:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 10, 2015 at 10:26 AM, Martin Stolpe <martinstolpe@gmail.com> wrote:
> Problem is that when building binutils using GCC >=5.0
> warnings will be treated as errors which will cause
> the build to fail.
>
> Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils_2.24.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils_2.24.bb b/meta/recipes-devtools/binutils/binutils_2.24.bb
> index 738aaee..bc34a14 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.24.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.24.bb
> @@ -7,12 +7,15 @@ EXTRA_OECONF += "--with-sysroot=/ \
>                  --enable-install-libbfd \
>                  --enable-install-libiberty \
>                  --enable-shared \
> +                --disable-werror \
>                  "
>
>  EXTRA_OECONF_class-native = "--enable-targets=all \
>                               --enable-64-bit-bfd \
>                               --enable-install-libiberty \
> -                             --enable-install-libbfd"
> +                             --enable-install-libbfd \
> +                             --disable-werror \
> +                             "

lowering the guards is not the right approach. I understand you want
to compile fido with distros that are released after fido.
but better would be to backport relevant fixed into component itself.

>
>  do_install_class-native () {
>         autotools_do_install
> --
> 2.4.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

