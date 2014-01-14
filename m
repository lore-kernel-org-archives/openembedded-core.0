Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 74CA060172
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 16:58:40 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id ar20so698842iec.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 08:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0IEzLllsvQHVWogEDWF9/pDh+rWFm+ce7bXb8DxbbAg=;
	b=TycfxuTNz0UGkEZhohgGT0m+E8aqY0x2LrI2L0ynD3DrbKSPD6fkRW0IW8ff+yzPeh
	DrJ/w6veSdBQVY8DhzfdTJrG2lnQUJaLWKJNddhUuuEENQMkYOpNg6U2W9/arDLlZB1L
	mXo8r6bqEn3eetrRBrAZVfsUqwnGAknJSXb9jbV/ndEfAzWetT0Z7vPrWK5m6Q1A2pC5
	5JIxxSgos8tPNtlBzWHnKMYLJ0a7VF3gppp15QFzqFma3cQ1uimBwio74+oZcVXNcR9I
	MZdfyQ4m/6qQEmWSskuHbjo5ZJkX9886Hz8kDQNEDlBP0vQRchChfe7EgvulWh7fLTpI
	w1+g==
X-Received: by 10.43.182.74 with SMTP id pl10mr3107321icc.70.1389718721203;
	Tue, 14 Jan 2014 08:58:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Tue, 14 Jan 2014 08:58:11 -0800 (PST)
In-Reply-To: <1389716791-22080-1-git-send-email-otavio@ossystems.com.br>
References: <1389716791-22080-1-git-send-email-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Jan 2014 08:58:11 -0800
Message-ID: <CAMKF1so-Jeoi2bq3=r77uzQ6HFDbwimQpuopzRqjGs00mNUQZQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-dora][PATCH] gcc-4.8: Backport PR c++/57532 fix from 4.8.2
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
X-List-Received-Date: Tue, 14 Jan 2014 16:58:42 -0000
Content-Type: text/plain; charset=UTF-8

looks good to me.

On Tue, Jan 14, 2014 at 8:26 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57532
>
> Log:
> r200836 | jason | 2013-07-09 14:52:17 -0300 (Tue, 09 Jul 2013) | 3 lines
>
>         PR c++/57532
>         * parser.c (cp_parser_ref_qualifier_opt): Don't tentatively parse
>         a ref-qualifier in C++98 mode.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
>  .../gcc/gcc-4.8/0048-PR57532.patch                 |   36 ++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0048-PR57532.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index 8d50bf7..b34c7ae 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -77,6 +77,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>            file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
>            file://0046-libatomic-deptracking.patch \
>            file://0047-repomembug.patch \
> +          file://0048-PR57532.patch \
>           "
>  SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
>  SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0048-PR57532.patch b/meta/recipes-devtools/gcc/gcc-4.8/0048-PR57532.patch
> new file mode 100644
> index 0000000..4a05d33
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0048-PR57532.patch
> @@ -0,0 +1,36 @@
> +Upstream-Status: Backport
> +Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
> +r200836 | jason | 2013-07-09 14:52:17 -0300 (Tue, 09 Jul 2013) | 3 lines
> +
> +        PR c++/57532
> +        * parser.c (cp_parser_ref_qualifier_opt): Don't tentatively parse
> +        a ref-qualifier in C++98 mode.
> +
> +Index: gcc/testsuite/g++.dg/parse/ref-qual2.C
> +===================================================================
> +--- a/gcc/testsuite/g++.dg/parse/ref-qual2.C   (revision 0)
> ++++ b/gcc/testsuite/g++.dg/parse/ref-qual2.C   (revision 200836)
> +@@ -0,0 +1,6 @@
> ++// PR c++/57532
> ++
> ++int main()
> ++{
> ++    return (int() & int());
> ++}
> +Index: gcc/cp/parser.c
> +===================================================================
> +--- a/gcc/cp/parser.c  (revision 200835)
> ++++ b/gcc/cp/parser.c  (revision 200836)
> +@@ -16986,6 +16986,11 @@
> + {
> +   cp_ref_qualifier ref_qual = REF_QUAL_NONE;
> +   cp_token *token = cp_lexer_peek_token (parser->lexer);
> ++
> ++  /* Don't try to parse bitwise '&' as a ref-qualifier (c++/57532).  */
> ++  if (cxx_dialect < cxx11 && cp_parser_parsing_tentatively (parser))
> ++    return ref_qual;
> ++
> +   switch (token->type)
> +     {
> +     case CPP_AND:
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

