Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778B5FF8841
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32580.1777064210095154988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fX51ZfHV;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so42144955e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064208; x=1777669008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVZn56Z+EO8gXCc5bBC4olKUsP8bV9S8R/6BjNte8lQ=;
        b=fX51ZfHVrItkQZ6mwuvaLMRrcxSNPQFZeDLxvTtmKdRAzoG9N8EQKzc1VKB9Y2GFgo
         ds12f7v2CYr3u07F7gK3bRCVX+ceAfLqdNiPoOKVve5O5swQFOdh6XB+ffJu6gA+eLBX
         8Jp2YpdhP2EYWlOQJXmJdoI3qGqKUCH7U/Hfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064208; x=1777669008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EVZn56Z+EO8gXCc5bBC4olKUsP8bV9S8R/6BjNte8lQ=;
        b=TAQlnH4iLqTHLXe/q4ffkq+40LPPNXeaLav0BfhTCOLZvFCCHCqNy+Z9H72EdAOi3b
         1Uxi8PUVBdIAORUVOT2sQ3NjovsVT5mpKdwtyBjExlxyxCsYXrLTzRippIN2fiYuJscl
         euqKO9Q+dU1RzDGIy9ZhTXrl0sTSzCnVsiAmUXhPdgUZY2MvfKwnHYHNoKqoZtf1qJZP
         jaMlXF8tEcH/GDi3MTJxoFZdsQJ87ZqeiX8d/gbLep0OsCA7rAMdtsF6rC5YvE5gYFnB
         4htlPqAjY6doKOyzgrwKDoFK6mhs6VEfRq08NyD9k+PkURX+5G6NyWznQCcK+9ZGgBhd
         ojtw==
X-Gm-Message-State: AOJu0YzZ64M7mjFWq+lD1oO0t56MZXoYixOo56p7JKVi4m/F+x9hdt8p
	pEbEvzMRZXWzA97wO61XqRF+r3650I+wiL2QFB4krOxKgp54z4gzAce411X4DkbtGw6Zzm54zV1
	a9ZxRVR8jHthM
X-Gm-Gg: AeBDietT03QyUeku53EZW2AZtnMM9HhdB6l1Lw9GfYs6xXqho19fPQCgWf+/S/PuRzl
	7y9OuGxFW/ezXzwmNHoedvV573wOxLa6CoU0GZI2sV+WpuVP3K0Lqz/obj+VYSSQsL3ZxdyyKwq
	JxD5BYKMfeGIp+FSrLzIHNRndrMCa9uqa5+J0J4mVLhLNxP877j7FuNnxIYcluVHxPYe/mw1Njz
	ZtWB28osiDNu16Jw4y8GTYOrFkkaypPh+ZLfh8xUFYowiA3CAOCL3bPa3gw48WyRRPx0MMThpNf
	vzkFPCAOy6B4Mb3W1RFjDE3MMs9uuZT5tKNqYygukQ1LkoooNNibtH52XpJICfHBAR+SSC77htO
	ux0Me19Vy1ITZrFNsCo9OefVnSe82Ifr0niK+0HQwCCMxAgMQLpy+1CG144yGi3A1BGZ/OgOHDB
	3W+GkNB9OTHw00WlfvtN6pLCdemmy8l8oXDUiqZYDMnRVefwo7+/cKbvd/jVBn8fff6nM3nw2Fo
	vn9IafiLKDLV39vP/3z7JX/x1zOi8xU0hAKoA==
X-Received: by 2002:a05:600c:b96:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48a53390f6cmr266036825e9.9.1777064208204;
        Fri, 24 Apr 2026 13:56:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/66] vim: Fix CVE-2026-28418
Date: Fri, 24 Apr 2026 22:55:18 +0200
Message-ID: <bbbe166c9d9df9b8cf0df6f84bf1eb3c7732b7da.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235892

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28418

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-28418.patch            | 78 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28418.patch b/meta/recipes-support/vim/files/CVE-2026-28418.patch
new file mode 100644
index 00000000000..3a80ba77f7d
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28418.patch
@@ -0,0 +1,78 @@
+From f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 23 Feb 2026 18:30:11 +0000
+Subject: [PATCH] patch 9.2.0074: [security]: Crash with overlong emacs tag
+ file
+
+Problem:  Crash with overlong emacs tag file, because of an OOB buffer
+          read (ehdgks0627, un3xploitable)
+Solution: Check for end of buffer and return early.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-h4mf-vg97-hj8j
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-28418
+Upstream-Status: Backport [https://github.com/vim/vim/commit/f6a7f469a9c0d09e84cd6cb46c3a9e76f684da2d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/tag.c                    |  3 +++
+ src/testdir/test_taglist.vim | 15 +++++++++++++++
+ src/version.c                |  2 ++
+ 3 files changed, 20 insertions(+)
+
+diff --git a/src/tag.c b/src/tag.c
+index a32bbb2459..45af67f20d 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -1902,6 +1902,9 @@ emacs_tags_new_filename(findtags_state_T *st)
+ 
+     for (p = st->ebuf; *p && *p != ','; p++)
+ 	;
++    // invalid
++    if (*p == NUL)
++	return;
+     *p = NUL;
+ 
+     // check for an included tags file.
+diff --git a/src/testdir/test_taglist.vim b/src/testdir/test_taglist.vim
+index 5a946042be..506e64f7ae 100644
+--- a/src/testdir/test_taglist.vim
++++ b/src/testdir/test_taglist.vim
+@@ -301,4 +301,19 @@ func Test_tag_complete_with_overlong_line()
+   set tags&
+ endfunc
+ 
++" This used to crash Vim
++func Test_evil_emacs_tagfile()
++  CheckFeature emacs_tags
++  let longline = repeat('a', 515)
++  call writefile([
++	\ "\x0c",
++	\ longline
++	\ ], 'Xtags', 'D')
++  set tags=Xtags
++
++  call assert_fails(':tag a', 'E426:')
++
++  set tags&
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 712a3e637c..7d265ab641 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1685,
+ /**/
+     1684,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4553c69c55f..37534c696b1 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
            file://CVE-2026-33412.patch \
+           file://CVE-2026-28418.patch \
            "
 
 PV .= ".1683"

