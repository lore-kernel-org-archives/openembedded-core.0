Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9FEC77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 06:56:36 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.20096.1684479387308602017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 23:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=v1Il7gL/;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f3af4295ddso329619e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 23:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684479385; x=1687071385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=icu1S9GevR2IzJiYpsbR0o2xZM8w60/2YZYBjDuWDOU=;
        b=v1Il7gL/qWGof2ThHUzUg+cNYtC1StXgz2o+OiZT/VafNtFpRZUzTQxNmi9iSqQMTw
         5BUwtDgaX6ckWLPJOmbk1iVf5IsHXFGzs99gPSMwyLy3sEKBzaA3O0Zkzv1gTkel5NaW
         89g+djl5TeG9n7H3Q9gbEp+7C2zWnZxtEy+l2RYaVCUsQKN+GzXQmB5pVmHmqjs7AjDH
         V7XzSw6oVBBVqymyxdUfBHe+dsxtypO+OMvE8xrnW4v7HX9Rkd5pRGaghtYjWthedOfV
         jECun4pWw4jVz/wTw8LuHptVH1At/3ZkA4qZDYyp2i/5awAGogIW9mUoNbeD3HC34vkF
         r1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684479385; x=1687071385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icu1S9GevR2IzJiYpsbR0o2xZM8w60/2YZYBjDuWDOU=;
        b=DQRrCz5kSFvHnP9pTgOzy6LHx4Mpx0uU0lc+ImXpElxueZRCokuW8Mb4YThz7Dr1vT
         FTjDVDTeNHGGLHDS2cluaw8sXdfqok3Oba57oTiKwD/xeQgxKHpuDOhYDT5NF97uJ+UY
         kdME1fOI8ZmrqPBqZt8YILITj3LfAiU9C3MuiglMYMPO2UsdHA3Oambq7OHg84wnmlOM
         hs5dFePpB/77HKC1r+D/MeDMhTNH/ZNQupwZsKySTTAr4cv+l6FxgJZw1/A6IfMkXbC2
         7dmbnMLBVv+y2e70cV+YD38AWnWwk9GxDvxmpv4YXKDw+cUr1i8YuHtqXU12VXo5JCiz
         i7/A==
X-Gm-Message-State: AC+VfDzJZ6UNdU8i/xWtvnydaMkKD1ZaYeM+9nWpqcCgXhAgWo23sExa
	IOUInunHixrk75KhxXD2tFs69A==
X-Google-Smtp-Source: ACHHUZ5MStrEHqo4zrhlk920ub4v5uCFreK4yfLsVOUWdKRZS9ubBGB41GXLoROod0dlgnz6Em8KwA==
X-Received: by 2002:ac2:4c39:0:b0:4db:964:51b5 with SMTP id u25-20020ac24c39000000b004db096451b5mr418068lfq.41.1684479385227;
        Thu, 18 May 2023 23:56:25 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id b15-20020ac25e8f000000b004ec84d24818sm492193lfq.282.2023.05.18.23.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 23:56:24 -0700 (PDT)
Date: Fri, 19 May 2023 09:56:22 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-core@lists.openembedded.org,
	Peter Marko <peter.marko@siemens.com>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
Message-ID: <ZGcdlmHgJ063SFYv@nuoska>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <20230519062420.37015-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519062420.37015-1-andrej.valek@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 06:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181534

Hi,

Looks really good but could you split the documentation to separate
patch and send to docs@lists.yoctoproject.org instead of oe-core?

Thanks!

-Mikko

