Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id ECFCE7CB20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:47:51 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id g12so6888554wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uzjSjo4/4MaX9aCeqsg3CPg6uCn1Siwo3av4LDSSSC8=;
	b=U9AsaYy07jEiP06xgZuevV0AdQJXQcbm2PUJwCLPalpKdodkmhGsIL25gHFVn38iu2
	wAmbQx+v/lJJTdBBNLunTcbUgZTsVncgk4FKzNggzCOsjahL2+PBV2XR3wrtKSEeTA6n
	f+z+vZlkoiiayAd4g4eRMTXD1EWSBg4Vfz/8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uzjSjo4/4MaX9aCeqsg3CPg6uCn1Siwo3av4LDSSSC8=;
	b=LRdM/EsA+FnIMj6W/syWsaCj1leKhBwhI2ayvjdjzDSI18MZE+e4xuw/xuD8rE8cZh
	Eapjz5mMXa283QxapjMhb5TF1xngTPazCo2+o00rwMdQfjHTYaSqOzgDUEgyugDW262b
	NxU5YpPdxgISDegofHkiyN1hCcBHCtvO1TjBxqRr89ZWGZXBDZ4dtPSLegFFFJF1pE6b
	XO4DNyAF3/th27R9ap07/Vj31f0RVPvmO9Z1kEcRHx9Qz+M7pNvEzA+twT1pfBW3vufd
	pFvqv7yb0BcBHDYJtb7EFY0zcTap5Qvs8d6+qEI0a2U2DCzXiRkgXY+CTJ7qhZ1tKOTz
	cnXw==
X-Gm-Message-State: APjAAAXDOGBC7vfXiQG4kPMNyVF0tngTHBoTTPdueYGTywWa7HrhP8y/
	Qw4jF0TqwkZTRsxIOCEY4qqWsAoI5KA=
X-Google-Smtp-Source: APXvYqyaycf3eHblcydzSAu+1bF+Glw0isuW8pWBkX+fu8Yxe+8Q1mA6CZLNxMYm4cAuea3lZUeyzw==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr3307700wrw.172.1551289672381; 
	Wed, 27 Feb 2019 09:47:52 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l10sm28754659wrx.45.2019.02.27.09.47.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 09:47:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 17:47:44 +0000
Message-Id: <20190227174746.21127-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190227174746.21127-1-richard.purdie@linuxfoundation.org>
References: <20190227174746.21127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/5] resulttool/report: Handle missing metadata sections more cleanly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2019 17:47:52 -0000
Content-Transfer-Encoding: 8bit

Currently some older results files cause the code to give tracebacks.
Handle these missing sections more cleanly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/report.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 2f5ea308e21..5ffe262f89b 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -31,9 +31,12 @@ class ResultsTextReport(object):
     def handle_ptest_result(self, k, status, result):
         if k == 'ptestresult.sections':
             return
-        _, suite, test = k.split(".", 2)
+        try:
+            _, suite, test = k.split(".", 2)
+        except ValueError:
+            return
         # Handle 'glib-2.0'
-        if suite not in result['ptestresult.sections']:
+        if 'ptestresult.sections' in result and suite not in result['ptestresult.sections']:
             try:
                 _, suite, suite1, test = k.split(".", 3)
                 if suite + "." + suite1 in result['ptestresult.sections']:
@@ -45,7 +48,7 @@ class ResultsTextReport(object):
         for tk in self.result_types:
             if status in self.result_types[tk]:
                 self.ptests[suite][tk] += 1
-        if suite in result['ptestresult.sections']:
+        if 'ptestresult.sections' in result and suite in result['ptestresult.sections']:
             if 'duration' in result['ptestresult.sections'][suite]:
                 self.ptests[suite]['duration'] = result['ptestresult.sections'][suite]['duration']
             if 'timeout' in result['ptestresult.sections'][suite]:
-- 
2.20.1


