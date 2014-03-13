Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48AB76F7AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 06:21:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2D6LSR6003315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 23:21:28 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 12 Mar 2014 23:21:27 -0700
Message-ID: <53214E66.70401@windriver.com>
Date: Thu, 13 Mar 2014 14:21:26 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1394606302.git.liezhi.yang@windriver.com>
	<015d5a2ffbf03ecfe5804b2c3418cdfb14d45579.1394606302.git.liezhi.yang@windriver.com>
In-Reply-To: <015d5a2ffbf03ecfe5804b2c3418cdfb14d45579.1394606302.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] docbook-sgml-dtd-native: remove catalog file when do_clean
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
X-List-Received-Date: Thu, 13 Mar 2014 06:21:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/12/2014 02:38 PM, Robert Yang wrote:
> The docbook_sgml_dtd_sstate_postinst adds catalog file to
> /etc/sgml/sgml-docbook.cat, but the do_clean would not remove the file,
> which would cause unexpected errors since we have multiple versions
> of docbook-sgml-dtd:
>
> docbook-sgml-dtd-3.1-native_3.1.bb
> docbook-sgml-dtd-4.1-native_4.1.bb
> docbook-sgml-dtd-4.5-native.bb
>
> If we run:
>
> $ bitbake docbook-sgml-dtd-4.1-native
> $ bitbake docbook-sgml-dtd-4.1-native -ccleansstate && bitbake docbook-sgml-dtd-3.1-native
> $ bitbake docbook-utils-native
>
> We would get this error:
>
> jade: cannot open "/path/to/etc/sgml/sgml-docbook-dtd-4.1.cat" (No such file or directory)
> make[2]: *** [sgmldiff.html] Error 1
>
> Remove the catalog entry when do_clean will fix the problem.
>
> [YOCTO #5949]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc             |   10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
> index 1b357b5..bf2affb 100644
> --- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
> +++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
> @@ -58,3 +58,13 @@ docbook_sgml_dtd_sysroot_preprocess () {
>       install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-sgml-dtd-${DTD_VERSION}
>   }
>
> +CLEANFUNCS += "docbook_sgml_dtd_sstate_clean"
> +
> +docbook_sgml_dtd_sstate_clean () {
> +	# Ensure that the catalog file sgml-docbook.cat is properly
> +	# updated when the package is removed from sstate cache.
> +	if [ -s ${sysconfdir}/sgml/sgml-docbook.bak ]; then
> +		sed -i '/'"\/sgml\/sgml-docbook-dtd-${DTD_VERSION}.cat"'/d' \
> +			${sysconfdir}/sgml/sgml-docbook.bak

I updated the patch a little, we need also remove the catalog file from
sgml-docbook.cat, please see the PULL:

git://git.pokylinux.org/poky-contrib rbt/sgml


And here is the patch:

diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc 
b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
index 1b357b5..b2381bd 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
@@ -58,3 +58,15 @@ docbook_sgml_dtd_sysroot_preprocess () {
      install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog 
${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-sgml-dtd-${DTD_VERSION}
  }

+CLEANFUNCS += "docbook_sgml_dtd_sstate_clean"
+
+docbook_sgml_dtd_sstate_clean () {
+       # Ensure that the catalog file sgml-docbook.cat is properly
+       # updated when the package is removed from sstate cache.
+       if [ -f ${sysconfdir}/sgml/sgml-docbook.bak ]; then
+               sed -i '/'"\/sgml\/sgml-docbook-dtd-${DTD_VERSION}.cat"'/d' \
+                       ${sysconfdir}/sgml/sgml-docbook.bak
+               sed -i '/'"\/sgml\/sgml-docbook-dtd-${DTD_VERSION}.cat"'/d' \
+                       ${sysconfdir}/sgml/sgml-docbook.cat
+       fi
+}

// Robert


> +	fi
> +}
>

