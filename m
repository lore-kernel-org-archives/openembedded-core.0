Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A20CA5FE2
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 14:54:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14209.1790952872822836968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 07:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3VRAHdr6;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49e73611928so545195e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790952871; x=1791557671; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zAz8QxXV8UFYQB4Vwq4ZdTmVb+hY0jktj4IT+1lmntw=;
        b=3VRAHdr6w9ix4/DbvIXcmp0ZgjpOMI84HBsbMvwX5Fd5Pfte537onJrFLacDGBbK+y
         nzRsxJ4SA3XXYz8GevtmKdiZnjDt5Z/h/06V3T4W1dOgFycjz1FEeRcTa/rrSnNTMZni
         CXHgjJkhUXzevztri4U04KTh3WObU9JwmE89Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952871; x=1791557671;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAz8QxXV8UFYQB4Vwq4ZdTmVb+hY0jktj4IT+1lmntw=;
        b=FkbvNQA2ubDgwxfLe0qVcW8F8NVunMnJWbGOdgpMi2LlhWRTQ5J0k8lHCHkXRvbTjU
         2/2JZlnt+MmaQEc2CjA7GtmvTW6sBTaa2z/npzriWfNuH9w9hyw5iH3gVHk23CoeKb4h
         qpilR1YVaFvpUM7ehIPYE/AgpkfqsgdyHp4PIkouqeAkKwGboPec8NxFglueEaGw53O+
         TgEivo+ZSNjsY5AxtT4aUArsmu+SGZjjR7oyFgZYrlc/ZdEnTMIOvPqEA+82f5sEcrQV
         6PBSbs5LZxrxD4RdodvSUlaWRahCJWSyTKtNN+3FxWAuUhY28eD4LCr7oGXJTsdoEk5M
         CfHQ==
X-Forwarded-Encrypted: i=1; AKwUvByfvFzjnzsa5UWM63oCBzWtLrt+U4zRX3sZB5DDlH2fvIfxJevXaGh1Htet0OKJTejdQsA8wIV8TiCQaw9djOXJ0A==@lists.openembedded.org
X-Gm-Message-State: AFuF++lATnHlhEhFQDboCayn28id141xwKyLXthkCF4bpoXIF1Ai5h1e
	82nbWON4Wtutw9jl5ONSUZmCXeq1OwEOR5rJvuZkp5/LB0Pwoh7Sb0dklACbZjf/LIc=
X-Gm-Gg: AYBFou1BGKe9CFob+o0rcarMB9JJXG/obQ1c6j+hUeYNDop0Y4BtiYRx8QkskNor3EF
	vGM1ylY7CwbZp/s2jAS76pxL4vOgvpFwhSutqcDRiWnGholP2CQH0EuCvz6xD52g2XWb+HWKG5O
	Y+5okmlTxLImEfwOdgnEnQLWIPOUofwu5BPs6hY4Zk8i0klxHdVXZ/UPiflWctWFRx6ohn0tISS
	Aojy7WehOE/vaKxAVYvWvdzH3TRDWHIEPwD6TLi2cxMTXY9+PgY37r+SJ6f/OYhRULiI4HZNE/I
	wsN+ZsiTvn+U/e6oPlU2q2gKliqLdwhVzzUtmbUNrO2C15tmO0U0kwrakx862KVytMbyhfaRTFx
	5VZa899tCPprx2ToJq5p9f0nr470+Rn/eX7uc9NFmV4FPzMQEsQgnSRbOZKKI0B5/jgDdtSHJtc
	IjpUsSjNerFPm7v73TqissZr8B7lUi5iaJ9nvX0fZ6MjNz12ED4aIiVTMMutN/6/4LORwacEmjm
	0Alk2ZyhUuzyketq8siUVmzf1vZJPxrWNwfLd5PNLE5vL+NZT6zD/YDgPs3zQ==
X-Received: by 2002:a7b:c319:0:b0:49f:bd43:5a1c with SMTP id 5b1f17b1804b1-4a01eb388aemr95312945e9.15.1790952870902;
        Fri, 02 Oct 2026 07:54:30 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f06b3sm6392718f8f.11.2026.10.02.07.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:54:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 16:54:30 +0200
Message-Id: <DLUFT2BDIRQN.36EVUGERNVHXH@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 8/8] libxml2: Fix CVE-2026-86144
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260929041836.2217090-1-hthakar@cisco.com>
 <20260929041836.2217090-8-hthakar@cisco.com>
In-Reply-To: <20260929041836.2217090-8-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247124

On Tue Sep 29, 2026 at 6:18 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/GNOME/libxml2/commit/b63cd517afecb76582dd9488c55e5=
4ceaf50de61
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-86144
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../libxml/libxml2/CVE-2026-86144.patch       | 219 ++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
>  2 files changed, 220 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch b/meta=
/recipes-core/libxml/libxml2/CVE-2026-86144.patch
> new file mode 100644
> index 0000000000..41fee42732
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch
> @@ -0,0 +1,219 @@
> +From 8d0c6eb94f8a32a49e3c9122a6da82c519198063 Mon Sep 17 00:00:00 2001
> +From: Ruben Thijssen <ruben.thijssen@cba.com.au>
> +Date: Fri, 15 May 2026 15:42:18 +1000
> +Subject: [PATCH] fix(xinclude): propagate parseFlags in xmlXIncludeProce=
ss and
> + xmlXIncludeProcessTree
> +
> +CVE: CVE-2026-86144
> +Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/b63cd=
517afecb76582dd9488c55e54ceaf50de61]
> +
> +Backport Changes:
> +- Use xmlLoadExternalEntity() with xmlCtxtUseOptions() because Scarthgap=
 2.12.10 predates xmlLoadResource() and resource-loader callbacks.
