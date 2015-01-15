Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id D940860232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 16:36:09 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id z10so17208085pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 08:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=mhXaTyEGFVhwKmj1mEcONZNVvAYQlB1l6yxulbrXLSw=;
	b=GiCYkypaXz7KkdILYSVubEF9AttU4AJyY5ZGzVKJha0OOEGmE+/4Yb7CqsRf/fSclC
	DunuzBZFrfPRowiBmvPmAA+Teo5Q01CEQ8U1QUfv76Rc9NX/W9Nl6Sd/j7y7CkY6RizD
	z0hPzn58uBXsWI/Hn+5h4er6Tpf2qF896qPSFAyRwhrdFDmsbhdL1x619Vh0JjDN2Ia1
	PX0p2yBCuJOicGDrO6vDE3fVDPCLwinKyo9WWfmUTgV1yxd90d7eqa9AnJtJevbIB4lm
	NFOcwjtmo4rYJGprBHjEVfaZ/B1J3uuoCIPBN1mvdj6hb4ydsm8wkQazez2GbPS5x6pf
	12hg==
X-Received: by 10.68.100.33 with SMTP id ev1mr15587797pbb.13.1421339770471;
	Thu, 15 Jan 2015 08:36:10 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:64cd:5fdf:a308:32c2?
	([2601:c:a700:272f:64cd:5fdf:a308:32c2])
	by mx.google.com with ESMTPSA id
	ex11sm1794512pac.19.2015.01.15.08.36.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 08:36:09 -0800 (PST)
Message-ID: <54B7EC76.9090306@gmail.com>
Date: Thu, 15 Jan 2015 08:36:06 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1421314636.31262.42.camel@linuxfoundation.org>
In-Reply-To: <1421314636.31262.42.camel@linuxfoundation.org>
Subject: Re: [PATCH] libxml2: Backport fix for CVE introduced entity issues
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
X-List-Received-Date: Thu, 15 Jan 2015 16:36:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

this will be required for dizzy when I pull in the cve fix ( which i 
missed)..



On 01/15/2015 01:37 AM, Richard Purdie wrote:
> The CVE fix introduced problems with entity issues, we observed this
> when building the Yocto Docs in particular. Backport the fix from
> upstream so we can build our docs correctly.
>
> [YOCTO #7134]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch b/meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
> new file mode 100644
> index 0000000..10a8112
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
> @@ -0,0 +1,30 @@
> +From 72a46a519ce7326d9a00f0b6a7f2a8e958cd1675 Mon Sep 17 00:00:00 2001
> +From: Daniel Veillard <veillard@redhat.com>
> +Date: Thu, 23 Oct 2014 11:35:36 +0800
> +Subject: Fix missing entities after CVE-2014-3660 fix
> +
> +For https://bugzilla.gnome.org/show_bug.cgi?id=738805
> +
> +The fix for CVE-2014-3660 introduced a regression in some case
> +where entity substitution is required and the entity is used
> +first in anotther entity referenced from an attribute value
> +
> +Upstream-Status: Backport
> +
> +diff --git a/parser.c b/parser.c
> +index 67c9dfd..a8d1b67 100644
> +--- a/parser.c
> ++++ b/parser.c
> +@@ -7235,7 +7235,8 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
> +      * far more secure as the parser will only process data coming from
> +      * the document entity by default.
> +      */
> +-    if ((ent->checked == 0) &&
> ++    if (((ent->checked == 0) ||
> ++         ((ent->children == NULL) && (ctxt->options & XML_PARSE_NOENT))) &&
> +         ((ent->etype != XML_EXTERNAL_GENERAL_PARSED_ENTITY) ||
> +          (ctxt->options & (XML_PARSE_NOENT | XML_PARSE_DTDVALID)))) {
> + 	unsigned long oldnbent = ctxt->nbentities;
> +--
> +cgit v0.10.1
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.2.bb b/meta/recipes-core/libxml/libxml2_2.9.2.bb
> index f0cfa59..1affff1 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.2.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.2.bb
> @@ -1,6 +1,7 @@
>   require libxml2.inc
>
> -SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar"
> +SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
> +            file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch"
>
>   SRC_URI[libtar.md5sum] = "9e6a9aca9d155737868b3dc5fd82f788"
>   SRC_URI[libtar.sha256sum] = "5178c30b151d044aefb1b08bf54c3003a0ac55c59c866763997529d60770d5bc"
>
>

