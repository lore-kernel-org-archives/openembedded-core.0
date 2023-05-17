Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E15EC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 11:08:39 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.46591.1684321708998251337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 04:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=FOBGVKey;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f27b65bbf9so813522e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684321707; x=1686913707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hlkin0/qZn0jeMa/OYw/9nRI//9YYzBGmBsE0tbX5YY=;
        b=FOBGVKeyYHsO/NOjqUapAHaR6nat6BBt7fmNLJ8G5XocNUjZdEC73O86BWhQyAXAne
         vVci0SmIcJ/JfKbH8c/OvoC2LpBNiYnESjZSwdNeZND9lqDZyDK1AV861/S6joBaO6ln
         xqXtCdUjL9sX7alGxZrtK9KvXoaaOY06Fqe8DU3+TbmKBXmn+WvmAdJT9A1i3Rb8fEUQ
         7a+2xAVXcfsClCXSWWjNZqMmMRrMZNApeL+byF7n/syE82yAhF2zA4gYfN/TJBApVDhC
         bYkHUHphWWl5WVuoVShciPkZ52QAdm5XW1YNBwpQXkRDRAunj/IIOEWMg+bo/7jlB0no
         UIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684321707; x=1686913707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlkin0/qZn0jeMa/OYw/9nRI//9YYzBGmBsE0tbX5YY=;
        b=MhwnDpEvogHeKDdXbrvzPYjLbEMUBVfiNfcAvEwolEIQ+8/jJ9Cj4GNDhXXZWD18H5
         F+ZkCm7cUNa3N5HamkTFUfYtW30k5IOqioB38tVmWWwIWWFXMQwJ2nG57Oj37vkc9eM1
         p64pg4T7zFkxDHKszCZ19IAveuGPGyEM0uApsEovL9sb6mqZhO2n7kd3ZBSv7InY3xvn
         i/rf2VP+tXZeKzcX9yhl+V9JBEALyxC+9YCTXAhih5TsKiG+EV/e3nm6gSaJ7EIic4T4
         DiMtH24nTlYNkP+RIEfHLmaIT9fDOVD3ohA3wIqMu9qT1WTH1JA8w+F9T3kJumfVJyY5
         1WCg==
X-Gm-Message-State: AC+VfDzgSl5x2TfgkfVaAMd5BuvEZIZZ5YGzviT/O4NKE1TyIHI8xqOf
	WhLtD+SiZTKhrh2R9jHopTh4gw==
X-Google-Smtp-Source: ACHHUZ4gpVbCtVAqCFOANJCsn8+L5R93xiy0RA9ordIlS3N671ltdjJA7elcNhqoW7fjyU2gL5wjpg==
X-Received: by 2002:ac2:48b4:0:b0:4eb:1527:e29d with SMTP id u20-20020ac248b4000000b004eb1527e29dmr86951lfg.52.1684321707053;
        Wed, 17 May 2023 04:08:27 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id p17-20020a05651211f100b004f155762085sm3330169lfs.122.2023.05.17.04.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:08:26 -0700 (PDT)
Date: Wed, 17 May 2023 14:08:24 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: andrej.valek@siemens.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2] cve-check: add option to add additional
 patched CVEs
Message-ID: <ZGS1qOBTMNAPFHv2@nuoska>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <20230517054138.33459-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517054138.33459-1-andrej.valek@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 11:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181485

Hi,

On Wed, May 17, 2023 at 07:41:38AM +0200, Andrej Valek via lists.openembedded.org wrote:
> - Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_REASONING] to be
> more flexible. CVE_STATUS should contains flag for each CVE with accepted
> values "Ignored" or "Not applicable". It allows to add a status for CVEs
> which could be fixed externally.
> - Optional CVE_STATUS_REASONING flag variable could contains a reason
> why the CVE status was used. It will be added in csv/json report like
> a new "reason" entry.
> - All listed CVEs in CVE_CHECK_IGNORE are copied to CVE_STATUS with
> value "Ignored" like a fallback.
> 
> Example of usage:
> CVE_STATUS[CVE-1234-0001] = "Not applicable" or "Ignored"
> CVE_STATUS[CVE-1234-0002] = "Not applicable"
> CVE_STATUS_REASONING[CVE-1234-0002] = "Issue only applies on windows"

