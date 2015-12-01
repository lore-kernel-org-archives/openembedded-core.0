Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 18C6A60620
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 22:48:15 +0000 (UTC)
Received: by wmec201 with SMTP id c201so228030789wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 14:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bopWZjS/buAdvP/+a1VDPAQ1DV7vziATfIkG+prxSPk=;
	b=q8dSMkIf1vlHe/i47T6/IEVZeV70VBicRWCr8HCxhAdzKDU1704r13yR7M57pe0r6j
	Qc9Cijz3G8yuNvEYzIdv+Ms0mN65BcZ88WgrxC1q1/Qn/PL9qIgYf9dvCbNm6w1twlsJ
	H28lyj4H7Lxe/4pMNvgTG7vhpmPWtTO3mb3m2IO6bU0/CGrA4VqsB5vN/WXNOMNMcMuV
	gdN2LukpiOyC/mzh3Tm7c9L9TDn7n2ZIAFfXCjb6F7VeGjZgUbNT/MPRDoLqHQw7THhN
	wBOcdEGc9bOjhMzZQNEs+mwr0vkTtnbOJ8oJBPwWOQDUngOaI2s20+TZblpTUTDkcWOH
	MI9g==
MIME-Version: 1.0
X-Received: by 10.28.86.196 with SMTP id k187mr38307446wmb.61.1449010095992;
	Tue, 01 Dec 2015 14:48:15 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Tue, 1 Dec 2015 14:48:15 -0800 (PST)
In-Reply-To: <cfd522ee6ab39b8bfcb5a160d4bd5cef7f422f79.1448962573.git.liezhi.yang@windriver.com>
References: <cover.1448962573.git.liezhi.yang@windriver.com>
	<cfd522ee6ab39b8bfcb5a160d4bd5cef7f422f79.1448962573.git.liezhi.yang@windriver.com>
Date: Tue, 1 Dec 2015 14:48:15 -0800
Message-ID: <CAJ86T=VLDQGwTGvq4+9nPoWOW2D=kf90MeNbAeQ4EeY0QkjGCQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] libxml2: fix CVE-2015-7942 and CVE-2015-8035
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
X-List-Received-Date: Tue, 01 Dec 2015 22:48:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 1, 2015 at 1:44 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> CVE-2015-7942 libxml2: heap-based buffer overflow in xmlParseConditionalSections()
> CVE-2015-8035 libxml2: DoS when parsing specially crafted XML document if XZ support is enabled

It looks like CVE-2015-7942 requires two separate patches, only one of
which made it to oe-core master, plus there were a lot of the other
CVE fixes committed upstream in October and November.

  http://www.xmlsoft.org/news.html
  https://git.gnome.org/browse/libxml2/log/?h=v2.9.3


> [YOCTO #8641]
>
> (From OE-Core master rev: 27de51f4ad21d9b896e7d48041e7cdf20c564a38)
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/libxml/libxml2.inc               |    2 +
>  .../libxml/libxml2/CVE-2015-7942.patch             |   55 ++++++++++++++++++++
>  .../libxml/libxml2/CVE-2015-8035.patch             |   41 +++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
> index 1c3c37d..6ada401 100644
> --- a/meta/recipes-core/libxml/libxml2.inc
> +++ b/meta/recipes-core/libxml/libxml2.inc
> @@ -21,6 +21,8 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
>             file://libxml-m4-use-pkgconfig.patch \
>             file://configure.ac-fix-cross-compiling-warning.patch \
>             file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
> +           file://CVE-2015-7942.patch \
> +           file://CVE-2015-8035.patch \
>            "
>
>  BINCONFIG = "${bindir}/xml2-config"
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
> new file mode 100644
> index 0000000..a5930ed
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
> @@ -0,0 +1,55 @@
> +libxml2: CVE-2015-7942
> +
> +From 9b8512337d14c8ddf662fcb98b0135f225a1c489 Mon Sep 17 00:00:00 2001
> +From: Daniel Veillard <veillard@redhat.com>
> +Date: Mon, 23 Feb 2015 11:29:20 +0800
> +Subject: Cleanup conditional section error handling
> +
> +For https://bugzilla.gnome.org/show_bug.cgi?id=744980
> +
> +The error handling of Conditional Section also need to be
> +straightened as the structure of the document can't be
> +guessed on a failure there and it's better to stop parsing
> +as further errors are likely to be irrelevant.
> +
> +Upstream-Status: Backport
> +https://git.gnome.org/browse/libxml2/patch/?id=9b8512337d14c8ddf662fcb98b0135f225a1c489
> +
> +[YOCTO #8641]
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + parser.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +Index: libxml2-2.9.2/parser.c
> +===================================================================
> +--- libxml2-2.9.2.orig/parser.c
> ++++ libxml2-2.9.2/parser.c
> +@@ -6783,6 +6783,8 @@ xmlParseConditionalSections(xmlParserCtx
> +       SKIP_BLANKS;
> +       if (RAW != '[') {
> +           xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
> ++          xmlStopParser(ctxt);
> ++          return;
> +       } else {
> +           if (ctxt->input->id != id) {
> +               xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
> +@@ -6843,6 +6845,8 @@ xmlParseConditionalSections(xmlParserCtx
> +       SKIP_BLANKS;
> +       if (RAW != '[') {
> +           xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
> ++          xmlStopParser(ctxt);
> ++          return;
> +       } else {
> +           if (ctxt->input->id != id) {
> +               xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
> +@@ -6898,6 +6902,8 @@ xmlParseConditionalSections(xmlParserCtx
> +
> +     } else {
> +       xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID_KEYWORD, NULL);
> ++      xmlStopParser(ctxt);
> ++      return;
> +     }
> +
> +     if (RAW == 0)
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
> new file mode 100644
> index 0000000..d175f74
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
> @@ -0,0 +1,41 @@
> +libxml2: CVE-2015-8035
> +
> +From f0709e3ca8f8947f2d91ed34e92e38a4c23eae63 Mon Sep 17 00:00:00 2001
> +From: Daniel Veillard <veillard@redhat.com>
> +Date: Tue, 3 Nov 2015 15:31:25 +0800
> +Subject: CVE-2015-8035 Fix XZ compression support loop
> +
> +For https://bugzilla.gnome.org/show_bug.cgi?id=757466
> +DoS when parsing specially crafted XML document if XZ support
> +is compiled in (which wasn't the case for 2.9.2 and master since
> +Nov 2013, fixed in next commit !)
> +
> +Upstream-Status: Backport
> +https://git.gnome.org/browse/libxml2/patch/?id=f0709e3ca8f8947f2d91ed34e92e38a4c23eae63
> +
> +[YOCTO #8641]
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + xzlib.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/xzlib.c b/xzlib.c
> +index 0dcb9f4..1fab546 100644
> +--- a/xzlib.c
> ++++ b/xzlib.c
> +@@ -581,6 +581,10 @@ xz_decomp(xz_statep state)
> +             xz_error(state, LZMA_DATA_ERROR, "compressed data error");
> +             return -1;
> +         }
> ++        if (ret == LZMA_PROG_ERROR) {
> ++            xz_error(state, LZMA_PROG_ERROR, "compression error");
> ++            return -1;
> ++        }
> +     } while (strm->avail_out && ret != LZMA_STREAM_END);
> +
> +     /* update available output and crc check value */
> +--
> +cgit v0.11.2
> +
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

