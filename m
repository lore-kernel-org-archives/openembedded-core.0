Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D97B73D27
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 02:19:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t892JoOc019546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 19:19:50 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 8 Sep 2015 19:19:50 -0700
Message-ID: <55EF9744.8000600@windriver.com>
Date: Wed, 9 Sep 2015 10:19:48 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1438655591-5115-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1438655591-5115-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH v2] bjam-native: build and install bjam.debug
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
X-List-Received-Date: Wed, 09 Sep 2015 02:19:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...

Thanks
Wenzong

On 08/04/2015 10:33 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> bjam is stripped by default, this causes QA warning while stripping it
> from do_populate_sysroot():
>
>    WARNING: File '.../tmp/sysroots/x86_64-linux/usr/bin/bjam' \
>      from bjam-native was already stripped, \
>      this will prevent future debugging!
>
> The JAM scripts allow to build unstripped version with '--debug'. Just
> build and install the bjam.debug to stop bjam from being stripped in
> compile step.
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta/recipes-support/boost/bjam-native_1.58.0.bb   |  5 ++-
>   .../boost/files/bjam-native-build-bjam.debug.patch | 50 ++++++++++++++++++++++
>   2 files changed, 54 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch
>
> diff --git a/meta/recipes-support/boost/bjam-native_1.58.0.bb b/meta/recipes-support/boost/bjam-native_1.58.0.bb
> index d85d1a9..32646d7 100644
> --- a/meta/recipes-support/boost/bjam-native_1.58.0.bb
> +++ b/meta/recipes-support/boost/bjam-native_1.58.0.bb
> @@ -5,11 +5,14 @@ SECTION = "devel"
>
>   inherit native
>
> +SRC_URI += "file://bjam-native-build-bjam.debug.patch"
> +
>   do_compile() {
>       ./bootstrap.sh --with-toolset=gcc
>   }
>
>   do_install() {
>       install -d ${D}${bindir}/
> -    install -c -m 755 bjam ${D}${bindir}/
> +    # install unstripped version for bjam
> +    install -c -m 755 bjam.debug ${D}${bindir}/bjam
>   }
> diff --git a/meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch b/meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch
> new file mode 100644
> index 0000000..9f8b7ea
> --- /dev/null
> +++ b/meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch
> @@ -0,0 +1,50 @@
> +From 619ada314ab26c0c9cbfe5702cd9c0caa8f6415a Mon Sep 17 00:00:00 2001
> +From: Wenzong Fan <wenzong.fan@windriver.com>
> +Date: Mon, 3 Aug 2015 17:12:33 +0800
> +Subject: [PATCH] bjam-native: build bjam.debug
> +
> +bjam is stripped by default, this causes QA warning while stripping it
> +from do_populate_sysroot():
> +
> +  WARNING: File '.../tmp/sysroots/x86_64-linux/usr/bin/bjam' \
> +    from bjam-native was already stripped, \
> +    this will prevent future debugging!
> +
> +The JAM scripts allow to build unstripped version with '--debug'. Just
> +build and install the bjam.debug to stop bjam from being stripped in
> +compile step.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +---
> + bootstrap.sh                    | 1 +
> + tools/build/src/engine/build.sh | 2 +-
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/bootstrap.sh b/bootstrap.sh
> +index 98cf88b..54690aa 100755
> +--- a/bootstrap.sh
> ++++ b/bootstrap.sh
> +@@ -228,6 +228,7 @@ if test "x$BJAM" = x; then
> +   echo "tools/build/src/engine/$arch/b2"
> +   cp "$BJAM" .
> +   cp "$my_dir/tools/build/src/engine/$arch/bjam" .
> ++  cp "$my_dir/tools/build/src/engine/${arch}.debug/bjam" bjam.debug
> +
> + fi
> +
> +diff --git a/tools/build/src/engine/build.sh b/tools/build/src/engine/build.sh
> +index 6dbc706..c69fdc7 100755
> +--- a/tools/build/src/engine/build.sh
> ++++ b/tools/build/src/engine/build.sh
> +@@ -312,5 +312,5 @@ if test -x "./bootstrap/jam0" ; then
> +     if test "${BJAM_UPDATE}" != "update" ; then
> +         echo_run ./bootstrap/jam0 -f build.jam --toolset=$BOOST_JAM_TOOLSET "--toolset-root=$BOOST_JAM_TOOLSET_ROOT" "$@" clean
> +     fi
> +-    echo_run ./bootstrap/jam0 -f build.jam --toolset=$BOOST_JAM_TOOLSET "--toolset-root=$BOOST_JAM_TOOLSET_ROOT" "$@"
> ++    echo_run ./bootstrap/jam0 -f build.jam --toolset=$BOOST_JAM_TOOLSET "--toolset-root=$BOOST_JAM_TOOLSET_ROOT" "$@" --debug
> + fi
> +--
> +1.9.1
> +
>

