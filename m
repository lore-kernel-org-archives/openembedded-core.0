Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA8CC54E55
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:31 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.1944.1709071043435582258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cd+LW4Qu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e48eef8be5so3413121b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071043; x=1709675843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehqBgD11gA5OQRRK8yuMiy6VAOJ3FCUVFXXOgDenIwE=;
        b=cd+LW4QucrbWxKkjIhjQxK2+okdOsJhPV719gIc5HMLgNTzpYpx1324oIujFnDSL5P
         Tvf6L+u0cF7ACIgDCDOR39e80KO+HssO/QK953AlisT/28FvjpFHegjeGzzH+z9HHm52
         TPd5jiJIYfURLU2vLr30lLRTE45xYhn0pk8ZQgHc5HBPdDsW9FvpkMaKyqGA6x6sWT+A
         M0GmRmmabvLhs8nDA2LlubBMV+VlMXJsvH8NupCdH+HX0KLScYR+XF9oxQzIXE6ytid0
         m18WSyPM3Iw+iZ6ZyxRgl80dmVPPeroyoEWSVptl8G0qFQwE2s/O8wznRH6qTjv3GWS9
         BvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071043; x=1709675843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehqBgD11gA5OQRRK8yuMiy6VAOJ3FCUVFXXOgDenIwE=;
        b=YKeRrKcui45aaO/cNi/JkZ1xfhXllVe/H6xaI32YELB5m+SAnRgLAMWAs3+9nKL4Uo
         MZ7T8NK9AxIc4aXNWEqAHmSvRWhLDmfBOhIkJk8up96gC1+0ULCaS7KUH1vBeo1WMyzJ
         VEIsoDMQCE50g5dVIxLETYeB3N5vzPBPD0tJmbK1Eft26iu2W32bDnP6xFvOlY1wvq4Q
         FZObmimj97Tr0ILwxUYC03LF31rqgjDZTqw04gfZMyZTlFTddD01nvrFarHIKoVYx2N0
         VJEqT9xVYUqlF6QEu0GXoW4H8jAxd6dljhVecj/2sdjN1OtJW+2MTcl0T+Eq1FAWFQKy
         cu8A==
X-Gm-Message-State: AOJu0YxEUzKTE2JOjdHqrNxSifX4c0KmqnUD/ImyBBF4TaL+JYE3gmlW
	ojbz9GkG8O/DHTL9LS4RqZFsJi7tAbddouHh9pmzt6ALZv09AvrZfvM6pq4C8/uxVdkX51jJaGZ
	fSb8=
X-Google-Smtp-Source: AGHT+IGFG9XiPpOn2Tm3LvpjG55sfdBIW/sKq4ZaGEhfHQsgt8GcHAwl841wyvPgHtFSEvWCuCF/tQ==
X-Received: by 2002:aa7:8450:0:b0:6e4:5cf5:1b5b with SMTP id r16-20020aa78450000000b006e45cf51b5bmr9607313pfn.30.1709071042670;
        Tue, 27 Feb 2024 13:57:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/16] oeqa/selftest/recipetool: expect meson.bb
Date: Tue, 27 Feb 2024 11:56:55 -1000
Message-Id: <979b216330b2f4e8ab9d4e615d4e83997d59def0.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196307

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Latest recipetool from master branch generates a pyhton3-meson.bb recipe
while the older version from kirkstone generates a meson.bb. Change the
test to pass with meson.bb.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index c888770533..a2d8d292ad 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -444,7 +444,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         # older release of Meson at present so we don't need a toml parser.
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile = os.path.join(temprecipe, 'python3-meson_git.bb')
+        recipefile = os.path.join(temprecipe, 'meson_git.bb')
         srcuri = 'https://github.com/mesonbuild/meson;rev=0.52.1'
         cmd = ['recipetool', 'create', '-o', temprecipe, srcuri]
         result = runCmd(cmd)
@@ -480,7 +480,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         pv = '0.52.1'
-        recipefile = os.path.join(temprecipe, 'python3-meson_%s.bb' % pv)
+        recipefile = os.path.join(temprecipe, 'meson_%s.bb' % pv)
         srcuri = 'https://github.com/mesonbuild/meson/releases/download/%s/meson-%s.tar.gz' % (pv, pv)
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
-- 
2.34.1


