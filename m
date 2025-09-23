Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD097CAC5AE
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:39:03 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.18539.1758638342668827471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iKODLL/r;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77f2c7ba550so2397598b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758638342; x=1759243142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWj7RRgPU5QpDt6xxJ8NpKGEMWyu16awBiDRfwPLDuI=;
        b=iKODLL/r0zVjvjAB+8zRulkZh0p9OZggMbhrwQN0bFZTJXFEZIN24vC8ONcpphwgoY
         EeyetjMeLKN32OwS6YiZ1eL8m5fznF6PSCGoRbtiu2WpS9jyks+TXLqDbQvrZiRaenuD
         MEnCy81C+eBZu3JujzoRBvhllPUCEYmpTXVXyavydqO233mXdrRovnNKGwaB/nqmoQ70
         2cScOKQSTRpfVWc2bjOvRst2cw54uQI/29rFOy4X46X+wzOboBpP922xPZ9pNumij2PK
         FhRWL9ua7/9nqPNSrwTjjmh7vwdagBJVcdepNXaJKWkm9IWn9ufayjvs3Uz1a8kADC0V
         vrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638342; x=1759243142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWj7RRgPU5QpDt6xxJ8NpKGEMWyu16awBiDRfwPLDuI=;
        b=XUprLCyRPtj73Y90E5JnxqA+Sc32vfLtOnv1wwuAnexKaBb87rbrNKenUMftVuUpmx
         ZN25SuWEhKVNmOv6AFCVz9QxaKyNnJypedJ2aC2J+OQQukDhwaRqYtmhRHZxl8ojzaia
         haddA5i+43q4GeXVIkEJTxR/Z+GHbDVzNBN06hZQHF6ZgWxYCPPoFcOsXeochLqrks1e
         5bhWYduRNttvzqFX+ijZJ985zoQmRMu1H2uRvRNF/MXp6pMyGt1L+c8rxf22RTMEMGav
         bE8NtXduvXLYtc6Aq8vAMRqzg4G/k6Txq1dc9y3KxB1EGXHwq3s1qTtpRz2wZEZvlSfi
         /Sgg==
X-Gm-Message-State: AOJu0YxMV2lwj8FmssqhEDJqaTOfK7S9EouolhlZsz3fYu/SzKzZwmRN
	HYFa9cPAwBF/180O0uTAfp+JxZq8gZ9BSoShkZWTQYmMpeUxRxsAi0WVi7e1ll5332u+wwQ8r02
	MwfUVGQM=
X-Gm-Gg: ASbGnct72eSoIG2tZEl23OnUBie7vdS4lDd5+PYHaJ17b3wAl5g8WdwyNO5QzPyh2gG
	34yVh2SPBLR8kTI5tepLmzdlhLfKiic7tWm/Rz2WG+8TbGkgwooVmGUKFo41eNbaMOPBGk6J71v
	oCqa2SG0PMLPuUMO8MLuf2K2Xe/B9gzZHgeYMaZ1S1T1LopEpkyCpu3sX4Y544zBbigMQ2+FNQW
	3h9tgK6oiZ2e5vd/D6FWq36ti51HmVNGNMFM22jQtngJDlxn/9eEObSDDqM6dP2EC2G2wRsIfgH
	YuSV2t3J2R6kxlvY2xPwz4oo1bYZgLyRGCwCpkHoiaJtEKS63sg7p2Tj9lN/FMnj/7B94AOUlHJ
	6UEPjyaZlZEf0
X-Google-Smtp-Source: AGHT+IHQdck8Ad5pZufoLVKPlEB/3yrtbQ9sWnT8S5oIgRH04eYqTUgjIMEFjXLG9i4dSXr0URZQOQ==
X-Received: by 2002:a05:6a20:4307:b0:262:9451:c648 with SMTP id adf61e73a8af0-2cff72003c0mr4546447637.37.1758638341633;
        Tue, 23 Sep 2025 07:39:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3f58:7e15:309f:29c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55100df86bsm13428368a12.23.2025.09.23.07.39.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:39:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 2/7] ffmpeg: upgrade 7.1.1 -> 7.1.2
Date: Tue, 23 Sep 2025 07:38:37 -0700
Message-ID: <b564d34603753e93fdd52fc73c901a0d423c9681.1758638188.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758638188.git.steve@sakoman.com>
References: <cover.1758638188.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223885

From: Archana Polampalli <archana.polampalli@windriver.com>

Fixes CVE-2025-7700

Changelog:
https://github.com/FFmpeg/FFmpeg/blob/n7.1.2/Changelog

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/{ffmpeg_7.1.1.bb => ffmpeg_7.1.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_7.1.1.bb => ffmpeg_7.1.2.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.2.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.2.bb
index d5252bfbdd..1c49bb1fc3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-22921.patch \
           "
 
-SRC_URI[sha256sum] = "733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1"
+SRC_URI[sha256sum] = "089bc60fb59d6aecc5d994ff530fd0dcb3ee39aa55867849a2bbc4e555f9c304"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.43.0


