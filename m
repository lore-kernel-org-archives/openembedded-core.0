Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848C5CCD1A7
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 12:27:30 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.14208.1760704044472436939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 05:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RrJ5c1wX;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-363f137bbf8so15862491fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760704043; x=1761308843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Xprd5mVKnHoxDDFRsqvVXBc72Pkhcq0PQgfW1raUyY=;
        b=RrJ5c1wXzHLNlOOxAVWA0ewJFrbIKw2JDCk39fz4HI+GKSgiHj1sdwBeRMmcMRY/JF
         wtkktXdvevA+pxYOFgzvq4KDX5cCWDPYFhJo5K0E7qqkQdc9QOTemfxKNG2kHilg03a+
         8Itcd0ZyKut2nSEpbz9QCxzn95fwbhkp62fJfm5DmAiIG5TRCWlKCRayes+iHcdaFUAq
         d0KHlXj9xUFpfaQNU/vDXUygdkn3VFRxOUV37b4pRzX0dnyjR1Aucak4RY7K6YBkpGmy
         zU4BEASz/D51kG3oE29EhWJp29SGFXE5ZvqkhcXoF5UGGXChEKcEphP9Tu9yCinWWVYB
         7WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760704043; x=1761308843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Xprd5mVKnHoxDDFRsqvVXBc72Pkhcq0PQgfW1raUyY=;
        b=OyQM1k4vmjTIEezx4G70Ia3rKyjyKzJoGtCMkFPB9nbhVuXVhxt96k8pFJm/chLhES
         yytRFqh+oCqS+1WtA6GolnA7XStsVzzY8JyTHqeMPDdn8V0YkinFlx+ft5maESCPJ2RP
         KlvmUuKl05ETmTPm9SydmujugbmPN3/G7CcXB04OXnM/C7oBAeEpjnXUA0ke8TRLvurY
         uHWZPDsP+aeped3Ww57hV99kAXKLpFJMUj7nXJdZt02kU3laIPdXEdDDcfrSqBSkR0VP
         QMCTbQZLcsOn9NVY1xkxFJOx8xoMklT31ognMAezPuiykoVZtQWrvu7jFinZQB0S/qMA
         jzcQ==
X-Gm-Message-State: AOJu0YxOMqMfgaJH6DyrvsMMG8CNL6r8I3uJ8DeKq5OfI7Te5JWaI9Ui
	eKnaaDwd05Xhdme5lBhYH9E8xUloMJ/c/BM3drAoVtcnUaIRFd6oc4Q+rynVdiXtGflFXBqZX0x
	+4I4Zr9w=
X-Gm-Gg: ASbGncvwjWo7B4KN26crjzidFx3OCmY4ALIrD0LSX+jet+ULPFxJg7fETaNiQojf4wP
	36sbQy46nKQ7y6Lgn4PsORNrNqB+KUlK2AHkH0EEy4ixnE9v5n41N9/xxmLpjwvd4Vsi0HFYWdj
	r/T6DEkbUy8gtaAoRdCDd4aA4X5RR5bsJMxYPjIruqkvDzXY0PnT56Z4WpkRG6ygkGbLKqFsJ42
	Gi5XaRqQEYlVQdYFsu/e73m8UR4eXNICe3/2ey5aGh+WwgJbX+4VTw0ZP0IXs3qxbw1sSDoFEmP
	CWrFkkjhdOc3p9LBqPFgh82q+fICaQ/FT7d0CTiVhw9ZGhkX9XzfoeVkfHfSsb6A8gcnyi7t+6A
	1pLNErrYoQV4y3wnRwijnRMfbZYSXOOFi5A2zZWsQJEFxclJYav7IbSjbRhbiqt+Vjm9oo/MFUs
	Az8dz+fgPT7KxIXjRMNXoN3BJEe9g0iUc9zmu92BHBf9Wd9AE1VVq/oIk=
X-Google-Smtp-Source: AGHT+IEzBG0c9u+0PIBThaLhR5c+EmbGavY9EzzgSVi/1nnJkxNyo9OrPK5krNLOvAEODM+xFEGeIw==
X-Received: by 2002:a2e:a99d:0:b0:372:80ac:a33a with SMTP id 38308e7fff4ca-37797a3b204mr12802311fa.28.1760704042563;
        Fri, 17 Oct 2025 05:27:22 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ab05sm61421371fa.44.2025.10.17.05.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:27:22 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/5] selftest package.py: disable qemu graphics
Date: Fri, 17 Oct 2025 15:26:48 +0300
Message-ID: <20251017122649.493701-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017122649.493701-1-mikko.rapeli@linaro.org>
References: <20251017122649.493701-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 12:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225016

Test does not need it and graphics can cause boot failures.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/package.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 38ed7173fe..fdf7ad0879 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -177,7 +177,7 @@ class PackageTests(OESelftestTestCase):
             self.logger.error("GDB result:\n%d: %s", status, output)
             return False
 
-        with runqemu('core-image-minimal') as qemu:
+        with runqemu('core-image-minimal', runqemuparams='nographic') as qemu:
             for binary in ['/usr/bin/hello1',
                            '/usr/bin/hello2',
                            '/usr/libexec/hello3',
@@ -202,7 +202,7 @@ class PackageTests(OESelftestTestCase):
                 self.fail("Cannot parse output: " + output)
 
         sysconfdir = get_bb_var('sysconfdir', 'selftest-chown')
-        with runqemu('core-image-minimal') as qemu:
+        with runqemu('core-image-minimal', runqemuparams='nographic') as qemu:
             for path in [ sysconfdir + "/selftest-chown/file",
                           sysconfdir + "/selftest-chown/dir",
                           sysconfdir + "/selftest-chown/symlink",
-- 
2.34.1