Looks good to me but would you add testing into
meta/lib/oeqa/selftest/cases/cve_check.py ?

And once merged update documentation in
documentation/dev-manual/vulnerabilities.rst,
documentation/ref-manual/classes.rst and
documentation/ref-manual/variables.rst ;)

Thanks,

-Mikko

> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/classes/cve-check.bbclass | 30 +++++++++++++++++++++++++-----
>  meta/lib/oe/cve_check.py       |  6 ++++++
>  2 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index bd9e7e7445c..e081095037c 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -70,13 +70,17 @@ CVE_CHECK_COVERAGE ??= "1"
>  # Skip CVE Check for packages (PN)
>  CVE_CHECK_SKIP_RECIPE ?= ""
>  
> -# Ingore the check for a given list of CVEs. If a CVE is found,
> -# then it is considered patched. The value is a string containing
> -# space separated CVE values:
> +# Ignore the check for a given CVE. Each of CVE has to be mentioned
> +# separately with optional reason, why it has to ignored.
>  #
> -# CVE_CHECK_IGNORE = 'CVE-2014-2524 CVE-2018-1234'
> +# CVE_STATUS[CVE-1234-0001] = "Not applicable" or "Ignored"
> +# CVE_STATUS[CVE-1234-0002] = "Ignored"
> +# CVE_STATUS_REASONING[CVE-1234-0002] = "Issue only applies on windows"
>  #
> +# CVE_CHECK_IGNORE is depracated and CVE_STATUS has to be used instead.
> +# Keep CVE_CHECK_IGNORE like a fallback.
>  CVE_CHECK_IGNORE ?= ""
> +CVE_STATUS ?= ""
>  
>  # Layers to be excluded
>  CVE_CHECK_LAYER_EXCLUDELIST ??= ""
> @@ -88,6 +92,12 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
>  # set to "alphabetical" for version using single alphabetical character as increment release
>  CVE_VERSION_SUFFIX ??= ""
>  
> +python () {
> +    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
> +    for cve in d.getVar("CVE_CHECK_IGNORE").split():
> +        d.setVarFlags("CVE_STATUS", {cve: "Ignored"})
> +}
> +
>  def generate_json_report(d, out_path, link_path):
>      if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
>          import json
> @@ -282,7 +292,11 @@ def check_cves(d, patched_cves):
>          bb.note("Recipe has been skipped by cve-check")
>          return ([], [], [], [])
>  
> -    cve_ignore = d.getVar("CVE_CHECK_IGNORE").split()
> +    # Convert CVE_STATUS into ignored CVEs
> +    cve_ignore = []
> +    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
> +        if status in ["Not applicable", "Ignored"]:
> +            cve_ignore.append(cve)
>  
>      import sqlite3
>      db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
> @@ -455,6 +469,9 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>          else:
>              unpatched_cves.append(cve)
>              write_string += "CVE STATUS: Unpatched\n"
> +        has_reason = d.getVarFlag("CVE_STATUS_REASONING", cve)
> +        if has_reason:
> +            write_string += "CVE REASON: %s\n" % has_reason
>          write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
>          write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
>          write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
> @@ -576,6 +593,9 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>              "status" : status,
>              "link": issue_link
>          }
> +        has_reason = d.getVarFlag("CVE_STATUS_REASONING", cve)
> +        if has_reason:
> +            cve_item["reason"] = has_reason
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

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181444): https://lists.openembedded.org/g/openembedded-core/message/181444
> Mute This Topic: https://lists.openembedded.org/mt/98943046/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


