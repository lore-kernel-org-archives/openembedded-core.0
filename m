Return-Path: <sofiane.hamam@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD8AC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 12:31:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.20838.1739968297932620074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 04:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z8EtM9bi;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso30749255e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 04:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739968296; x=1740573096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a1h+MDwiNMNYUEkz9QajQSswTgZ07u/Eow1WCHgNa78=;
        b=Z8EtM9bi1eY0ORESc5BAPRBSw8H5sz7DDRRm18qig0ANBiX/zMyPxhKUOLWbO8Xc5L
         yxxD/5eOkXzZw+44uTrXXWmIE09GDXr53uCra9gbdHm8ema7GhkV/Eeyeq70w4HbfeIz
         kQ0Hc068Et6Ygc7FEGHHLPtTR0sy8atgIhLCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968296; x=1740573096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1h+MDwiNMNYUEkz9QajQSswTgZ07u/Eow1WCHgNa78=;
        b=GyV5RlIIfsPK1rYITh6PU8AM//VuEmE7LC4B+N1QCGemuft+TyOXAiRATcs+UCR7Sz
         8Cj4bAXwISR/3tFvSRFIsda7pj4aos21UW4a0fRrmHS5iigZH9JTgNQFE5ssB0y57iI9
         GryTPpr1hHa+G3/DHQc0VujVjh1ZD0vVuafVAQ4I3bUmKkKW9pirrPYMrP2grFxYw28c
         +2ck38wSVZVjdrYiVwvMJhs/ljCVQn9usiR6HRu3l8Wy2UpBOdaIH8tmz2ZKZUOWVh5/
         btd45P4mymxTjk80nEqThpSqsdoBpqtUg2hIztrTdSaPTZNyVrvuqDr0P8M7c7gkUENZ
         uNPQ==
X-Gm-Message-State: AOJu0YyAnRQpecds5vSrYwoD+RRsjbspP+ulU2jMeRDs1xq4O5UDAink
	raeaC3ZKgm2LSth6OIxmpuPyEKLygxQY0HdXD0HquwylMgQIybMNpFoxNNyTrZE1/T4H65rmBQl
	W
X-Gm-Gg: ASbGncteuMff9gHouiMWVzhlXqmar4EtdeMyd0DIFcG+81f52gzJgxx+8oatrg/iMqQ
	e37nhXdSM4epIWh/3rDTrbAWqj78X3lEgCdQr90SUpOXMbLVY4rOaMHTiqOeNtOXY48tOa6R0GJ
	xMz+mUNjfQuDekJKBBOLIqWfyDrUSgI64Etv7GtK/MHIA6fQtCZTY9tv1NuP6IwBqzYMTKPCtJd
	hl8hoi+mWajuEATZj9ldPZtBRKO9QVJncBzS1bHt0LramDqmaR6qXU7Mh4QsgEHaamsvTXlc78a
	NKNZ6kQyVvE+y/k78PFWdJfE4R0RAERLwYYHxlSendCisBfGl7k+3dcszSR5CjkOe7OIXSQLMnf
	InynBrJXntIO8fptyRZEleie3
X-Google-Smtp-Source: AGHT+IHI4EOnUqU/NKg8o0+fzNQetCqhJOv6sFYinm2sFkaCobu20QKZq1MaJo2Wpihe3FyKtku0HA==
X-Received: by 2002:a05:600c:5104:b0:439:8c9c:6d32 with SMTP id 5b1f17b1804b1-4398c9c6f8amr97453625e9.13.1739968295481;
        Wed, 19 Feb 2025 04:31:35 -0800 (PST)
Received: from FRSMI25-BPYTOP.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399558f8d1sm44322805e9.19.2025.02.19.04.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:31:35 -0800 (PST)
From: Sofiane HAMAM <sofiane.hamam@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>
Subject: [PATCH v2] sanity: Check for non ascii chars in TOPDIR
Date: Wed, 19 Feb 2025 13:31:03 +0100
Message-ID: <20250219123102.3288782-2-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 12:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211703

Some modules (like Perl's MakeMaker) do not support non ASCII
characters in build folder's path, this would cause build failures
of software that does not support non ASCII.
A sanity check is added to warn the user.

Fixes [YOCTO #15764]

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 meta/classes-global/sanity.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 66693fc9b9..1bae998f74 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -299,6 +299,11 @@ def check_path_length(filepath, pathname, limit):
         return "The length of %s is longer than %s, this would cause unexpected errors, please use a shorter path.\n" % (pathname, limit)
     return ""
 
+def check_non_ascii(filepath, pathname):
+    if(not filepath.isascii()):
+        return "Non-ASCII character(s) in %s path (\"%s\") detected. This would cause build failures as we build software that doesn't support this.\n" % (pathname, filepath)
+    return ""
+
 def get_filesystem_id(path):
     import subprocess
     try:
@@ -719,6 +724,7 @@ def check_sanity_version_change(status, d):
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     import stat
     tmpdir = d.getVar('TMPDIR')
+    topdir = d.getVar('TOPDIR')
     status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
     tmpdirmode = os.stat(tmpdir).st_mode
     if (tmpdirmode & stat.S_ISGID):
@@ -785,6 +791,9 @@ def check_sanity_version_change(status, d):
     # The length of TMPDIR can't be longer than 400
     status.addresult(check_path_length(tmpdir, "TMPDIR", 400))
 
+    # Check that TOPDIR does not contain non ascii chars (perl_5.40.0, Perl-native and shadow-native build failures)
+    status.addresult(check_non_ascii(topdir, "TOPDIR"))
+
     # Check that TMPDIR isn't located on nfs
     status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
 

