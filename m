Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 17256750FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 19:00:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8JJ02Vg025545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 19 Sep 2018 20:00:05 +0100
Message-ID: <3c22531824835d8958ab9fd39f764051cb5edcff.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 12:00:02 -0700
In-Reply-To: <20180919185542.2329-2-raj.khem@gmail.com>
References: <20180919185542.2329-1-raj.khem@gmail.com>
	<20180919185542.2329-2-raj.khem@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH V2 2/2] musl: Add aliases for glibc provided libraries
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
X-List-Received-Date: Wed, 19 Sep 2018 19:00:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-19 at 11:55 -0700, Khem Raj wrote:
> This is a step towards running pebuilt applications for glibc  on
> musl
> There are many realworld applications which are not always built from
> source, especially provided by third party
> 
> Package the glibc symlinks into new package musl-glibc-compat
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> V2 - Package new symlinks into separate compat package
> 
>  meta/recipes-core/musl/musl_git.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
> core/musl/musl_git.bb
> index be31718e3a..efdf620c6c 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -26,6 +26,14 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
>             bsd-headers \
>             libssp-nonshared \
>            "
> +GLIBC_LDSO ?= "ld.so.1"
> +GLIBC_LDSO_arm = "${@ bb.utils.contains('TUNE_FEATURES',
> 'callconvention-hard', 'ld-linux-armhf.so.3', 'ld-linux.so.3', d)}"
> +GLIBC_LDSO_aarch64 = "ld-linux-aarch64.so.1"
> +GLIBC_LDSO_x86 = "ld-linux.so.2"
> +GLIBC_LDSO_x86_64 = "ld-linux-x86-64.so.2"
> +GLIBC_LDSO_x32 = "ld-linux-x32.so.2"
> +GLIBC_LDSO_powerpc64 = "ld64.so.1"
> +GLIBC_LDSO_mips64 = "ld64.so.1"

How about we tweak linuxloader.bbclass to have a glibc specific
function could call to get this? I'm not a fan of adding another set of
these lists...

Cheers,

Richard



