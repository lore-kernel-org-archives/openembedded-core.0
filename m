Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE1FC5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 08:37:59 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.48721.1724661475958549407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 01:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WYfJ+KcM;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5342109d726so2490814e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 01:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724661474; x=1725266274; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i32t8Fqy5zcLoQBP2etdjVOp9Jd94Onv2A8pybx95pQ=;
        b=WYfJ+KcM93NfShVY081D74nIHiL2Uo/lQFOLZsCKWmPKp1q/Q51SHZ51dfprzxMm6w
         uyBluctZmwO9N69AWbB7htnF3amBWNhYB1g/j8zXESFhnkhCMPNgPmdtwDOsEu1eg02u
         b1YVyHB6DCNdjLKoWPAtWyYFdSXA4OQlxWhcFAhyWBxjj20AkNHU64ehwAMfeWIVTvPQ
         Tg6C5QPF9bi8utpnfnP/Mm+OftmIQeFgPqJZL7Un65WKZRNy7j07LTHOupQpR/DGosoz
         zQHIes6xruJl0sreZEbrtsWDxDqktpG33LmUFHXYRGYVOHEr+x/bv3/lNpGzyxezZvb4
         WAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661474; x=1725266274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i32t8Fqy5zcLoQBP2etdjVOp9Jd94Onv2A8pybx95pQ=;
        b=vYFxuugKmz0FYw3gmB5SfeqvMmaZbzIiOySo3sihOw5b7MUOTv2VJTVAmCxss71BIM
         A7MeqdDcuTJBTgwTksJfArTZyr5Uxz3Y97aD9T7nxtNm6KnweWHZb7/OVVrjAJIxrZWE
         DYdidChXatDkQkEKEeW8og1s3YNmLTh7mD+QYcxyyOGhGPVUg7DhaOBqKz308aiWlWi8
         +jJ3fc4vo5h+wxFn/6EUx17gRY/yw2G79MIECdzXsUUXQLxT013IXIkxfo6KTh+IfFBk
         vjK/DEuNpx+qYA+nKSP00MTDCn31jEsxjOCjcid7CEO0f3uof9p+xqAOpWBPWoP3npNw
         z1lA==
X-Gm-Message-State: AOJu0YyRzO1apQOVYP3ByHiwq7ot852GOTsdzZy2xFT97hUPc+IPxjJK
	xPZLGAQdsM3H8N6/c096LKcGS8JuHmUbKLVjQzvbUKBMekT95y8GcHVn22mLfXAqHT9Wb6aXX9z
	hDaV+LqsQxTnCuXfQ5gArGVEisnE=
X-Google-Smtp-Source: AGHT+IGFaKwBnudSatuV5R9mpAMLdwlpqTgWEPHyCFAEHd2+VxgGK74W86MOrZLuf12Z9IxD5VR1JUL6G1lA847AuNc=
X-Received: by 2002:ac2:51cd:0:b0:52f:c281:72de with SMTP id
 2adb3069b0e04-53438423d32mr3297478e87.15.1724661472977; Mon, 26 Aug 2024
 01:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240826081337.2737132-1-clara.kowalsky@siemens.com>
In-Reply-To: <20240826081337.2737132-1-clara.kowalsky@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Aug 2024 10:37:41 +0200
Message-ID: <CANNYZj9B_kPoSx-WMFuMhTAsttXSzVo-+=NQ0D021wkmKLj0Wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] testimage: Add support to create test report in
 JUnit XML format
To: clara.kowalsky@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 08:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203737

