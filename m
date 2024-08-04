Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2150C3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.30113.1722791373037440827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fkmWN04Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70d18112b60so3721117b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791372; x=1723396172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PWp87SsgOxFa4yAetmQEXncHujSIOog4M/PnYxCh8A=;
        b=fkmWN04Q2mLLqv7ADlGBF7oahhg9RdjlCUwrkKdUKNA95rJD9b+mPpmVKp5KFPyscM
         Mh0EawzaJtBPNxNRyrV48sl4LK/ArNW2cKBvrw+m7QNCcA72B2GrbaL8A0xM440Jar+Z
         Y5izV+1enJLlkxjmsJjKvMxaG68kYk21i0VYUEfgCewA2Myb87GndBOsy7ohQ+l7KMca
         MKZssZ8RV46Kl1ZjuYtDIIMIMKK1VA28UyfBhEQ9a+a/RS3Fd5utOlTLbQ9v+qvgOQv5
         dHoGUP66qH7tZYl/uExQ6rZW8jwmOU+Ak7vIng4VwEujEvLxQCjaWNSXicLblkNMUQ8/
         bkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791372; x=1723396172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PWp87SsgOxFa4yAetmQEXncHujSIOog4M/PnYxCh8A=;
        b=Fl3i7WE8tsVvQLFqm+iuVECD/uoZKUf3UgBr/WFdxyyYsxDVqsDqa9ENpQocFtJkTI
         +NAjqyUiB8ewKg9vYXuUVXEhcrwmytL4NTrZ09CZGXPAIPHwWlWRemYX1h/4PaSGPN6x
         KlYHvwxJFbSFYBecpMndAp16aoDO+eWBS59lKsXuGhnEWfGG3jv+hHRh1G4z9qawDvOx
         QD5XB9Ddhnm49j2sBPcXnti8vgDJ0nEAPptHYuTPqDQ56AKAdlpn+qy9Jdw2RIa7XDvk
         +/gsB7YTE2fed8JjzQ+/HxxtWC8iYmHdbbymKW8b7OlDW09fhr69VhdV7G9vZPRRd5Kc
         ahZg==
X-Gm-Message-State: AOJu0YwhkmWJLHSqLaRWzyNpMBYi14EANCVjKOjx71ojVofv9LOK1pVG
	COAqNGz+Naax3r8r8hzmcAu3cOxZ0pIsvLJG9c2YXXJZ4BGpDyjLaXCxT72qZzGc56Fyo4s8i7O
	DXM/ecw==
X-Google-Smtp-Source: AGHT+IEq/heJ1mMRTAWsz9zAPTKudspcDLpN0lLwC/vPC4oRZMqXK3g2Xd/cJDu/z18QI2EM84qldA==
X-Received: by 2002:a05:6a00:92a0:b0:70e:cf2a:4503 with SMTP id d2e1a72fcca58-71065f1e257mr21138106b3a.11.1722791372179;
        Sun, 04 Aug 2024 10:09:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/18] libyaml: Fix warning regarding unpatched CVE
Date: Sun,  4 Aug 2024 10:09:07 -0700
Message-Id: <a88c83ba93346b62c2a360ab71bacc57585fec60.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202963

From: Niko Mauno <niko.mauno@vaisala.com>

This commit incorporates changes in following master branch commits:

  f3479f74c9 libyaml: Amend CVE status as 'upstream-wontfix'
  3ebb2ca832 libyaml: Change CVE status to wontfix
  56b6b35626 libyaml: Update status of CVE-2024-35328

which mitigate the following warning with cve-check.bbclass:

   WARNING: libyaml-native-0.2.5-r0 do_cve_check: Found unpatched CVE (CVE-2024-35328), for more information check .../tmp/work/x86_64-linux/libyaml-native/0.2.5/temp/cve.log

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 4cb5717ece..1c6a5fcb45 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,4 +18,6 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+CVE_STATUS[CVE-2024-35328] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


