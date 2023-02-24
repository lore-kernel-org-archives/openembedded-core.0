Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C805C7EE32
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:46:01 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.22895.1677257156185575893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MRRA48d5;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8209010000A;
	Fri, 24 Feb 2023 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677257154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyYFjNF2fWM7E86SJekuEZr9LW9SvHkTJ7vErRQ4YeE=;
	b=MRRA48d57WsO+iJvkqCzFSsZrtPN5gXga7j4IZeHnQYZftzvjR6DN8mgvgRNEpHwGWvttH
	MABbPvwn10K++4Hn7GQM3yDBOEAahLwWhzSdXExcmFOs19rSVLcCqEQ3HfIakwwToyTHNu
	qf+m6lzA4uglAMC+kPbno2Nlwq5mlNjXuciPLAY7GsC9Por4CSAjT2S6w3YjpnKAtP1TnL
	kFFQrLJeLpEQc/IN1KMkHXl8M54PBYMeH4CcTunw3Q4o/FfCZxOu14wyMhMW1eEZlN29Dw
	23sOZy0P/VzNesuh1ydiucvW+gyaWAlUOBbH4Bg16SwbwhrY3RNwjBOnflrxSw==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v3 3/6] scripts/resulttool/regression: add metadata filtering for oeselftest
Date: Fri, 24 Feb 2023 17:45:52 +0100
Message-Id: <20230224164555.67634-4-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224164555.67634-1-alexis.lothore@bootlin.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177700

From: Alexis Lothoré <alexis.lothore@bootlin.com>

When generating regression reports, many false positive can be observed since
some tests results are compared while the corresponding tests sets are not the
same, as it can be seen for example for oeselftest tests (oeselftest is run
multiple time but with different parameters, resulting in different tests sets)

Add a filtering mechanism in resulttool regression module to enable a better
matching between tests. The METADATA_MATCH_TABLE defines that when the TEST_TYPE
is "oeselftest", then resulttool should filter pairs based on
OESELFTEST_METADATA appended to test configuration. If metadata is absent from
test results, in order to keep compatibility with older results, add a
"guessing" mechanism to generate the missing OESELFTEST_METADATA. The guessed
data is tightly coupled to the autobuilder configuration, where all oe-selftest
executions are described

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 162 +++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index d0b0c318051..1b0c8335a39 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -11,6 +11,164 @@ import resulttool.resultutils as resultutils
 from oeqa.utils.git import GitRepo
 import oeqa.utils.gitarchive as gitarchive
 
