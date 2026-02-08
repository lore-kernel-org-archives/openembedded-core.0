Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798C4EF06E9
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26367.1770561132043320842
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P2Bf1VjM;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: logan.gallois@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43590777e22so1310400f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 06:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770561130; x=1771165930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ8cytqyn0UJLtu+gJdN2hLxHG1rvQkIWWNe8Jn33rk=;
        b=P2Bf1VjM83eBBZzeSLfY5LlTASR4gFWNXlmN4s531+vCzemc7bu87k3zl7mJVXTjmY
         ug8jbeGsm/kUSIVJ1ZscvYSWaInXj3hAQBbRly058qJBYyp9iCtZaTwSLyBRD+Rs6AIg
         Az4LmNjKMFt66rVPnr9oj/luHDwvic/hXKS4L8KX/wjcO2TIubXqwXOL4SRj/FwPeaVy
         rr+eL/3bjd2ar6Jh43d7tWr0enOnPmLWe0nQ/u2+ijzKXOJUrhVmY0QvmrYypMP7vEVa
         +HFNNnY7mlCmzE1+CGGK9srt1rAOj1+DBWjT0FFMn2U0xYNTnn5eKEorsmJAEEfXepNq
         5cLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770561130; x=1771165930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJ8cytqyn0UJLtu+gJdN2hLxHG1rvQkIWWNe8Jn33rk=;
        b=kLrS4ntvTYIa2+em5JAtVnuBS5qFIlx22uTwLfH1rF0K8TxMJRbMpQeU2IDbcBTOyz
         Nwp5/X3z1hHiGT5BoryWwyjmFG38b2GsMSHBHQDXsPSRr5X53BTNBYYGFhmZINPKks+2
         HAn3deU+aPDQFzRBShAA0whOARPJoar8HqHAldLAjcs8Nuer44iyCluSc6aeglQWOoZj
         EdtXBno8+wLzJN79Ss2zwQvD/DV7mCZPqcQ497NVylJeQ5g33FkEzehDCakVqCKWp7rE
         gK+l/u8ssibxbpnifw/Gw3yazERyAkiVp73C4NlKIHGv1Y4ssX21CgNXCvLCZqmhbx/O
         tupQ==
X-Gm-Message-State: AOJu0Ywc7o8FbSoiCIpYwOQJmnd7/fG/1mzKLK3RtuN9OaGB+hpRksPM
	IVmoVe2bSInNuYQQ0/ux5YdCJv8ls/ZJoMNpLTPwV7tswxRs9omcVTcFxqNaFA==
X-Gm-Gg: AZuq6aIvNVY49t0ibl/WjtJ9by3O/RDUi82x4TS3xRYSWsZlzyuqJWNSx5a/9m02FIY
	6FAj/0hrSRVHA6scAZhSqS8XZpQyZ/+Wg053XTZNYJusjnQnaAgFqLEV83wyMJmUGejvq5InB/m
	VB3BYnXbp4L9LyeI11fNnpllX5tcWoAYLzXF/iAqwkesV+zp43TiOJLcS417i4ApTgDO4Ml9vwx
	vbnGOTRdf+plF5z7hvDut0z0HpJn0BXEHW6n7igkGdCelyKuqt3za8MuL/qrQZfDGi4+4jXCvqc
	baT3UjjzMLYKADetrlkKmwks1RaLoVXoXqpO/ijSW2hElsJbY3lw7WhlXrgqGIcIPwwPpS6yNMg
	nfiIDKkOUrOXn7AxlinMQgpnMk616/i3tIslg8dkrEDjE2WX25+F0JROKQPiM+1MimVLCduCaCm
	T9Z9jkjcfTmiamylN9c+3mqdfvj6UQ7d8lW9q6oYm31FVLT667mkUwiRBs2b4oQ7E6xA==
X-Received: by 2002:a05:6000:2c0a:b0:437:6aca:d1cc with SMTP id ffacd0b85a97d-4376acad2admr2679334f8f.23.1770561129798;
        Sun, 08 Feb 2026 06:32:09 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b20fasm20273936f8f.6.2026.02.08.06.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:32:09 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Logan Gallois <logan.gallois@hexagon.com>
Subject: [OE-Core][whinlatter][PATCH] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 15:32:06 +0100
Message-ID: <20260208143206.1796-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230697

From: Logan Gallois <logan.gallois@hexagon.com>

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not
exported to the environment.

Export TEMPLATECONF so that bitbake-setup correctly picks up templates
provided by external layers.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index edbcd48355a..5ac46dde343 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -98,7 +98,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


