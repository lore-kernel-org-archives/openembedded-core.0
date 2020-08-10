Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.37544.1597028406205441755
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fiLjMKXn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id ha11so4191276pjb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Gmr1nrKf8mAFWrAtg3eblbAXvLE30POxzW5V3T91g1g=;
        b=fiLjMKXnazCRpUd+mL/pbHfIJshlDR7QIROjul+U2FgkyyTCEsyQah+WnnWHZbMr8k
         0VU+junkOox5A30TIM1ZqozND01AyaRV47FN7IvuSv05x5FP070uKaj8LMSUO+RCRQLV
         qGGxJRP3ekqi165R70IG/lfMP564wK9A3gPY/l/o+QcnhcHrKhhF6r+yEfJ6QCOpWDmG
         kdP9TWs+1KTRSlH3Nd4XbRx16qF443heJwASZL6HCvUTYMMPiLBJqvlO6VUZAV6T3xbj
         APwyPLZJZFrdfisE6BfNj85n9qJyyCT6iRELm++LLX83SRjQ8i7btHFNVs1sF7lYgKGt
         lQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Gmr1nrKf8mAFWrAtg3eblbAXvLE30POxzW5V3T91g1g=;
        b=taF0VvPBa96a5z+eyfa1Z1DYHKXckc37Ngis9m859jwSl2T6aKS4V811OcIccsU4Es
         7dBLMcCCBdaoCequfznLIoIeVqE0rWrV27560gclz0zNoEzVTl4TmtuuLd5YsO8BpCyq
         uTPedjexz8ahWsbnRIUYH6Xc9uqM4nomNAkZ1TZ8Y+kz+TO8v6TuP3pu7kfYyQf6XEIz
         //nuhodZnmnSI2vgZ2XocLxeQYJRmDMqg4ovWVgFsHySX4gzn1Dba1Eniqjwsz4TvDtB
         8FGEmkepjdEBszBKNF7KOnVY+BARpn/ow7/zH8rB82cdhgrrqzqyAmnx6wOTZ2T4vjFY
         6VXg==
X-Gm-Message-State: AOAM533jVepqZMNfR+P//BSNRcHwg191RkJRCNW5aVOKYk9lgZKdc0M8
	hL/6ZIbv8Ntz0uV90VEkhLV38q5XSBXLog==
X-Google-Smtp-Source: ABdhPJwAHHM89UtN01kZ6woG0lfzXxCIt/vYb2PL303Tr7p3vfue3WV4NRnmXkgSHcdfGfP5k7oQxA==
X-Received: by 2002:a17:90a:15c8:: with SMTP id w8mr16904011pjd.179.1597028404965;
        Sun, 09 Aug 2020 20:00:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/19] ltp: make copyFrom scp command non-fatal
Date: Sun,  9 Aug 2020 16:59:16 -1000
Message-Id: <9390846e2abdd6837094a619ba4703a1be4a04cf.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Matthew <matthew.zeng@windriver.com>

[YOCTO #13802]

Make the scp failure non-fatal so the ltp tests continue to run and
the rest of the logs will be available to see afterwards.

Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0f7d093038274f4f21f6cca39a96aac4f6c32ee3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py   | 7 +++++--
 meta/lib/oeqa/runtime/cases/ltp.py | 5 +++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 090b40a814..aefb576805 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -107,13 +107,16 @@ class OESSHTarget(OETarget):
             scpCmd = self.scp + [localSrc, remotePath]
             return self._run(scpCmd, ignore_status=False)
 
-    def copyFrom(self, remoteSrc, localDst):
+    def copyFrom(self, remoteSrc, localDst, warn_on_failure=False):
         """
             Copy file from target.
         """
         remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
         scpCmd = self.scp + [remotePath, localDst]
-        return self._run(scpCmd, ignore_status=False)
+        (status, output) = self._run(scpCmd, ignore_status=warn_on_failure)
+        if warn_on_failure and status:
+            self.logger.warning("Copy returned non-zero exit status %d:\n%s" % (status, output))
+        return (status, output)
 
     def copyDirTo(self, localSrc, remoteDst):
         """
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 6dc5ef22ad..a66d5d13d7 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -78,9 +78,10 @@ class LtpTest(LtpTestBase):
             # copy nice log from DUT
             dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group )
             remote_src = "/opt/ltp/results/%s" % ltp_group 
-            (status, output) = self.target.copyFrom(remote_src, dst)
+            (status, output) = self.target.copyFrom(remote_src, dst, True)
             msg = 'File could not be copied. Output: %s' % output
-            self.assertEqual(status, 0, msg=msg)
+            if status:
+                self.target.logger.warning(msg)
 
             parser = LtpParser()
             results, sections  = parser.parse(dst)
-- 
2.17.1

