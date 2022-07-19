Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CAFC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 18:50:01 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.44649.1658256588601873987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 11:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oP7v600w;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id a10so18461893ljj.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 11:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Hhxz6Jg/RlO6LxuHiQ4h3pPM5yS/9u5xa0cuwh2YEo=;
        b=oP7v600wk1MD5gVvMn2j8wen+dQYsUYI9KAH+hyD3YUFN0V+4KbfNndPlWqIT25Zgq
         F+5nA+iANz7Sc9D+67H0fclNDCu6DXzdf66nvwk9VNeOnMEDw8mgo3fD5iuNL7yp+FmP
         zY/QIUNiJYX33/Rme6eUYFQ6HUcqvKorziZj4jfGGOtwQJW/zRy935C9H+P2tYAN/jK/
         pJcdeG0saipUzLn67aiOp2bwQU9hxTBzui6Tgvcn7zjDw+TLSZmHYHBCMfvn5PRsu0gt
         GZvHJRS2v+emwTLAsPip7BDLsHNDTTCSX/UMEyZ+NHQBoqInKRcEUCcq/CPoFMMM1Eez
         5mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Hhxz6Jg/RlO6LxuHiQ4h3pPM5yS/9u5xa0cuwh2YEo=;
        b=XHj30tAGqI3BYtKbXdlFACjZg8keXeBAasspl9eVS81uXiktQIpUJn6P5hoQMm7Rqb
         6dYDtFgrKPNjWraa+KVfHIR79/HR5EP+q/LUs2wxFN3FdWSYm59iXqm1lPpKFkwpb2lc
         78jmuboONQhCVucLMCDMjFInS9nfioxH+eAyQ2LASelbPJwULlldgQ0nXrUk7e9NJXmA
         h9hzO4frULfLMtshGNk42w/5+K+qkLRos8Ilwz5W6P3CthtAbjQDdph61RP1MP49NmmW
         x0N1qXtWbxvEkg1uC4ogIhuiYyTxX1DE+mxPtTMG1TI/CZwTtAVXTUSSv0HmslO6SKXM
         EUkg==
X-Gm-Message-State: AJIora+Cz0GppGln7gjSbmT9/23Iy/CeHNmChfErodV70yWaVSGbZk48
	gPw7L+KgZmYJZL/4Q/MKgkvWIcIMmkt/XmEOaiA=
X-Google-Smtp-Source: 
 AGRyM1uJWDi/z1pFzHSvVDxAVvEuzfYAm7eog7+jS9SY0QFXzmD2JzmnC1LaULLUfqUdDzfgHYKc5XZzUVDLv4XBNU8=
X-Received: by 2002:a2e:b0fc:0:b0:25d:9d38:bfb8 with SMTP id
 h28-20020a2eb0fc000000b0025d9d38bfb8mr12051477ljl.273.1658256586770; Tue, 19
 Jul 2022 11:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220712102729.24407-1-akash.hadke@kpit.com>
In-Reply-To: <20220712102729.24407-1-akash.hadke@kpit.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 19 Jul 2022 20:49:35 +0200
Message-ID: 
 <CAApg2=QcuaTVfGzM5stYO=EmHZAW-B+S3J0SxSNLV6c269fzfA@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][kirkstone][PATCH] cve-check.bbclass: Add
 anonymous function to get patched CVEs from recipe
To: Akash Hadke <akash.hadke@kpit.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 18:50:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168286

On Tue, Jul 12, 2022 at 12:28 PM akash hadke via
lists.openembedded.org <akash.hadke=kpit.com@lists.openembedded.org>
wrote:
>
> Add an anonymous function to get patched CVEs from the recipe
> and set the value to 'CVE_PATCHED' variable
> This variable later can be used to do CVE data processing
> outside of bitbake
>
> Also, introduce a new variable 'CVE_CHECK_WITH_DB' default set
> to '0', when it is set to non zero value it avoids CVE scan for
> unpatched CVEs from NVD DB.
> It will work as the second operational mode for cve-check.bbclass
> which only exports the data.
>
> Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
> ---
>  meta/classes/cve-check.bbclass | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index da7f93371c..b7f7ca73e5 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -82,6 +82,12 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
>  # set to "alphabetical" for version using single alphabetical character as increment release
>  CVE_VERSION_SUFFIX ??= ""
>
> +# set to "1" for avoiding full scan for unpatched CVEs
> +CVE_CHECK_WITH_DB ??= "0"

The default behavior is now to check with the database, so this should be at "1"
by default.

> +
> +# Patched CVEs from recipe will be assigned to this variable
> +CVE_PATCHED ??= ""
> +
>  def generate_json_report(d, out_path, link_path):
>      if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
>          import json
> @@ -133,13 +139,18 @@ python cve_save_summary_handler () {
>  addhandler cve_save_summary_handler
>  cve_save_summary_handler[eventmask] = "bb.event.BuildCompleted"
>
> +python() {
> +    from oe.cve_check import get_patched_cves
> +    d.setVar('CVE_PATCHED', " ".join(get_patched_cves(d)))
> +}
> +
>  python do_cve_check () {
>      """
>      Check recipe for patched and unpatched CVEs
>      """
>      from oe.cve_check import get_patched_cves
>
> -    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
> +    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")) and d.getVar("CVE_CHECK_WITH_DB") == "0":
>          try:
>              patched_cves = get_patched_cves(d)
>          except FileNotFoundError:

Instead of the anonymous function, you could add a condition here.


Regards,
Marta

