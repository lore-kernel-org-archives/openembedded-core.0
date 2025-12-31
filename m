Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF5BEE642B
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 11:21:31 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83637.1767180084399117258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 03:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XqO0JH34;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so13929398a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 03:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767180083; x=1767784883; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmQ8qW3X12x/1QiKJgBt6fMF8w1GCTzKYqJnPFYfZ0Y=;
        b=XqO0JH34n1DSpOPzWh2Pmy0amIhoEb1KnHYfSyIx5WaNDGbAHKp4gMM7SsVw7ZZkeX
         s+76xfpW3ZgISh40XvapESM2qMq3w5g0kNTjk9afzgcFR4qeJbDjiCLHmu0/cdGDbJf7
         nSK8Yyq2gD5HgghUlJIJA9JzVUBsTaQ6Ax2BFFrttIsdW2CdpjoQoZNyQ9h04qRPTOF6
         SAt7c/Ezk5Fjltggs/18pRZQl8pKlhHh7r+x3f0bMHQ3Z47og7gxrAAI+K4KeBTmcrHU
         4U3E6tTcZfdkhtf8JOdj72beg1tSyE3dNqbWxojw+IZbj35mJPlheE1vhZKUy4IbsEyz
         fFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767180083; x=1767784883;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmQ8qW3X12x/1QiKJgBt6fMF8w1GCTzKYqJnPFYfZ0Y=;
        b=GCxfIIvBBQ3PM7Be+DzuvVCwfHIzt49tGFvrdM9ciLBwyee8IMz3onrQZfZcWwUd2p
         RUxUNxmTHyqvYHYVTDKF2I1hMT/JhMA5OSIspB9yDmnjLG9Q3N43SkNcCs6m4hQht+yE
         jv0ngiJgnoDlSo4WX1gaX2D997caAtQ9EbyxiZT6/m8YcJXCqlenDutMC1V81iNK5Efv
         B+2xCSBtoLypIoLi2Nd9sJ0merpCW7eHdrIM+zKgDn1EFA49TL6XnSxC8Ay69iMQCY7x
         OY2aKD6EIjaxBClx5/ekt0o56y6+dH7Jv0NhOyIITxz1kwA8JCog0Sz4/iFKvDNGfhLE
         eevg==
X-Gm-Message-State: AOJu0YzWaolvx2F5CB5OK2IPKdlbIs+EZeeLdaxP6nyoSbMZWV7Cn7RM
	QU6q0oRSaT7v3QPP/xIo1EK6Ijg0Hw94Sa0lqXlorIAA70a54fXf8/NS
X-Gm-Gg: AY/fxX5s2wx1VrEvN3j4c9whp8njt1QdpCfv2La09+o0SVdtTV1ulX0Xu+93dtchVvV
	wvJ6Tkw53Ql/lCvgxPW29IijJWD+ldbtzBaFTClg+VHoz1ZyabI0H8Ha2OH9S6uYckZuxFTwZtA
	vXUmTLQtjNBEoqw0v8rGgXwFhcxy876dipeu80k71j92oo1bckZWQe81i1bjqTl/NTwXIrqVZ1R
	Z0LB87kVpYFqnrF/RNXQh0fxUtAIH1Ih4k6tkTT+Ozoeu0tjXcg/T4xDfZKu2S/FXZ8PVms6OYq
	FI3OM9V8baQ/jNOjMoa+niZmMdR65Nxi0BykgJreJefLlzmSy+mc3RBeTuBxB4JVKa12gPPFLod
	mlUZrF6CixV6OP/RIHstQuwRa7qiUwJAhGVKZ3XQonz/JGzmWBgSCCPkwLHYS/y1iAn7lSpurg1
	rojfn5W2jHlE1IEO9ssg==
X-Google-Smtp-Source: AGHT+IHcGYTVH2s0soergn5okVGmlRvAG8+A3FQnZbKQZOTRpc5BoufVxskj3K8qoJaNtDiBkGNnZQ==
X-Received: by 2002:a05:6402:3c6:b0:647:a127:7c1e with SMTP id 4fb4d7f45d1cf-64b8ec6dfb0mr26344131a12.20.1767180082562;
        Wed, 31 Dec 2025 03:21:22 -0800 (PST)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:97c7:249a:5e45:8cf4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm37856772a12.25.2025.12.31.03.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 03:21:22 -0800 (PST)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Wed, 31 Dec 2025 12:21:01 +0100
Subject: [PATCH RESEND] buildhistory: fix handling of RDEPENDS style
 strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-buildhistory-fix-sortpkglist-v1-1-7737a3232be4@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767180070; l=1315;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=l0uZ0FYC6pnubgQO7CAY7uX1BDrwZVNb//OAtx5qfDA=;
 b=bTsBCnnfbRb8YPnEtVoAlayKwbCeNIud8dkHTBHE44YtkiqlQQa8VDUP4YlFXptrvCiRNGmKA
 hlJfebAY0ayBLCsB7DuUA4dGMV9WNLfGxXvJB6fmI1X1dI8Ikmc+fQm
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 11:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228731

RDEPENDS style strings are regex searched for entries matching
the usual, allowed package names (plus possible version flags).
RPROVIDES however, is also allowed to contain actual file paths
like '/bin/sh', which get broken by the current implementation.

Use bb.utils to handle RDEPENDS style stings.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes/buildhistory.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4a380c10c6..78037a6462 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -187,10 +187,7 @@ python buildhistory_emit_pkghistory() {
             return None
 
     def sortpkglist(string):
-        pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+[^)]+\))?', string, 0)
-        pkglist = [p.group(0) for p in pkgiter]
-        pkglist.sort()
-        return ' '.join(pkglist)
+        return bb.utils.join_deps(bb.utils.explode_dep_versions2(string), False)
 
     def sortlist(string):
         items = string.split(' ')

---
base-commit: 2e10e9a50f12d5de3d22fbed59b65461afa3fa84
change-id: 20251217-buildhistory-fix-sortpkglist-8adbcccffc7e

Best regards,
-- 
Adam Blank <adam.blank.g@gmail.com>


