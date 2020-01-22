Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 66A759145D
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:26 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id d15so2603820pjw.1
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lsnR4C5iJQrMejIPSnfikUVG/8MPS8uVspQA5KxnmB4=;
	b=DXiSSxD36ADDOJ4nsh8vbkRciXvDoLvbKhyrTyxuo4bWsnaR0VXZ0vSLBnV/Nmp13k
	KNtj+rqOaPRZPpyybchrgdgy0GYGJ+/K68IhK4uffXPo5uT/K9rZ9cEaueUvmQOEHI/v
	pZS8qdXIzsFq7qI+ZG725A7oYxJ4x4e77NjbL5ddqaqYDuQcqHO77FGhp2jTlxG587jt
	CwOevzDvSWb2j0Lnt7gdgs1ZOLXQVudflH9b756zzcNrjdDo9ab1QgfW0UpoVkuAQD8e
	cK95V+qTxCe0qR5NVAYsAHKvLeY2DYqkFDawidgON3ZmYrue2gdtF8plXZGE5rhk3S9k
	/nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lsnR4C5iJQrMejIPSnfikUVG/8MPS8uVspQA5KxnmB4=;
	b=ULkGs51Kh9b+ra8tqz1aeYVRNSnVhPfsFZeEIMzxjRL9PzF7KaQnQsvdAxWGEQbPFf
	lSRTt4Sc2cvSv5gNM7D69fKJQsrzA/ubWF+FnhodN+RD+Rmwf+Vz/sU3V+EgwuuubrkM
	IRR4UBvHeiRHGUXnmFFZcD1iLzHv+bGbAU3i+w6JLHTteQWp7A8GpkBLW6fVFa63i3gv
	GbYdOfsR07CANh7q4icX2QkHHFbW4SYjLHbeoOPdlM0qO6wMb4jOdW2LIbhAwZtJcvGv
	6RM+K6Py7yRapD7YUk9hKSbyaUlUhc8qjMAkLi7J1N5vq4HYg/6YaCy5NtywDWQoPD19
	uYMw==
X-Gm-Message-State: APjAAAVjPRkjdOqe26ssfXjNict7A99drENBc1flfVwPsXdqoDurtB4K
	MseUaiCUBJqUdPklIOpDLRANF3Th
X-Google-Smtp-Source: APXvYqz16hs4SFQRoTA65ZLYszidWqTqGii5aq9cSfX6Pt7R/EKhOx6Nf6ZsKfF+iLeBOuabZj7EyA==
X-Received: by 2002:a17:902:a608:: with SMTP id
	u8mr8889470plq.76.1579672107304; 
	Tue, 21 Jan 2020 21:48:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.26
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:15 -0800
Message-Id: <232b2f6dabaedff087df15a7e6d431dd9f314b4c.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 10/11] scripts/oe-build-perf-report: Avoid buildstats warning
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:26 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When a comparision branch is set we see warnings. If two branches are used,
look for buildstats information from both to avoid this kind of warning:

INFO: Parsing buildstats from 'refs/notes/buildstats/perf-centos7.yoctoproject.org/master-next/qemux86'
WARNING: Buildstats not found for perf-centos7.yoctoproject.org/master/qemux86/56808-g08220028e52992dcba667fc97bf3afe8be1949fb/0
WARNING: Buildstats not found for perf-centos7.yoctoproject.org/master/qemux86/56808-g08220028e52992dcba667fc97bf3afe8be1949fb/1
INFO: Buildstats were missing for some test runs, please run 'git fetch origin refs/notes/buildstats/perf-centos7.yoctoproject.org/master-next/qemux86:refs/notes/buildstats/perf-centos7.yoctoproject.org/master-next/qemux86' and try again

(the warning is due to stats being looked for in both branches, choose
the other branch and different warnings would be shown)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af58c18fcd0451540dd77ee862956b2b9dee17c4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/oe-build-perf-report | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 21bde7e156..e781f4f03f 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -372,7 +372,7 @@ def print_html_report(data, id_comp, buildstats):
                                chart_opts=chart_opts))
 
 
-def get_buildstats(repo, notes_ref, revs, outdir=None):
+def get_buildstats(repo, notes_ref, notes_ref2, revs, outdir=None):
     """Get the buildstats from git notes"""
     full_ref = 'refs/notes/' + notes_ref
     if not repo.rev_parse(full_ref):
@@ -391,8 +391,13 @@ def get_buildstats(repo, notes_ref, revs, outdir=None):
         for tag in rev.tags:
             log.debug('    %s', tag)
             try:
-                bs_all = json.loads(repo.run_cmd(['notes', '--ref', notes_ref,
-                                                  'show', tag + '^0']))
+                try:
+                    bs_all = json.loads(repo.run_cmd(['notes', '--ref', notes_ref, 'show', tag + '^0']))
+                except GitError:
+                    if notes_ref2:
+                        bs_all = json.loads(repo.run_cmd(['notes', '--ref', notes_ref2, 'show', tag + '^0']))
+                    else:
+                        raise
             except GitError:
                 log.warning("Buildstats not found for %s", tag)
                 bs_all = {}
@@ -589,9 +594,12 @@ def main(argv=None):
     buildstats = None
     if args.dump_buildstats or args.html:
         outdir = 'oe-build-perf-buildstats' if args.dump_buildstats else None
-        notes_ref = 'buildstats/{}/{}/{}'.format(args.hostname, args.branch,
-                                                 args.machine)
-        buildstats = get_buildstats(repo, notes_ref, [rev_l, rev_r], outdir)
+        notes_ref = 'buildstats/{}/{}/{}'.format(args.hostname, args.branch, args.machine)
+        notes_ref2 = None
+        if args.branch2:
+            notes_ref = 'buildstats/{}/{}/{}'.format(args.hostname, args.branch2, args.machine)
+            notes_ref2 = 'buildstats/{}/{}/{}'.format(args.hostname, args.branch, args.machine)
+        buildstats = get_buildstats(repo, notes_ref, notes_ref2, [rev_l, rev_r], outdir)
 
     # Print report
     if not args.html:
-- 
2.17.1