+METADATA_MATCH_TABLE = {
+    "oeselftest": "OESELFTEST_METADATA"
+}
+
+OESELFTEST_METADATA_GUESS_TABLE={
+    "trigger-build-posttrigger": {
+        "run_all_tests": False,
+        "run_tests":["buildoptions.SourceMirroring.test_yocto_source_mirror"],
+        "skips": None,
+        "machine": None,
+        "select_tags":None,
+        "exclude_tags": None
+    },
+    "reproducible": {
+        "run_all_tests": False,
+        "run_tests":["reproducible"],
+        "skips": None,
+        "machine": None,
+        "select_tags":None,
+        "exclude_tags": None
+    },
+    "arch-qemu-quick": {
+        "run_all_tests": True,
+        "run_tests":None,
+        "skips": None,
+        "machine": None,
+        "select_tags":["machine"],
+        "exclude_tags": None
+    },
+    "arch-qemu-full-x86-or-x86_64": {
+        "run_all_tests": True,
+        "run_tests":None,
+        "skips": None,
+        "machine": None,
+        "select_tags":["machine", "toolchain-system"],
+        "exclude_tags": None
+    },
+    "arch-qemu-full-others": {
+        "run_all_tests": True,
+        "run_tests":None,
+        "skips": None,
+        "machine": None,
+        "select_tags":["machine", "toolchain-user"],
+        "exclude_tags": None
+    },
+    "selftest": {
+        "run_all_tests": True,
+        "run_tests":None,
+        "skips": ["distrodata.Distrodata.test_checkpkg", "buildoptions.SourceMirroring.test_yocto_source_mirror", "reproducible"],
+        "machine": None,
+        "select_tags":None,
+        "exclude_tags": ["machine", "toolchain-system", "toolchain-user"]
+    },
+    "bringup": {
+        "run_all_tests": True,
+        "run_tests":None,
+        "skips": ["distrodata.Distrodata.test_checkpkg", "buildoptions.SourceMirroring.test_yocto_source_mirror"],
+        "machine": None,
+        "select_tags":None,
+        "exclude_tags": ["machine", "toolchain-system", "toolchain-user"]
+    }
+}
+
+def test_has_at_least_one_matching_tag(test, tag_list):
+    return "oetags" in test and any(oetag in tag_list for oetag in test["oetags"])
+
+def all_tests_have_at_least_one_matching_tag(results, tag_list):
+    return all(test_has_at_least_one_matching_tag(test_result, tag_list) or test_name.startswith("ptestresult") for (test_name, test_result) in results.items())
+
+def any_test_have_any_matching_tag(results, tag_list):
+    return any(test_has_at_least_one_matching_tag(test, tag_list) for test in results.values())
+
+def have_skipped_test(result, test_prefix):
+    return all( result[test]['status'] == "SKIPPED" for test in result if test.startswith(test_prefix))
+
+def have_all_tests_skipped(result, test_prefixes_list):
+    return all(have_skipped_test(result, test_prefix) for test_prefix in test_prefixes_list)
+
+def guess_oeselftest_metadata(results):
+    """
+    When an oeselftest test result is lacking OESELFTEST_METADATA, we can try to guess it based on results content.
+    Check results for specific values (absence/presence of oetags, number and name of executed tests...),
+    and if it matches one of known configuration from autobuilder configuration, apply guessed OSELFTEST_METADATA
+    to it to allow proper test filtering.
+    This guessing process is tightly coupled to config.json in autobuilder. It should trigger less and less,
+    as new tests will have OESELFTEST_METADATA properly appended at test reporting time
+    """
+
+    if len(results) == 1 and "buildoptions.SourceMirroring.test_yocto_source_mirror" in results:
+        return OESELFTEST_METADATA_GUESS_TABLE['trigger-build-posttrigger']
+    elif all(result.startswith("reproducible") for result in results):
+        return OESELFTEST_METADATA_GUESS_TABLE['reproducible']
+    elif all_tests_have_at_least_one_matching_tag(results, ["machine"]):
+        return OESELFTEST_METADATA_GUESS_TABLE['arch-qemu-quick']
+    elif all_tests_have_at_least_one_matching_tag(results, ["machine", "toolchain-system"]):
+        return OESELFTEST_METADATA_GUESS_TABLE['arch-qemu-full-x86-or-x86_64']
+    elif all_tests_have_at_least_one_matching_tag(results, ["machine", "toolchain-user"]):
+        return OESELFTEST_METADATA_GUESS_TABLE['arch-qemu-full-others']
+    elif not any_test_have_any_matching_tag(results, ["machine", "toolchain-user", "toolchain-system"]):
+        if have_all_tests_skipped(results, ["distrodata.Distrodata.test_checkpkg", "buildoptions.SourceMirroring.test_yocto_source_mirror", "reproducible"]):
+            return OESELFTEST_METADATA_GUESS_TABLE['selftest']
+        elif have_all_tests_skipped(results, ["distrodata.Distrodata.test_checkpkg", "buildoptions.SourceMirroring.test_yocto_source_mirror"]):
+            return OESELFTEST_METADATA_GUESS_TABLE['bringup']
+
+    return None
+
+
+def metadata_matches(base_configuration, target_configuration):
+    """
+    For passed base and target, check test type. If test type matches one of
+    properties described in METADATA_MATCH_TABLE, compare metadata if it is
+    present in base. Return true if metadata matches, or if base lacks some
+    data (either TEST_TYPE or the corresponding metadata)
+    """
+    test_type = base_configuration.get('TEST_TYPE')
+    if test_type not in METADATA_MATCH_TABLE:
+        return True
+
+    metadata_key = METADATA_MATCH_TABLE.get(test_type)
+    if target_configuration.get(metadata_key) != base_configuration.get(metadata_key):
+        return False
+
+    return True
+
+
+def machine_matches(base_configuration, target_configuration):
+    return base_configuration.get('MACHINE') == target_configuration.get('MACHINE')
+
+
+def can_be_compared(logger, base, target):
+    """
+    Some tests are not relevant to be compared, for example some oeselftest
+    run with different tests sets or parameters. Return true if tests can be
+    compared
+    """
+    base_configuration = base['configuration']
+    target_configuration = target['configuration']
+
+    # Older test results lack proper OESELFTEST_METADATA: if not present, try to guess it based on tests results.
+    if base_configuration.get('TEST_TYPE') == 'oeselftest' and 'OESELFTEST_METADATA' not in base_configuration:
+        guess = guess_oeselftest_metadata(base['result'])
+        if guess is None:
+            logger.error(f"ERROR: did not manage to guess oeselftest metadata for {base_configuration['STARTTIME']}")
+        else:
+            logger.debug(f"Enriching {base_configuration['STARTTIME']} with {guess}")
+            base_configuration['OESELFTEST_METADATA'] = guess
+    if target_configuration.get('TEST_TYPE') == 'oeselftest' and 'OESELFTEST_METADATA' not in target_configuration:
+        guess = guess_oeselftest_metadata(target['result'])
+        if guess is None:
+            logger.error(f"ERROR: did not manage to guess oeselftest metadata for {target_configuration['STARTTIME']}")
+        else:
+            logger.debug(f"Enriching {target_configuration['STARTTIME']} with {guess}")
+            target_configuration['OESELFTEST_METADATA'] = guess
+
+    return metadata_matches(base_configuration, target_configuration) \
+        and machine_matches(base_configuration, target_configuration)
+
+
 def compare_result(logger, base_name, target_name, base_result, target_result):
     base_result = base_result.get('result')
     target_result = target_result.get('result')
@@ -61,6 +219,8 @@ def regression_common(args, logger, base_results, target_results):
             # removing any pairs which match
             for c in base.copy():
                 for b in target.copy():
+                    if not can_be_compared(logger, base_results[a][c], target_results[a][b]):
+                        continue
                     res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
                     if not res:
                         matches.append(resstr)
@@ -70,6 +230,8 @@ def regression_common(args, logger, base_results, target_results):
             # Should only now see regressions, we may not be able to match multiple pairs directly
             for c in base:
                 for b in target:
+                    if not can_be_compared(logger, base_results[a][c], target_results[a][b]):
+                        continue
                     res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
                     if res:
                         regressions.append(resstr)
-- 
2.39.1


