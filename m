Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C60F5511F
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19039.1772923979283487155
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gLnilCPj;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so6959875e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923977; x=1773528777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKKlAvnBumaDqIgFoh2UXV1HyKr3d0OGIRzXkWqpdL0=;
        b=gLnilCPjZkJMOs7rrsrh594tCO+nryDUou75+tBWWFfzNpOf380s+7yBg+GkrcCZ0P
         y1/t9BqA8PNJgn780McI+oVXZreYkmAfRq29MQUJ1eTo4EUg3fmKI7ryQnhsTsUukfM2
         6rz805RlODX/+XmSKYsAlYKaa/GMP6zkzWaQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923977; x=1773528777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yKKlAvnBumaDqIgFoh2UXV1HyKr3d0OGIRzXkWqpdL0=;
        b=tJR7ISaO9CN86A+NPPXuRPPGOyArpStn+CbyhaNAHIjuNP251K/OcnEYqfWSuCTXLA
         qLbeEMVbDi7PxYf/yrcAimNyi+pJ30da1MjqGES3BoGl3QCIQEofpD1PsrDSov6ZfKjG
         5OkwsqbfT1ti+iOzw3KcW3bKULlJ5ZrzpP4CuudS58V507zKs/iLrUiIIjovxYF6HQ5r
         fwI2/KYTM4n1f4BNY4xB3V/RfzCDbXdwrYS0wBc/EHuMOF4baYcTdwoTzw7ZklP4bXG6
         Ld+R7fV4q9TBY0e015E8NWUDmFEyhWnXu03FVwNwkWIzBxre1rDUXYDlZ0CVhgEb7bhP
         OtHg==
X-Gm-Message-State: AOJu0Yw+8ff7TmMnyi87kAdp5EtHt4fwJRhvrJszn1050PJEEEE3Ev12
	SNIqEkv4MGS9YYcBiHxqnbAIuJj49lHkaObvYx2YD4FFtsZw3b4Epsemp24Y4j6rvpFdu9HXzEz
	TF6iN
X-Gm-Gg: ATEYQzxVCNNm3nPj8duMl5UJZ7RzsfMX6sgkcpDfgLwovKvWwZnDYizpHlhfdFZsKRz
	tyd59izNR3/s1Ef/suXIGGAg1f9/IowdGZpBt/9RaW7eWXNq9jDZc1ISZnmVnuKu3+rF+qCXf67
	2NlInPm/cuVyIIlSDVnRsH7DtBMIA3wHK7a6zqDXSw1Kwa8bzLJ95pYANTRKZwGP4SLfesP65y/
	7boQI14u6kbkaao4FlG5mNoftYu/jyd1eLvp1vXOEjVpJrebbIGzWvAbvf90i7pC+1gplXzrJ37
	BW+H6T4AXmimdb/7r+CchUtcdCjZQQv5SHGJocqJSfKz1NlNnyz6JaiXMTP78BLkkbQVoRRBm3N
	n9xxcTu6EtfoJRaisWBqtXxrjqGybgRcCVk0hsISYrJjur3o9Dhqr36SlZV2vZX4aKWUxq5+N5P
	vK7UYJEhKWbB23Hy6T0kqZYLZfnXBRASiTlpvlfSB/F5aGVv2vTC7tJdS5V80yfSrFkrPxE/Pwd
	VHxp2QOVTTVamlsuMy3t6j7vUQ=
X-Received: by 2002:a05:600c:34d2:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-485269305b2mr108860535e9.12.1772923977418;
        Sat, 07 Mar 2026 14:52:57 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.52.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:52:56 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/11] ffmpeg: set status for CVE-2025-12343
Date: Sat,  7 Mar 2026 23:52:20 +0100
Message-ID: <4cc6f4302483d227c2e26223da43b8811165febf.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232628

From: Peter Marko <peter.marko@siemens.com>

Per [1] is patch for this CVE [2].
This is equivalent of [3] which is included in n6.1.3.

[1] https://security-tracker.debian.org/tracker/CVE-2025-12343
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/b8d5f65b9e89d893f27cf00799dbc15fc0ca2f8e
[3] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/6250ed77a6fb5bb089e533e30985d197e8323dcf

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 080241d34f9..849835c8493 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -48,7 +48,7 @@ CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wr
 CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
-CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594 CVE-2025-10256"
+CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594 CVE-2025-10256 CVE-2025-12343"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
 CVE_STATUS[CVE-2025-25468] = "cpe-incorrect:vulnerability was introduced in v8.0"

