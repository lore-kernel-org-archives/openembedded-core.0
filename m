Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.32149.1609070995766528244
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Dec 2020 04:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UKnCWwcA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id w5so8047633wrm.11
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Dec 2020 04:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ye7yq5fvyfOlVd1IHAiVF/ws05SNd2UJB9mRbP5vmXM=;
        b=UKnCWwcAYmDXJy/JwkHl+pbkuZ1lQL1JEdsuKX8p8CV3RjwuLYwjT+wgCF+XszK0Q/
         IKHOpZPnFeR+XvKs4dwLCOJb6dAOS4MB1Rz5DbPJ789PHmVMBcGPnI1xPcR6UwTLB53t
         xrwNV2yLAEs5LeiJpziAYpbCz3RkaSVrlwCVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ye7yq5fvyfOlVd1IHAiVF/ws05SNd2UJB9mRbP5vmXM=;
        b=RszzsnylNfAoBfIsoCbqZA9/vLgx3yEc68SlmuUKSU3+Tp7nIZtZuZiRskvkW494Iw
         0rZS7GaFPImNB2QG758C3MwB6GCmjz9rbKHbw8pccph/nwUyl794Fy0pctd+W/D7ecz0
         2bY5KCZ9ANxY9GDm9PIAcnphnrXTWWGmmoixiwrPH4Fwy7X/IfZwxZUIoGDbBqb46xrF
         A6d2aHMIaxLS2aANy6Gi3yXDWGn3GtCpYIh3EexbTNcaC+10TElqccEPoInKfeF6V7Vv
         hD6XwSZVqJu0sXafhM/gSFGK1WdtDtxuTowgvPa1SIQSacDsxsKP+4SMkU95NmOXpZyQ
         ln8g==
X-Gm-Message-State: AOAM5322c9MdDrkx+fsOUgWCmSUSj9e77BdoVvMDQAXlVmPWPFAIuHEe
	SaDyizDzQ93lNEqgjQ1TH1JMSiyaz5rSzA==
X-Google-Smtp-Source: ABdhPJw6J61HE6OCCb/FXzZ2dGO86KRjwdFfjUWI7cKNS/gBLhwBaakwnjbEhyXPcKqF4DajLIoxJA==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr45683329wrc.411.1609070994277;
        Sun, 27 Dec 2020 04:09:54 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (7.9.7.f.4.f.8.d.2.f.f.9.b.8.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:98b:9ff2:d8f4:f797])
        by smtp.gmail.com with ESMTPSA id x66sm14987598wmg.26.2020.12.27.04.09.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 04:09:53 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] selftest/reproducible: Add useradd-staticids to reproducible builds tests
Date: Sun, 27 Dec 2020 12:09:52 +0000
Message-Id: <20201227120952.139650-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201227120952.139650-1-richard.purdie@linuxfoundation.org>
References: <20201227120952.139650-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its surprising we've made it this far without this, add in some specific
uid/gid settings to ensure these don't cause false positives to the tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index e3597d5081a..eee494e5cc8 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -249,6 +249,10 @@ class ReproducibleTests(OESelftestTestCase):
             TMPDIR = "{tmpdir}"
             LICENSE_FLAGS_WHITELIST = "commercial"
             DISTRO_FEATURES_append = ' systemd pam'
+            USERADDEXTENSION = "useradd-staticids"
+            USERADD_ERROR_DYNAMIC = "skip"
+            USERADD_UID_TABLES += "files/static-passwd"
+            USERADD_GID_TABLES += "files/static-group"
             ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
                         tmpdir=tmpdir)
 
-- 
2.27.0

