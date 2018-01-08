Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 62EA378971
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 08:44:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w088i5NQ008413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 8 Jan 2018 08:44:06 GMT
Message-ID: <1515401045.29722.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Jan 2018 08:44:05 +0000
In-Reply-To: <1515344359-82351-2-git-send-email-juro.bystricky@intel.com>
References: <1515344359-82351-1-git-send-email-juro.bystricky@intel.com>
	<1515344359-82351-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH 2/2] icu-dev: improve reproducibility
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
X-List-Received-Date: Mon, 08 Jan 2018 08:44:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2018-01-07 at 08:59 -0800, Juro Bystricky wrote:
> Remove all build host references from several distributed files:
> Makefile.inc, icu-config, pkgdata.inc
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-support/icu/icu.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-
> support/icu/icu.inc
> index 5cf7b11..c41ea8a 100644
> --- a/meta/recipes-support/icu/icu.inc
> +++ b/meta/recipes-support/icu/icu.inc
> @@ -64,6 +64,14 @@ do_install_append_class-target() {
>          rm -f
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
>          icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
>      fi
> +	
> +	# Remove build host references...
> +	sed -i  \
> +	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> +	    -e 's|${DEBUG_PREFIX_MAP}||g' \
> +	    -e 's:${HOSTTOOLS_DIR}/::g' \
> +	    ${D}/usr/bin/icu-config
> ${D}/usr/lib/icu/${PV}/Makefile.inc \
> +	    ${D}/usr/lib/icu/${PV}/pkgdata.inc
>  }
>  
>  PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"

Hardcoded /usr/lib?

https://autobuilder.yocto.io/builders/nightly-multilib/builds/703/steps/BuildImages_2/logs/stdio

Cheers,

Richard


