Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C5DC74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 17:39:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20669.1679420387590474026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 10:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D167AAD7;
	Tue, 21 Mar 2023 10:40:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A88C3F766;
	Tue, 21 Mar 2023 10:39:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] scripts: add buildstats-summary
Date: Tue, 21 Mar 2023 17:39:43 +0000
Message-Id: <20230321173943.1257786-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 17:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178892

This script will write a summary of the buildstats to the terminal,
sorted by start time or duration, optionally hiding short tasks, and
highlighting long running tasks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/buildstats-summary | 126 +++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100755 scripts/buildstats-summary

diff --git a/scripts/buildstats-summary b/scripts/buildstats-summary
new file mode 100755
index 00000000000..89348318afa
--- /dev/null
+++ b/scripts/buildstats-summary
@@ -0,0 +1,126 @@
+#! /usr/bin/python3
+#
+# Dump a summary of the specified buildstats to the terminal, filtering =
and
+# sorting by walltime.
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+import argparse
+import dataclasses
+import datetime
+import enum
+import os
+import pathlib
+import sys
+
+scripts_path =3D os.path.dirname(os.path.realpath(__file__))
+sys.path.append(os.path.join(scripts_path, "lib"))
+import buildstats
+
+
+@dataclasses.dataclass
+class Task:
+    recipe: str
+    task: str
+    start: datetime.datetime
+    duration: datetime.timedelta
+
+
+class Sorting(enum.Enum):
+    start =3D 1
+    duration =3D 2
+
+    # argparse integration
+    def __str__(self) -> str:
+        return self.name
+
+    def __repr__(self) -> str:
+        return self.name
+
+    @staticmethod
+    def from_string(s: str):
+        try:
+            return Sorting[s]
+        except KeyError:
+            return s
+
+
+def read_buildstats(path: pathlib.Path) -> buildstats.BuildStats:
+    if not path.exists():
+        raise Exception(f"No such file or directory: {path}")
+    if path.is_file():
+        return buildstats.BuildStats.from_file_json(path)
+    if (path / "build_stats").is_file():
+        return buildstats.BuildStats.from_dir(path)
+    raise Exception(f"Cannot find buildstats in {path}")
+
+
+def dump_buildstats(args, bs: buildstats.BuildStats):
+    tasks =3D []
+    for recipe in bs.values():
+        for task, stats in recipe.tasks.items():
+            t =3D Task(
+                recipe.name,
+                task,
+                datetime.datetime.fromtimestamp(stats["start_time"]),
+                datetime.timedelta(seconds=3Dint(stats.walltime)),
+            )
+            tasks.append(t)
+
+    tasks.sort(key=3Dlambda t: getattr(t, args.sort.name))
+
+    minimum =3D datetime.timedelta(seconds=3Dargs.shortest)
+    highlight =3D datetime.timedelta(seconds=3Dargs.highlight)
+
+    for t in tasks:
+        if t.duration >=3D minimum:
+            line =3D f"{t.duration}    {t.recipe}:{t.task}"
+            if t.duration >=3D highlight:
+                print(f"\033[1m{line}\033[0m")
+            else:
+                print(line)
+
+
+def main(argv=3DNone) -> int:
+    parser =3D argparse.ArgumentParser(
+        formatter_class=3Dargparse.ArgumentDefaultsHelpFormatter
+    )
+
+    parser.add_argument(
+        "buildstats", metavar=3D"BUILDSTATS", help=3D"Buildstats file", =
type=3Dpathlib.Path
+    )
+    parser.add_argument(
+        "--sort",
+        "-s",
+        type=3DSorting.from_string,
+        choices=3Dlist(Sorting),
+        default=3DSorting.start,
+        help=3D"Sort tasks",
+    )
+    parser.add_argument(
+        "--shortest",
+        "-t",
+        type=3Dint,
+        default=3D1,
+        metavar=3D"SECS",
+        help=3D"Hide tasks shorter than SECS seconds",
+    )
+    parser.add_argument(
+        "--highlight",
+        "-g",
+        type=3Dint,
+        default=3D60,
+        metavar=3D"SECS",
+        help=3D"Highlight tasks longer than SECS seconds",
+    )
+
+    args =3D parser.parse_args(argv)
+
+    bs =3D read_buildstats(args.buildstats)
+    dump_buildstats(args, bs)
+
+    return 0
+
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main())
--=20
2.34.1


