Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B74C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 18:20:55 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.2029.1717438852212696573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 11:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 453IJm5G027449;
	Mon, 3 Jun 2024 13:19:49 -0500
Received: from [192.168.3.156] ([192.168.3.156])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 453IJm8F009147;
	Mon, 3 Jun 2024 13:19:48 -0500
Message-ID: <1f7d1ebd-3af3-402c-b82d-38a39ed0f1c4@kernel.crashing.org>
Date: Mon, 3 Jun 2024 13:19:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC][OE-core 2/3] vex.bbclass: add a new class
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
        Samantha Jalabert <samantha.jalabert@syslinbit.com>
References: <20240531130128.1258909-1-marta.rybczynska@syslinbit.com>
 <20240531130128.1258909-2-marta.rybczynska@syslinbit.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240531130128.1258909-2-marta.rybczynska@syslinbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 18:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200278



On 5/31/24 8:01 AM, Marta Rybczynska wrote:
> The "vex" class generates the minimum information that is necessary
> by an external CVE checking tool. It is a drop-in replacement of "cve-check".
> It uses the same variables from recipes.
> 
> It generates the JSON output format only.
> 
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
> ---
>   meta/classes/vex.bbclass | 332 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 332 insertions(+)
>   create mode 100644 meta/classes/vex.bbclass
> 
> diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
> new file mode 100644
> index 0000000000..e196f73169
> --- /dev/null
> +++ b/meta/classes/vex.bbclass

...

> +
> +CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
> +CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
> +CVE_CHECK_SUMMARY_FILE_NAME_JSON = "cve-summary.json"

Should the above be:

CVE_CHECK_SUMMARY_FILE_NAME_JSON ?= "cve-summary.json"

or

CVE_CHECK_SUMMARY_FILE_NAME_JSON = "${CVE_CHECK_SUMMARY_FILE_NAME}.json"

> +CVE_CHECK_SUMMARY_INDEX_PATH = "${CVE_CHECK_SUMMARY_DIR}/cve-summary-index.txt"

Any reson for the above to be ?= or ??= ?

> +
> +CVE_CHECK_LOG_JSON ?= "${T}/cve.json"
> +
> +CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
> +CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
> +CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
> +CVE_CHECK_COPY_FILES ??= "1"
> +CVE_CHECK_CREATE_MANIFEST ??= "1"
> +
> +# Report Patched or Ignored CVEs
> +CVE_CHECK_REPORT_PATCHED ??= "1"
> +
> +CVE_CHECK_SHOW_WARNINGS ??= "1"
> +
> +# Skip CVE Check for packages (PN)
> +CVE_CHECK_SKIP_RECIPE ?= ""
> +
> +# Replace NVD DB check status for a given CVE. Each of CVE has to be mentioned
> +# separately with optional detail and description for this status.
> +#
> +# CVE_STATUS[CVE-1234-0001] = "not-applicable-platform: Issue only applies on Windows"
> +# CVE_STATUS[CVE-1234-0002] = "fixed-version: Fixed externally"
> +#
> +# Settings the same status and reason for multiple CVEs is possible
> +# via CVE_STATUS_GROUPS variable.
> +#
> +# CVE_STATUS_GROUPS = "CVE_STATUS_WIN CVE_STATUS_PATCHED"
> +#
> +# CVE_STATUS_WIN = "CVE-1234-0001 CVE-1234-0003"
> +# CVE_STATUS_WIN[status] = "not-applicable-platform: Issue only applies on Windows"
> +# CVE_STATUS_PATCHED = "CVE-1234-0002 CVE-1234-0004"
> +# CVE_STATUS_PATCHED[status] = "fixed-version: Fixed externally"
> +#
> +# All possible CVE statuses could be found in cve-check-map.conf
> +# CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
> +# CVE_CHECK_STATUSMAP[fixed-version] = "Patched"
> +#
> +# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
> +# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
> +CVE_CHECK_IGNORE ?= ""
> +
> +# Layers to be excluded
> +CVE_CHECK_LAYER_EXCLUDELIST ??= ""
> +
> +# Layers to be included
> +CVE_CHECK_LAYER_INCLUDELIST ??= ""
> +
> +
> +# set to "alphabetical" for version using single alphabetical character as increment release
> +CVE_VERSION_SUFFIX ??= ""
> +
...

