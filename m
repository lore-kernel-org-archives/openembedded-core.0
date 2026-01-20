Return-Path: <ungerer.ricardo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342E2D2629C
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:47:49 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15237.1768938459712384975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 11:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XxE4kLEg;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: ungerer.ricardo@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b72a1e2f0so6718040e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768938457; x=1769543257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4Xiv8RLKVQDpes8AJ6Xt7Td0iiUU0khCfUbFMstCaA=;
        b=XxE4kLEggutTmTsCW6xFP07lGWUtJjEBqKdhIBEZ6uc/L3Czd1hCKLkNxBRbU//+zU
         Zo/wHAfFMaXDCkFBEh1l9ZW4MmrPudmN8DUI8CgLR7cUK1OojGlJQvYRt97+NJV8s38a
         Afl3uFXCKkQeEronFTEe4dCXGPNry0atMy/qqKaANKhmMwoWx35bKQVG9GH3MfBsutVu
         pZsCLH/NUl52e4eYr+S+pMjje3XKlI/6FwRncFD0NeNd/JGRvOLEBVE5zmSIcTnP9nvM
         dnuarp3HcLM3N5hW9+RZOXHIpoVbQfg7Py1T1CGWNr3yKYawiTOaMMPfmOZ01vkQQhs3
         0zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938457; x=1769543257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4Xiv8RLKVQDpes8AJ6Xt7Td0iiUU0khCfUbFMstCaA=;
        b=VpkO0fVvkTg/oDT2lPHkecCzfR+N3CYCwDpDNUmUiHc4/qBZq8YJlVYGAJVl7mV084
         2PqZ1TLZLkIIEWodBB+g+uu1rcSzmteQetdul5OsnpbaAWZvqm5je0C3Qj+PFxjtPG2N
         BqdEw7p7q8MskE7NMsiBME44MHnGj29FJ1VEqtf6pIMSTk9BF+hOh19yanj7+xRNyUH+
         0lY0CtEGcSa8MQrkQexHf+oY5ZGuQRnJw391+ZNnzDLUUdTXbv/Agy4vRm804tqV3+WZ
         YfJ8xzzQP4KoErbQ50bN3VdAk59epqzi9cPdP1o5RvE33y7Tmrmonhod6Tm6XofcNHia
         fPXQ==
X-Gm-Message-State: AOJu0YyZDEcnHmtNhMhGHCSX2X7BVw98bhlncHcUxEDLaslXUrNBlAgq
	oQzpzkzAfCEkSPR+l6816ewv5yPaVftpa71oUpOOOr3w9Z6eBkYYPXuOyplIuA==
X-Gm-Gg: AZuq6aKj/obTW4R/tolDS3nUvLLLh3EiOfOjcHtkrh2lqncl8r4ex96VWni3T/ByTEj
	A6vHlsZb1gB95mUJDkmsZFbcW040sFQTpfw+JlesKCpAJrwNY1wF8D0R7k2q6DzceX77ddlP7QE
	9iuhMY7KncZFWlPoQdWu3sIu3CXxHPKbbG+WLjQiaUDCbGqx8zfdjZJJqDAEF7y8PVRPpON7R8K
	hWml5SNWSuK8kJvCuC8ucKRqxyx5y6Ya3kD7MedyXtyXHcsMda/SPJ+8JJMWln1g++HwwcrzGuH
	2rJS/BlFMyStMBNTpY9oHDp1fwBbk1bEBu75dmRs6syardpICqVLZh9tHeW8iw6iawbfkmhs0ir
	e/Mo6SXSNYhR/3nMZxOg1xsGXWTObhynASc9e4QHpiWIAyjoHSKuXPJ52f+CwszGuQeaPBJ9HXF
	c9EzNG5y8nsj8X7ThU
X-Received: by 2002:a05:6512:3c8a:b0:59a:103d:2918 with SMTP id 2adb3069b0e04-59dc93565d1mr919200e87.37.1768938457196;
        Tue, 20 Jan 2026 11:47:37 -0800 (PST)
Received: from bolonheso.. ([45.94.208.114])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59baf9d442dsm4395035e87.94.2026.01.20.11.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:47:35 -0800 (PST)
From: Ricardo Ungerer <ungerer.ricardo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Ungerer <ungerer.ricardo@gmail.com>
Subject: [PATCH 2/3] yocto-check-layer: Fix README email check
Date: Tue, 20 Jan 2026 19:47:21 +0000
Message-ID: <20260120194722.142355-3-ungerer.ricardo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120194722.142355-1-ungerer.ricardo@gmail.com>
References: <20260120194722.142355-1-ungerer.ricardo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 19:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229790

So far the test_readme have been use of re.match to find an email
address in the README file. This only matches if the email address
is at the start of the file. This commit changes this to re.search to
find email addresses anywhere in the README file.

Signed-off-by: Ricardo Ungerer <ungerer.ricardo@gmail.com>
---
 scripts/lib/checklayer/cases/common.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 0114481434..9ea7592ba6 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -39,7 +39,7 @@ class CommonCheckLayer(OECheckLayerTestCase):
         self.assertIn('patch', data.lower(), msg="No patching information found in README.")
         # Check that there is an email address in the README
         email_regex = re.compile(r"[^@]+@[^@]+")
-        self.assertTrue(email_regex.match(data), msg="No email address found in README.")
+        self.assertTrue(email_regex.search(data), msg="No email address found in README.")
 
     def find_file_by_name(self, globs):
         """
-- 
2.43.0


