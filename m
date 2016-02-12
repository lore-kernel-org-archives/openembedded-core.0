Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 549306AC3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 22:19:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 12 Feb 2016 14:19:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,437,1449561600"; d="scan'208";a="745172732"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.13.227])
	by orsmga003.jf.intel.com with ESMTP; 12 Feb 2016 14:19:57 -0800
Message-ID: <1455315595.3546.41.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 22:19:55 +0000
In-Reply-To: <1455236434-31029-1-git-send-email-akuster808@gmail.com>
References: <1455236434-31029-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [jethro][fido] libbsd: Secuirty fix CVE-2016-2090
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
X-List-Received-Date: Fri, 12 Feb 2016 22:19:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-02-11 at 16:20 -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> CVE-2016-2090 Heap buffer overflow in fgetwln function of libbsd
> 
> affects libbsd <= 0.8.1

and this not needed in master which has 0.8.2.

I plan to take this in fido once it's merged to jethro.

Regards,

Joshua

> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../libbsd/files/CVE-2016-2090.patch               | 50
> ++++++++++++++++++++++
>  meta/recipes-support/libbsd/libbsd_0.7.0.bb        |  4 +-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/libbsd/files/CVE-2016-
> 2090.patch
> 
> diff --git a/meta/recipes-support/libbsd/files/CVE-2016-2090.patch
> b/meta/recipes-support/libbsd/files/CVE-2016-2090.patch
> new file mode 100644
> index 0000000..2eaae13
> --- /dev/null
> +++ b/meta/recipes-support/libbsd/files/CVE-2016-2090.patch
> @@ -0,0 +1,50 @@
> +From c8f0723d2b4520bdd6b9eb7c3e7976de726d7ff7 Mon Sep 17 00:00:00
> 2001
> +From: Hanno Boeck <hanno@hboeck.de>
> +Date: Wed, 27 Jan 2016 15:10:11 +0100
> +Subject: [PATCH] Fix heap buffer overflow in fgetwln()
> +
> +In the function fgetwln() there's a 4 byte heap overflow.
> +
> +There is a while loop that has this check to see whether there's
> still
> +enough space in the buffer:
> +
> +		if (!fb->len || wused > fb->len) {
> +
> +If this is true more memory gets allocated. However this test won't
> be
> +true if wused == fb->len, but at that point wused already points out
> +of the buffer. Some lines later there's a write to the buffer:
> +
> +		fb->wbuf[wused++] = wc;
> +
> +This bug was found with the help of address sanitizer.
> +
> +Warned-by: ASAN
> +Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=93881
> +Signed-off-by: Guillem Jover <guillem@hadrons.org>
> +
> +Upstream-Status: Backport
> +http://cgit.freedesktop.org/libbsd/commit/?id=c8f0723d2b4520bdd6b9eb
> 7c3e7976de726d7ff7
> +
> +CVE: CVE-2016-2090
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/fgetwln.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/fgetwln.c b/src/fgetwln.c
> +index 9ee0776..aa3f927 100644
> +--- a/src/fgetwln.c
> ++++ b/src/fgetwln.c
> +@@ -60,7 +60,7 @@ fgetwln(FILE *stream, size_t *lenp)
> + 	fb->fp = stream;
> + 
> + 	while ((wc = fgetwc(stream)) != WEOF) {
> +-		if (!fb->len || wused > fb->len) {
> ++		if (!fb->len || wused >= fb->len) {
> + 			wchar_t *wp;
> + 
> + 			if (fb->len)
> +-- 
> +2.3.5
> +
> diff --git a/meta/recipes-support/libbsd/libbsd_0.7.0.bb
> b/meta/recipes-support/libbsd/libbsd_0.7.0.bb
> index 902666d..8d9a708 100644
> --- a/meta/recipes-support/libbsd/libbsd_0.7.0.bb
> +++ b/meta/recipes-support/libbsd/libbsd_0.7.0.bb
> @@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f1530ea92aea
> a1c5e2547cfd43905d8c"
>  SECTION = "libs"
>  DEPENDS = ""
>  
> -SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.x
> z"
> +SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.x
> z \
> +           file://CVE-2016-2090.patch \
> +           "
>  
>  SRC_URI[md5sum] = "fcceb4e66fd448ca4ed42ba22a8babb0"
>  SRC_URI[sha256sum] =
> "0f3b0e17e5c34c038126e0a04351b11e23c6101a7d0ce3beeab29bb6415c10bb"
> -- 
> 2.3.5
> 

