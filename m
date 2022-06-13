Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51871C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 06:49:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.2958.1655102949728675513
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 23:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NHjCmP7h;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EC792C0006;
	Mon, 13 Jun 2022 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655102947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+4yZEcCT21SGOSjPFjAbxJmypv92u7sJBGOpWSt3Uk=;
	b=NHjCmP7hKVHBzBQuYSI+OdIwQzJEHHUmo3eglOUWE4+XPgXHmj+a5lI/MORT3ivHOaS1ZJ
	CaD1jJLJldOddP5flD6MAHZsoayWUkWTMeaJVj0SA7C6eNsX9ZDDTpXIJsB3Zu0nqUF+eq
	7aRCBsXm7gu2PyC9T7iysgXFK6Cz52pj7nRdF0yi+LKK+I4MFFx6lStu7kKFMd2JxlNoOz
	bcM667Gw19HxIR295AU0s/fxQ1x/KBeUIx1zfOuuIwAVmBxRSSpHXf06wMnjmTmcoKP0AQ
	xTMS+0Rg/fhzR/OZ+F9eTqNKezLijLAvIJfjLW8kP1VcpT8n6hQnqvhlppS6Iw==
Date: Mon, 13 Jun 2022 08:49:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: Re: [OE-core] [PATCH] cve-check: add support for Ignored CVEs
Message-ID: <Yqbd4kN0aTWJZQkR@mail.local>
References: <20220610140237.1684000-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610140237.1684000-1-rybczynska@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 06:49:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166828

Hello Marta,

This seems to break the selftests:

2022-06-12 22:22:20,248 - oe-selftest - INFO - cve_check.CVECheck.test_recipe_report_json (subunit.RemotedTestCase)
2022-06-12 22:22:20,249 - oe-selftest - INFO -  ... FAIL
Stderr:
2022-06-12 22:07:57,462 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-15731/conf/local.conf
2022-06-12 22:07:57,464 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2022-06-12 22:22:20,249 - oe-selftest - INFO - 13: 2/44 115/486 (20.55s) (cve_check.CVECheck.test_recipe_report_json)
2022-06-12 22:22:20,249 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/cve_check.py", line 82, in test_recipe_report_json
    check_m4_json(summary_json)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/cve_check.py", line 78, in check_m4_json
    self.assertIn("CVE-2008-1687", found_cves)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.9/unittest/case.py", line 1098, in assertIn
    self.fail(self._formatMessage(msg, standardMsg))
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.9/unittest/case.py", line 670, in fail
    raise self.failureException(msg)
AssertionError: 'CVE-2008-1687' not found in {}


https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3697/steps/15/logs/stdio

On 10/06/2022 16:02:37+0200, Marta Rybczynska wrote:
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
>  meta/classes/cve-check.bbclass | 43 ++++++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 1b4910f737..760e825a4c 100644
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
> +        if (is_patched or is_ignored) and report_all:
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
> View/Reply Online (#166804): https://lists.openembedded.org/g/openembedded-core/message/166804
> Mute This Topic: https://lists.openembedded.org/mt/91668774/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

