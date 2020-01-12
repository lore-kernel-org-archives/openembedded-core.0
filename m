Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id A56106D666
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:45:32 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id q9so6876286wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 06:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mDCoczSydMObwXCQu7r1WE5ZDt9d00b1HLEMvrKbnQg=;
	b=h2e1W+7o7vJnDrE5d+TLyCUP+kxnj+Uehepw+n77DYkqMIwZq9JW3/+pAUf1ItLuD4
	VpyS+AEHOvCofUZ5boXycjf7lx3derQqiorvUJ1Qk7vb6y7GwAEZJStVryv2CPICDPS6
	/HGx0pwRTERe9d7YLawEb9/O9w6KBVgj2StrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mDCoczSydMObwXCQu7r1WE5ZDt9d00b1HLEMvrKbnQg=;
	b=C/RAGskiztKXnaIoS2BS+erG4JLE8UiRx3IJPmFBj8efLmfV5aj09/nlluRnMb6fzt
	K9Sjktj6d+JAdw4YV7gL5N072WBOgXfWTU03qvhRXtaTn2hMskXGzflYlvD+B11qBq32
	oqvcM1gTVwGlvpAwLVprlk2XOvCV0jw4G6XAjC/U1u3W6c95PIS8ThdrSGgtmk7WEF4e
	mtWBNjIPayssKPSKcKYVtXiXSu4P6oKscjyRukt838TyIQA9CL5rK3Osxl/idcB5JlS6
	d2WTD3FeNa9niEydIA7tCIqknZO2+rbHmzE2VKqgvziZWxjN4w4T9UiaR1euvIAPO+QQ
	Rsjg==
X-Gm-Message-State: APjAAAXcRKkJHiSinTVcWMUWhv+b2gn3uB30plE0KMeaXHlCG2g4sK5j
	ZoZJ0jRRRjn9Ux/E7ko9viAHwY3gJEw=
X-Google-Smtp-Source: APXvYqyM8tMVtRv6zORw5LxqAfWMNg1T3Nx2G8K7GFeZ0M1fg0OLju5TrRfLEj8t3aFvhryqF5A3PQ==
X-Received: by 2002:a05:600c:298:: with SMTP id
	24mr14764806wmk.141.1578840333148; 
	Sun, 12 Jan 2020 06:45:33 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q14sm10808553wmj.14.2020.01.12.06.45.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jan 2020 06:45:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:45:30 +0000
Message-Id: <20200112144530.29417-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200112144530.29417-1-richard.purdie@linuxfoundation.org>
References: <20200112144530.29417-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] scripts/oe-build-perf-report: Avoid buildstats warning
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
X-List-Received-Date: Sun, 12 Jan 2020 14:45:32 -0000
Content-Transfer-Encoding: 8bit

When a comparision branch is set we see warnings. If two branches are used,
look for buildstats information from both to avoid this kind of warning:

INFO: Parsing buildstats from 'refs/notes/buildstats/perf-centos7.yoctoproject.org/master-next/qemux86'
WARNING: Buildstats not found for perf-centos7.yoctoproject.org/master/qemux86/56808-g08220028e52992dcba667fc97bf3afe8be1949fb/0
WARNING: Buildstats not found for perf-centos7.yoctoproject.org/master/qemux86/56808-g08220028e52992dcba667fc97bf3afe8be1949fb/1
INFO: Buildstats were missing for some test runs, please run 'git fetch origin refs/notes/buildstats/perf-centos7.yoctoproject.org/master-next/qemux86:refs/notes/buildstats/perf-centos7.yoctoproject.org/master-next/qemux86' and try again

(the warning is due to stats being looked for in both branches, choose
the other branch and different warnings would be shown)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-build-perf-report | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 21bde7e1561..e781f4f03ff 100755
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
2.20.1


