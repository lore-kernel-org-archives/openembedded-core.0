Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5990C369CC
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 03:29:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.600.1744860572196250005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 20:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nhH/XsGv;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39149bccb69so281062f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744860570; x=1745465370; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDjdm/rZML1+mTzRrYx2inPA/j9n/wwFmh+UiMNOmos=;
        b=nhH/XsGvPA+unTLt7QK+jACdSYH9SAwJOfyeYfdVOo4UfOVEs1FwszmPAh+kC5FzCB
         7rLSa2JW9t6K/et80/SVK5qgSszaMyeinOE+uPxoNl/YMckFt8nvPdiFQUtoTYHgbsph
         mdRDelam2LIK/0iONGCRR7ACC1LpjozhZ8Jj7GUhyiT/16oq6nv8AbGLb7kdQ2yewGWk
         z59wPQ4wL07F9i7DwpesrX2KFONZJE16Vf4II84vNAWpZZ6qKhQSgy2WuUD+0sSyrEIr
         srGFRXH36Kz2W7eq8Gr3/HmknJXR0Gp7jqPlXUl08GFWBfm9tuExwNtxE7tvWEPiA1G3
         59RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744860570; x=1745465370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDjdm/rZML1+mTzRrYx2inPA/j9n/wwFmh+UiMNOmos=;
        b=PHF9nDyexSVbTCbz3YdLtcgf2fltOE0j48ikTo6lpzbBei8nqp4ZB/uETIUZu++Eb9
         SvgYSdvKc9+33KGlpR6O7kHW040S/Ybi5v28zwwazsf4h39FnyBmrQwpZnwezuxqvurr
         M1Twe4jy3hGjjl59MCcaeFew94NGZGBgo8VvXUX7CEiC8ox5TlYyv/F75GenPDtO6Xiz
         63KhZfAgT/iXAUd//piYnmjqLTcVDiGu3Nh5QiIGYCJhJGw8h0jVlPiJRNSf5iIFFs1o
         77fRD3uDRT19sPMiZjktrtQ7aX5khZfuGCqAIIHqWPQ+2u3DGo4Qg8gAMMLihg2vvTR6
         3cng==
X-Gm-Message-State: AOJu0YzWkMOM+tiBCuPd1Hpt6j5jSr9QzjNmeJj6R6bPVe40OgtvKt7I
	+RWrkOnBvT7blTtahu1rm/3GDcbRXkoMBAjV4lTsas3ImWOsxALff+rNl6aP
X-Gm-Gg: ASbGncsuo2oOM+nl2z5aCgoD2OjU3L+wLC3n/iB1NyeGtbKdz4oZyC4HAKGMPJTFmJq
	jO1qh22cAFBgR/SNAq6Cq6A1nBTYyLAoy2qDvuVQ0s4lM1Jqz/76YmKxumvEbTGhxpKwqrnue09
	UPifvxN90NpLLJUD1kDBGFutZb5cCVUxKwCOLikg1Ec70x0zswgmcQN5K3Zs/KBR51q+XgTglgg
	tXBx19msAvxf4ztVv73M+/WoGDk22Eoq7rb6HihuyhNHIRrmmCxCGeu8f3u0FDgcxTwNnOFjoE2
	lyXTT+XxgBs6Gr5mlURuvRliJ8xnLbIC2PehwPMORmsTpgurBChucnu7G7n5VnAuSuwoOUD5i5y
	dZNN0SB5h
X-Google-Smtp-Source: AGHT+IHWNinSNRqJJd3aGWF+3g2yLfiJdTSVtVRtSpUIWbi9WfNZe6zR03pmvXV7tFtVbStjmodhfw==
X-Received: by 2002:a05:6000:4006:b0:39c:11c0:eba1 with SMTP id ffacd0b85a97d-39ee5b0fef9mr3449233f8f.12.1744860570346;
        Wed, 16 Apr 2025 20:29:30 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm18713620f8f.76.2025.04.16.20.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 20:29:29 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 17 Apr 2025 03:29:16 +0000
Subject: [PATCH OE-Core 3/5] connman: Add iptables/ip6tables-save to
 ac_cv_path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-connman-fixes-v1-3-160b2b811116@gmail.com>
References: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
In-Reply-To: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215035

Set the paths for iptables/ip6tables so that they are correct for the target
install and not discovered on the host filesystem.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/connman/connman_1.44.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index bbe3585dc72ff64ecda74d866f119dc3b71e4fcf..3ee2b12b7ed98004acb8af89056409344e3351dc 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -30,8 +30,10 @@ RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
 
 EXTRA_OECONF += "\
-    ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
+    ac_cv_path_IP6TABLES_SAVE=${sbindir}/ip6tables-save \
+    ac_cv_path_IPTABLES_SAVE=${sbindir}/iptables-save \
     ac_cv_path_PPPD=${sbindir}/pppd \
+    ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
     --enable-debug \
     --enable-loopback \
     --enable-ethernet \

-- 
2.46.1


