Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5832AC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:41:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4827.1789007623748603132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 19:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BvuL3cK3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lH0K3198376
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 02:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oBwuwBlBAi8Jc4l2dqz5yaasINVhRd6TX2s
	REK1cLe8=; b=BvuL3cK3fWkJWMJAYh7fhS6P5VOl9HRhKGl2L8APRyP1forMPUN
	OjUNz0b3JNtqY03tefJbccMqn9FIe25SaSYbeVSfPmf2uloAEDtGgmseAsMzyoXd
	VsIL0xEhyY70rhZi7NMtOOfbDoOfNk/gBDNKM/qxl1HeVft+Y7GLfUZg2EoK203b
	XAR7GugRsAOnwGNbMQl+nccq7DsarnpCI7C6EPfu+Av98xRy89a/KA+yB9nYAWnl
	Ck/WPKVOAAAMKakjEnuyK3As2Bgm4v+L76hymQifvbjyRhro7Bqb1mHFwKYKd2KD
	IdyI/0jmQV/iyKBqa8esHB8YnOI45IlGo9A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydsnku-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 02:33:42 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68A2Xf9F2616541;
	Thu, 10 Sep 2026 02:33:41 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 68A2Xe6n2616531
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 02:33:40 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id A78A6ABA; Thu, 10 Sep 2026 10:33:39 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH wrynose] systemd: backport drop-in lookup optimization
Date: Thu, 10 Sep 2026 10:33:38 +0800
Message-ID: <20260910023338.1422939-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa21706 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=n6MYwUk4AAAA:8
 a=sSdlVLZ36vxmc_UqIBIA:9
X-Proofpoint-GUID: 7pgEaAZwzuodJLtL6i99nuB2mQuoKDzb
X-Proofpoint-ORIG-GUID: 7pgEaAZwzuodJLtL6i99nuB2mQuoKDzb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAyNSBTYWx0ZWRfX0UmLoXbBCGWB
 jq/nXigeLKg5AOmFNfQPge6/r5E+m4W429grBfqYAyX56r+9Y38+P+/dYnMHHqzSGS5ubkHBYaL
 HFhJ1EGhi0iETRq0spQmGcaHwTFuPpc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAyNSBTYWx0ZWRfX1HOS9vD44SsH
 FKDsauDY7X5vuXdpy/yyjmBX1ay5nnz2onsMjQjO1OsN7Nwejjjhj8Ee2kj01dfWn946nvmBNqV
 thDQRbAy/6+A7PGi/3e1yRTDDO+gkZ5Rx6ZAVJIK9viN6+zlTTwjzSCFlao8h6PlOEt19ZAPmeH
 5OCjNfx9HFGuuR+L2WrH9OjD03abxZlp0O1zjfmuxntATaKEMsVlr5dWAPFLRs007PAJNNoA4Y4
 lRFsC6thN+INY3ZIBcyvIwqzcjmvPjqYuH8JQ3zMYOLcpFrDOskivJhCcmVf4vGLY3/A6F1tppb
 f+Dlpu4GcZL+ldms6OJBAWTKz4tvBCVvE1SqKoNwS3gbR3oM3BqV3LwKSf1grJSJyN0GyfyD8Dm
 nwRKcVn4RKhkhubEt9NoWaz3uh3eTah5LNhpiWtyDBVUKvldMiBTpcorlOjsKLjLqKkcrd5b93e
 BRXtr8gYVgLun5PBomA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100025
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245581

Systemd re-derived drop-in name candidates for every lookup directory
while enumerating units, adding repeated parsing and allocations to the
boot path.

Backport the upstream optimization to the wrynose branch. Adapt it for
systemd 259.5 and its older unit path cache and configuration file APIs.

Assisted-by: Codex:GPT-5
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 ...-t-re-derive-drop-in-name-candidates.patch | 249 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.5.bb    |   1 +
 2 files changed, 250 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-shared-dropin-don-t-re-derive-drop-in-name-candidates.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-shared-dropin-don-t-re-derive-drop-in-name-candidates.patch b/meta/recipes-core/systemd/systemd/0001-shared-dropin-don-t-re-derive-drop-in-name-candidates.patch
