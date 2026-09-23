Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692E0C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:58:44 +0000 (UTC)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3027.1790190266833243408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=BPLutAFw;
 spf=pass (domain: baylibre.com, ip: 74.125.227.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78564421fdbso459062137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190266; x=1790795066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ay/n7RaNb0iEBG7Y6xqdGxgqCR9jiV+cs/eLe0uckpU=;
        b=BPLutAFwezybLaZAZF7HE7rIIdr07xEA4q++kxVHBUz9LEjnt5doti04sbRYaMLHN2
         jz1fZEQzjL3YNQ1GFMuEzN6muYGAKzVbnzijR3s3IQAAynfMjH/ei+2A0wZRWDnyFvrY
         BYcgJnD+Q4k8GEJdxrrqUf1Lkrt+uCVHoPvLdQEY5BVOrn42+PM3RE/JHfnqPAweJXm7
         InvHIkLzMMDNBskkNO6kqyndanOSaZHP/J3rJ1SNVqBb+QjkjmwTk7INvr3lZHxa9XRu
         ZnBM9mIiuefq0UJ6YMS+KXLYBlDq24v6l3vgqoMZA4rDz1r8MJopj3evo17Obhj4rOoV
         UG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190266; x=1790795066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ay/n7RaNb0iEBG7Y6xqdGxgqCR9jiV+cs/eLe0uckpU=;
        b=bicYjPVpXIlfcuqJ8EK/W0AOR+lnGoWpxT7ladh91ZJMiohp71e6U3Q3eTZ0ZvM1C2
         gAC582kF7k4oKTogJsgmL4+OESRSvWUd+0sD9peE0zcS4s9tslXVZEu0fKAkJI2A+TZB
         QfLv5V3+re+4/IT+YoubZpPKVjhd4EYdy9fkBnttDaRkNoxgZc7uAhsPRVVTUfK/X3Ug
         hqP80jmzfZYKQ/tkCDrkwDp29FtRt30AKL0c9xn3CJlZ0nnuZSENQI0kTE/hV6NmvPTv
         5CZ3hNKhmDVMfWKHt8fhMkLbK22n4yPioUgGHF2DHABTPMq2F5fI6zMVRXc3zU/QKKe+
         O6aQ==
X-Gm-Message-State: AFuF++lpVBTZsYcUfaiWFv//nMyG/CmwkGSSuQQPrFrMwBsMKneclleE
	KbhQ4nMl6iih2Q7Zz2o0xJzA3vYewlUzQWN+IHilKa9bApVaL24UU7NXNWHo3tzrTvCcesZXUrd
	GqTB0
X-Gm-Gg: AYBFou3x0Evtdtp9mpVK9X+kcgIhJlN83KDwUGPBZ7GE+8Jzamcg0UzQmBhEbVZACbi
	oLrcmRb2pkLiVIJv3VlagpmG4fIkxOdZ0W9I2I/ZxtlSsuS0DMDlwkEL03Jv1iJoN0nrA4jJpUC
	aIayt+enVy1JhJs1hdYYCnvdDTgbBjeC68UGS9KX9YOboa7CkumrO+VfqohF7gP069gKSMSv02j
	PcbbdZHVaRRZolFOMgc5zKPVux1zy5P7l9xax8F7uj0/EwrFAEaGlo5Pi4AJx5j7GMRR9PjHH1X
	3vzBUBQAqPrvQJ9NgblWsth/nGOT4c8IdyRpoCa2JrBSUmn4SiaUXIJekQf8SdGF6GnADWvaS86
	UkGUWKMwM1gGcq8N7Nh5xHc6Vxgov0S4fCsYay7DUhXVkfbPu5rZ0LaGl//bxr3yTexlUBxNz99
	RcJ8sQQNAPFXTMlb/86yRWScGY2qMOXH7oI1RixSJ9ZaX0U6ggp16DTtYPoeU0NAiK48NbA3LOS
	zXNoVukwdQorYpZtuXRP6iYf+WgzqD0Cg==
X-Received: by 2002:a05:6102:3e8e:b0:7a1:f7d2:e839 with SMTP id ada2fe7eead31-7af1dadc074mr136735137.25.1790190265315;
        Wed, 23 Sep 2026 12:04:25 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566d033sm4537450137.5.2026.09.23.12.04.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:24 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 01/13] scripts: resulttool: add 'durations' option
Date: Wed, 23 Sep 2026 15:04:07 -0400
Message-ID: <20260923190419.353493-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246541

Extend resulttool with the ability to compare two or more sets of
testresults for significant changes in runtime duration. The idea is to
allow tracking of performance deltas in ptest/toolchain/etc. test suites
over time, especially when upgrades or patches alter configurations for
underlying tools/infrastructure (QEMU, meson, autotools, architecture
tunings, and so on). This feature works with raw testresults.json files
as reported by the Autobuilder and reports generated with 'resulttool
report <source>', although the behaviour is different:

- For raw testresults.json files, it reports every target and applies the
options to the test cases run against them.
- For report files it summarizes the overall runtimes (see the examples
  below).

