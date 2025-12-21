Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0CEE67482
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:56 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68646.1766353074387458886
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L7NB1LHP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c565c3673so1993223a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353074; x=1766957874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RentQ/Wgv4l+D0XZHOWzIm2zUoXxfaGSgjTUMZvurY0=;
        b=L7NB1LHPiYHIADPuGX4XBssleN8vCS3f3xGP+0HTvEdKaViimJri1ud7Wx5tN57Mw4
         zXu1YXNePg9aohQiVkl/lV+BouqsgB6ILlCt0tpbhEA9o9nV1oC36IcQeAhBRstQ6OUp
         mDduhQeBZxknwPhQjTV4FJ2N9Fyl7LyirFHCNI3ZC6cZHi5+vobkDfNcWBX/SPcyCIoV
         qNQCF0FD0bw5/tvhX8zS48q0EOqLF+12ZT4TGuJ3/N17cXhH9f7fNvyHsuj+TW/xUcrY
         hmRtyMjfahjqPjyfIQXj8EhcXJu+Zz7hgQptxvtNEslRzrUsJhbMqeX1xnRVP/mJ1yL2
         XGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353074; x=1766957874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RentQ/Wgv4l+D0XZHOWzIm2zUoXxfaGSgjTUMZvurY0=;
        b=XRRiz8AmInF5J+rzXMasSpkS6wdb56ENFsdIQj2jtLyw4TBTLNYq+b0Zg3saof7Kus
         NsIptAzAPCrnSiqO1IgyKtWQwJI/CF+CjkYPYuOFwNSEW94geQZvoGDmXq6/BLG+ewG0
         3TFwEZWgXwyElSysD6u0KKu+pCfkIc6qxQZJpzkTv6RPqNGVCGAQO9KLQ6jDpJpGGS15
         lyQpb1Q1WimvBWiSJs5vUVVrrghg2Cgk3zZo79XYLB1fJF9nA5+lifaRx8S2xTlEWIU9
         cdy1OtQIGpb1mlhv5dSB5H/x/DVh8Jte5HoLdoCb1KCGSropWzc7/i5e1qP40iP4M7Kw
         cSPw==
X-Gm-Message-State: AOJu0YweXHjhf0HoN1NPxoPAlulbXnt2YjZfKWVLtjs5wslOqzfJnHkS
	XCkp2WdRn/WpdwfMurUbxfTBm3tn0CkGlFCIbYgOiy1jhmaJ3V4QQdztDa4M4TUYm51jyr9ST5q
	fGwEAYF8=
X-Gm-Gg: AY/fxX5D4McZXYDW2x6J1KxKRK/bBPkxyatA4Apm7BHrINadnTeFZUQ8pze2Qt0jgVT
	QPIeMTYHzyMRxNf9rje/idhDky84WcBme+p0M5/hya1vP3zUy0sNM4dieQkq7UcuvU0Ml3RE8o8
	1Q+LCdMcQf0zfI60HQPBzhUUpVObzSXMH2CSyOY4s+FD7vLv+Ufkp2PRoZzWBO9KBa5UV/SdZF1
	c7+0b8ZGmo4ZDmI0RdLtn8gzMc/hx+iRE+tLkWjXhhqPUFmXZ+eddjGqmJ9QKosylUdYHjoAoDq
	ML+QXZJUlkFzFyHCSxeN1p0MuB6RcHLelmXnVLz84BI2v3rOeLX7ZTMrjDBCsvYqs1b6fk1UpUr
	KUpD03ZbxwW15OMwVhXltPiiriSkFniE0+w53Hs4+Cll0+VKitjgcHrcXs+7h5p+l6HMd/RZX+u
	si
X-Google-Smtp-Source: AGHT+IHSne5JNZild/lx8AIIt0Kj1dUHXORWNs/d4zgXhFT8LWo20w9htjtVs8QaXwYSRx/HO4nVTg==
X-Received: by 2002:a17:90b:3c8d:b0:34e:6e7d:7e73 with SMTP id 98e67ed59e1d1-34e71e0910emr9935076a91.11.1766353073574;
        Sun, 21 Dec 2025 13:37:53 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 18/18] populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked sigs
Date: Sun, 21 Dec 2025 13:37:11 -0800
Message-ID: <9964fa3da2fa1e7243fba1a826e59f7bb1813706.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228276

From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>

Fixes [YOCTO #15853]

The filtering in populate_sdk_ext.bbclass was removing all image targets from
the locked signatures, including the main SDK images (SDK_TARGETS). As a
result, their tasks including the image SPDX/SBOM tasks were not added to
locked-sigs.inc.

Without these entries, the eSDK lacked the necessary sstate, and the installer
attempted to run the missing tasks during installation, leading to unexpected
task execution errors.

This patch keeps SDK_TARGETS (and their multilib variants) in the locked
signatures so their SPDX/SBOM tasks are included. With those tasks in the
sstate cache, the eSDK installs cleanly without needing to re-run anything.

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 920c5de570ec575a9eaccb105461394d9fa0f1db)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2859320ddf..2838ca1a03 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -460,6 +460,15 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
+    sdk_targets = d.getVar('SDK_TARGETS')
+    ext_sdk_target_set = set(multilib_pkg_extend(d, sdk_targets).split())
+    excluded_set = set(excluded_targets.split())
+
+    # Ensure SDK_TARGETS and their image SPDX/SBOM tasks are included in the locked signatures,
+    # as they are required during eSDK installation.
+    filtered_excluded_set = excluded_set - ext_sdk_target_set
+    excluded_targets = ' '.join(filtered_excluded_set)
+
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     #nativesdk-only sigfile to merge into locked-sigs.inc
-- 
2.43.0


