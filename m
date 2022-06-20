Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5A5C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 17:31:18 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.32979.1655746277200513278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 10:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HDqWSz2d;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id cf14so6306805edb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u1bE8L92GMTHip3t4+D4GLc1RXTb//CUjdzMYBAcqfA=;
        b=HDqWSz2dVlBGYnplv5FTmhgPrP50GYbmQ1DQ28hyH4ERFPMbVqMcxYZ0IKX489gMvx
         TLgZrjzvyenO+BppHqIsW0PeujTUMdqCVEnpLiwAyy4HKmEvXhc4BNS2YUnUBwlT3J0Y
         4xcnZbrI4Zb21jcb4FMltV+lvM4HPzFrl93YmEd571GDZprCbkf0qdpVs1oqYlZtMmKW
         Yc//sPpuU3S6tBJKy4SS8LqyC2KihbXdVYHa+ubJh3FPlY3Ak91OwZd6BP5jipY984tq
         C3W0riiqtFSkVw35gRG4o2rfezlXkSezTlfAJyy53KPqYJIqhNcxlDPY0TyWn+vO95Z1
         eoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u1bE8L92GMTHip3t4+D4GLc1RXTb//CUjdzMYBAcqfA=;
        b=c1dGDScYPlrubyJM+N6Ue5RUZOGBgtgjgFu9neJC92Dl9g1+0b9vFao8nnA1BYh3w9
         mbAEcVlPDVBpVp78gHpO1IaImYwtvGTla708Mtz5MzLEKGY5+mW6GFkUeu+J8AIArVDC
         heTTQInlPtNH3oQfCLqdpPJM6RYBeh5sGylnS/5JYSxv3oY9jSukyx0y1NwcR88kIhTD
         5PseH8UgeGmyVJ/HTobajaFMuoD+/PfurQxRBdJo+KgBS0k8vyb1lJjyONUm4+9k5Ok0
         2Igel7y4/7TP99ptSa756GZJpe3OYcMhNu8OmJLhr980OJZafkpKKP31PO3WmhcTIJBe
         j3+A==
X-Gm-Message-State: AJIora9U76aAODmmktyWleMKaKSMEc5Mjk5B6SzwBsAAYCsw20ZHgQ2O
	YKyl9vuCZXvbtT4uI6+wewOw5cAHh+udhye1qtsYSA==
X-Google-Smtp-Source: 
 AGRyM1vHWB0+w5bMJwhYHtoS5vPk1AoDqCNOQlXbQQP1A6RbZq94Y5X8EGOwJWj/6VTiV/DOH/O+V7o8BEd2pmk+wB4=
X-Received: by 2002:a05:6402:5409:b0:42a:a643:4eb8 with SMTP id
 ev9-20020a056402540900b0042aa6434eb8mr31184652edb.71.1655746275352; Mon, 20
 Jun 2022 10:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220615132011.2432008-1-rybczynska@gmail.com>
In-Reply-To: <20220615132011.2432008-1-rybczynska@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 20 Jun 2022 07:31:04 -1000
Message-ID: 
 <CAOSpxdaSNfEy+ny18Y5vbeaZzYjdsc8P77HGzMRNbqLNBDxkBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] cve-check: add support for Ignored CVEs
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 17:31:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167123

Hi Marta,

Do you plan to submit a similar series for dunfell? It would be good
to keep the LTS and master branches in sync for CVE checking.

Steve

