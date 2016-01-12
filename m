Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6A5E6072C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 03:38:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0C3c3gV015612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Jan 2016 19:38:03 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jan 2016 19:38:02 -0800
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56947518.6090207@windriver.com>
Date: Tue, 12 Jan 2016 11:38:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH][V2][Jethro, fido 01/10] libxml2: security fix CVE-2015-7941
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
X-List-Received-Date: Tue, 12 Jan 2016 03:38:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Armin,


I got strange errors when apply the patches:

$ git am /tmp/jethro/*libxml2*
[snip]
Applying: libxml2: security fix CVE-2015-7500
/buildarea/lyang1/poky/.git/rebase-apply/patch:80: trailing whitespace.

/buildarea/lyang1/poky/.git/rebase-apply/patch:82: space before tab in indent.
            ((RAW != '/') || (NXT(1) != '>')) &&
/buildarea/lyang1/poky/.git/rebase-apply/patch:84: trailing whitespace.

/buildarea/lyang1/poky/.git/rebase-apply/patch:85: space before tab in indent.
         attname = xmlParseAttribute2(ctxt, prefix, localname,
/buildarea/lyang1/poky/.git/rebase-apply/patch:86: space before tab in indent.
                                      &aprefix, &attvalue, &len, &alloc);
fatal: corrupt patch at line 300
Patch failed at 0008 libxml2: security fix CVE-2015-7500

Would you please put the patches to a repo ? so that I can fetch them ?

// Robert

On 01/08/2016 08:48 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> includes:
> CVE-2015-7941-1
> CVE-2015-7941-2
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   meta/recipes-core/libxml/libxml2.inc               |  2 +
>   ...top-parsing-on-entities-boundaries-errors.patch | 39 +++++++++++++++
>   ...leanup-conditional-section-error-handling.patch | 56 ++++++++++++++++++++++
>   3 files changed, 97 insertions(+)
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
> index 1c3c37d..24b98a6 100644
> --- a/meta/recipes-core/libxml/libxml2.inc
> +++ b/meta/recipes-core/libxml/libxml2.inc
> @@ -21,6 +21,8 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
>              file://libxml-m4-use-pkgconfig.patch \
>              file://configure.ac-fix-cross-compiling-warning.patch \
>              file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
> +           file://CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch \
> +           file://CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch \
>             "
>
>   BINCONFIG = "${bindir}/xml2-config"
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
> new file mode 100644
> index 0000000..11da9f9
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
> @@ -0,0 +1,39 @@
> +From a7dfab7411cbf545f359dd3157e5df1eb0e7ce31 Mon Sep 17 00:00:00 2001
> +From: Daniel Veillard <veillard@redhat.com>
> +Date: Mon, 23 Feb 2015 11:17:35 +0800
> +Subject: [PATCH] Stop parsing on entities boundaries errors
> +
> +For https://bugzilla.gnome.org/show_bug.cgi?id=744980
> +
> +There are times, like on unterminated entities that it's preferable to
> +stop parsing, even if that means less error reporting. Entities are
> +feeding the parser on further processing, and if they are ill defined
> +then it's possible to get the parser to bug. Also do the same on
> +Conditional Sections if the input is broken, as the structure of
> +the document can't be guessed.
> +
> +Upstream-Status: Backport
> +
> +CVE-2015-7941-1
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + parser.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/parser.c b/parser.c
> +index a8d1b67..bbe97eb 100644
> +--- a/parser.c
> ++++ b/parser.c
> +@@ -5658,6 +5658,7 @@ xmlParseEntityDecl(xmlParserCtxtPtr ctxt) {
> + 	if (RAW != '>') {
> + 	    xmlFatalErrMsgStr(ctxt, XML_ERR_ENTITY_NOT_FINISHED,
> + 	            "xmlParseEntityDecl: entity %s not terminated\n", name);
> ++	    xmlStopParser(ctxt);
> + 	} else {
> + 	    if (input != ctxt->input) {
> + 		xmlFatalErrMsg(ctxt, XML_ERR_ENTITY_BOUNDARY,
> +--
> +2.3.5
> +
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
> new file mode 100644
> index 0000000..b7bd960
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
> @@ -0,0 +1,56 @@
> +From 9b8512337d14c8ddf662fcb98b0135f225a1c489 Mon Sep 17 00:00:00 2001
> +From: Daniel Veillard <veillard@redhat.com>
> +Date: Mon, 23 Feb 2015 11:29:20 +0800
> +Subject: [PATCH] Cleanup conditional section error handling
> +
> +For https://bugzilla.gnome.org/show_bug.cgi?id=744980
> +
> +The error handling of Conditional Section also need to be
> +straightened as the structure of the document can't be
> +guessed on a failure there and it's better to stop parsing
> +as further errors are likely to be irrelevant.
> +
> +Upstream-Status: Backport
> +
> +CVE-2015-7941-2
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + parser.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/parser.c b/parser.c
> +index bbe97eb..fe603ac 100644
> +--- a/parser.c
> ++++ b/parser.c
> +@@ -6770,6 +6770,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
> + 	SKIP_BLANKS;
> + 	if (RAW != '[') {
> + 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
> ++	    xmlStopParser(ctxt);
> ++	    return;
> + 	} else {
> + 	    if (ctxt->input->id != id) {
> + 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
> +@@ -6830,6 +6832,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
> + 	SKIP_BLANKS;
> + 	if (RAW != '[') {
> + 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
> ++	    xmlStopParser(ctxt);
> ++	    return;
> + 	} else {
> + 	    if (ctxt->input->id != id) {
> + 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
> +@@ -6885,6 +6889,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
> +
> +     } else {
> + 	xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID_KEYWORD, NULL);
> ++	xmlStopParser(ctxt);
> ++	return;
> +     }
> +
> +     if (RAW == 0)
> +--
> +2.3.5
> +
>

