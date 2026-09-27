Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76265CA5FA2
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32857.1790495027540750274
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kBM94Zv0;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-488885c3844so554943f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495026; x=1791099826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BpGVufLe95AwW+tM2WALjrjpgZUmd+E/9jCdnWYwKc4=;
        b=kBM94Zv0TG74VLvZZiawJp7WWJqRuW/wTNy1OpRrUqCcOYQev3EX50KN/0Z9Jihx0h
         3A46OWp2uGkXEEJZJnXkZRjxok0E18NwsukDfb7ceLYQBt2B/67VZ6Wz+kR57TPhkhy+
         XwFuuMeFk1rmnN65MF3YLjz9w3vpA4MEXHVLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495026; x=1791099826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BpGVufLe95AwW+tM2WALjrjpgZUmd+E/9jCdnWYwKc4=;
        b=HDoTMsYBOixbsdyXMvA37pC6R/WUj3KqbUvBj/j8EDyzTGnVvY3mtjfmbcDYOoUYsw
         6YcpdRiBPJSDt1+hl6e9nSV4k8RtvAfVyW78GlCRYwBM2/qG3kYhO3VRu7F/l6uRPab7
         ztqv2iKsW0v4+8NxCUcSgXdYghqe1vP6ofYXrpOCbCDxsJGrlkOwRcW8eJ92zcf7dgip
         GUo/VbpvK1Po6XCDN6XVUu4J3yo8fexBGGi+hTrntZ4Dpqu0gsUJ3VF3LBOENO/c9pJD
         zubPoiRUBMSu3t7AfSboAzcuMs/dcPlV5nML4faLwVgw6f+zsW2EkC2zY1EeOUovLnuy
         JHmw==
X-Gm-Message-State: AFq9FYKQBoqLLexTqWnxYH3hHoIMI2AOsfIkA7Yldx4YeLsqdi6jj/Q0
	k0q/p7e4sWzWRDAHbzCUK/AFQI1G/QUXJckP+Tu+Fge+e/CCZpOqAS0e2gT3KdtXtWp1g/8G+7c
	4sFlTufE=
X-Gm-Gg: AYBFou37s7LkZKQLiSuOhGFdMn7YIjFmo5+W97wdiLf6xvbtJRjfrYPNFmNt/0HPV0e
	TJ/6V6k0W0PnjAJGhzHxBasm1PZxk89w1nSu6Ohg1BiMaQfOznf95puVl1w9h3J0R0/UrMi1Zh2
	laQoJQan1BSsrFbTa2kev8BJZzOFKCGUirQK/DdF+g0k7FiPUzNIfrBTNLBWvwdE4fq144a+n86
	OMTxyIbB0KC/DhATfgoyqYi4uEGGXvcSqmzyvT+MBS7shCXJO2g6QRudXGQdehaD+4b56uP1cma
	tErNXjJFo1k0mn5Ovo4Rj4Btx2yr8sWindQzcq2ZuSeCnFxEEn1TJDoGHt4pjY/etIOR75U/jIj
	k8VnbMgtgYwQskzce0CS+2s3bWnxPkfxerByIzFtlO4G1xAx664Mq2RRcczFf0+TwGy26J15EsK
	98paI4oTjhG9o5EFNAH70r1Hbn+P+ljNLpSYnGj+SrtRj1rA6rTQOxlF+Srnfl2E3QtDg/yNvH7
	cNleSoeCns8SfL5MzdsBm2buC1WNz/JhV+3HmxbxFkypomANNMNr5s6yOVxZ7mB5bAu9AAcjA==
X-Received: by 2002:a05:6000:4103:b0:487:c3e:d6cc with SMTP id ffacd0b85a97d-4887171e51bmr18231511f8f.31.1790495025757;
        Sun, 27 Sep 2026 00:43:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/28] vim: Fix CVE-2026-28417 hostname regression
Date: Sun, 27 Sep 2026 09:43:01 +0200
Message-ID: <8aad82361ba459a6ec3947a1f38bce28c52e0941.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246660

From: Devansh Patel <devanshp@cisco.com>

The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw
hostname validation. That CVE fix requires follow-up regression patches
because it rejects valid hostnames containing optional ports or
underscores.

Vim 9.2.0340 already contains that CVE fix and patch 9.2.0089, which
corrects optional-port handling. It still needs patch 9.2.0553 to accept
underscores, so backport that commit and retain its _gateway regression
test.

The netrw history hunk is adapted to preserve Wrynose's existing
multi-line history and append the upstream 2026 May 28 entry. The
src/version.c hunk is omitted because this backport does not change the
recipe version or Vim's upstream patch-number table.

[1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1
[2] https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda
[3] https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11
[4] https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-28417-regression.patch | 65 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression.patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression.patch
new file mode 100644
index 00000000000..e5d947b7374
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression.patch
@@ -0,0 +1,65 @@
+From a058d0dcd289ddb934b30125ac732f737bf89eb7 Mon Sep 17 00:00:00 2001
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
+- Wrynose's netrw header uses a chronological change-history list instead
+  of upstream's "Last Change:" field, so add the equivalent 2026 May 28
+  history entry.
+- Omitted src/version.c because this backport does not change the recipe's
+  Vim version or its upstream patch-number table.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 93d177cd2b69bac58fc51a5a514d7bc71e264b11)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 5 +++--
+ src/testdir/test_plugin_netrw.vim              | 1 +
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index c240bbd13..54be15b3f 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -24,6 +24,7 @@
+ " 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
+ " 2026 Apr 01 by Vim Project use fnameescape() with netrw#FileUrlEdit()
+ " 2026 Apr 05 by Vim Project Fix netrw#RFC2396() #19913
++" 2026 May 28 by Vim Project allow underscores in hostname checking #20344
+ " 2026 Jun 16 by Vim Project Fix filename escaping in local file deletion
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+@@ -2604,8 +2605,8 @@ function s:NetrwValidateHostname(hostname)
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
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index a0a3915f5..8d7167793 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -574,6 +574,7 @@ endfunc
+ func Test_netrw_hostname()
+   let valid_hostnames = [
+   \   'localhost',
++  \   '_gateway',
+   \   '127.0.0.1',
+   \   '::1',
+   \   '0:0:0:0:0:0:0:1',
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b3732cb780e..de639a65026 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -46,6 +46,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-73076.patch \
            file://CVE-2026-73077.patch \
            file://CVE-2026-73078.patch \
+           file://CVE-2026-28417-regression.patch \
            "
 
 PV .= ".0340"

