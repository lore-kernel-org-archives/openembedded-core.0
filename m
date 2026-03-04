Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A20CEB7EB6
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:25:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14937.1772619939651122151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Me1WCgy8;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439bcec8613so2027140f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772619938; x=1773224738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ODmRnX45XT3+/dRCaDUqqQ2N7YfZj9Ub0gRo40/VD0=;
        b=Me1WCgy8ivPWq2Zl3s+6dTuTZf1IS6nmpm5SPMXwm6ATi/EpX4w/EkvoRE4FlLmQHZ
         ZppQZqMrydUT31udbnvhxVj49E3kH/bVmGXbIOFr/aFHyBvkzID6Aoi824/N1eGhF7+3
         N49Ja8joFlPyHcetUiHu92HK30a/JktqavgKIWvxb9/CT/3IG/v6VofoHRAAJ4qqLpfv
         rlf/ndlWrr4DVE4zTS5qAKoSfB6fZEs/Xr11EMZHLO6NW6S5fHnPHgY+P3wVI89cOu6c
         RYKXUmi3HtuO+bmggUCQWnqKVP4S2kU6fPVyzRImUzGbX6UEt/TDDCxd5gDYDnvjWQYC
         iiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772619938; x=1773224738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ODmRnX45XT3+/dRCaDUqqQ2N7YfZj9Ub0gRo40/VD0=;
        b=dTRf7CI3VoEevDlE4cKPEnI/PrRAVGGjuyISRHounhcgHfm+5UsT2r8HnGTgTDfgEf
         qTHHznLL+WCPQiEHm0guQcamfIon2T8jLLZXPP9eQPOifc0X/891ONGxHgr9COPh9nRv
         7uhPeJpS/P+mzO0BXCrqHLWvsNtw4NrTqYJSULQvHZc2e7WDHR7XfGNsT6cNHKvjNjZa
         ug+UyOcyF5bAQlh5tEs87R4vt1wnUI4DmqolSJnPn1Fq51ssHJht2yFT+YEshTJNb6SW
         En73NNgpU3ABZmeMcqaDRu+yEdeq6Jx0OXnf4OzkgHDBqahxYcHsrg2s0ZTvBH0BiB26
         yq8g==
X-Gm-Message-State: AOJu0Yx8kEiYdV1e1U0XI/cAccbhf74oRSOvj3nD2pa07bT44fIFstiA
	oCpSlJ9yUEMPmCNuIwmw3jlaoxvwcGppUP+LBTrRb4VQdAbcrYPYfBOw0TieZQ==
X-Gm-Gg: ATEYQzzKFfxhus3LrTfZYwf9egI0b4NrsZRYfQvuwJ/8VXPMz4JfOygCf3WyfjRhMVy
	s7kwdg5EaaE4vn2tRL/jg3C/ty80wsEa0TlZRn/6p2wGVzZ4M2c2day217yHU8e0CSadbMiB5gK
	/tUCnoZW0i+crMvVWOIaRh9Q5BR1GKalvnCjS0wWSad3mx3E9Ip+G6MHrpwMNbGNxdYi6yZuFby
	t9KVNCpC9QPdy8VVLLWKW3vjxXdzJBTexV8sSBBJQbvMQkDI1dk++7JFi9MsSoET4yOqHgbu+jC
	CFp5DcPDcWEqr6NGdNzthYXLDNVHOroiQnnsnOfY+B8ztP9U5smX4Pqc7aIIjpVtZgF9fWIrbxy
	O17GwxN7LB2BBsDJovj9lgoDipFzYsC/JxrhycdSV72obzfuH5v2O8aDYY0Oldr7CwBKSMtqn3V
	3xa2Kdvpa3B1Ax/gUm9rNaRXUowaeLYfR6b5hgpB71JVDmd0aOvS5B0yKh+cs=
X-Received: by 2002:a05:6000:1866:b0:430:f985:a7b2 with SMTP id ffacd0b85a97d-439c80209c9mr2487061f8f.51.1772619937689;
        Wed, 04 Mar 2026 02:25:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439af926c53sm32155253f8f.8.2026.03.04.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:25:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v3] sanity.bbclass: warn when sstate is outside of build dir, but hash equiv database is inside it
Date: Wed,  4 Mar 2026 11:25:31 +0100
Message-ID: <20260304102531.3825150-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232357

From: Alexander Kanavin <alex@linutronix.de>

This should help with the long-standing usability problem: when
someone tweaks the configuration to put sstate somewhere else than
the default (so that it can be shared between local builds, or over NFS),
they should also share the hash equivalency database, but no indication
would be given to the user to do so.

This will issue a warning and recommend to start a dedicated hash equivalency
server (if sstate is on NFS), or set BB_HASHSERVE_DB_DIR (if it isn't).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
v3: moved the check to oe-core's sanity class (v1/2 had it in bitbake cooker),
due to use of SSTATE_DIR variable which is specific to oe-core.
---
 meta/classes-global/sanity.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 7e81d65939..a170c3f5f5 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1011,6 +1011,29 @@ def check_sanity_everybuild(status, d):
     if d.getVar("SSTATE_MIRRORS") and hashserv and hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
         bb.warn("You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.")
 
+    # Check that when SSTATE_DIR is shared between builds, hashserve database is not private to a build
+    hashserv_proto,_,hashserv_path,_,_,_ = bb.fetch2.decodeurl(hashserv)
+    if hashserv_proto == "unix":
+        dbdir = d.getVar("BB_HASHSERVE_DB_DIR") or d.getVar("PERSISTENT_DIR") or d.getVar("CACHE")
+        topdir = d.getVar("TOPDIR")
+        sstatedir = d.getVar("SSTATE_DIR")
+
+        if (hashserv_path.startswith(topdir) and dbdir.startswith(topdir) and not sstatedir.startswith(topdir)):
+            if bb.utils.is_path_on_nfs(sstatedir):
+                bb.warn("""Sstate directory is on a shared NFS (it is set via SSTATE_DIR to {}),
+    but hash equivalency database is inside this particular build directory {}.
+
+    This will prevent sstate reuse, and it is recommended to set up a permanently running hash equivalency server
+    according to https://docs.yoctoproject.org/dev-manual/hashequivserver.html""".format(sstatedir, topdir))
+            else:
+                bb.warn("""Sstate directory is shared between several builds (it is set via SSTATE_DIR to {}),
+    but hash equivalency database is inside this particular build directory {}.
+
+    This will prevent sstate reuse, and it is recommended to set the location for the database to a common path
+    via BB_HASHSERVE_DB_DIR, for example:
+
+    BB_HASHSERVE_DB_DIR = \"${{SSTATE_DIR}}\"""".format(sstatedir, topdir))
+
     # Check that TMPDIR hasn't changed location since the last time we were run
     tmpdir = d.getVar('TMPDIR')
     checkfile = os.path.join(tmpdir, "saved_tmpdir")
-- 
2.47.3


