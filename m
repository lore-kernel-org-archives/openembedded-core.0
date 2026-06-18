Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE736CD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 07:03:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13851.1781766230574219563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 00:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ExsfcsAX;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso6374885ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781766230; x=1782371030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fN+ORK61zlDajMgiIHL2/PPuCaThbgROUm2HG1zPL8=;
        b=ExsfcsAXdd7y4Bjfr0y4xJaEQ9u+FzY/nOC2ME698at9H2sgtkdu9o+sIudR+DxxcL
         c5vK5lawNOiVu3oCfiGb1U9cTZcGXdT1wTttzjSwQ5EEfyHB4wVgnI48uJSu0GD+n61P
         RtL0k9KMh2MiSJKGQnRYZ82Z7yVOYyLBpnTmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766230; x=1782371030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fN+ORK61zlDajMgiIHL2/PPuCaThbgROUm2HG1zPL8=;
        b=LIKQEXIpXMxgWocfAGcCLiH3qGlmcy8SPwTfLSHaiwXQmF8jhKOvhuRTuuCrHkOsGJ
         rTCuSMXd6vAStXya45n4od2EempTxv72boncl54vMqETFArumifY31XGnPtORo/AVhhe
         0Qc+OAykzmjgkYZ6Nc209EOKP7R6N0LebWOqXM4B5WDzQwhLzTyBLIrr+Sd1saLgF0NH
         qpoO6IubVgskU2pMYQSxVYZve9lVrQhccgeA2eqqsqQIu454DP0ePVLBjyHJ55eDBEpS
         /SdK8RPHQegPKrkdsF+2uAhtDKonv7a9goo0WN2iLPx0AGBdLP9uqBD97/CwCF9I0WMN
         3tDA==
X-Gm-Message-State: AOJu0YwN/lt3bdFZsWoRlPM64JIL0UGBbowwcAQITcaIxhG/ZsDlG+Fn
	qZlC4xMX+89Y5j89N2RCSNWx8KGAu2zXR5dIduBALWnF279eML4TBpoFtBFqzFu7r6sqSXhQ+x1
	R7NjiDm0=
X-Gm-Gg: AfdE7cl2J7Yz7qc1lBkBUT4IWqcmEJINXgiN+L8jPazGWz+MC0/PX579BA6VJCowpyh
	XHMzZYPOlPULYbzt6qDkgldqaVIhElUsyFFvn2unxtMQ/nM+sjTHAPuhnnSxfNyIsHN6v813vJG
	Idn7vgjt9K3H5pMoDRl1q3ZjNG0HdOoEfElaAbUzVA1xpxkPgXwu+hpJYksVo53Tw9NPyAOr8hi
	K/urcvoHx/HVL5ydYQWgt4sd0YT2+6tz5X1KIVrtkP1Md7mSYhcV8kDEv69Ihct+8LPt5XMWl4h
	D8snLu6tY/AspAyeKGRk6FddHjGxBVWKHO4rFyrj7I3HOfkoFgUj27n2ZlHSW8o5BeittBRBulz
	BnM3nuG4aKI+6YJHBzyGZp/nRolANDNS8FmIUTLF2h0p6/Lq63Zf/am4sW5LEoIYmi2KOLbbo1C
	TgiPnp+UUm+K6oTc6yHZevL4Z+2nYU
X-Received: by 2002:a17:903:41cb:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c6bc0a2cd7mr76882325ad.9.1781766229971;
        Thu, 18 Jun 2026 00:03:49 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc5:39e0:9a1b:5daf:bc8c:6c46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433460a60sm224314525ad.76.2026.06.18.00.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:03:49 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 2/5] scripts: Fix typo in pull-spdx-licenses script name
Date: Thu, 18 Jun 2026 12:33:23 +0530
Message-ID: <20260618070328.650509-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618070328.650509-1-vanusuri@mvista.com>
References: <20260618070328.650509-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 07:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239056

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix the typo in the script name since I can't unsee it now!

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2776008404eebb58bb24e02140ed18760492752b)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 scripts/{pull-sdpx-licenses.py => pull-spdx-licenses.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{pull-sdpx-licenses.py => pull-spdx-licenses.py} (100%)

diff --git a/scripts/pull-sdpx-licenses.py b/scripts/pull-spdx-licenses.py
similarity index 100%
rename from scripts/pull-sdpx-licenses.py
rename to scripts/pull-spdx-licenses.py
-- 
2.43.0


