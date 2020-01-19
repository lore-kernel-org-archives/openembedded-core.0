Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 91C837FBFD
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 21:37:30 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id x6so14768018pfo.10
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 13:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lsnR4C5iJQrMejIPSnfikUVG/8MPS8uVspQA5KxnmB4=;
	b=YR+CN2/0HUNBO5Avao5IQ0d40o29bjC7EsXW+JIM4H3tz60eA0ka4GBAaqy61bQIPu
	dpEdmAACgOyTVAtFU69NlqKtC7Bp9q8F2DU8n3Cjv47GVO3zEL6LNIuzQZ8FMOy7VOX+
	LKRML/5rBqDx7gAgtovkBtWD5c7WOjm+nmSAts+/i2pVYwvZPS1epBotXEfcs5tB6oiq
	2X05IqagAQi8z1WjO5+wtu8wn3sUnuSzJpGRpjBSAkQQ+c2KNKQOTbFmdlpDpuYdKcmo
	dFC1Lw49TK+uK7llk8HgLb1AUccfWhtmkxjIh6y9hDuaaqHZjh0bpa5Y9R3Xc/rAOoZ+
	NaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lsnR4C5iJQrMejIPSnfikUVG/8MPS8uVspQA5KxnmB4=;
	b=pW3vXmAT4kx1/oQU/wcvDXN08hKLwrljDEWgsfKlS30BLumL9MPrd5GZI45ubVqU6Q
	KE01riE50sOjpEOoV4xqzb052faW4IMriiPr0f08z+BbhdUlRpHubFug4l4P7y9N9sqZ
	okXWFNTuYTQOJzR4pHsvGO7BBoANucc/ggeQ0T5G+JXFaeN4tLCBX2mn2KZU4VoRk4Y/
	7drPfUxO5FbQbbIcH0b3s4FcVCu9C7QAh/crLtuKJUCGvi/qaGaAHlzlRGSX1qetWkEm
	9H7SKsMCCXyWHnWBvzE9DxL0S6gfsuDfjKu0Zx3AFySj9uEbdZsWKzYsO18bHd+rsfCo
	Z+pg==
X-Gm-Message-State: APjAAAVN/2i7bOlmocITmal72u4+RBG1FdJmzI39HIROIp3XveoNcB6P
	UP4Ftai0mPt5MNzvPjGojUlhrhLO
X-Google-Smtp-Source: APXvYqzk0/w1a384/IpFcB3CYk1MikQuYKEG78uVr5qJ4TGP3QcNlAgdx56ZD4ikj689VuFaA6AT5Q==
X-Received: by 2002:a62:1d52:: with SMTP id d79mr14125608pfd.144.1579469851344;
	Sun, 19 Jan 2020 13:37:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	q15sm34912518pgi.55.2020.01.19.13.37.30
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 13:37:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 13:37:23 -0800
Message-Id: <232b2f6dabaedff087df15a7e6d431dd9f314b4c.1579469619.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579469619.git.akuster808@gmail.com>
References: <cover.1579469619.git.akuster808@gmail.com>
Subject: [zeus 5/6] scripts/oe-build-perf-report: Avoid buildstats warning
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
X-List-Received-Date: Sun, 19 Jan 2020 21:37:30 -0000

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


