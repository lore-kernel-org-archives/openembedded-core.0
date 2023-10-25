Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5CEC25B47
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 10:19:07 +0000 (UTC)
Received: from h4.cmg2.smtp.forpsi.com (h4.cmg2.smtp.forpsi.com [185.129.138.189])
 by mx.groups.io with SMTP id smtpd.web10.170049.1698229142114632293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 03:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=uEMGeZQX;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=uEMGeZQX;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.189, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.112.33] ([20.86.218.51])
	by cmgsmtp with ESMTPSA
	id vayYqtEgjSqGRvayYqEyfd; Wed, 25 Oct 2023 12:18:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1698229139; bh=mfrmLsGV2uZ800Miz2OPj1CH0gaWBNBJNSFSRmhtuKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=uEMGeZQXRLCOS/jp1qR1D7UZCYgYqZpNPeKHfcQMPIZp/gNWakrUU7sITzIcDqKsq
	 GxtYkrl4h1nYSst8m/C/RPTgYhMll9XgdIUOCMYZql6LZWxsMN4mETLZwI1PKN6rlI
	 gOvAr149ySFRVMuuRWwg+i00PYGoYzYLAxKiNovieDhrNg3vxuTVzprCGlztHj0crN
	 QogjXYtLoxHeNWoM9i1FHHzgd1Jk5FW/cZAFKTz5Fxi/iemyhEmPcV6IwuPDvpmBta
	 FrWS/xN/7d/zp/9r6YSHEhQxCrjbza9iYMJaTEFkPWEv31E1ORJ6C8itcBzMwyYGGX
	 DPvAXfVC6Jc8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1698229139; bh=mfrmLsGV2uZ800Miz2OPj1CH0gaWBNBJNSFSRmhtuKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=uEMGeZQXRLCOS/jp1qR1D7UZCYgYqZpNPeKHfcQMPIZp/gNWakrUU7sITzIcDqKsq
	 GxtYkrl4h1nYSst8m/C/RPTgYhMll9XgdIUOCMYZql6LZWxsMN4mETLZwI1PKN6rlI
	 gOvAr149ySFRVMuuRWwg+i00PYGoYzYLAxKiNovieDhrNg3vxuTVzprCGlztHj0crN
	 QogjXYtLoxHeNWoM9i1FHHzgd1Jk5FW/cZAFKTz5Fxi/iemyhEmPcV6IwuPDvpmBta
	 FrWS/xN/7d/zp/9r6YSHEhQxCrjbza9iYMJaTEFkPWEv31E1ORJ6C8itcBzMwyYGGX
	 DPvAXfVC6Jc8w==
Message-ID: <30cbb691-8425-4218-82e3-edef7e320411@skyrain.eu>
Date: Wed, 25 Oct 2023 12:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] cve-check: Classify patched CVEs into 3
 statuses
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>,
 richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org,
 Shunsuke Tokumoto <s-tokumoto@fujitsu.com>, Peter.Marko@siemens.com
References: <20230922083400.3157-1-shin.matsunaga@fujitsu.com>
 <20231025051344.24088-1-shin.matsunaga@fujitsu.com>
 <a69cb061-306a-4895-b0f9-28eb1c9ecc37@skyrain.eu>
 <CAApg2=RpNbt-QT3TW6qtyDn56LfG=pHXROccLW6Qh5ucDEM_ow@mail.gmail.com>
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <CAApg2=RpNbt-QT3TW6qtyDn56LfG=pHXROccLW6Qh5ucDEM_ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfN5z6qnPagVmKV5oiFN4kCZel0UZ/54HAjrLCYjpFB2QJwgLMaWyMjxCfIouxxdcgtSqagIZJbffeMMciLIBL36Ev0ac4bvq6H6Y5WsT0CEZcm5/0cL9
 V4UQGZc2MkgCFxXCsXYj4pj8F/AZxoum1SQTDG2U36RefQU8mSd0CekCe2FDUImVZEmQRFwW8bBTDOYhYvXzq/97mxjmKC8JbEJPG6+QAS1KDjmOfxfnrU4Z
 WMyQuZS9Qq9CO9kR3PuDMxYnR+AhBxoWSHMepBtsUhnlkGobRrRPc2zfz5X/abpktV5mrm0Z2jpb1NLCcE2IOiPvsvov3JnhmQUA5vPgMBS8EgalH5UOwZJ0
 RgecIlni2qukaGJK2MK52OKXOeLdLL4Ukr/zGv1o7BfOBrqODVw=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 10:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189674

Hi Marta,

That's fine, as I said we designed the "ignore" with status 
"cpe-incorrect" or "ignored" exactly for those purposes. Extending the 
option with "not affected" doesn't make any sense.