On Wed, Jun 15, 2022 at 3:20 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> Ignored CVEs aren't patched, but do not apply in our configuration
> for some reason. Up till now they were only partially supported
> and reported as "Patched".
>
> This patch adds separate reporting of Ignored CVEs. The variable
> CVE_CHECK_REPORT_PATCHED now manages reporting of both patched
> and ignored CVEs.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> ---
> Changes in v2:
>     - fix JSON generation with CVE_CHECK_REPORT_PATCHED enabled/disabled
> ---
>  meta/classes/cve-check.bbclass | 43 ++++++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 1b4910f737..50b9247f46 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -47,7 +47,9 @@ CVE_CHECK_MANIFEST_JSON ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX
>  CVE_CHECK_COPY_FILES ??= "1"
>  CVE_CHECK_CREATE_MANIFEST ??= "1"
>
> +# Report Patched or Ignored CVEs
>  CVE_CHECK_REPORT_PATCHED ??= "1"
> +
>  CVE_CHECK_SHOW_WARNINGS ??= "1"
>
>  # Provide text output
> @@ -144,7 +146,7 @@ python do_cve_check () {
>              bb.fatal("Failure in searching patches")
>          ignored, patched, unpatched, status = check_cves(d, patched_cves)
>          if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
> -            cve_data = get_cve_info(d, patched + unpatched)
> +            cve_data = get_cve_info(d, patched + unpatched + ignored)
>              cve_write_data(d, patched, unpatched, ignored, cve_data, status)
>      else:
>          bb.note("No CVE database found, skipping CVE check")
> @@ -258,6 +260,7 @@ def check_cves(d, patched_cves):
>      suffix = d.getVar("CVE_VERSION_SUFFIX")
>
>      cves_unpatched = []
> +    cves_ignored = []
>      cves_status = []
>      cves_in_recipe = False
>      # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
> @@ -291,9 +294,8 @@ def check_cves(d, patched_cves):
>              cve = cverow[0]
>
>              if cve in cve_ignore:
> -                bb.note("%s-%s has been ignored for %s" % (product, pv, cve))
> -                # TODO: this should be in the report as 'ignored'
> -                patched_cves.add(cve)
> +                bb.note("%s-%s ignores %s" % (product, pv, cve))
> +                cves_ignored.append(cve)
>                  continue
>              elif cve in patched_cves:
>                  bb.note("%s has been patched" % (cve))
> @@ -305,9 +307,13 @@ def check_cves(d, patched_cves):
>                  cves_in_recipe = True
>
>              vulnerable = False
> +            ignored = False
> +
>              for row in conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)):
>                  (_, _, _, version_start, operator_start, version_end, operator_end) = row
>                  #bb.debug(2, "Evaluating row " + str(row))
> +                if cve in cve_ignore:
> +                    ignored = True
>
>                  if (operator_start == '=' and pv == version_start) or version_start == '-':
>                      vulnerable = True
> @@ -340,13 +346,16 @@ def check_cves(d, patched_cves):
>                          vulnerable = vulnerable_start or vulnerable_end
>
>                  if vulnerable:
> -                    bb.note("%s-%s is vulnerable to %s" % (pn, real_pv, cve))
> -                    cves_unpatched.append(cve)
> +                    if ignored:
> +                        bb.note("%s is ignored in %s-%s" % (cve, pn, real_pv))
> +                        cves_ignored.append(cve)
> +                    else:
> +                        bb.note("%s-%s is vulnerable to %s" % (pn, real_pv, cve))
> +                        cves_unpatched.append(cve)
>                      break
>
>              if not vulnerable:
>                  bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cve))
> -                # TODO: not patched but not vulnerable
>                  patched_cves.add(cve)
>
>          if not cves_in_product:
> @@ -358,7 +367,7 @@ def check_cves(d, patched_cves):
>      if not cves_in_recipe:
>          bb.note("No CVE records for products in recipe %s" % (pn))
>
> -    return (list(cve_ignore), list(patched_cves), cves_unpatched, cves_status)
> +    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_status)
>
>  def get_cve_info(d, cves):
>      """
> @@ -396,6 +405,8 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>      include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
>      exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
>
> +    report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
> +
>      if exclude_layers and layer in exclude_layers:
>          return
>
> @@ -403,7 +414,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>          return
>
>      # Early exit, the text format does not report packages without CVEs
> -    if not patched+unpatched:
> +    if not patched+unpatched+ignored:
>          return
>
>      nvd_link = "https://nvd.nist.gov/vuln/detail/"
> @@ -413,13 +424,16 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>
>      for cve in sorted(cve_data):
>          is_patched = cve in patched
> -        if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
> +        is_ignored = cve in ignored
> +
> +        if (is_patched or is_ignored) and not report_all:
>              continue
> +
>          write_string += "LAYER: %s\n" % layer
>          write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
>          write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
>          write_string += "CVE: %s\n" % cve
> -        if cve in ignored:
> +        if is_ignored:
>              write_string += "CVE STATUS: Ignored\n"
>          elif is_patched:
>              write_string += "CVE STATUS: Patched\n"
> @@ -496,6 +510,8 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>      include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
>      exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
>
> +    report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
> +
>      if exclude_layers and layer in exclude_layers:
>          return
>
> @@ -522,10 +538,11 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>
>      for cve in sorted(cve_data):
>          is_patched = cve in patched
> +        is_ignored = cve in ignored
>          status = "Unpatched"
> -        if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
> +        if (is_patched or is_ignored) and not report_all:
>              continue
> -        if cve in ignored:
> +        if is_ignored:
>              status = "Ignored"
>          elif is_patched:
>              status = "Patched"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166986): https://lists.openembedded.org/g/openembedded-core/message/166986
> Mute This Topic: https://lists.openembedded.org/mt/91775990/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

