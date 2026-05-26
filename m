Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EC5CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:37:43 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36005.1779799054743001796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PcRyK80V;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bea7176c72so40044585ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1779799054; x=1780403854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4klIPvUehQAE1ODbedASFOeK3J0nfRY/vDTiekYu0Ek=;
        b=PcRyK80VwFhlWEOuZIfbMO90rk5Mp+r4Y0Ij60harZ+sU2KdBFV2Pq/n39EC7w/ESs
         z1LI9AytK1O8ThR6goQQq+28XYP4NAIC0+OgFhnxHBF0Cu/E2JcNiZ4Cjs3IA2amJ4Gw
         PtxETAj1kUkp9AN3/+Eqv4EJcbbFQGsQBZxF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799054; x=1780403854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4klIPvUehQAE1ODbedASFOeK3J0nfRY/vDTiekYu0Ek=;
        b=qJ6UsxL63ylSN4WrwXjAmU5cPw03Q+eUjR0q+KyGZzb6Dj+418L5XbaAJFnQRnA9IP
         IuEAA9P/ehgrUvfyo8utv47bWvjEZUJf7QMTj1NPhrr0p2G1QyTsHrTqVNR+ULWqV7KY
         yWQCcnCLrcV3Iw58wjdrd2qKIaLeiKYJJpXeSpptPwLnl1RkHudFrI9S1ZnGhbU+90BG
         jID/zYmVa76eUdM5iGLtWrfcTi+AdePQxaCxR7zLNG7Kty8AMQ8gm3PUa13gvcxES5WO
         Gh139LdIuL2rEFmq0AURUrIqnfXduWLCFJYeL6EAo83jRiPt/bagWnLdmanr+MGOgVS8
         eh2A==
X-Gm-Message-State: AOJu0YyZ6k80TYKwtHDi2RaZkfrmeFUr58NoyXF/UlIshOCESO83fM14
	N2eAxZF10tQrTaUt4NiN33UDcU2yaESBLbkilNM835JvP7QeC5Sm3RAe5XhqwFUa1WdKZU4yufk
	334ohFBE=
X-Gm-Gg: Acq92OHq0Wy/M4cLxp9w77uXrgMSO72mCiWEhkh7O6JlfMO6hf1mfEnD7tHqPZlDunT
	m9A4ZAXUkRM6mMrbfoCcFfE2asPicu+/IPw9kKCuO8xfCephFZ2UIekU3Z7W6pnBNz2+C5JgISo
	eMN4c0CxRZsbGb3uNCJIJe1HsexxqG1YD35qMLRwoUqxH43Hmvlv97WzaSayxHrQcE8zzLL38fi
	PoSMNGw9hFzK1nr99d43Aw9AEchOX0cd42lu6zwG1SiXzw3aDJaLKcoIMMQ+R2wTOdwHv3qn7OO
	uVlbyHR63H7GsYlY8roLNjtHl8ZjhMaUZrVBsmjp+LJAvElNd5xSBBiKitzVwSIw4ankLMIVFd5
	OQwd0j1VeDPEpMZZx3iA+ahE0WuCsxcnKftlmo5h3rS8q5X0YYzLVion8Zzk+Kyotcmhw9OrbU4
	QcNfRUqDXwldrl4TehuvOnZe7HfsI=
X-Received: by 2002:a17:903:3c0c:b0:2bd:612b:912d with SMTP id d9443c01a7336-2beb05e2d23mr195901575ad.14.1779799053908;
        Tue, 26 May 2026 05:37:33 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:1cc5:677b:4cba:fdd7:404f:c80d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5900b8bsm121262685ad.76.2026.05.26.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:37:33 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] tzdata/tzcode-native: upgrade 2026a -> 2026b
Date: Tue, 26 May 2026 18:07:19 +0530
Message-ID: <20260526123719.211417-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237600

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The 2026b release contains the following changes:

Briefly:
    British Columbia moved to permanent -07 on 2026-03-09.
    Some more overflow bugs have been fixed in zic.

Changes to future timestamps

    British Columbia’s 2026-03-08 spring forward was its last
    foreseeable clock change, as it moved to permanent -07 thereafter.
    (Thanks to Arthur David Olson.)  Although the change to permanent
    -07 legally took place on 2026-03-09, temporarily model the change
    to occur on 2026-11-01 at 02:00 instead.  This works around a
    limitation in CLDR v48.2 (2026-03-17).  This temporary hack is
    planned to be removed after CLDR is fixed.

Changes to code

    zic no longer mishandles a last transition to a new time type.
    zic no longer overflows a buffer when generating a TZ string like
    "PST-167:59:58PDT-167:59:59,M11.5.6/-167:59:59,M12.5.6/-167:59:59",
    which can occur with adversarial input.  (Thanks to Naveed Khan.)

    zic no longer generates a longer TZif file than necessary when
    an earlier time zone abbreviation is a suffix of a later one.
    As a nice side effect, zic no longer overflows a buffer when given
    a long series of abbreviations, each a suffix of the next.
    (Buffer overflow reported by Arthur Chan.)

    zic no longer overflows an int when processing input like ‘Zone
    Ouch 2147483648:00:00 - LMT’.  The int overflow can lead to buffer
    overflow in adversarial cases.  (Thanks to Naveed Khan.)

    zic now checks for signals more often.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit dda7d55396e0c5258cba58af7e990ab3813bf108)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 71b034d158..a477437066 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026a"
+PV = "2026b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
-SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
+SRC_URI[tzcode.sha256sum] = "37e9ed8427f5d3521c22fc58e293cbfb043d70eedf1003870b33f363f61ca344"
+SRC_URI[tzdata.sha256sum] = "114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544"
-- 
2.43.0


