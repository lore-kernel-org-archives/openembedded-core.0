Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4492ECCD183
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.2337.1760064674269485170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VspNEoEA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-782023ca359so1635291b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064673; x=1760669473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxDcayZQj6ds41uTN6slZiFIpIlfB2OI86YIgeOwFl0=;
        b=VspNEoEAXabzhefDnokB9eTnNnBK4Q2gdnR2akJOejIbvcveXYBu3olc6UrDxehxBP
         SGs0MC20W3Xh8F0YLj9xB97S26scuy/tSRkvhU56hFSzBJ63ycArjjBwSsEEOvqw2+xG
         /syFKxiMqsI9XfV93XUTq4SnfUrSfQGB+nIV29wCcQlWhXExBdqOzXHz+P1J5EpavMuL
         ViQfA505YUwqmdSpOOZjr83F0PGoUjkmSD+yCEipAl6YUMQ+Tk8DvczSvlGdGsF3geoF
         GWP8SI80L0Aa3uUcDRvXkgrzYyfnqWpx+TqS24ZVE6vE8WttTJ5tWCjnc+EFSJbrfCQr
         Mwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064673; x=1760669473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxDcayZQj6ds41uTN6slZiFIpIlfB2OI86YIgeOwFl0=;
        b=gSK7Hb45k6EeAetxcVf7prPSfiqWkHPKPeehcSmiy+0SXKGDz/uaOwllh0QPFc6dgt
         a7pTLXsDWd5e/dviVSkDMMTmFhZMElcl22+iJ41/ihcKVhiVe2v07CzK4ssmX2n/wJRH
         6YwIBeRKIbP4W3kRM4Po8kv2lJUjBwChDvOjzAkZlCcAUB0t4l+AaEg18QkA1sKgqJzL
         4ZGwWIVMxrdUPqumnYGpqu4rrvnAcUarVElNzhus0CTdQWRpXD0RVRv/MjvF7HVgN2zM
         XtZEMUSuny8PVu+iyJvAam75GCikOy8LmqbmUzPuJEsSjhM2yERe6ytBK0t/+tziN0GP
         +bOg==
X-Gm-Message-State: AOJu0YwfFjGi7ugcNPxDPiRA24kWHhoWhh6rhzr3PXVob+ciJWu6wNDX
	aULuHL0+K+79xDR3v51Djd+iAAUtENIGvAuBazAlrKUc8Mbgl0NX/hZrb1vAyP6p0btxolxJGcT
	CryFC
X-Gm-Gg: ASbGncs3Lh+b+HK8hiY2rfLXRfQ05x8w//fynif41o8mQCJNJ9rHPYsJ0xgYdJ/J0wy
	N3AHRjhYUdB4lrsQdbTaiP11O5W9GzxbdZX8+d8Poa1aTA8wo0wlaVxqvg2FGECZs2zjVakqo1Q
	WNZO3Lqbo2oN+c6YaJaYYfAeeVUwikd3O9yAVS/DG5y3lx+QfPqqllJIMFv0GUKMg0d2HBLLsio
	yhhMpOSPZXQ3kEhBVVnFBE0NydMLTVllyIH0KjAtHfWyOBYw0RHT00orEH8CC/i6zg+k+xglr8h
	DbZz/TtY9bKti/7HZz+EqhNoicLkftYdMHa8Pay2LfCrb6fy0Yzf1eAduP85K5i4g6KWtyw1I93
	U9CKaLOdmXXcVY0uXlf7OZYyp8Ngcm2Nc
X-Google-Smtp-Source: AGHT+IEArVFctqW5RSvySNDZFSml0/X6sdWug3JF557j81UkLLneuBrGY1vym3VUj/q6fcGxsWnfwg==
X-Received: by 2002:a05:6a00:4fd4:b0:78a:f784:e8cf with SMTP id d2e1a72fcca58-79387829619mr10586109b3a.27.1760064673449;
        Thu, 09 Oct 2025 19:51:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.51.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:51:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/18] oeqa/sdk/cases/buildcpio.py: use gnu mirror instead of main server
Date: Thu,  9 Oct 2025 19:50:37 -0700
Message-ID: <99d549ed135626718fb1615d367eb7c59127b032.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224662

ftp.gnu.org is the main server of the GNU project, however download speed
can vary greatly based on one's location.

Using ftpmirror.gnu.org should redirect the request to the closest up-to-date mirror,
which should result sometimes in significantly faster download speed, depending
on one's location. This should also distribute the traffic more across the mirrors.

This information was sourced from https://www.gnu.org/prep/ftp.html

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/buildcpio.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index ab8fc41876..4148463267 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -24,7 +24,7 @@ class BuildCpioTest(OESDKTestCase):
 
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftpmirror.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
 
             dirs = {}
             dirs["source"] = os.path.join(testdir, "cpio-2.15")
-- 
2.43.0


