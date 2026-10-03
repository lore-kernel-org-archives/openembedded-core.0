Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650A3CA5FF0
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 21:43:20 +0000 (UTC)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13725.1791063795027870387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 14:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=p0Wd+y94;
 spf=pass (domain: smile.fr, ip: 74.125.225.98, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so541626f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 14:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791063793; x=1791668593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FqcsiLC3G539KkSiK7f0LWqzz24Zu+4Qy7Q4HaoqEvE=;
        b=p0Wd+y94HOKqkjBRdLXa4frWrKqgB3NVZb9MvKpMbOm7ccKgjpqh9/szUlP4veQngu
         Ar01/W1c7cVxOnZoPAN1crKirbVEw1EJrPIp7spJpxRcXYuZPXBr366Fk9KYbazjsjmB
         fREiluQjdmcVQyty/ohoUMkOTJY5hU57PxR20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063793; x=1791668593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FqcsiLC3G539KkSiK7f0LWqzz24Zu+4Qy7Q4HaoqEvE=;
        b=zFRNg2klp9PzqO+PktUVKwHgUzK4/QyDNSH0swV7BHSj9KqgDvRD6siN7/E/AAWGvu
         cvqnTSNN9XVwnme3SIBJ+hPuEzQlE5dmCe2iewR/vXfqhVkLPHs2Ea01HnI9GIAuwcA8
         Qkh7DXrsqaiWFKL1T4BvkSbHLRkfUQBulQ5cfGeYqqPdkftTE4TYUKQcT8gpcmP8hLXZ
         m0cHsxziVuKtlu6MYmbw62DDhgVg3RLcJUNE6IlJGHvs9QrdPHTaoj7FyeKxcOWZ2CzY
         3lYpRcYlog9LogEoNoPx2Ru/L9vonl+iJEoPwCKwIvDXgchpdPwqgFzH3wVE3/+l2Cqq
         hQiA==
X-Gm-Message-State: AFq9FYIiMXKo8+/G2VM0sagLtlEFZYavdEHTvsPK0cZ+twvAS1RUQ5rc
	BrNuBU0hOQS29ByMercKCzxw+KVaBG8S3bvwndJ5oWRD9/fwGXnNUohExBv6wfDtN26oPVdKqvM
	QXQpxWww=
X-Gm-Gg: AYBFou34rq/2p0hnfhk+AqmHwkFOLtJEddlRQZIxdexjIjrEyokPL8LMcsr7vfNSMAS
	734j8cYjo8Frwf6lt9hETeLPj8gUBRRopLp41wT9QxSvWF0JUW9xvTxdjEOT2MfSxJzZ9RWCDtY
	lSq7HToQp8pnt+7zHuulCWFSG2P1L1Lf7HHVb3Qbd0fiNwrdE2wd5bQ/SRJbThsDTsjr6V0i/Vc
	PKFS8fTPhzt3ZtM3C71OTcUpoA3ce2UfHpyySIlP/4FlEswqt1PNbOU2N/P6hRMIPX+niKY6kLk
	l5rGZycvrzgKx4YJJiVTzBmSQGB7nJtsi05ObAsho9faHioWk/9NNSM/T+SY/xTGIw7AsbMRvdv
	4yaTOHMbzwKviEJkHdcnau5W9bB6veLeMLaYk0HPD24qp6KtZkrYoVUo/1BafAv93ES8osU8Fs0
	xBoRhVE7HZEJd4fIadoYvFTEnGn4Vn2VFbJU3xEiCfjBYYr20eaVIfrUEOSioge54afsaOR5g5l
	AK9zR3IMzrNpQDIGy0CMhuSDVQyTLjbDkY9wkc1ROXhs8KTTjYKEw+zSqYukd3s61G79Uh681LH
	9Jw=
X-Received: by 2002:a05:6000:1862:b0:48b:5083:96ae with SMTP id ffacd0b85a97d-48b50839985mr11250983f8f.15.1791063792981;
        Sat, 03 Oct 2026 14:43:12 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04e2sm12832952f8f.15.2026.10.03.14.43.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:43:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/8] vim: Fix CVE-2026-28417 regressions
