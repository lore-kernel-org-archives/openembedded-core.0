Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8939BC0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 06:44:16 +0000 (UTC)
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
 by mx.groups.io with SMTP id smtpd.web10.167892.1698216246450158267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 23:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=aLzocD04;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=aLzocD04;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.163, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.112.33] ([20.86.218.51])
	by cmgsmtp with ESMTPSA
	id vXcYqEWcOsdmGvXcYqSV6f; Wed, 25 Oct 2023 08:44:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1698216244; bh=I/11N+Nivh4E49Aoh2VGyNdZ1RBYt70fakdskk/Fow8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=aLzocD04xYlt4uKZhpe4ZFGJAcEMxpK+YCjemcLXewO28kgscaPmkNTnl8uKsaOj2
	 PWfNZd4Hs/Gex3g3GAuJ1+uwJlhSA9N6c+SbHQcrbWBRv+hgc+muEhDokJodNupxMH
	 LZmKrb7sGUHYRUV/Bj+1H/A1XTPWXVBQH9O8DqgYlwN1sSsh1EOAuDMIaoBwDTSVMR
	 LiX1Sx5u1/bIgCdA2EfIoFFUMn/+im1YCneTdbAuv+u+bj/kxmDC7+xd/i+msDOZ65
	 5etaZP6RnojzG9NjM/eXn0gujYRXb+B1tfTAgHRQQQXwPwYyqvcsurWcMcmC7Ta5SN
	 lb/9bKHQcXp9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1698216244; bh=I/11N+Nivh4E49Aoh2VGyNdZ1RBYt70fakdskk/Fow8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=aLzocD04xYlt4uKZhpe4ZFGJAcEMxpK+YCjemcLXewO28kgscaPmkNTnl8uKsaOj2
	 PWfNZd4Hs/Gex3g3GAuJ1+uwJlhSA9N6c+SbHQcrbWBRv+hgc+muEhDokJodNupxMH
	 LZmKrb7sGUHYRUV/Bj+1H/A1XTPWXVBQH9O8DqgYlwN1sSsh1EOAuDMIaoBwDTSVMR
	 LiX1Sx5u1/bIgCdA2EfIoFFUMn/+im1YCneTdbAuv+u+bj/kxmDC7+xd/i+msDOZ65
	 5etaZP6RnojzG9NjM/eXn0gujYRXb+B1tfTAgHRQQQXwPwYyqvcsurWcMcmC7Ta5SN
	 lb/9bKHQcXp9g==
Message-ID: <a69cb061-306a-4895-b0f9-28eb1c9ecc37@skyrain.eu>
Date: Wed, 25 Oct 2023 08:44:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] cve-check: Classify patched CVEs into 3
 statuses
To: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>, rybczynska@gmail.com,
 richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
 Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
References: <20230922083400.3157-1-shin.matsunaga@fujitsu.com>
 <20231025051344.24088-1-shin.matsunaga@fujitsu.com>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <20231025051344.24088-1-shin.matsunaga@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPe2P9cHWqGqnsggITg61ZY2VJarxv5CRtQcWjLg+bydOjX4VPGVkLNObKTFYEPXH16VKbXk8JN22PEbSFc/vr/o8N5f9mcZD0jrToARevLbTgYYieuS
 CSgKkPoXmrV5A4VJI+VZtGnQ8QfxC6UaTxVmtSZ71Sw9iwbw9O+NwekVHIHdWPP7NQaLxG+1bYEzTdGpZFgbDpBlZ6zsB0Ynhid6Bm+haJ/KxIaYPW4SNUXk
 hp18DmGSXGFi51Qa7OLs3qtl930y6Fi/03KLOQzlafA9DTIpI08WsABKZr0Uq/sQgBsE6CvX1zXpUsj+5uzx5eMC9V9RztKdzQOqo8vx2XqkWr8e8uu3ypvH
 g12WgcF5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 06:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189670

