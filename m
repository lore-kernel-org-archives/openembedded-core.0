Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6D6CFD307
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:03 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3762.1763849702087816495
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Cq8XDsmo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343ff854297so4550840a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849701; x=1764454501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+gzd/DMuSGBeEynG30623maZXbrdVrV1SoCupExdwA=;
        b=Cq8XDsmoRFZmqterhvaJ9Z3a9FOYgexD1xijgXLIjNhLza/Kj5BJ9+CL1IsICMe8+K
         KRfWAiBCqkRvVg2slULIPwJE5aRGDGYlUeTHMGVaobwvCfgG3aA87HKMTBW59N/omX5l
         7CtRDkYdKjzI5uzp0mx34p8KL/CWR8ciYnHE7tnRhk/ioqqiJgu7xpaIYMjBSi1lAAs/
         YxD/1qmIktDGtaqtvaN5FSDkDmSD2tQopyQsyPgToXJwvRHX5FinPkRBwAUWyZoLiE+Y
         RbNE1ZuToX4hq1AH+KthQ5FBX9WHVSh1mQ+X4LkTTN8l3cdUQjdb4mI51MzMC0VqD8Dt
         OdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849701; x=1764454501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+gzd/DMuSGBeEynG30623maZXbrdVrV1SoCupExdwA=;
        b=nUaJkY6JUdlbcElN/1rsalNNOAEoPTWQrcN7tQdBRuPXqf8satD/X8LCeOJZBm1+CU
         0XswN6WKTNrOQywjQ4FtssnXN959gpUXlOqE2G+2ywrBwZdwKAa8w6hDgrdi1fhRCP5v
         U8S2GL7cOGCyklfhR9u3LwRRHJH0lkKkBydH1aijJzykCY6gtY/SZl+KoT+VdWs8fkKp
         oN26W7zIvdeE48XdMbb40Y9mi/B53R1K4hayKKY9eJFlBFrspqiKed/LSH5pezrofovT
         Mh2FPvWVR7iT2Y1s6HdxmSff7kVuDNO7ugf+fVyI5a1/1ufZ0jLGsPbnOrHZZJsveXx5
         3D+Q==
X-Gm-Message-State: AOJu0YxYevNWBg2tGBWALDAKe08dinMK3Ocb4kX7EleGkDbgrlcOBLUW
	+VTB04DCjcNXi+NYDcQ5x11/V2INwhHohZ26/i8l2bdh5ypruqhC2Umg6DDkjV+H9NvEhSyOBNn
	GJojZ
X-Gm-Gg: ASbGncs3TtX3mko3YzPHDUCsxT3SWQljm+oL4YsFvpjT6Dtfr+lRaq5X9mbxOISH/eg
	KEwyoDvLqD9g8GaMZ4c/QNPYqBBxCyJfnQCxSbXtNQ47xS/tI28Ueih2v2WguKprFbiUoQL5+Iz
	YyOgUBwE2yOQ4EGkpIEVERdI8GYo3yLDvH6Vuo0NBVJ488WdIMxXcvq3C5OH+Z6e6hCbMTdChSd
	AsB+e3/m/jWHY06ATpbKr13/6Oe73ShpSRNwP/8aRTGI1KwCclRmuAeFUD8STgbTuVodQBwW0aV
	iRWIUBMR894seNL3bl+U/HsafAkmTnvBmFplo9rpvcYdOloN9eXPQN3XI0T0evImw3Fjt5KW3b4
	bL8WCTh2Rj789E7dfebqai4BPnwszVDdVGWb9bpjyrwLtH7FjmHebCLGrMQubirhyB1zw/qKBbB
	2zUw==
X-Google-Smtp-Source: AGHT+IHN8ZdFEj2qWOp8KpU6+YBk38JSj8fh7zh9J8HVXyP8Q+npEOJz7T9CGZUonMETQuHx4arrhw==
X-Received: by 2002:a17:90b:3c8e:b0:340:ca7d:936a with SMTP id 98e67ed59e1d1-34733f22173mr8145736a91.18.1763849701351;
        Sat, 22 Nov 2025 14:15:01 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.15.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:15:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/21] goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task signatures
Date: Sat, 22 Nov 2025 14:14:21 -0800
Message-ID: <e8d475b9b6d7b1ac3b0cfe367faabc07deb663b0.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226713

From: Alexander Kanavin <alex@linutronix.de>

The default assignments look like this:
TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"

TUNE_FEATURES is a target-specific variable, and so should be used
only for target builds. The change is similar to what is already done
for native packages.

(From OE-Core rev: cfff8e968257c44880caa3605e158764ed5c6a2a)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/goarch.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index 1ebe03864f..0e9ef3a6ec 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -24,6 +24,9 @@ TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES
 TARGET_GOARM:class-native = "7"
 TARGET_GO386:class-native = "sse2"
 TARGET_GOMIPS:class-native = "hardfloat"
+TARGET_GOARM:class-crosssdk = "7"
+TARGET_GO386:class-crosssdk = "sse2"
+TARGET_GOMIPS:class-crosssdk = "hardfloat"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
-- 
2.43.0


