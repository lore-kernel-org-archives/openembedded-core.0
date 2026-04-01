Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABA1107637B
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 13:46:00 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13472.1775051150548878907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 06:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2iGJa+MN;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so2789071f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775051149; x=1775655949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSzW0DaoKq5WeZxCuLD3vQNRGp67csGHczTV6p3B08A=;
        b=2iGJa+MNy1C4PrNb4JaMiok6+1RppgElZ1S3oy+EF9ca22lOWLzTi1acyw63KVSX+y
         rTOS0+wqIySrjTmEaaG9c5RsxuGEYCviBasDZd1VAR1GwD2GhJd0ZQQagFTyzH1mEUwb
         JrL0fOkjfl2zALNN+4Rr7BiTGIHry98xiRK8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051149; x=1775655949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSzW0DaoKq5WeZxCuLD3vQNRGp67csGHczTV6p3B08A=;
        b=m1ul9vPERrf+nsbDt1W74evXp34qnbEhUicDcS6hplU8UNQCwaflRhQPwoqHmgtgn4
         XR5MpZ9sonXMWUpf/nA5JTsXqvnMPMw/An3k/cvvjikFYvPTeSCEoM4fPnCXXGBO1SK9
         moIQ9qewvpdcankR0B4gSOJd7WYSHDm8h0FVtXx6xZbo7hnErmoV1CqJOub3ncN7aZoV
         pVEVTQzZA3CkZ70dVE0chgrJUj6unA9TFsP8zWgxI3zjn1HGXHnwyPHBh2AS3/tm4HKQ
         A/R1gy37xrYfqrQcMP4rq32q7hmbnYtaEYfwhO8DYpQWPDCXTq5nzgMuXh+oinYGAzYa
         83Og==
X-Gm-Message-State: AOJu0Yyd4bk2uzZNrVPhRp0bMaSbCAVRwVk2cDOzGhJlG+eOE1K7T8wK
	4PlW/IlYA7bS3t5cINSAFP1W18uPvEt3rgL4I3o11eAv5Scou4eNE43dN7WY6kYhwXi6w7V6/L9
	s+oR5vOA=
X-Gm-Gg: ATEYQzyO44WEbz09ThjerGVeqf0tPvm/XRuTVikmUgyjLEmdCHfPoVxirmIqPiO5rIm
	+RihN522xbrJJFx3rLAfd7Ct3JAdpPQHXldeJt9xAxJTYR4epQdlRm5694XKvffNn9Z6sul2fh2
	v3ULjAtZ7DOiFyOT0STO35CKEKMNwGyCIaJAkZIOCj/P7Ne8nWo9uh9YtxYOOl2Mc80RV05RMir
	C9cQL82MYExJV7oA8+t285VZ7EJwBRKoEa3v3TEGRaUnDZqLQN13Iufc/uPb41CfAHyfIq6VHUV
	hEwzEQE+yN+Yzz3mJZgIfIlR07+amWHfvTZdXONRic1cbnY1Bs4Nf8IJ/bvIxed6ddD3N+LK1IU
	qnWyXwgAhfibsw4GUb1gN/Q/cHxo8G0Ae3e1NaIt1lVQPBIKiLHnrLPnmii5DszqSisT+fYsX20
	HL3EWv29JDSn9sEd0ySPemxR1mlxWP622/mD29MeZ8F7E3P0YzZLc0brtYh9s3SwwWUj6TzGSMq
	l9KQqpqXf08uHlUyvjgodK20L2exDQvH3+0O842DKPSMQ==
X-Received: by 2002:adf:e60d:0:b0:43d:1e1f:9440 with SMTP id ffacd0b85a97d-43d1e1f95a5mr91248f8f.48.1775051148678;
        Wed, 01 Apr 2026 06:45:48 -0700 (PDT)
Received: from P-ASN-DERVAUX.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm84653f8f.0.2026.04.01.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:45:47 -0700 (PDT)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v2 1/2] patchtest: return non-zero exit code on test failure
Date: Wed,  1 Apr 2026 15:45:32 +0200
Message-Id: <20260401134533.322260-1-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 13:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234348

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Update patchtest to return a non-zero exit code when a test fails
instead of always exiting successfully.

This enables proper failure detection in selftests and CI pipelines
relying on the command return status.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
changes in v2:
    - Removed the --error-on-failure option; if a test fails, a non-zero value is returned
---
 scripts/patchtest | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 9218db232a..143cf08572 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -183,6 +183,7 @@ def print_result_message(preresult, postresult):
     print("----------------------------------------------------------------------\n")
 
 def main():
+    ret = 0
     tmp_patch = False
     patch_path = PatchtestParser.patch_path
     log_results = PatchtestParser.log_results
@@ -214,13 +215,15 @@ def main():
 
         try:
             if log_path:
-                run(patch, log_path)
+                ret = run(patch, log_path)
             else:
-                run(patch)
+                ret = run(patch)
         finally:
             if tmp_patch:
                 os.remove(patch)
 
+    return ret
+
 if __name__ == '__main__':
     ret = 1
 