Hi all,

Do we really need a new "not_affected" state? I guess the ignore state 
is exactly designed for those purposes.

Regards,
Andrej

On 25.10.2023 07:13, Matsunaga-Shinji wrote:
> CVEs that are currently considered "Patched" are classified into the following 3 statuses:
> 1. "Patched"      - means that a patch file that fixed the vulnerability has been applied
> 2. "Not affected" - means that the package version (PV) is not affected by the vulnerability
> 3. "Undecidable"  - means that versions cannot be compared to determine if they are affected by the vulnerability
>
> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
> Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
> ---
>
> Changes for v2:
>     - Fix the status "Out of range" to "Not affected"
>
>   meta/classes/cve-check.bbclass | 55 +++++++++++++++++++++++-----------
>   1 file changed, 38 insertions(+), 17 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index b55f4299da..502db324df 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -185,10 +185,10 @@ python do_cve_check () {
>                   patched_cves = get_patched_cves(d)
>               except FileNotFoundError:
>                   bb.fatal("Failure in searching patches")
> -            ignored, patched, unpatched, status = check_cves(d, patched_cves)
> -            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
> -                cve_data = get_cve_info(d, patched + unpatched + ignored)
> -                cve_write_data(d, patched, unpatched, ignored, cve_data, status)
> +            ignored, patched, unpatched, not_affected, undecidable, status = check_cves(d, patched_cves)
> +            if patched or unpatched or not_affected or undecidable or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
> +                cve_data = get_cve_info(d, patched + unpatched + ignored + not_affected + undecidable)
> +                cve_write_data(d, patched, unpatched, ignored, not_affected, undecidable, cve_data, status)
>           else:
>               bb.note("No CVE database found, skipping CVE check")
>   
> @@ -308,13 +308,13 @@ def check_cves(d, patched_cves):
>       products = d.getVar("CVE_PRODUCT").split()
>       # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
>       if not products:
> -        return ([], [], [], [])
> +        return ([], [], [], [], [], [])
>       pv = d.getVar("CVE_VERSION").split("+git")[0]
>   
>       # If the recipe has been skipped/ignored we return empty lists
>       if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
>           bb.note("Recipe has been skipped by cve-check")
> -        return ([], [], [], [])
> +        return ([], [], [], [], [], [])
>   
>       # Convert CVE_STATUS into ignored CVEs and check validity
>       cve_ignore = []
> @@ -328,6 +328,8 @@ def check_cves(d, patched_cves):
>       conn = sqlite3.connect(db_file, uri=True)
>   
>       # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
> +    cves_not_affected = []
> +    cves_undecidable = []
>       for product in products:
>           cves_in_product = False
>           if ":" in product:
> @@ -355,6 +357,7 @@ def check_cves(d, patched_cves):
>   
>               vulnerable = False
>               ignored = False
> +            undecidable = False
>   
>               product_cursor = conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor))
>               for row in product_cursor:
> @@ -376,7 +379,7 @@ def check_cves(d, patched_cves):
>                           except:
>                               bb.warn("%s: Failed to compare %s %s %s for %s" %
>                                       (product, pv, operator_start, version_start, cve))
> -                            vulnerable_start = False
> +                            undecidable = True
>                       else:
>                           vulnerable_start = False
>   
> @@ -387,10 +390,15 @@ def check_cves(d, patched_cves):
>                           except:
>                               bb.warn("%s: Failed to compare %s %s %s for %s" %
>                                       (product, pv, operator_end, version_end, cve))
> -                            vulnerable_end = False
> +                            undecidable = True
>                       else:
>                           vulnerable_end = False
>   
> +                    if undecidable:
> +                        bb.note("%s-%s is undecidable to %s" % (pn, real_pv, cve))
> +                        cves_undecidable.append(cve)
> +                        break
> +
>                       if operator_start and operator_end:
>                           vulnerable = vulnerable_start and vulnerable_end
>                       else:
> @@ -406,9 +414,9 @@ def check_cves(d, patched_cves):
>                       break
>               product_cursor.close()
>   
> -            if not vulnerable:
> +            if not undecidable and not vulnerable:
>                   bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cve))
> -                patched_cves.add(cve)
> +                cves_not_affected.append(cve)
>           cve_cursor.close()
>   
>           if not cves_in_product:
> @@ -420,7 +428,7 @@ def check_cves(d, patched_cves):
>       if not cves_in_recipe:
>           bb.note("No CVE records for products in recipe %s" % (pn))
>   
> -    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_status)
> +    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_not_affected, cves_undecidable, cves_status)
>   
>   def get_cve_info(d, cves):
>       """
> @@ -447,7 +455,7 @@ def get_cve_info(d, cves):
>       conn.close()
>       return cve_data
>   
> -def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
> +def cve_write_data_text(d, patched, unpatched, ignored, not_affected, undecidable, cve_data):
>       """
>       Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
>       CVE manifest if enabled.
> @@ -471,7 +479,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>           return
>   
>       # Early exit, the text format does not report packages without CVEs
> -    if not patched+unpatched+ignored:
> +    if not patched+unpatched+ignored+not_affected+undecidable:
>           return
>   
>       nvd_link = "https://nvd.nist.gov/vuln/detail/"
> @@ -482,6 +490,8 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>       for cve in sorted(cve_data):
>           is_patched = cve in patched
>           is_ignored = cve in ignored
> +        is_not_affected = cve in not_affected
> +        is_undecidable = cve in undecidable
>   
>           status = "Unpatched"
>           if (is_patched or is_ignored) and not report_all:
> @@ -490,6 +500,10 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>               status = "Ignored"
>           elif is_patched:
>               status = "Patched"
> +        elif is_not_affected:
> +            status = "Not affected"
> +        elif is_undecidable:
> +            status = "Undecidable"
>           else:
>               # default value of status is Unpatched
>               unpatched_cves.append(cve)
> @@ -561,7 +575,7 @@ def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_fi
>           with open(index_path, "a+") as f:
>               f.write("%s\n" % fragment_path)
>   
> -def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
> +def cve_write_data_json(d, patched, unpatched, ignored, not_affected, undecidable, cve_data, cve_status):
>       """
>       Prepare CVE data for the JSON format, then write it.
>       """
> @@ -606,6 +620,9 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>       for cve in sorted(cve_data):
>           is_patched = cve in patched
>           is_ignored = cve in ignored
> +        is_not_affected = cve in not_affected
> +        is_undecidable = cve in undecidable
> +
>           status = "Unpatched"
>           if (is_patched or is_ignored) and not report_all:
>               continue
> @@ -613,6 +630,10 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>               status = "Ignored"
>           elif is_patched:
>               status = "Patched"
> +        elif is_not_affected:
> +            status = "Not affected"
> +        elif is_undecidable:
> +            status = "Undecidable"
>           else:
>               # default value of status is Unpatched
>               unpatched_cves.append(cve)
> @@ -645,12 +666,12 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>   
>       cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file)
>   
> -def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
> +def cve_write_data(d, patched, unpatched, ignored, not_affected, undecidable, cve_data, status):
>       """
>       Write CVE data in each enabled format.
>       """
>   
>       if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
> -        cve_write_data_text(d, patched, unpatched, ignored, cve_data)
> +        cve_write_data_text(d, patched, unpatched, ignored, not_affected, undecidable, cve_data)
>       if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
> -        cve_write_data_json(d, patched, unpatched, ignored, cve_data, status)
> +        cve_write_data_json(d, patched, unpatched, ignored, not_affected, undecidable, cve_data, status)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189667): https://lists.openembedded.org/g/openembedded-core/message/189667
> Mute This Topic: https://lists.openembedded.org/mt/102172913/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