On Fri, May 19, 2023 at 08:24:18AM +0200, Andrej Valek wrote:
> - Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_REASONING] to be
> more flexible. CVE_STATUS should contain flag for each CVE with accepted
> values "Ignored", "Not applicable" or "Patched". It allows to add
> a status for each CVEs.
> - Optional CVE_STATUS_REASONING flag variable may contain a reason
> why the CVE status was used. It will be added in csv/json report like
> a new "reason" entry.
> - Settings the same status and reason for multiple CVEs is possible
> via CVE_STATUS_GROUPS variable.
> - All listed CVEs in CVE_CHECK_IGNORE are copied to CVE_STATUS with
> value "Ignored" like a fallback.
> 
> Examples of usage:
> CVE_STATUS[CVE-1234-0001] = "Ignored" # or "Not applicable" or "Patched"
> CVE_STATUS[CVE-1234-0002] = "Not applicable"
> CVE_STATUS_REASONING[CVE-1234-0002] = "Issue only applies on Windows"
> 
> CVE_STATUS_GROUPS = "CVE_STATUS_WIN CVE_STATUS_PATCHED"
> CVE_STATUS_WIN = "CVE-1234-0001 CVE-1234-0002"
> CVE_STATUS_WIN[status] = "Not applicable"
> CVE_STATUS_WIN[reason] = "Issue only applies on Windows"
> 
> CVE_STATUS_PATCHED = "CVE-1234-0003 CVE-1234-0004"
> CVE_STATUS_PATCHED[status] = "Patched"
> CVE_STATUS_PATCHED[reason] = "Fixed externally"
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  documentation/dev-manual/new-recipe.rst      |  4 +-
>  documentation/dev-manual/vulnerabilities.rst | 11 ++---
>  documentation/ref-manual/classes.rst         |  9 ++--
>  documentation/ref-manual/variables.rst       | 33 ++++++++++++---
>  meta/classes/cve-check.bbclass               | 44 +++++++++++++++++---
>  meta/lib/oe/cve_check.py                     |  6 +++
>  6 files changed, 87 insertions(+), 20 deletions(-)
> 
> diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
> index 4e74246a4e9..008f4b1ceb7 100644
> --- a/documentation/dev-manual/new-recipe.rst
> +++ b/documentation/dev-manual/new-recipe.rst
> @@ -1253,8 +1253,8 @@ In the following example, ``lz4`` is a makefile-based package::
>  
>     S = "${WORKDIR}/git"
>  
> -   # Fixed in r118, which is larger than the current version.
> -   CVE_CHECK_IGNORE += "CVE-2014-4715"
> +   CVE_STATUS[CVE-2014-4715] = "Patched"
> +   CVE_STATUS_REASONING[CVE-2014-4715] = "Fixed in r118, which is larger than the current version"
>  
>     EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
>  
> diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
> index 0ee3ec52c5c..ca1ea87ba7e 100644
> --- a/documentation/dev-manual/vulnerabilities.rst
> +++ b/documentation/dev-manual/vulnerabilities.rst
> @@ -158,7 +158,8 @@ CVE checker will then capture this information and change the CVE status to ``Pa
>  in the generated reports.
>  
>  If analysis shows that the CVE issue does not impact the recipe due to configuration, platform,
> -version or other reasons, the CVE can be marked as ``Ignored`` using the :term:`CVE_CHECK_IGNORE` variable.
> +version or other reasons, the CVE can be marked as ``Ignored`` or ``Not applicable`` using
> +the :term:`CVE_STATUS[]` variable flag.
>  As mentioned previously, if data in the CVE database is wrong, it is recommend to fix those
>  issues in the CVE database directly.
>  
> @@ -182,11 +183,11 @@ products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
>  -  If the package name (:term:`PN`) is part of
>     :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as ``Patched``.
>  
> --  If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
> -   set as ``Ignored``.
> +-  If the CVE ID has status :term:`CVE_STATUS[<CVE ID>] = "Ignored"`, it is
> +   set as ``Ignored`` as same as for :term:`CVE_STATUS[<CVE ID>] = "Not applicable"`.
>  
> --  If the CVE ID is part of the patched CVE for the recipe, it is
> -   already considered as ``Patched``.
> +-  If the CVE ID is part of the patched CVE for the recipe or has status
> +   :term:`CVE_STATUS[<CVE ID>] = "Patched"`, it is considered as ``Patched``.
>  
>  -  Otherwise, the code checks whether the recipe version (:term:`PV`)
>     is within the range of versions impacted by the CVE. If so, the CVE
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index ab1628401e9..2811244b8f7 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -517,10 +517,13 @@ The ``Patched`` state of a CVE issue is detected from patch files with the forma
>  ``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` and using
>  CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch file.
>  
> -If the recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, then the CVE state is reported
> -as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
> +If the recipe adds the ``CVE-ID`` as flag of :term:`CVE_STATUS` variable with status
> +``Ignored`` or ``Not applicable``, then the CVE state is reported as ``Ignored``.
>  
> -   CVE_CHECK_IGNORE += "CVE-2020-29509 CVE-2020-29511"
> +   CVE_STATUS[CVE-2020-15523] = "Ignored"
> +
> +Possible CVE's statuses are ``Ignored``, ``Not applicable`` and ``Patched``.
> +Check :ref:`ref-variables-CVE_STATUS` for more details.
>  
>  If CVE check reports that a recipe contains false positives or false negatives, these may be
>  fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUCT` and :term:`CVE_VERSION` variables.
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6ee65e17884..cd5f1d65d27 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1653,11 +1653,7 @@ system and gives an overview of their function and contents.
>           and kernel module recipes).
>  
>     :term:`CVE_CHECK_IGNORE`
> -      The list of CVE IDs which are ignored. Here is
> -      an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`::
> -
> -         # This is windows only issue.
> -         CVE_CHECK_IGNORE += "CVE-2020-15523"
> +      Is deprecated and should be replaced by :term:`CVE_STATUS`
>  
>     :term:`CVE_CHECK_SHOW_WARNINGS`
>        Specifies whether or not the :ref:`ref-classes-cve-check`
> @@ -1698,6 +1694,33 @@ system and gives an overview of their function and contents.
>  
>           CVE_PRODUCT = "vendor:package"
>  
> +   :term:`CVE_STATUS`
> +      The CVE ID which is patched or should be ignored. Here is
> +      an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`::
> +
> +         CVE_STATUS[CVE-2020-15523] = "Ignored"
> +
> +      Possible CVE's statuses ``Ignored``, ``Not applicable`` or ``Patched``, while the ``reasoning``
> +      is optional.
> +
> +   :term:`CVE_STATUS_GROUPS`
> +      If there is a many CVEs with the same status and reason can by simplified by using this
> +      variable instead of many similar lines with ``CVE_STATUS`` and ``CVE_STATUS_REASONING``
> +
> +         CVE_STATUS_GROUPS = "CVE_STATUS_WIN CVE_STATUS_PATCHED"
> +         CVE_STATUS_WIN = "CVE-1234-0001 CVE-1234-0002"
> +         CVE_STATUS_WIN[status] = "Not applicable"
> +         CVE_STATUS_WIN[reason] = "Issue only applies on Windows"
> +
> +         CVE_STATUS_PATCHED = "CVE-1234-0003 CVE-1234-0004"
> +         CVE_STATUS_PATCHED[status] = "Patched"
> +         CVE_STATUS_PATCHED[reason] = "Fixed externally"
> +
> +   :term:`CVE_STATUS_REASONING`
> +      Optional explanation for :term:`CVE_STATUS`
> +
> +         CVE_STATUS_REASONING[CVE-2020-15523] = "Issue only applies on Windows"
> +
>     :term:`CVE_VERSION`
>        In a recipe, defines the version used to match the recipe version
>        against the version in the `NIST CVE database <https://nvd.nist.gov/>`__
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index bd9e7e7445c..44462de7445 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -70,12 +70,15 @@ CVE_CHECK_COVERAGE ??= "1"
>  # Skip CVE Check for packages (PN)
>  CVE_CHECK_SKIP_RECIPE ?= ""
>  
> -# Ingore the check for a given list of CVEs. If a CVE is found,
> -# then it is considered patched. The value is a string containing
> -# space separated CVE values:
> +# Replace NVD DB check status for a given CVE. Each of CVE has to be mentioned
> +# separately with optional reason for this status.
>  #
> -# CVE_CHECK_IGNORE = 'CVE-2014-2524 CVE-2018-1234'
> +# CVE_STATUS[CVE-1234-0001] = "Ignored" # or "Not applicable" or "Patched"
> +# CVE_STATUS[CVE-1234-0002] = "Not applicable"
> +# CVE_STATUS_REASONING[CVE-1234-0002] = "Issue only applies on Windows"
>  #
> +# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
> +# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
>  CVE_CHECK_IGNORE ?= ""
>  
>  # Layers to be excluded
> @@ -88,6 +91,25 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
>  # set to "alphabetical" for version using single alphabetical character as increment release
>  CVE_VERSION_SUFFIX ??= ""
>  
> +python () {
> +    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
> +    cve_check_ignore = d.getVar("CVE_CHECK_IGNORE")
> +    if cve_check_ignore:
> +        bb.warn("CVE_CHECK_IGNORE has been deprecated, use CVE_STATUS instead")
> +        set_cves_statuses(d, d.getVar("CVE_CHECK_IGNORE"), "Ignored")
> +
> +    # Process CVE_STATUS_GROUPS to set multiple statuses and optional reasons at once
> +    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split():
> +        set_cves_statuses(d, d.getVar(cve_status_group) or "",
> +                          d.getVarFlag(cve_status_group, "status"),
> +                          d.getVarFlag(cve_status_group, "reason"))
> +}
> +
> +def set_cves_statuses(d, cves, status, reason=""):
> +    for cve in cves.split():
> +        d.setVarFlag("CVE_STATUS", cve, status)
> +        d.setVarFlag("CVE_STATUS_REASONING", cve, reason)
> +
>  def generate_json_report(d, out_path, link_path):
>      if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
>          import json
> @@ -282,7 +304,13 @@ def check_cves(d, patched_cves):
>          bb.note("Recipe has been skipped by cve-check")
>          return ([], [], [], [])
>  
> -    cve_ignore = d.getVar("CVE_CHECK_IGNORE").split()
> +    # Convert CVE_STATUS into ignored CVEs and check validity
> +    cve_ignore = []
> +    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
> +        if status in ["Not applicable", "Ignored"]:
> +            cve_ignore.append(cve)
> +        elif status not in ["Patched"]:
> +            bb.error("Unsupported status %s in CVE_STATUS[%s]" % (status, cve))
>  
>      import sqlite3
>      db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
> @@ -455,6 +483,9 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>          else:
>              unpatched_cves.append(cve)
>              write_string += "CVE STATUS: Unpatched\n"
> +        reasoning = d.getVarFlag("CVE_STATUS_REASONING", cve)
> +        if reasoning:
> +            write_string += "CVE REASON: %s\n" % reasoning
>          write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
>          write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
>          write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
> @@ -576,6 +607,9 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>              "status" : status,
>              "link": issue_link
>          }
> +        reasoning = d.getVarFlag("CVE_STATUS_REASONING", cve)
> +        if reasoning:
> +            cve_item["reason"] = reasoning
>          cve_list.append(cve_item)
>  
>      package_data["issue"] = cve_list
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index dbaa0b373a3..f47dd9920ef 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -130,6 +130,12 @@ def get_patched_cves(d):
>          if not fname_match and not text_match:
>              bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
>  
> +    # Search for additional patched CVEs
> +    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
> +        if status == "Patched":
> +            bb.debug(2, "CVE %s is additionally patched" % cve)
> +            patched_cves.add(cve)
> +
>      return patched_cves
>  
>  
> -- 
> 2.40.1
> 

