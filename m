Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 9043076FD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 12:17:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 450375188051
Message-ID: <1441109845.4029.5.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 01 Sep 2015 13:17:25 +0100
In-Reply-To: <1440767524-26149-1-git-send-email-sona.sarmadi@enea.com>
References: <1440767524-26149-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido] icu: CVE-2014-8146-CVE-2014-8147
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
X-List-Received-Date: Tue, 01 Sep 2015 12:17:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-28 at 15:12 +0200, Sona Sarmadi wrote:
> CVE-2014-8146 icu: heap overflow via incorrect isolateCount
> CVE-2014-8147 icu: integer truncation in the resolveImplicitLevels
> function
> 
> References:
> [1] https://github.com/pedrib/PoC/raw/master/generic/i-c-u-fail.7z
> [2] https://www.kb.cert.org/vuls/id/602540
> [3] http://bugs.icu-project.org/trac/changeset/37080
> [4] http://bugs.icu-project.org/trac/changeset/37162
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>

Thanks Sona, this patch is queued in my fido-next branch[1].

Regards,
Joshua

1. http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshua
gl/fido-next

> ---
>  .../icu/icu/icu-CVE-2014-8146-CVE-2014-8147.patch  | 49
> ++++++++++++++++++++++
>  meta/recipes-support/icu/icu_54.1.bb               |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-support/icu/icu/icu-CVE-2014-8146
> -CVE-2014-8147.patch
> 
> diff --git a/meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014
> -8147.patch b/meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014
> -8147.patch
> new file mode 100644
> index 0000000..cf32d13c
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu/icu-CVE-2014-8146-CVE-2014
> -8147.patch
> @@ -0,0 +1,49 @@
> +ICU: CVE-2014-8146-CVE-2014-8147
> +
> +CVE-2014-8146 icu: heap overflow via incorrect isolateCount
> +CVE-2014-8147 icu: integer truncation in the resolveImplicitLevels
> function
> +
> +References:
> +[1] https://github.com/pedrib/PoC/raw/master/generic/i-c-u-fail.7z
> +[2] https://www.kb.cert.org/vuls/id/602540
> +[3] http://bugs.icu-project.org/trac/changeset/37080
> +[4] http://bugs.icu-project.org/trac/changeset/37162
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> +diff -ruN a/common/ubidi.c b/common/ubidi.c
> +--- a/common/ubidi.c	2014-10-03 18:11:20.000000000 +0200
> ++++ b/common/ubidi.c	2015-08-28 08:22:39.455906194 +0200
> +@@ -2138,7 +2138,7 @@
> +     /* The isolates[] entries contain enough information to
> +        resume the bidi algorithm in the same state as it was
> +        when it was interrupted by an isolate sequence. */
> +-    if(dirProps[start]==PDI) {
> ++    if(dirProps[start]==PDI  && pBiDi->isolateCount >= 0) {
> +         levState.startON=pBiDi->isolates[pBiDi
> ->isolateCount].startON;
> +         start1=pBiDi->isolates[pBiDi->isolateCount].start1;
> +         stateImp=pBiDi->isolates[pBiDi->isolateCount].stateImp;
> +diff -ruN a/common/ubidiimp.h b/common/ubidiimp.h
> +--- a/common/ubidiimp.h	2014-10-03 18:11:16.000000000 +0200
> ++++ b/common/ubidiimp.h	2015-08-28 08:28:24.069163845 +0200
> +@@ -1,7 +1,7 @@
> + /*
> +
> *********************************************************************
> *********
> + *
> +-*   Copyright (C) 1999-2014, International Business Machines
> ++*   Copyright (C) 1999-2015, International Business Machines
> + *   Corporation and others.  All Rights Reserved.
> + *
> +
> *********************************************************************
> *********
> +@@ -184,8 +184,8 @@
> + typedef struct Isolate {
> +     int32_t startON;
> +     int32_t start1;
> ++    int32_t state;
> +     int16_t stateImp;
> +-    int16_t state;
> + } Isolate;
> +
> + typedef struct Run {
> diff --git a/meta/recipes-support/icu/icu_54.1.bb b/meta/recipes
> -support/icu/icu_54.1.bb
> index 45b5cb6..9f10beb 100644
> --- a/meta/recipes-support/icu/icu_54.1.bb
> +++ b/meta/recipes-support/icu/icu_54.1.bb
> @@ -11,6 +11,7 @@ ICU_PV = "${@icu_download_version(d)}"
>  BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/ic
> u4c-${ICU_PV}-src.tgz"
>  SRC_URI = "${BASE_SRC_URI} \
>             file://icu-pkgdata-large-cmd.patch \
> +           file://icu-CVE-2014-8146-CVE-2014-8147.patch \
>            "
>  
>  SRC_URI_append_class-target = "\
> -- 
> 1.9.1
> 