new file mode 100644
index 0000000..95a275d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-shared-dropin-don-t-re-derive-drop-in-name-candidates.patch
@@ -0,0 +1,249 @@
+From 5ef2510988829c12cfbbe60e614bff3e3b0f97f9 Mon Sep 17 00:00:00 2001
+From: Eric Curtin <eric.curtin@docker.com>
+Date: Thu, 2 Jul 2026 13:37:06 +0100
+Subject: [PATCH] shared/dropin: don't re-derive drop-in name candidates per
+ lookup dir
+
+unit_file_find_dirs() is called once for every (unit name or alias,
+lookup directory, drop-in suffix) combination while enumerating units
+at boot, to check whether that unit has a ".d", ".wants", ".requires"
+or ".upholds" drop-in directory in that particular lookup path. On a
+typical system with ~270 loaded units and ~12 directories in the unit
+search path, this adds up to tens of thousands of calls.
+
+For every one of those calls, the function used to independently
+re-derive the full chain of candidate unit names to check for that one
+directory: the name itself, its template if it is a template instance,
+and its "-" prefix chain (e.g. for "foo-bar-waldo.service" also
+"foo-bar-.service" and "foo-.service"), recursively expanding further
+where applicable. That derivation only depends on the unit name itself
+and does not involve the lookup directory at all, so it produces the
+exact same list of candidate names regardless of which of the 12
+lookup directories is currently being checked. Despite this, it was
+being fully recomputed for every single directory, doing several small
+allocations and unit-name parsing calls (unit_name_template(),
+unit_name_to_prefix(), unit_name_build_from_type(), ...) each time.
+
+Split the name-derivation logic out into its own function,
+unit_file_expand_dropin_names(), and compute it once per unit
+name/alias, then reuse the resulting candidate list across all lookup
+directories instead of re-deriving it for each of them. The order in
+which candidate directories end up being added is unchanged, so this
+is not expected to alter drop-in resolution behaviour: I confirmed this
+by comparing the sorted unit load state, fragment path and drop-in path
+output of "systemd --test --system" before and after this change on the
+same unit tree, which is byte-for-byte identical.
+
+I measured the effect by instrumenting manager_enumerate() with
+CLOCK_MONOTONIC timestamps and running systemd, built from this exact
+tree, as actual PID 1 in a container with ~270 real units loaded, 50
+runs each before and after this change:
+
+  before: mean 45.35ms (stddev 0.60ms)
+  after:  mean 38.81ms (stddev 0.81ms)
+
+a ~14% reduction with about 8 standard deviations of separation between
+the two distributions, i.e. well outside of run-to-run noise.
+
+unit_file_expand_dropin_names()'s out parameter is renamed from
+ret_names to names, since it is appended to (including recursively)
+rather than only being populated on success, matching the ret_ naming
+convention used elsewhere for output-only parameters. Also, a failure
+partway through expanding a name's candidates (e.g. OOM) no longer
+discards the candidates already derived before the failure, keeping
+unit_file_find_dirs() closer to the original recursive
+implementation's error handling.
+
+unit_file_add_dir_if_exists(), which builds the path to check for each
+(lookup directory, candidate name) pair, is now the hottest remaining
+part of this code: with the per-directory re-derivation gone, it is
+called once for every directory/candidate combination instead of once
+per candidate. It used to build that path with strjoin(name, suffix)
+followed by path_join(unit_path, name_and_suffix), i.e. two heap
+allocations plus path_join()'s normalization pass. Lookup paths are
+already normalized (path_simplify() + strv_uniq()), so a single
+strjoin(unit_path, "/", name, suffix) produces the same string while
+halving the allocations and skipping the redundant normalization.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/5ef2510988829c12cfbbe60e614bff3e3b0f97f9]
+
+---
+index f540f48..730cf3f 100644
+--- a/src/shared/dropin.c
++++ b/src/shared/dropin.c
+@@ -140,32 +140,30 @@ static int unit_file_add_dir(
+         return 0;
+ }
+ 
+-static int unit_file_find_dirs(
+-                const char *original_root,
+-                Set *unit_path_cache,
+-                const char *unit_path,
+-                const char *name,
+-                const char *suffix,
+-                char ***dirs) {
+-
++/* Expands a unit name into the ordered list of candidate unit names whose drop-in directories should be
++ * considered for it: the name itself, its template (if it's an instance), and its "-" prefix chain (e.g.
++ * given "foo-bar-waldo.service" also "foo-bar-.service" and "foo-.service"), each of which may again expand
++ * further via the same rules (e.g. a templated prefix).
++ *
++ * This only depends on the unit name itself, not on any particular lookup directory. Search paths usually
++ * contain several directories, and each unit is looked up under several different suffixes (".d", ".wants",
++ * ".requires", ".upholds"), so callers are expected to compute this list once per (name, aliases) and reuse
++ * it across every directory/suffix combination, rather than re-deriving it (which requires several small
++ * allocations and unit-name parsing calls) again for each one. */
++static int unit_file_expand_dropin_names(const char *name, char ***names) {
+         _cleanup_free_ char *prefix = NULL, *instance = NULL, *built = NULL;
+         bool is_instance, chopped;
+         const char *dash;
+         UnitType type;
+-        char *path;
+         size_t n;
+         int r;
+ 
+-        assert(unit_path);
+         assert(name);
+-        assert(suffix);
++        assert(names);
+ 
+-        path = strjoina(unit_path, "/", name, suffix);
+-        if (!unit_path_cache || set_get(unit_path_cache, path)) {
+-                r = unit_file_add_dir(original_root, path, dirs);
+-                if (r < 0)
+-                        return r;
+-        }
++        r = strv_extend(names, name);
++        if (r < 0)
++                return log_oom();
+ 
+         is_instance = unit_name_is_valid(name, UNIT_NAME_INSTANCE);
+         if (is_instance) { /* Also try the template dir */
+@@ -175,7 +173,7 @@ static int unit_file_find_dirs(
+                 if (r < 0)
+                         return log_error_errno(r, "Failed to generate template from unit name: %m");
+ 
+-                r = unit_file_find_dirs(original_root, unit_path_cache, unit_path, template, suffix, dirs);
++                r = unit_file_expand_dropin_names(template, names);
+                 if (r < 0)
+                         return r;
+         }
+@@ -234,7 +232,72 @@ static int unit_file_find_dirs(
+         if (r < 0)
+                 return log_error_errno(r, "Failed to build prefix unit name: %m");
+ 
+-        return unit_file_find_dirs(original_root, unit_path_cache, unit_path, built, suffix, dirs);
++        return unit_file_expand_dropin_names(built, names);
++}
++
++/* Checks whether [original_root]/unit_path/name+suffix exists (consulting unit_path_cache first, if
++ * given), and if so adds it to dirs. */
++static int unit_file_add_dir_if_exists(
++                const char *original_root,
++                Set *unit_path_cache,
++                const char *unit_path,
++                const char *name,
++                const char *suffix,
++                char ***dirs) {
++
++        _cleanup_free_ char *path = NULL;
++
++        assert(unit_path);
++        assert(name);
++        assert(suffix);
++
++        /* Lookup paths are already normalized (path_simplify() + strv_uniq()), so a plain concatenation
++         * here produces the same string path_join() would, without the extra allocation and
++         * normalization pass. */
++        path = strjoin(unit_path, "/", name, suffix);
++        if (!path)
++                return log_oom();
++
++        if (unit_path_cache && !set_contains(unit_path_cache, path))
++                return 0;
++
++        return unit_file_add_dir(original_root, path, dirs);
++}
++
++static int unit_file_find_dirs(
++                const char *original_root,
++                Set *unit_path_cache,
++                char **lookup_path,
++                const char *name,
++                const char *suffix,
++                char ***dirs) {
++
++        _cleanup_strv_free_ char **candidates = NULL;
++        int r;
++
++        assert(name);
++        assert(suffix);
++
++        r = unit_file_expand_dropin_names(name, &candidates);
++        if (r < 0 && strv_isempty(candidates))
++                return r;
++
++        /* Even if expansion failed partway through (e.g. OOM, or a malformed candidate derived from the
++         * unit name), still use whatever candidates were already derived before the failure, rather than
++         * discarding all of them: this keeps us closer to the original recursive implementation, where a
++         * failure deriving a less specific candidate didn't undo drop-ins already found for more specific
++         * ones.
++         *
++         * Similarly, a failure while checking one candidate directory (e.g. OOM, or an unexpected chase()
++         * error) only aborts the (increasingly less specific) remaining candidates for the lookup
++         * directory we were currently looking at, matching the original recursive implementation's error
++         * handling. Other lookup directories are still tried independently. */
++        STRV_FOREACH(p, lookup_path)
++                STRV_FOREACH(c, candidates)
++                        if (unit_file_add_dir_if_exists(original_root, unit_path_cache, *p, *c, suffix, dirs) < 0)
++                                break;
++
++        return 0;
+ }
+ 
+ int unit_file_find_dropin_paths(
+@@ -254,12 +317,10 @@ int unit_file_find_dropin_paths(
+         assert(ret);
+ 
+         if (name)
+-                STRV_FOREACH(p, lookup_path)
+-                        (void) unit_file_find_dirs(original_root, unit_path_cache, *p, name, dir_suffix, &dirs);
++                (void) unit_file_find_dirs(original_root, unit_path_cache, lookup_path, name, dir_suffix, &dirs);
+ 
+         SET_FOREACH(n, aliases)
+-                STRV_FOREACH(p, lookup_path)
+-                        (void) unit_file_find_dirs(original_root, unit_path_cache, *p, n, dir_suffix, &dirs);
++                (void) unit_file_find_dirs(original_root, unit_path_cache, lookup_path, n, dir_suffix, &dirs);
+ 
+         /* All the names in the unit are of the same type so just grab one. */
+         n = name ?: (const char*) set_first(aliases);
+@@ -273,13 +334,12 @@ int unit_file_find_dropin_paths(
+ 
+                 /* Special top level drop in for "<unit type>.<suffix>". Add this last as it's the most generic
+                  * and should be able to be overridden by more specific drop-ins. */
+-                STRV_FOREACH(p, lookup_path)
+-                        (void) unit_file_find_dirs(original_root,
+-                                                   unit_path_cache,
+-                                                   *p,
+-                                                   unit_type_to_string(type),
+-                                                   dir_suffix,
+-                                                   &dirs);
++                (void) unit_file_find_dirs(original_root,
++                                           unit_path_cache,
++                                           lookup_path,
++                                           unit_type_to_string(type),
++                                           dir_suffix,
++                                           &dirs);
+         }
+ 
+         if (strv_isempty(dirs)) {
+@@ -287,7 +347,7 @@ int unit_file_find_dropin_paths(
+                 return 0;
+         }
+ 
+-        r = conf_files_list_strv(ret, file_suffix, NULL, 0, (const char**) dirs);
++        r = conf_files_list_strv(ret, file_suffix, /* root= */ NULL, CONF_FILES_WARN, (const char**) dirs);
+         if (r < 0)
+                 return log_warning_errno(r, "Failed to create the list of configuration files: %m");
+ 
+
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index f3ec0ed..d3f9a1e 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -35,6 +35,7 @@ SRC_URI += " \
            file://0001-meson-use-libfido2_cflags-dependency.patch \
            file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch \
            file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch \
+           file://0001-shared-dropin-don-t-re-derive-drop-in-name-candidates.patch \
            "
 
 PAM_PLUGINS = " \
-- 
2.43.0