You have to set the status to "why is not affected" = "ignored". Which 
completely covers the requested case.

Regards,
Andrej

On 25.10.2023 11:33, Marta Rybczynska wrote:
> Hi Andrej,
> This is more complex. "Not affected" is also an issue that isn't present in the
> code - like when we have a version that has never had the vulnerability.
> Those are also currently 'Patched' in cve-check.
>
> This work is in sync with what VEX is doing, is it the use-case
> Matsanaga-Shinji?
>
> Regards,
> Marta
>
> On Wed, Oct 25, 2023 at 8:44 AM Andrej Valek <andrej.v@skyrain.eu> wrote:
>> Hi all,
>>
>> Do we really need a new "not_affected" state? I guess the ignore state
>> is exactly designed for those purposes.
>>
>> Regards,
>> Andrej
>>
>> On 25.10.2023 07:13, Matsunaga-Shinji wrote:
>>> CVEs that are currently considered "Patched" are classified into the following 3 statuses:
>>> 1. "Patched"      - means that a patch file that fixed the vulnerability has been applied
>>> 2. "Not affected" - means that the package version (PV) is not affected by the vulnerability
>>> 3. "Undecidable"  - means that versions cannot be compared to determine if they are affected by the vulnerability
>>>
>>> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
>>> Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
>>> ---
>>>
>>> Changes for v2:
>>>      - Fix the status "Out of range" to "Not affected"
>>>
>>>    meta/classes/cve-check.bbclass | 55 +++++++++++++++++++++++-----------
>>>    1 file changed, 38 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
>>> index b55f4299da..502db324df 100644
>>> --- a/meta/classes/cve-check.bbclass
>>> +++ b/meta/classes/cve-check.bbclass
>>> @@ -185,10 +185,10 @@ python do_cve_check () {
>>>                    patched_cves = get_patched_cves(d)
>>>                except FileNotFoundError:
>>>                    bb.fatal("Failure in searching patches")
>>> -            ignored, patched, unpatched, status = check_cves(d, patched_cves)
>>> -            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
>>> -                cve_data = get_cve_info(d, patched + unpatched + ignored)
>>> -                cve_write_data(d, patched, unpatched, ignored, cve_data, status)
>>> +            ignored, patched, unpatched, not_affected, undecidable, status = check_cves(d, patched_cves)
>>> +            if patched or unpatched or not_affected or undecidable or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
>>> +                cve_data = get_cve_info(d, patched + unpatched + ignored + not_affected + undecidable)
>>> +                cve_write_data(d, patched, unpatched, ignored, not_affected, undecidable, cve_data, status)
>>>            else:
>>>                bb.note("No CVE database found, skipping CVE check")
>>>
>>> @@ -308,13 +308,13 @@ def check_cves(d, patched_cves):
>>>        products = d.getVar("CVE_PRODUCT").split()
>>>        # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
>>>        if not products:
>>> -        return ([], [], [], [])
>>> +        return ([], [], [], [], [], [])
>>>        pv = d.getVar("CVE_VERSION").split("+git")[0]
>>>
>>>        # If the recipe has been skipped/ignored we return empty lists
>>>        if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
>>>            bb.note("Recipe has been skipped by cve-check")
>>> -        return ([], [], [], [])
>>> +        return ([], [], [], [], [], [])
>>>
>>>        # Convert CVE_STATUS into ignored CVEs and check validity
>>>        cve_ignore = []
>>> @@ -328,6 +328,8 @@ def check_cves(d, patched_cves):
>>>        conn = sqlite3.connect(db_file, uri=True)
>>>
>>>        # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
>>> +    cves_not_affected = []
>>> +    cves_undecidable = []
>>>        for product in products:
>>>            cves_in_product = False
>>>            if ":" in product:
>>> @@ -355,6 +357,7 @@ def check_cves(d, patched_cves):
>>>
>>>                vulnerable = False
>>>                ignored = False
>>> +            undecidable = False
>>>
>>>                product_cursor = conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor))
>>>                for row in product_cursor:
>>> @@ -376,7 +379,7 @@ def check_cves(d, patched_cves):
>>>                            except:
>>>                                bb.warn("%s: Failed to compare %s %s %s for %s" %
>>>                                        (product, pv, operator_start, version_start, cve))
>>> -                            vulnerable_start = False
>>> +                            undecidable = True
>>>                        else:
>>>                            vulnerable_start = False
>>>
>>> @@ -387,10 +390,15 @@ def check_cves(d, patched_cves):
>>>                            except:
>>>                                bb.warn("%s: Failed to compare %s %s %s for %s" %
>>>                                        (product, pv, operator_end, version_end, cve))
>>> -                            vulnerable_end = False
>>> +                            undecidable = True
>>>                        else:
>>>                            vulnerable_end = False
>>>
>>> +                    if undecidable:
>>> +                        bb.note("%s-%s is undecidable to %s" % (pn, real_pv, cve))
>>> +                        cves_undecidable.append(cve)
>>> +                        break
>>> +
>>>                        if operator_start and operator_end:
>>>                            vulnerable = vulnerable_start and vulnerable_end
>>>                        else:
>>> @@ -406,9 +414,9 @@ def check_cves(d, patched_cves):
>>>                        break
>>>                product_cursor.close()
>>>
>>> -            if not vulnerable:
>>> +            if not undecidable and not vulnerable:
>>>                    bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cve))
>>> -                patched_cves.add(cve)
>>> +                cves_not_affected.append(cve)
>>>            cve_cursor.close()
>>>
>>>            if not cves_in_product:
>>> @@ -420,7 +428,7 @@ def check_cves(d, patched_cves):
>>>        if not cves_in_recipe:
>>>            bb.note("No CVE records for products in recipe %s" % (pn))
>>>
>>> -    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_status)
>>> +    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_not_affected, cves_undecidable, cves_status)
>>>
>>>    def get_cve_info(d, cves):
>>>        """
>>> @@ -447,7 +455,7 @@ def get_cve_info(d, cves):
>>>        conn.close()
>>>        return cve_data
>>>
>>> -def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>>> +def cve_write_data_text(d, patched, unpatched, ignored, not_affected, undecidable, cve_data):
>>>        """
>>>        Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
>>>        CVE manifest if enabled.
>>> @@ -471,7 +479,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>>>            return
>>>
>>>        # Early exit, the text format does not report packages without CVEs
>>> -    if not patched+unpatched+ignored:
>>> +    if not patched+unpatched+ignored+not_affected+undecidable:
>>>            return
>>>
>>>        nvd_link = "https://nvd.nist.gov/vuln/detail/"
>>> @@ -482,6 +490,8 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>>>        for cve in sorted(cve_data):
>>>            is_patched = cve in patched
>>>            is_ignored = cve in ignored
>>> +        is_not_affected = cve in not_affected
>>> +        is_undecidable = cve in undecidable
>>>
>>>            status = "Unpatched"
>>>            if (is_patched or is_ignored) and not report_all:
>>> @@ -490,6 +500,10 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
>>>                status = "Ignored"
>>>            elif is_patched:
>>>                status = "Patched"
>>> +        elif is_not_affected:
>>> +            status = "Not affected"
>>> +        elif is_undecidable:
>>> +            status = "Undecidable"
>>>            else:
>>>                # default value of status is Unpatched
>>>                unpatched_cves.append(cve)
>>> @@ -561,7 +575,7 @@ def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_fi
>>>            with open(index_path, "a+") as f:
>>>                f.write("%s\n" % fragment_path)
>>>
>>> -def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>>> +def cve_write_data_json(d, patched, unpatched, ignored, not_affected, undecidable, cve_data, cve_status):
>>>        """
>>>        Prepare CVE data for the JSON format, then write it.
>>>        """
>>> @@ -606,6 +620,9 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>>>        for cve in sorted(cve_data):
>>>            is_patched = cve in patched
>>>            is_ignored = cve in ignored
>>> +        is_not_affected = cve in not_affected
>>> +        is_undecidable = cve in undecidable
>>> +
>>>            status = "Unpatched"
>>>            if (is_patched or is_ignored) and not report_all:
>>>                continue
>>> @@ -613,6 +630,10 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>>>                status = "Ignored"
>>>            elif is_patched:
>>>                status = "Patched"
>>> +        elif is_not_affected:
>>> +            status = "Not affected"
>>> +        elif is_undecidable:
>>> +            status = "Undecidable"
>>>            else:
>>>                # default value of status is Unpatched
>>>                unpatched_cves.append(cve)
>>> @@ -645,12 +666,12 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
>>>
>>>        cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file)
>>>
>>> -def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
>>> +def cve_write_data(d, patched, unpatched, ignored, not_affected, undecidable, cve_data, status):
>>>        """
>>>        Write CVE data in each enabled format.
>>>        """
>>>
>>>        if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
>>> -        cve_write_data_text(d, patched, unpatched, ignored, cve_data)
>>> +        cve_write_data_text(d, patched, unpatched, ignored, not_affected, undecidable, cve_data)
>>>        if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
>>> -        cve_write_data_json(d, patched, unpatched, ignored, cve_data, status)
>>> +        cve_write_data_json(d, patched, unpatched, ignored, not_affected, undecidable, cve_data, status)
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#189667): https://lists.openembedded.org/g/openembedded-core/message/189667
>>> Mute This Topic: https://lists.openembedded.org/mt/102172913/3619876
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