Thanks! I wonder if this should be simply enabled by default (it
doesn't seem like an expensive operation). Even if it's not used by
anything in Yocto CI, the code will at least be tested to complete
without errors.

Alex

On Mon, 26 Aug 2024 at 10:13, Clara Kowalsky via
lists.openembedded.org
<clara.kowalsky=siemens.com@lists.openembedded.org> wrote:
>
> This introduces the possibility to report the test results of testimage
> in JUnit XML format by setting TESTIMAGE_JUNIT_REPORT = "1".
> The generated unit test report is located in the TEST_LOG_DIR and can be
> used in the CI/CD pipeline to display the test results.
>
> Signed-off-by: Clara Kowalsky <clara.kowalsky@siemens.com>
> ---
>  meta/classes-recipe/testimage.bbclass | 15 +++++++++++
>  meta/lib/oeqa/core/runner.py          | 39 ++++++++++++++++++++++++++-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
> index 6d1e1a107a..3e58c1bf87 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -1,4 +1,5 @@
>  # Copyright (C) 2013 Intel Corporation
> +# Copyright (C) 2024 Siemens AG
>  #
>  # SPDX-License-Identifier: MIT
>
> @@ -61,6 +62,10 @@ TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest
>  # The accepted flags are the following: search_reached_prompt, send_login_user, search_login_succeeded, search_cmd_finished.
>  # They are prefixed with either search/send, to differentiate if the pattern is meant to be sent or searched to/from the target terminal
>
> +# The test results can be reported in JUnit XML format by setting
> +# TESTIMAGE_JUNIT_REPORT = "1".
> +# The generated JUnit XML file is located in the TEST_LOG_DIR and can be used to display the test results in the CI/CD pipeline.
> +
>  TEST_LOG_DIR ?= "${WORKDIR}/testimage"
>
>  TEST_EXPORT_DIR ?= "${TMPDIR}/testimage/${PN}"
> @@ -112,6 +117,8 @@ TESTIMAGE_DUMP_DIR ?= "${LOG_DIR}/runtime-hostdump/"
>
>  TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_NAME IMAGE_NAME"
>
> +TESTIMAGE_JUNIT_REPORT ?= ""
> +
>  testimage_dump_monitor () {
>      query-status
>      query-block
> @@ -303,6 +310,11 @@ def testimage_main(d):
>      target_kwargs['serialcontrol_extra_args'] = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS") or ""
>      target_kwargs['testimage_dump_monitor'] = d.getVar("testimage_dump_monitor") or ""
>
> +    # Get junitxml_file
> +    if bb.utils.to_boolean(d.getVar("TESTIMAGE_JUNIT_REPORT")):
> +        junitxml_file = os.path.join(d.getVar("TEST_LOG_DIR"),
> +                           'junit.%s.xml' % d.getVar('DATETIME'))
> +
>      def export_ssh_agent(d):
>          import os
>
> @@ -387,6 +399,7 @@ def testimage_main(d):
>          results.logDetails(get_json_result_dir(d),
>                          configuration,
>                          get_testimage_result_id(configuration),
> +                        junitxml_file,
>                          dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
>          results.logSummary(pn)
>
> @@ -395,6 +408,8 @@ def testimage_main(d):
>      os.makedirs(targetdir, exist_ok=True)
>      os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
>      os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.basename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
> +    if junitxml_file:
> +        os.symlink(junitxml_file, os.path.join(targetdir, os.path.basename(junitxml_file)))
>
>      if not results or not complete:
>          bb.fatal('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
> diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
> index a86a706bd9..c499cfa9be 100644
> --- a/meta/lib/oeqa/core/runner.py
> +++ b/meta/lib/oeqa/core/runner.py
> @@ -1,5 +1,6 @@
>  #
>  # Copyright (C) 2016 Intel Corporation
> +# Copyright (C) 2024 Siemens AG
>  #
>  # SPDX-License-Identifier: MIT
>  #
> @@ -11,6 +12,7 @@ import logging
>  import re
>  import json
>  import sys
> +import xml.etree.ElementTree as ET
>
>  from unittest import TextTestResult as _TestResult
>  from unittest import TextTestRunner as _TestRunner
> @@ -170,7 +172,7 @@ class OETestResult(_TestResult):
>          return super(OETestResult, self).addUnexpectedSuccess(test)
>
>      def logDetails(self, json_file_dir=None, configuration=None, result_id=None,
> -            dump_streams=False):
> +            junitxml_file=None, dump_streams=False):
>
>          result = self.extraresults
>          logs = {}
> @@ -227,6 +229,9 @@ class OETestResult(_TestResult):
>              for l in logs[i]:
>                  self.tc.logger.info(l)
>
> +        if junitxml_file:
> +            self.dumpXmlTestresultFile(junitxml_file, result)
> +
>          if json_file_dir:
>              tresultjsonhelper = OETestResultJSONHelper()
>              tresultjsonhelper.dump_testresult_file(json_file_dir, configuration, result_id, result)
> @@ -239,6 +244,38 @@ class OETestResult(_TestResult):
>          # Account for expected failures
>          return not self.wasSuccessful() or len(self.expectedFailures)
>
> +    def dumpXmlTestresultFile(self, junitxml_file, test_result):
> +        elapsed_time = self.tc._run_end_time - self.tc._run_start_time
> +
> +        testsuites_node = ET.Element("testsuites")
> +        testsuites_node.set("time", "%s" % elapsed_time)
> +        testsuite_node = ET.SubElement(testsuites_node, "testsuite")
> +        testsuite_node.set("name", "Testimage")
> +        testsuite_node.set("time", "%s" % elapsed_time)
> +        testsuite_node.set("tests", "%s" % self.testsRun)
> +        testsuite_node.set("failures", "%s" % len(self.failures))
> +        testsuite_node.set("errors", "%s" % len(self.errors))
> +        testsuite_node.set("skipped", "%s" % len(self.skipped))
> +
> +        for test_id in test_result.keys():
> +            # filter out ptestresult.rawlogs and ptestresult.sections
> +            if re.search(r'\.test_', test_id):
> +                testcase_node = ET.SubElement(testsuite_node, "testcase")
> +                testcase_node.set("name", "%s" % test_id)
> +                testcase_node.set("classname", "Testimage")
> +                testcase_node.set("time", "%s" % test_result[test_id]['duration'])
> +                if test_result[test_id]['status'] == "SKIPPED":
> +                    testcase_node_status = ET.SubElement(testcase_node, "skipped")
> +                elif test_result[test_id]['status'] == "FAILED":
> +                    testcase_node_status = ET.SubElement(testcase_node, "failure")
> +                elif test_result[test_id]['status'] == "ERROR":
> +                    testcase_node_status = ET.SubElement(testcase_node, "error")
> +                if test_result[test_id]['status'] != "PASSED":
> +                    testcase_node_status.set("message", "%s" % test_result[test_id]['log'])
> +
> +        tree = ET.ElementTree(testsuites_node)
> +        tree.write(junitxml_file, encoding='UTF-8', xml_declaration=True)
> +
>  class OEListTestsResult(object):
>      def wasSuccessful(self):
>          return True
> --
> 2.46.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203736): https://lists.openembedded.org/g/openembedded-core/message/203736
> Mute This Topic: https://lists.openembedded.org/mt/108100544/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