Note that it is not designed to make any judgments about the usefulness
of a given comparison - it only reports the differences between sources
provided.

Options for the 'durations' command include:

- '--labels' to customize the column labels (defaults: 'RUN1', 'RUN2',
'RUN1->RUN2', etc.)
- '--sort-by-delta/-s' to list the largest differences first
- '--threshold/-t' for omitting test results without a percent delta
  meeting this value
- '--limit' to specify how a maximum number of rows (0 = no limit)
- '--min-duration' to omit tests where durations in all sources were
  less than the specified value (default: 10, 0 = disable)
- '--show-short' to print tests below --min-duration threshold in a
  follow-up table

AI-Generated: Uses Claude Sonnet 5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/lib/resulttool/durations.py | 187 ++++++++++++++++++++++++++++
 scripts/resulttool                  |   2 +
 2 files changed, 189 insertions(+)
 create mode 100644 scripts/lib/resulttool/durations.py

diff --git a/scripts/lib/resulttool/durations.py b/scripts/lib/resulttool/durations.py
new file mode 100644
index 0000000000..94a86cd26d
--- /dev/null
+++ b/scripts/lib/resulttool/durations.py
@@ -0,0 +1,187 @@
+# resulttool - compare test durations between two or more runs
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import os
+import re
+import resulttool.resultutils as resultutils
+
+# Matches the section titles "resulttool report" prints before each
+# Recipe/Passed/Failed/Skipped/Time(s) table (see template/test_report_full_text.txt)
+REPORT_SECTION_RE = re.compile(
+    r'^\S+ (?:PTest Result Summary \(Libc: [^)]+\)|Ltp Test Result Summary|Ltp Posix Result Summary)$')
+REPORT_ROW_RE = re.compile(
+    r'^(?P<name>\S.*?)\s*\|\s*\d+\s*\|\s*\d+\s*\|\s*\d+\s*\|\s*(?P<duration>\d+(?:\.\d+)?)\s*T?\s*$')
+
+def parse_report_log(path):
+    """Parse the Recipe/Time(s) tables out of a 'resulttool report' text log"""
+    durations = {}
+    section = None
+    with open(path) as f:
+        for line in f:
+            line = line.rstrip('\n')
+            if REPORT_SECTION_RE.match(line.strip()):
+                section = line.strip()
+                continue
+            if not section:
+                continue
+            m = REPORT_ROW_RE.match(line)
+            if m:
+                durations.setdefault(section, {})[m.group('name').strip()] = float(m.group('duration'))
+    return durations
+
+def load_durations(source):
+    if os.path.isfile(source):
+        with open(source, errors='ignore') as f:
+            head = f.read(512).lstrip()
+        if not head.startswith('{'):
+            return parse_report_log(source)
+    return get_durations(resultutils.load_resultsdata(source, configmap=resultutils.store_map))
+
+def get_durations(results):
+    """Flatten a loaded results dict into {testpath: {test_key: duration}}"""
+    durations = {}
+    for path, _, _, result in resultutils.test_run_results(results):
+        d = durations.setdefault(path, {})
+        for k, v in result.items():
+            if not isinstance(v, dict):
+                continue
+            if k.endswith(".sections"):
+                # ptestresult.sections/ltpresult.sections/ltpposixresult.sections:
+                # duration is per suite, not per testcase
+                for suite, info in v.items():
+                    dur = info.get('duration') if isinstance(info, dict) else None
+                    if dur is None:
+                        continue
+                    if isinstance(dur, str):
+                        dur = dur.split()[0]
+                    try:
+                        d['%s.%s' % (k, suite)] = float(dur)
+                    except ValueError:
+                        continue
+            elif 'duration' in v:
+                d[k] = float(v['duration'])
+    return durations
+
+def build_rows(testkeys, path, alldurations):
+    rows = []
+    for k in testkeys:
+        vals = [d[path][k] for d in alldurations]
+        # one delta/pct per consecutive pair: (run1,run2), (run2,run3), ...
+        deltas = []
+        for base, target in zip(vals, vals[1:]):
+            delta = target - base
+            # a percentage between two runs that both round to 0s is meaningless noise
+            if round(base) == 0 and round(target) == 0:
+                pct = None
+            else:
+                pct = (delta / base * 100) if base else 0.0
+            deltas.append((delta, pct))
+        rows.append((k, vals, deltas))
+    return rows
+
+def filter_sort_rows(rows, args):
+    """Apply --threshold/--sort-by-delta/--limit to a table's rows"""
+    if args.threshold:
+        rows = [r for r in rows if any(pct is not None and abs(pct) >= args.threshold for _, pct in r[2])]
+
+    sortkey = (lambda r: max((abs(pct) for _, pct in r[2] if pct is not None), default=0)) if args.sort_by_delta else (lambda r: r[0])
+    rows = sorted(rows, key=sortkey, reverse=args.sort_by_delta)
+    if args.limit:
+        rows = rows[:args.limit]
+    return rows
+
+def print_table(title, rows, labels):
+    if not rows:
+        return
+
+    width = max(len("TESTCASE"), min(70, max(len(r[0]) for r in rows))) + 2
+    pair_labels = ["%s->%s" % pair for pair in zip(labels, labels[1:])]
+    pair_widths = [max(12, len(pl)) for pl in pair_labels]
+
+    print("\n=== %s ===" % title)
+    print("%-*s%s  %s" % (width, "TESTCASE", "".join("%12s" % l for l in labels),
+                          "  ".join("%*s%9s" % (pw, pl, "%") for pw, pl in zip(pair_widths, pair_labels))))
+    for k, vals, deltas in rows:
+        # round() avoids -0.0 rendering as "-0" for small fractional deltas
+        pairstrs = ["%*d%9s" % (pw, round(delta), round(pct) if pct is not None else "")
+                   for pw, (delta, pct) in zip(pair_widths, deltas)]
+        print("%-*s%s  %s" % (width, k[:70], "".join("%12.0f" % v for v in vals), "  ".join(pairstrs)))
+
+def build_tables(args, logger):
+    """
+    Compute every (title, rows) table 'durations' prints, already filtered/sorted/limited,
+    in the order they should be printed: all normal tables first, then (if --show-short)
+    one short-tests table per test configuration.
+    Returns (labels, tables), or None if args were invalid.
+    """
+    if len(args.sources) < 2:
+        logger.error("At least two sources are needed to compare durations")
+        return None
+
+    labels = args.labels.split(',') if args.labels else ['RUN%d' % (i + 1) for i in range(len(args.sources))]
+    if len(labels) != len(args.sources):
+        logger.error("Number of --labels must match number of sources")
+        return None
+
+    alldurations = [load_durations(s) for s in args.sources]
+
+    testpaths = set.intersection(*(set(d) for d in alldurations))
+    if not testpaths:
+        return labels, []
+
+    tables = []
+    short_tables = []
+    for path in sorted(testpaths):
+        testkeys = set.intersection(*(set(d[path]) for d in alldurations))
+        rows = build_rows(testkeys, path, alldurations)
+
+        long_rows = [r for r in rows if max(r[1]) >= args.min_duration]
+        short_rows = [r for r in rows if max(r[1]) < args.min_duration]
+
+        tables.append((path, filter_sort_rows(long_rows, args)))
+        if args.show_short:
+            short_tables.append(("%s (under %gs, all sources)" % (path, args.min_duration),
+                                 filter_sort_rows(short_rows, args)))
+
+    return labels, tables + short_tables
+
+def durations(args, logger):
+    result = build_tables(args, logger)
+    if result is None:
+        return 1
+    labels, tables = result
+    if not tables:
+        print("No common test configurations found between the provided sources")
+        return 1
+
+    for title, rows in tables:
+        print_table(title, rows, labels)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('durations', help='compare test durations across two or more runs',
+                                         description='compare oeqa/ptest test and suite durations across two or '
+                                                      'more result sets, highlighting the biggest changes',
+                                         group='analysis')
+    parser_build.set_defaults(func=durations)
+    parser_build.add_argument('sources', nargs='+',
+                              help='two or more sources to compare, in the order given: each is either a '
+                                   'testresults.json file/directory/URL, or a text log produced by '
+                                   '"resulttool report"')
+    parser_build.add_argument('--labels', default='',
+                              help='comma separated labels for each source (default: RUN1, RUN2, ...)')
+    parser_build.add_argument('-s', '--sort-by-delta', action='store_true',
+                              help='sort by largest absolute change first (default: sorted by test name)')
+    parser_build.add_argument('-t', '--threshold', type=float, default=0.0,
+                              help='only show tests where at least one consecutive pair of sources changed '
+                                   'by at least this percentage')
+    parser_build.add_argument('-l', '--limit', type=int, default=0,
+                              help='limit output to this many rows per test configuration (0 = no limit)')
+    parser_build.add_argument('-m', '--min-duration', type=float, default=10.0,
+                              help='omit tests whose duration was under this many seconds in every source '
+                                   '(default: 10, use 0 to disable)')
+    parser_build.add_argument('--show-short', action='store_true',
+                              help='also print tests below --min-duration, in a separate table')
diff --git a/scripts/resulttool b/scripts/resulttool
index 66a6af9959..6e8124529d 100755
--- a/scripts/resulttool
+++ b/scripts/resulttool
@@ -44,6 +44,7 @@ import resulttool.merge
 import resulttool.store
 import resulttool.regression
 import resulttool.report
+import resulttool.durations
 import resulttool.manualexecution
 import resulttool.log
 import resulttool.junit
@@ -64,6 +65,7 @@ def main():
     subparsers.add_subparser_group('analysis', 'analysis', 100)
     resulttool.regression.register_commands(subparsers)
     resulttool.report.register_commands(subparsers)
+    resulttool.durations.register_commands(subparsers)
     resulttool.log.register_commands(subparsers)
     resulttool.junit.register_commands(subparsers)
 
-- 
2.55.0


