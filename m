Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AF2E7719A
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:47 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.18164.1735998158636088229
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LamW73cq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2156e078563so159542365ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998158; x=1736602958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bp8iRgI8eQPINX7UPZ28RdcuW0EN8JjJ/c2crJQbHHI=;
        b=LamW73cqj8dpEskUrmzV355su6FaFgYq7j5av7YUfTau/FttWha0yrzYFndEQElG/2
         Q+KIFvQfJDzmpIMFtS/fSlWNIDX5rgGMtaGO2Px0p5laU6AwiL0h2sP3hXLqVLwUEX1B
         +tc975lEXmMH3aQAqvQYu/d8SnqW7nCejWoEJ7bSH+35aEywIvfCuYf8aDj9Vdjw4owk
         EF/PzM/HViDd3UyYMuL9OCFxJtqxi7LXqup0Sbse2f9ikUUQvmUf0Tb/fSJUwxsDBXOM
         SjBsSpWCMxSjdP3SfROrrhOrXgzj2QP4dDzHxoeMkTjwrOT+wLMnGNAG+WpbJ9slAqc5
         lOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998158; x=1736602958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bp8iRgI8eQPINX7UPZ28RdcuW0EN8JjJ/c2crJQbHHI=;
        b=BfRWO0AZeAlyRfSU6Aq5y0oy5MIiHko5t0VdF720BgM02wj7UEGbZs2C1lE8r1qPzp
         dB8CslJF7rX4mBBUvmqSA39Ep8FL4iAwBLBfCwK8Qg0DxE1LX+hl9k5OHJuLh2SEei7p
         vBOoRRPck26h7QHUsz062vyHVpHBj04XVi+V5Y4GggwHTmJDTEiFRdEf8GV+YPaHaOsw
         M049G4ACsvcDT6lCYa7REw/uGcGa0zX1QxDSCYBTdmklze6lefvL/vDLJctS4SWY4U2z
         y4gtNmBG8yiUh8O90UOB6BtlBe2CjLTvOFg66ATXRcHRMX5alWDMuy98rzi3C/SLF4fJ
         JiZg==
X-Gm-Message-State: AOJu0YykRfe6c514GdHJ0B0dAjHtC43Vv347Qtv3p/2M++3BKWRoqvXw
	FkvmZxrO8UMu36ReGDfVaFZxtymy9ytBWlvkQBlgNpcMbwprfjrfFB8Y5g+b6lBUo4ivAObmUt+
	/
X-Gm-Gg: ASbGnctGG4q7hKndXpTE3M9bbsSK5+Fh/OT6iRQA0+QeLntpsPu2Zu3WvMnB8ZcvzV5
	gHmZzEuzyjfeNoSHoflNrIwyuTewVoF0DFIwF/yQJNq6NS33iMwYkL8XKsHob43gZSUl8ImBW/m
	/DL4vfVuRAM0ZbsOy3nXQZcvQEkG/w0XfAcxF7J3SSQ/o6BKER6zr+0R7HhJdfx/YbcpWJOZuZ4
	o3sTEcBtW8TlVtpgxRzrv4dbfc0qtOwWNSh9PKt7J7hrw==
X-Google-Smtp-Source: AGHT+IFBSPRoYVwFRFtHsuo5pjAA+SbNd/imibauDlmuUx3oAxpgk0VQ0fOWWa9rXPBpMYqKYPNOtg==
X-Received: by 2002:a05:6a00:4ace:b0:728:eb32:356c with SMTP id d2e1a72fcca58-72abde01b08mr62954635b3a.11.1735998157880;
        Sat, 04 Jan 2025 05:42:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/25] sanity.bbclass: skip check_userns for non-local uid
Date: Sat,  4 Jan 2025 05:41:49 -0800
Message-ID: <c3e0666dd2624c20c5f32657846d6f044046205b.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209394

From: Changqing Li <changqing.li@windriver.com>

Bitbake preserve network for non-local uid, refer [1],
so check_userns is not needed for non-local uid

[1] https://git.openembedded.org/bitbake/commit/?id=4eafae7904bae6e5c6bc50356e8a9077f2e207fa

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 808d0cece22bcbee15236717e158da247cbedaf1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sanity.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 72dab0fea2..a0b2508e11 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -484,6 +484,8 @@ def check_userns():
     # succeeds (at which point the uid is nobody) but writing to the uid_map
     # fails (so the uid isn't reset back to the user's uid). We can detect this.
     parentuid = os.getuid()
+    if not bb.utils.is_local_uid(parentuid):
+        return None
     pid = os.fork()
     if not pid:
         try:
-- 
2.43.0