Date: Sat,  3 Oct 2026 23:42:11 +0200
Message-ID: <1505d5181d610b221fd75d413d884172b46b7860.1791061402.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791061402.git.yoann.congal@smile.fr>
References: <cover.1791061402.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 21:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247180

From: Devansh Patel <devanshp@cisco.com>

The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw
hostname validation. That CVE fix requires two regression patches
because it rejects valid hostnames that include an optional port or an
underscore.

Backport Vim patches 9.2.0089 and 9.2.0553 in that order. They restore
optional-port and underscore handling while retaining the stricter
validation introduced by the original CVE fix.

Scarthgap's Vim 9.1.1683 source does not contain
test_plugin_netrw.vim, so the upstream test hunks are omitted. The
src/version.c hunks are also omitted because this backport does not
change the recipe version or Vim's upstream patch-number table.

[1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1
[2] https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda
[3] https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11
[4] https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../files/CVE-2026-28417-regression_p1.patch  | 78 +++++++++++++++++++
 .../files/CVE-2026-28417-regression_p2.patch  | 53 +++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +
 3 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
new file mode 100644
index 00000000000..0289614bfe5
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
@@ -0,0 +1,78 @@
+From a6e9906380af2b51ea4b77234ef77b14cc712f2c Mon Sep 17 00:00:00 2001
+From: Miguel Barro <miguel.barro@live.com>
+Date: Sun, 1 Mar 2026 19:32:29 +0000
+Subject: [PATCH] patch 9.2.0089: netrw: does not take port into account in
+ hostname validation
+
+Problem:  netrw: does not take port into account in hostname validation
+          (after v9.2.0073)
+Solution: Update hostname validation check and test for an optional port
+          number (Miguel Barro)
+
+closes: #19533
+
+CVE: CVE-2026-28417
+Upstream-Status: Backport [https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda]
+
+Backport Changes:
+- Omitted src/testdir/test_plugin_netrw.vim because this test file is not
+  present in the Vim 9.1.1683 source used by Scarthgap.
+- Omitted src/version.c because this backport does not change the recipe's
+  Vim version or its upstream patch-number table.
+
+Signed-off-by: Miguel Barro <miguel.barro@live.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit a6198523fb28a50d96945458792cdb4787d3cdda)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 1b790d250..69eababf1 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -6,6 +6,7 @@
+ " 2025 Aug 07 by Vim Project (netrw#BrowseX() distinguishes remote files #17794)
+ " 2025 Aug 22 by Vim Project netrw#Explore handle terminal correctly #18069
+ " 2026 Feb 27 by Vim Project Make the hostname validation more strict
++" 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+ "             with or without modifications, provided that this copyright
+@@ -2575,7 +2576,8 @@ endfunction
+ 
+ " s:NetrwValidateHostname:  Validate that the hostname is valid {{{2
+ " Input:
+-"   hostname, may include an optional username, e.g. user@hostname
++"   hostname, may include an optional username and port number, e.g.
++"       user@hostname:port
+ "   allow a alphanumeric hostname or an IPv(4/6) address
+ " Output:
+ "  true if g:netrw_machine is valid according to RFC1123 #Section 2
+@@ -2584,17 +2586,19 @@ function s:NetrwValidateHostname(hostname)
+   let user_pat = '\%([a-zA-Z0-9._-]\+@\)\?'
+   " Hostname: 1-64 chars, alphanumeric/dots/hyphens.
+   " No underscores. No leading/trailing dots/hyphens.
+-  let host_pat = '[a-zA-Z0-9]\%([-a-zA-Z0-9.]{,62}[a-zA-Z0-9]\)\?$'
++  let host_pat = '[a-zA-Z0-9]\%([-a-zA-Z0-9.]\{0,62}[a-zA-Z0-9]\)\?'
++  " Port: 16 bit unsigned integer
++  let port_pat = '\%(:\d\{1,5\}\)\?$'
+ 
+   " IPv4: 1-3 digits separated by dots
+-  let ipv4_pat = '\%(\d\{1,3}\.\)\{3\}\d\{1,3\}$'
++  let ipv4_pat = '\%(\d\{1,3}\.\)\{3\}\d\{1,3\}'
+ 
+   " IPv6: Hex, colons, and optional brackets
+-  let ipv6_pat = '\[\?\%([a-fA-F0-9:]\{2,}\)\+\]\?$'
++  let ipv6_pat = '\[\?\%([a-fA-F0-9:]\{2,}\)\+\]\?'
+ 
+-  return a:hostname =~? '^'.user_pat.host_pat ||
+-       \ a:hostname =~? '^'.user_pat.ipv4_pat ||
+-       \ a:hostname =~? '^'.user_pat.ipv6_pat
++  return a:hostname =~? '^'.user_pat.host_pat.port_pat ||
++       \ a:hostname =~? '^'.user_pat.ipv4_pat.port_pat ||
++       \ a:hostname =~? '^'.user_pat.ipv6_pat.port_pat
+ endfunction
+ 
+ " NetUserPass: set username and password for subsequent ftp transfer {{{2
diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch
new file mode 100644
index 00000000000..e33c64ac91e
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p2.patch
@@ -0,0 +1,53 @@
+From 047b5dfc3213a42d7db960569f53b37e332f3c76 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 28 May 2026 20:53:53 +0000
+Subject: [PATCH] patch 9.2.0553: runtime(netrw): netrw rejects hostnames
+ containing _
+
+Problem:  runtime(netrw): netrw rejects hostnames containing _
+          (lilydjwg)
+Solution: Relax the restriction and allow the underscore
+
+fixes: #20344
+
+CVE: CVE-2026-28417
+Upstream-Status: Backport [https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11]
+
+Backport Changes:
+- Preserved Scarthgap's multi-line netrw change history and appended the
+  upstream 2026 May 28 change instead of replacing it with a single date.
+- Omitted src/testdir/test_plugin_netrw.vim because this test file is not
+  present in the Vim 9.1.1683 source used by Scarthgap.
+- Omitted src/version.c because this backport does not change the recipe's
+  Vim version or its upstream patch-number table.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 93d177cd2b69bac58fc51a5a514d7bc71e264b11)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 69eababf1..58aecc81e 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -7,6 +7,7 @@
+ " 2025 Aug 22 by Vim Project netrw#Explore handle terminal correctly #18069
+ " 2026 Feb 27 by Vim Project Make the hostname validation more strict
+ " 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
++" 2026 May 28 by Vim Project allow underscores in hostname checking #20344
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+ "             with or without modifications, provided that this copyright
+@@ -2585,8 +2586,8 @@ function s:NetrwValidateHostname(hostname)
+   " Username:
+   let user_pat = '\%([a-zA-Z0-9._-]\+@\)\?'
+   " Hostname: 1-64 chars, alphanumeric/dots/hyphens.
+-  " No underscores. No leading/trailing dots/hyphens.
+-  let host_pat = '[a-zA-Z0-9]\%([-a-zA-Z0-9.]\{0,62}[a-zA-Z0-9]\)\?'
++  " No leading/trailing dots/hyphens.
++  let host_pat = '[a-zA-Z0-9_]\%([-a-zA-Z0-9._]\{0,62}[a-zA-Z0-9_]\)\?'
+   " Port: 16 bit unsigned integer
+   let port_pat = '\%(:\d\{1,5\}\)\?$'
+ 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5a34c1fa35f..bd2ce2f6abb 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -30,6 +30,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-28421.patch \
            file://CVE-2026-32249.patch \
            file://CVE-2026-28417.patch \
+           file://CVE-2026-28417-regression_p1.patch \
+           file://CVE-2026-28417-regression_p2.patch \
            file://CVE-2026-45130.patch \
            file://CVE-2026-46483.patch \
            file://CVE-2026-28420.patch \

