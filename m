Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF1871A50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:54:53 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id f8so10894214wrf.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Aug 2017 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2HcPr70BNk2lgb1a4yb36Vg0ljb65Ir40zoVW0e4KR8=;
	b=QYK+T4IOaMtRVZDrn+tpMBhW15/g87ZrAZmI327bnzfnnNDwyjs7EAqgJnMU12ef3v
	7vvFmB+k3l+BXRsvMyb6zXbIAnsSOvQVX+XRduBIvVnvKF94WUmSrPSVHlBl76tnerTf
	kWUqpKgqMLO/H97TvLb8m9Yaboci2RPmofr2QDEHtQsSLan5wttyGMbi7m32fQsbJxCy
	ckKlISrqxC6HK3hApOf4bT4Cgp8vKzGGwRd19q9YDbPsuq86YjwFIShHxnf9EkWSoJ0E
	wcsrrywE9p8lVjlN6j/zZuwdz9SA7hXsL3v95cfo0LmXb1H/l51YSJPWDnUsbseM40Ka
	cfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2HcPr70BNk2lgb1a4yb36Vg0ljb65Ir40zoVW0e4KR8=;
	b=lM325O+tKdWC8wG6cPghwsY5EqgRzNe3E9ZSlnqrA2q9O70FxJ+V4hTkU0WiRCF51e
	ILM94zlDIxB0k4H+5bjSv/rgQgXOOrR+ErPwl2uFdNSBepPSaq6zvaXi/ZsOrRBJJGHk
	hRpP8EafFQTs3np+45uTXNUHVil/UvC3p/AOtz2lKs+OjHQXO8EGn6/+i2EIIPFUJiRl
	Tl/m8z0UnxhZNytTW3KNdyXl+TYAbQeMvk6T660RZaNPGanmTUdxwP/kJrzUWiWJNsOt
	Wldi8nEo/YZv5gJmgCh/EtnM2Y5+T1vkp+reuJuiaS5UCjjw5cRGe/fe4mMga9Ljc6St
	329Q==
X-Gm-Message-State: AHYfb5jNaVneJ7qs23LHs1RyOCpPmPxkoT6O5d1oL0nE7c5q40kY4zPk
	hYIMZoQM308mAh/H
X-Received: by 10.223.134.242 with SMTP id 47mr3538086wry.104.1503298494745;
	Sun, 20 Aug 2017 23:54:54 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c13sm6351542wrb.87.2017.08.20.23.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Aug 2017 23:54:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 08:56:33 +0200
Message-Id: <20170821065633.27570-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [PATCH] insane.bbclass: write QA issues to log file only when thei are in ERROR_QA or WARN_QA
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
X-List-Received-Date: Mon, 21 Aug 2017 06:54:54 -0000

* QA check which aren't included in WARN_QA and ERROR_QA are shown
  during the build only as NOTE message (not shown at all with default
  knotty setting), so it might be surprising to see them later in qa.log
  file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b7177c9b32..44e4a01c92 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -184,12 +184,13 @@ def package_qa_write_error(type, error, d):
             f.write("%s: %s [%s]\n" % (p, error, type))
 
 def package_qa_handle_error(error_class, error_msg, d):
-    package_qa_write_error(error_class, error_msg, d)
     if error_class in (d.getVar("ERROR_QA") or "").split():
+        package_qa_write_error(error_class, error_msg, d)
         bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
         d.setVar("QA_SANE", False)
         return False
     elif error_class in (d.getVar("WARN_QA") or "").split():
+        package_qa_write_error(error_class, error_msg, d)
         bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
     else:
         bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
-- 
2.14.0


