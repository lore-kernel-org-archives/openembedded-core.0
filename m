Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAE5E77184
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:47:55 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.12562.1733928471185474965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yhhOq5Kv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so6034078a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 06:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733928470; x=1734533270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juBbflJAJuBDuhsBGBYtBcEbijKYxIrliCxaw0UNTLM=;
        b=yhhOq5Kv+TL7Uzy2sxxPWPkclSPOQ8YK2jZTnwU9A4QBI6WoNJasdYPeEuxbkeWGl5
         tKizPmRpUVUr2w+Tym9g8/MAF9fdnfoFN8mLV1bLsYQ+yRFa4jQXpRgA4yj433EUCOtT
         zQAza1AobkxwLQls46qpuZ4zKn87Fvw2s5vVSp3K/rLnCKgG/Uqts0V+QkAyEOULN68V
         mpvHtZOtXbeoDtbTYNzxfVryGpYu/ZY1OtnBXDSS2Kg15N5ndayF2xZId6GnBFJu0I6Q
         KtiDjCYIM8OaBevPkkOY5wyN9aS+6SDPGxbx395o0mmN51El37wIKyu5b2t6tDG2ObyA
         uIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928470; x=1734533270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juBbflJAJuBDuhsBGBYtBcEbijKYxIrliCxaw0UNTLM=;
        b=I2TQLIBw2oWOGT2Zoj1Plq+DlPIvUySnUkdBkZdDs/GRKfT9J9mFZVB671nuCmxL2d
         P5NVue1WkWEDMevbL4KZiekvFET2xqLE+8omcJtJxACZjdCvLWAKA3FGldD7gPUaw5cs
         QlIzcRlXGILW6rKos5aCsdN86hFLV2s4NQksyK9Ehat27MUhk6ORBuR42tQuTj+zS0Gb
         O5X7mZ/9xFfjO9oMA95eDmv3Qo3nGyigwbHbdanHcfFVXfACYOJ6sd2Ucq0xCHZfog/F
         IWm4+m4KXtdXkTFHnY0NQ7Eb34XDx5kf3xTK6cKm58rVXbUtqCmZLRmu84hemwi9tVOM
         MYcQ==
X-Gm-Message-State: AOJu0YwG1P6q5Kv/992Vr29iQzDESaOA0JCwkkDHYLT/pKqZSkD288f9
	U5Qzwlc3tH+y3U2QEDTD6vQXg0MuTiWVgbyvujarx47YAEDH6sEnj9vPwsH/dRlXcqUlow1PJU0
	+
X-Gm-Gg: ASbGncshy6T79HwV7eqkyDXATGoPQPl0MPJBbQLNiLdZ2rK4xhQLaCXa0tFyV3nWmu1
	DdlVrNvd7IOgXBW92uv4Q4xanY1Oq18sAMT/eKXhA2T8F6UlZ3MS6xsdrhS+Qioqqo/zgRlkv/o
	ykq6bL6JhNWv0Q4/k6p13xU+GsL6qNLCznM8d/1C7qloPDJtD/y/9t3Bxk3EiM3/cqALjsznZlu
	rqYZ75Ez3sy4dHE96zfl8FEEMQufmLtkvQMfcZSMO0=
X-Google-Smtp-Source: AGHT+IFeWNsGz60TEzjuxIB7X7vDAoNlYZ1D2aa3bSZ/tnN10RIOkKAw5hvhzrG6m4jlOPcNuGlOEw==
X-Received: by 2002:a17:90b:49:b0:2ee:a127:ba8b with SMTP id 98e67ed59e1d1-2f128048ea9mr4396485a91.36.1733928470418;
        Wed, 11 Dec 2024 06:47:50 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd3891dc95sm7494377a12.42.2024.12.11.06.47.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:47:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] sanity: check for working user namespaces
Date: Wed, 11 Dec 2024 06:47:35 -0800
Message-Id: <a069b9f9ee6708022e12970d53262d966ee806ba.1733928291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733928291.git.steve@sakoman.com>
References: <cover.1733928291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208590

From: Ross Burton <ross.burton@arm.com>

If user namespaces are not available (typically because AppArmor is
blocking them), alert the user.

We consider network isolation sufficiently important that this is a fatal
error, and the user will need to configure AppArmor to allow bitbake to
create a user namespace.

[ YOCTO #15592 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6af956fe6e876957a49d4abf425e8c789bf0459)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 293e405f62..3b13ba647e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -469,6 +469,29 @@ def check_wsl(d):
             bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
     return None
 
+def check_userns():
+    """
+    Check that user namespaces are functional, as they're used for network isolation.
+    """
+
+    # There is a known failure case with AppAmrmor where the unshare() call
+    # succeeds (at which point the uid is nobody) but writing to the uid_map
+    # fails (so the uid isn't reset back to the user's uid). We can detect this.
+    parentuid = os.getuid()
+    pid = os.fork()
+    if not pid:
+        try:
+            bb.utils.disable_network()
+        except:
+            pass
+        os._exit(parentuid != os.getuid())
+
+    ret = os.waitpid(pid, 0)[1]
+    if ret:
+        bb.fatal("User namespaces are not usable by BitBake, possibly due to AppArmor.\n"
+                 "See https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-notes/39890#unprivileged-user-namespace-restrictions for more information.")
+
+
 # Require at least gcc version 7.5.
 #
 # This can be fixed on CentOS-7 with devtoolset-6+
@@ -634,6 +657,7 @@ def check_sanity_version_change(status, d):
     status.addresult(check_git_version(d))
     status.addresult(check_perl_modules(d))
     status.addresult(check_wsl(d))
+    status.addresult(check_userns())
 
     missing = ""
 
-- 
2.34.1


