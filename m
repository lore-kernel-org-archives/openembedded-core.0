Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 813E277BF3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2U929gN026549; 
	Thu, 30 Mar 2017 10:02:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ajl00HCA_ONw; Thu, 30 Mar 2017 10:02:09 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2U924BS026537
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 10:02:05 +0100
Message-ID: <1490864524.13980.343.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 10:02:04 +0100
In-Reply-To: <1490798647-28191-1-git-send-email-jussi.kukkonen@intel.com>
References: <1490798647-28191-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] quilt: Fix paths for patch and perl
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
X-List-Received-Date: Thu, 30 Mar 2017 09:02:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-29 at 17:44 +0300, Jussi Kukkonen wrote:
> --with-perl value is used as part of shebang lines: the previous
> do_install_append hack did not work as it was often used as
>     #! /usr/bin/env perl -w
> Env does not support arguments, set --with-perl instead. Native
> recipe already overrides this so should not break.
> 
> --with-patch is used within the gnu patch wrapper only: before this
> commit the wrapper contained a path to (build host) native patch.
> 
> Also tweak one test so busybox mv output is accepted.
> 
> All ptests should now pass: Fixes [YOCTO #11221].
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-devtools/quilt/quilt.inc              |  3 ++-
>  ...0001-tests-Allow-different-output-from-mv.patch | 29
> ++++++++++++++++++++++
>  meta/recipes-devtools/quilt/quilt_0.65.bb          | 10 --------
>  3 files changed, 31 insertions(+), 11 deletions(-)
>  create mode 100644 meta/recipes-devtools/quilt/quilt/0001-tests-
> Allow-different-output-from-mv.patch
> 
> diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-
> devtools/quilt/quilt.inc
> index 57e2a14..e6a63ce 100644
> --- a/meta/recipes-devtools/quilt/quilt.inc
> +++ b/meta/recipes-devtools/quilt/quilt.inc
> @@ -8,6 +8,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-
> ${PV}.tar.gz \
>          file://run-ptest \
>          file://Makefile \
>          file://test.sh \
> +        file://0001-tests-Allow-different-output-from-mv.patch \
>  "
>  
>  SRC_URI[md5sum] = "c67ba0228f5b7b8bbe469474661f92d6"
> @@ -33,7 +34,7 @@ RDEPENDS_${PN} = "bash"
>  EXTRA_OE_MAKE_ARGS_darwin ?= ""
>  EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
>  
> -EXTRA_OECONF = "--with-perl=perl"
> +EXTRA_OECONF = "--with-perl=${bindir}/perl --with-patch=patch"

Unfortunately I think this would break nativesdk-quilt since we'd no
longer be using env and hence would require the buildtools tarball and
sdks contained perl?

Cheers,

Richard