> +- Adapt the regression tests for 2.12.10 by using the global structured-=
error handler, matching 2.12.10 loader network-entity diagnostics, and rest=
oring the test handler after xmlXIncludeProcess().
> +- Omit the upstream XML_IO_NETWORK_ATTEMPT filter because the 2.12.10 xm=
lLoadExternalEntity() path has no corresponding post-load error-filtering b=
lock.
> +- Add a parser-context allocation guard because the target version can r=
eturn NULL from xmlNewParserCtxt().
     ^ Please wrap this at 80 chars

> +(cherry picked from commit b63cd517afecb76582dd9488c55e54ceaf50de61)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> +---
> + result/XInclude/issue1120-1.xml         |  4 ++
> + result/XInclude/issue1120-1.xml.err     |  1 +
> + result/XInclude/issue1120-2.xml         |  4 ++
> + result/XInclude/issue1120-2.xml.err     |  1 +
> + runtest.c                               | 75 +++++++++++++++++++++++++
> + test/XInclude/issue1120/issue1120-1.xml |  6 ++
> + test/XInclude/issue1120/issue1120-2.xml |  6 ++
> + xinclude.c                              |  9 ++-
> + 8 files changed, 104 insertions(+), 2 deletions(-)
> + create mode 100644 result/XInclude/issue1120-1.xml
> + create mode 100644 result/XInclude/issue1120-1.xml.err
> + create mode 100644 result/XInclude/issue1120-2.xml
> + create mode 100644 result/XInclude/issue1120-2.xml.err
> + create mode 100644 test/XInclude/issue1120/issue1120-1.xml
> + create mode 100644 test/XInclude/issue1120/issue1120-2.xml
> +
> +diff --git a/runtest.c b/runtest.c
> +index e91e2dfd..297cb5e2 100644
> +--- a/runtest.c
> ++++ b/runtest.c
> +@@ -2444,6 +2444,75 @@ noentParseTest(const char *filename, const char *=
result,
> +     return(res);
> + }
> +=20
> ++#ifdef LIBXML_XINCLUDE_ENABLED
> ++/**
> ++ * Parse a file and run xmlXIncludeProcess() to verify that doc->parseF=
lags
> ++ * is propagated properly.
> ++ *
> ++ * @param filename  the file to parse
> ++ * @param result  the file with expected result
> ++ * @param err  the file with error messages
> ++ * @returns 0 in case of success, an error code otherwise
> ++ */
> ++static int
> ++xincludeProcessTest(const char *filename, const char *result, const cha=
r *err,
> ++                    int options) {
> [...]
> ++    /*
> ++     * Run xmlXIncludeProcess() with a structured error handler to chec=
k that
> ++     * the parse flags are propagated.
> ++     */
> ++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
> ++    xmlXIncludeProcess(doc);
> ++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
Upstream commit calls "xmlSetStructuredErrorFunc(NULL, NULL);" here but
this change is not explained.


> [...]
> +diff --git a/xinclude.c b/xinclude.c
> +index b6581558..0d57f5a1 100644
> +--- a/xinclude.c
> ++++ b/xinclude.c
> +@@ -1688,6 +1688,11 @@ xmlXIncludeLoadTxt(xmlXIncludeCtxtPtr ctxt, const=
 xmlChar *url,
> +      * Load it.
> +      */
> +     pctxt =3D xmlNewParserCtxt();
> ++    if (pctxt =3D=3D NULL) {
> ++        xmlXIncludeErrMemory(ctxt, ref->elem, NULL);
> ++        goto error;
> ++    }

This if statement comes from another commit:
78eab7a1 - xinclude: Report malloc failures

It look a bit intrusive to be backported but at least we need to
reference it in the changelog.

> ++    xmlCtxtUseOptions(pctxt, ctxt->parseFlags);
> +     inputStream =3D xmlLoadExternalEntity((const char*)URL, NULL, pctxt=
);
> +     if(inputStream =3D=3D NULL)
> + 	goto error;
> [...]
> diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-c=
ore/libxml/libxml2_2.12.10.bb
> index 1b0c3d50da..c100ef2a8c 100644
> --- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
> @@ -38,6 +38,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
>             file://CVE-2026-86141.patch \
>             file://CVE-2026-86142.patch \
>             file://CVE-2026-86143.patch \
> +           file://CVE-2026-86144.patch \
>             "
> =20
>  SRC_URI[archive.sha256sum] =3D "c3d8c0c34aa39098f66576fe51969db12a5100b9=
56233dc56506f7a8679be995"

Thanks!
--=20
Yoann Congal
Smile ECS


