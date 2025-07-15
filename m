Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6277BC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:50 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.5505.1752611802744750346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ms+clG+5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so5366376a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611802; x=1753216602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRW6CUPj5Noml63HpXhcy+lzOYVu4jVgKyPdxMNR0Bk=;
        b=Ms+clG+53SWLiLOaKX5gEZV+XB18DQ6UPwENTjH95u/hT5vIVvdOMVCc1X4YBw+73s
         oGgNTa/VnIxGUeDtv640vRvYoBYdgLumNdTAX7j8ppWhyIaECsof5JXRpNKptV9t/7Gf
         fvrxAAUID0Al89smj0AMJZsnczfgdDz+vk0XH3JH1ygU9+oFoD0riQ97qnoh0goZS8II
         meP3r+uXR775cn9U289yHrP0JDWuYAvh1oHutJRKTwcoumBLpHne8tWeKA2pIPO5EATh
         Tt2K6zBXTBBAWklXZ/IUaUvZS+kg7dhOOpXZ1seLHdW2FHLrBImkEV8we3NUTBMu5P03
         T6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611802; x=1753216602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRW6CUPj5Noml63HpXhcy+lzOYVu4jVgKyPdxMNR0Bk=;
        b=NOWmtZNcXAnPC9pMeuugIZglKLej5QcxZl2WjMqqKuMm+zCHXfk05kh8PJbxXwFmah
         3juLy4JpsHzLbXK2UKm2QFqtz+u95foIHU0fqC7cYbHQZOdEKJS0mh4nUD3tP9N23IDv
         mT4Po6sMz1AQ0fU1p11a044IxlX/dkUII2iL+BDfuw7DnhDQxluwuNFyM14PW1b/KgPx
         KrRnWCVDFofHbTKLFfFtaL4mjJSSmTtdkP3l5HgEwCsoH6BHfRxh+KVuf7vI8paYQbGq
         g2dOMdVf1Y2iZdMRbPwGheyGH6Kg8o6O2CjAAM2n7jmfXeiv2YGuScCohyuz3IrVUroy
         Gf5A==
X-Gm-Message-State: AOJu0YzXthcxVL87g5hKgLVDkLheJf/E1VFeYwJvGGM/mjZCeTw+LRre
	J0RvlL2i22/tUmn9WDFGxqDu6ETENmP9s4iL5m2HXWfzwP4d86S9zkBB8HZHBpKJESMZqwG6tyQ
	vfttH
X-Gm-Gg: ASbGncsUBHDZ34QKi+NQ7R9tCoeZzK565Rde2P0hTF5hMFMfXGfANesGiBcNi1HGeX2
	eZvYJnhDnTSeklvGJwFjdLhodSvFYgrMFd/+y/bPs/I8FFKJY87Hu0biJpqtazzZcMzY1Swghyh
	m6Iue9ULhDEhBSzwLIT9k83KXWNTInSCNNWdCVDIOFC2hYjSlrW7kjHIJ18XMOPe+n0pLelngha
	YKuCGeiI9v7nrp3t4p+mRF5DxjTjoTD7dYvDxMV+Hj3a5JOlrj7X9o/OAX2vIY2U/5NkcCKKie+
	589h3hOp2dyE/zf3A9YdcVmlqYrPx2xJpvsBxMUhyjR8THBmeJ/hM+62zy2vgWdOvoT9YbQQmDZ
	C8JYXKREwc///kw==
X-Google-Smtp-Source: AGHT+IFpKv5vCk2gCCors/eV2yJVV7rJLsnb6pgkU6Ao6+nK8vUH0+rdq0mx8x7SjDfMnjpwGZM3Zw==
X-Received: by 2002:a17:90b:2f0c:b0:312:26d9:d5b4 with SMTP id 98e67ed59e1d1-31c9f4c3816mr18843a91.17.1752611801834;
        Tue, 15 Jul 2025 13:36:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/16] sudo: upgrade from 1.9.15p2 to 1.9.15p5
Date: Tue, 15 Jul 2025 13:36:13 -0700
Message-ID: <9a604a05d4a8158742a2346fc7ebc3c99e58eeb7.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220421

From: Chen Qi <Qi.Chen@windriver.com>

(From OE-Core rev: 4b2eccc0ee3f2906f9b04de194b9df6e24c2cdf4)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 468633036c4b049b137d80740c4380ae1959e645)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.15p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 431dfba3c2..8e542015ad 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
+SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.43.0


