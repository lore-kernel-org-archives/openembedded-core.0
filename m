Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C1E7971CCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:18:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 04:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="86877683"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2017 04:18:51 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:18:44 +0300
Message-Id: <f3a79ddc120436b120f74cb6401d1b893dc325be.1494846894.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/5] oe-build-perf-report: implement --dump-buildstats
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 May 2017 11:18:51 -0000

For dumping buildstats from the test runs being reported. The output
directory where buildstats are copied is 'oe-build-perf-buildstats/'.
Buildstats can be then further analyzed with buildstats-diff script, for
example.

[YOCTO #11355]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-report | 49 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 34591bec16..1a30c70e2b 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -34,7 +34,7 @@ from build_perf import html
 
 scriptpath.add_oe_lib_path()
 
-from oeqa.utils.git import GitRepo
+from oeqa.utils.git import GitRepo, GitError
 
 
 # Setup logging
@@ -397,6 +397,43 @@ def print_html_report(data, id_comp):
     print(html.template.render(metadata=metadata, test_data=tests, chart_opts=chart_opts))
 
 
+def dump_buildstats(repo, outdir, notes_ref, revs):
+    """Dump buildstats of test results"""
+    full_ref = 'refs/notes/' + notes_ref
+    if not repo.rev_parse(full_ref):
+        log.error("No buildstats found, please try running "
+                  "'git fetch origin %s:%s' to fetch them from the remote",
+                  full_ref, full_ref)
+        return
+
+    missing = False
+    log.info("Writing out buildstats from 'refs/notes/%s' into '%s'",
+              notes_ref, outdir)
+    for rev in revs:
+        log.debug('Dumping buildstats for %s (%s)', rev.commit_number,
+                  rev.commit)
+        for tag in rev.tags:
+            log.debug('    %s', tag)
+            try:
+                bs_all = json.loads(repo.run_cmd(['notes', '--ref', notes_ref,
+                                                  'show', tag + '^0']))
+            except GitError:
+                log.warning("Buildstats not found for %s", tag)
+                missing = True
+            for measurement, buildstats in bs_all.items():
+                tag_base, run_id = tag.rsplit('/', 1)
+                tag_base = tag_base.replace('/', '_')
+                bs_dir = os.path.join(outdir, measurement, tag_base)
+                if not os.path.exists(bs_dir):
+                    os.makedirs(bs_dir)
+                with open(os.path.join(bs_dir, run_id + '.json'), 'w') as f:
+                    json.dump(buildstats, f, indent=2)
+    if missing:
+        log.info("Buildstats were missing for some test runs, please "
+                 "run 'git fetch origin %s:%s' and try again",
+                 full_ref, full_ref)
+
+
 def auto_args(repo, args):
     """Guess arguments, if not defined by the user"""
     # Get the latest commit in the repo
@@ -452,6 +489,8 @@ Examine build performance test results from a Git repository"""
     group.add_argument('--commit-number2',
                        help="Revision number to compare with, redundant if "
                             "--commit2 is specified")
+    parser.add_argument('--dump-buildstats', nargs='?', const='.',
+                        help="Dump buildstats of the tests")
 
     return parser.parse_args(argv)
 
@@ -546,6 +585,14 @@ def main(argv=None):
     else:
         print_html_report(data, index_l)
 
+    # Dump buildstats
+    if args.dump_buildstats:
+        notes_ref = 'buildstats/{}/{}/{}'.format(args.hostname, args.branch,
+                                                 args.machine)
+        dump_buildstats(repo, 'oe-build-perf-buildstats', notes_ref,
+                        [rev_l, rev_r])
+                        #revs_l.tags + revs_r.tags)
+
     return 0
 
 if __name__ == "__main__":
-- 
2.12.0


