Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91FAC43327
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 15:22:28 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71765.1783005742387473578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 08:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=HC7kT/d3;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9217d13c276so104592085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783005741; x=1783610541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moeKyl6NWNfn4D8Ze4VpBo7QG3MucDsq9fLBBaGnLuc=;
        b=HC7kT/d3cPKKHNVPN6AejPO9DkIVY2AIezBxqatbFOh6odJyEKMVASntv4VcjYNWV/
         cf39PX0L+mqMtVjybB87A/6Yz/l379/LSYWsRMmbPuCVrEvIiO26BAMNINb2kOczQeYS
         EY69KQArvVXKbfTauPtKz7tV5Ii9cY5ZvvJHSKb16ug0wZJyKaSmLcEVRNlPviekkI0e
         0iVsGznqEUxudm2XsLZDM7mirLBtMuMQ+Fc4WOm5NGFXInC59I9ty+OdFh15PMc/c/lB
         IlDWO0Yhqe9IdZ1H/ZRSx1ak32m0ZGVMfRkSwspDzitBi1i9/OvEuVsXvEupE/C8Kf3V
         usBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005741; x=1783610541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=moeKyl6NWNfn4D8Ze4VpBo7QG3MucDsq9fLBBaGnLuc=;
        b=hOjRiTQoyLMIFfSBE6HNe6we0tKn1Pyd+aZQ0l4HqPcdB44UbD2CUomq8yJ8NjDwl+
         e0GcMj0F3CigeT9LTELEJaAolfdKcV41A0VDeDcpctwQSVFe7bKhW9bef6asfKh6mJIL
         0kzW6807HeJlB9llKJQkWIpkIVMVnPhcf9XnBP6b9xbH4gYcxI3LHnEn3Vhp9T9Q5bnY
         jMDPcYx3dXNPucVoe5oUP2Hx4ez7j4vFPI83FOgnfu9+kSCLHYoYtKtKQpYJkrOzOtdf
         gqZS5MNBNZNfLBEWDbBdD+VVWlvzTY9nlrJkzs5goQLoQSx/nvbCNzyY2U+a/b208eVh
         IZ3w==
X-Gm-Message-State: AOJu0YzMaeo+pkVvQNnireZbOTUNLSJ9lNbllZyMuSoklceJcQ6FTP9J
	MCHzM2uPYbT1a7iSvaWp/YQNFLFMAkm6dJP8aaU9s8ft4y19rdoC0JD2FCdvVIhcC9nKkt6GHiB
	6E0oiUorTIQ==
X-Gm-Gg: AfdE7cnzQQ5XTAKjd0cPPDKBb3ZBFTBrQg3Pkr94YXdwwTvoz7F9//DNXNQwQMm2j66
	3A9jlp5x47WsKaWxv4JrwBg0iroMtEqismRf7i+LA6PF7wxwawoC1byWBfS4CujH1j4wKSS6QhK
	AgL2gH/fQZUgeDvXYgkTOL2zAaCOQYNc17pzaB6mQDgCcOrdJ5gAHUPzIuN4KPOL3vY+/aZ3b97
	w6dbQjWe/w/dvIHUOzv8r2tJrPTHw7z+mrhW2iLGWVnL4x6gFPlFpv45uXKDa8Oh0NSYQtP9AIo
	WwvjqBo15l/tHNVXqEAVkLZ7UoT130fhPQFCW6W433Us1pbRo3e9qpWAb/6mENmAiiE78hLy4Jl
	7KLvmD8LXZ6gwiIiPz0HFDFBY+kM2YYw24ddozfhwc2N76DJu+QsT2hX5IwL3C0f/LIOvVws5dL
	ofF3iBl58Eke76PDQs
X-Received: by 2002:a05:620a:460b:b0:92a:e752:a1d7 with SMTP id af79cd13be357-92e7809fc58mr849377185a.0.1783005741085;
        Thu, 02 Jul 2026 08:22:21 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801968dasm240066985a.34.2026.07.02.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:22:20 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 2/6] patchtest: tests: test_mbox.py: improve variable and message clarity, fix whitespace
Date: Thu,  2 Jul 2026 11:22:09 -0400
Message-ID: <20260702152213.1439717-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702152213.1439717-1-tgamblin@baylibre.com>
References: <20260702152213.1439717-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 15:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240060

- Rename "l" to "length" so it's clearer
- Make the message printed for an invalid author (AUH, in particular)
  more explicit
- Remove an extra space in an if block inside test_target_mailing_list()

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_mbox.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 5cf02af7bd..feb87fa2ae 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -74,11 +74,11 @@ class TestMbox(base.Base):
             shortlog = re.sub(r'^(\[.*?\])+ ', '', commit.shortlog)
             if shortlog.startswith('Revert "'):
                 continue
-            l = len(shortlog)
-            if l > patchtest_patterns.mbox_shortlog_maxlength:
+            length = len(shortlog)
+            if length > patchtest_patterns.mbox_shortlog_maxlength:
                 self.fail(
                     "Edit shortlog so that it is %d characters or less (currently %d characters)"
-                    % (patchtest_patterns.mbox_shortlog_maxlength, l),
+                    % (patchtest_patterns.mbox_shortlog_maxlength, length),
                     commit=commit,
                 )
 
@@ -120,7 +120,7 @@ class TestMbox(base.Base):
             folders = patch.path.split('/')
             base_path = folders[0]
             for project in [self.bitbake, self.doc, self.oe, self.poky]:
-                if base_path in  project.paths:
+                if base_path in project.paths:
                     self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
                               data=[('Suggested ML', '%s [%s]' % (project.listemail, project.gitrepo)),
                                     ('Patch\'s path:', patch.path)])
@@ -173,7 +173,7 @@ class TestMbox(base.Base):
         for commit in self.commits:
             if patchtest_patterns.auh_email in commit.commit_message:
                 self.fail(
-                    "Invalid author %s. Resend the series with a valid patch author"
+                    "Commit message contains AUH email address %s. Resend the series with a valid patch author"
                     % patchtest_patterns.auh_email,
                     commit=commit,
                 )
-- 
2.54.0


