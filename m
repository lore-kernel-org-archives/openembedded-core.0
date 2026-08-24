Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2156DC5DF9B
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 14:43:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18359.1787582607760232714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 07:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VW74qX4K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499cb997b8fso7706525e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 07:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787582606; x=1788187406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPO0BKwkGbFbyRCE3eFzINbBx7Hz1FWvWjhx54AL9Kg=;
        b=VW74qX4KzOAfc/jCq3GdaEdC5MbisunJapEeJcC/NoGv0JJSro8PFJHwumz75H/YQ4
         sKQv0MwQk2Qq91avYjBOsNf/onlt8zB127sMF5mglIEJeEb+p1UfuysyaQMGZBlKJ8La
         QMSURRCyd7SI9ng1Ay6M5UVyD5IAwNPM0Ig/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582606; x=1788187406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sPO0BKwkGbFbyRCE3eFzINbBx7Hz1FWvWjhx54AL9Kg=;
        b=QT/y6TpvsLFuDUZcmop7boZAw6oaPaX0ABgWMJ/jZ5tX1lFp0ec8oB/Ybxvqrw2GMj
         G1jJottjtTKZ1qR6gIEgPOCy1fgaLoYoC9kYXsX03amTDbxfyYK3I1PjViOC3suIAAUP
         08Wi//e1qA85vQNpYkR5bTD2onX/xbfikW2oN4eMnsb8pdntfmVO5mDowoRjRRItXDlF
         2EceNXEZythKuAepnwVgFu/E60vcTFoYm1P1+Inouo1WO9Qp84tsn4Nn8HGqwrj3oJQ6
         Yfcm91T/g8Jcebiajok/Kild/6Iyh+JpP5ivU8P1OpOONwI8ugsp97LfMxnXNEU2yCPS
         +3kw==
X-Gm-Message-State: AFuF++k2sM/6Oxi51Z7YZp4+AL+lhUYDKF7UyeWk0rC5TusBN/1n1f5n
	3C6l9YbKtzLb/bkOlZWRxONIY9blQ5xyVBDsWc+aI/SmyUwEmbgxB+M00Ngi3GvSdUhU0rXy+HU
	lSe/9ILQ=
X-Gm-Gg: AR+sD10PQTQXQNtNeq6uGW94/nb/esNrIQlB66Pk0Kgy62z9XcnG2yYlUAj2hXudQNV
	hMev60vjjdoMFBuFR1SIJ/HeTjmyj7Qq7g2MIpEmzuzq/732Zf2MOAnJ699JhSnvX2X5G5YRNhV
	f7dd8OKYGdoiYEocswpc+8XClWoEkG5xPU5wYwiwvMyNkYFfQnVKrOEVJKsUo0MzsikSn2PVdE2
	2ruD5pjQVWVGKLXASlxJWCUA08MC19vUBK+87sNpsRMmoGVihOE0lQJqlUotpuOn2ddRsxTWWAt
	Mj9KDbIvevX9bv6PcwlsPcBvS7qisoJeR6thPzfcHHwRmxdwzjGgk90UnvPZWMpbtXl1U8+f6mM
	icK2yZaIGvIm3TlLi+UlTSr8x17zbvyP0o2U5NMIfJBSlt4ho2zsYfinGLyNQLw9v3y67rRSFoO
	7KkxIdmC7tnwtPMiKJ3l5BAMz4lEPO/KR6MkW/HEn+d44zcbG86UrYFweUXd38mkL0mU4/R9FDa
	TJodB69wS01/1G5KSp1A1Z9vI67
X-Received: by 2002:a05:600c:1548:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-499b8277214mr324438145e9.0.1787582605783;
        Mon, 24 Aug 2026 07:43:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c359b95dsm93374945e9.11.2026.08.24.07.43.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:43:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] files/ext-sdk-prepare: Ensure all dependencies extract correctly
Date: Mon, 24 Aug 2026 15:43:24 +0100
Message-ID: <20260824144324.3200581-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 14:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244125

If you have a "full" eSDK and extract it, recipes can be masked from extraction
since they are not needed at runtime. An example is maturin-native, for which
populate_sysroot doesn't run in a core-image-sato image.

Fix this by ensuring all do_build tasks for the targets run. This allows
the maturin eSDK test to work correctly on full eSDK builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/ext-sdk-prepare.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 89b04030899..ed03b77ae62 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -69,7 +69,7 @@ def main():
     with open(logfile, 'a') as logf:
         logf.write('Preparing SDK for %s...\n' % ', '.join(sdk_targets))
 
-        ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet %s' % ' '.join(sdk_targets))
+        ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet --runall do_build %s' % ' '.join(sdk_targets))
         if not ret:
             ret = run_command_interruptible('bitbake --quiet build-sysroots -c build_native_sysroot && bitbake --quiet build-sysroots -c build_target_sysroot')
         lastlog = get_last_consolelog()

