Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E0B207C5B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:04:33 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t200so3538089wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=o/es5hM+Kmg0KWPiWx6Z6JdVu5/Tgr3BVjSVL6TajSk=;
	b=Bi0BGdYHSIpyb94zuzgvQX6qQqRNcKRUbxfU/woD5DVke0B+j0lyu2YhI/yLO86cv0
	+1Vcsj8IvgZq5CoHZlGXUYmEUh20Tr+z+tl06WJ/v2ddkZsgQfObVfKfi0By60ex5J2I
	xBDZCIPI0qWCS3n9VxvlK7HM7fBXwebRB78xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o/es5hM+Kmg0KWPiWx6Z6JdVu5/Tgr3BVjSVL6TajSk=;
	b=lpSdIKlHQpcbckVmXBIjPTOfdCmGaE4OgZ8/SM+DSd6UjGKzGAd6W3r9AkDQvLak8i
	K5XVgO5BvX+cZtWrx/Z/oJs/pTdJhYCKuIV1GhtRklm4DpjQD6z+HEONxW2mvSd0FH8E
	4f6eFdDzR0xNXlS7TUkA6vBFWBNnGZyDKWILQ1hI7VUsKy/A05UbNI6ZThJYH+7agsDY
	c1un3yO149NZGXDhZpt9MbhgThZxcWzR2QkNsNjsuqhP+n+pwItwN3k5ZRL/e1Yug3s1
	d4t0ISzFXCDG7B7oWRPeAU5zawbRRtd58eeiofFlTqLPt+vE0QP/MF7rVFUJ77FVgKsA
	ZYqA==
X-Gm-Message-State: AHQUAuZXgmnIg2qVQ/D7/bTW5HO0P+Pg2S3MI7sVx4yNgK062HzS4e1f
	SPQDfTHJdLM118RUJamg6mU5l3U82tw=
X-Google-Smtp-Source: AHgI3Ib3WQPSsNeFyhCCFnyVRWq6qNJRfx9YZI6n36/PicUW19CWi2EzSIkJ8jqArKw5ONqVftPWHw==
X-Received: by 2002:a1c:6c01:: with SMTP id h1mr1586404wmc.113.1549634674179; 
	Fri, 08 Feb 2019 06:04:34 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y8sm3684493wmg.13.2019.02.08.06.04.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:04:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 14:04:30 +0000
Message-Id: <20190208140430.19985-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190208140430.19985-1-richard.purdie@linuxfoundation.org>
References: <20190208140430.19985-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] oe-build-perf-report: Allow commits from different branches
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
X-List-Received-Date: Fri, 08 Feb 2019 14:04:34 -0000
Content-Transfer-Encoding: 8bit

The code won't currently allow comparisions of two commits on different
branches even if the commits are specified by their hashes.

This updates the code to search two branches for any relavent commits,
hence allowing comparisions to be made. A particularly useful case is
master vs. master-next for example.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-build-perf-report | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index c91f74192b3..b7b09391cb8 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -542,6 +542,7 @@ Examine build performance test results from a Git repository"""
                        help="Tag name (pattern) for finding results")
     group.add_argument('--hostname', '-H')
     group.add_argument('--branch', '-B', default='master')
+    group.add_argument('--branch2')
     group.add_argument('--machine', default='qemux86')
     group.add_argument('--history-length', default=25, type=int,
                        help="Number of tested revisions to plot in html report")
@@ -579,6 +580,10 @@ def main(argv=None):
 
     revs = get_test_revs(repo, args.tag_name, hostname=args.hostname,
                          branch=args.branch, machine=args.machine)
+    if args.branch2:
+        revs = revs + get_test_revs(repo, args.tag_name, hostname=args.hostname,
+                             branch=args.branch2, machine=args.machine)
+
     if len(revs) < 2:
         log.error("%d tester revisions found, unable to generate report",
                   len(revs))
-- 
2.20.1


