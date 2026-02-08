Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E6EEF06E4
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22459.1770539617654656461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 00:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kNYTjkd3;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: logan.gallois@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4362d4050c1so1830185f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 00:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770539616; x=1771144416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=kNYTjkd3CgeUReP8aHWr4tNZgej0pYVJczRiARyF+fG/Y3fkTZeyoBUSC8gNNzybjj
         JnO3Ksm1GWSkbRQjRgHDXFm1WFIPaK4/0Vow2fysqq8lKxJMIdx8rYOKMzAFYWivbp0b
         d7Olom1+yYcbVcemHvGd3Fx5I+BatSQIxDIBID5DrtCcZaMGwkElQtbRFdXa+0jj3jp2
         GX8fu+zCjLs2EComPAA3TlIiSqQsGBHXJBXdMDIJxShz7VSk4S3seWkknYAy0fMblbid
         OQX5mMt6vqLjaF6FrUMiBAokfWkl+1/oOvIy5oGRKMCGISD8Omuk6UT2oqau3wmUS/Py
         jngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770539616; x=1771144416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=RVhncPYoPLrsf/2rgjYm9lnpCBm8Chi7/Z46zCpNDbn3g1tSJdPB0rfWcHDKdKSSLC
         DliyzbhswjkbyOCF7mVG+DomLq8qt1n/2kAp3gczNjhtlV8OIuOSJMteiFdKgDIgV4Yq
         uH4FMdJHqe6ZuQXYs5GKekmKuU6qTQ85i+gHP0abh5yCqJduAnCKV8YkYo8MK0vlr4W8
         o/ycdTlL6Ladx6qV0BSHw2abV+pIrnYxwwFz4+rX1sDNYkvdxoCDJLywbCX1J/jUrXjh
         +fM5jU1WjWamYpQb2e4tv9DSm/0QNCkUjMMXFfWy0bmxA1UOJ9BM3yLTMV4iPy4FviLo
         g2Bg==
X-Gm-Message-State: AOJu0Yxdu6q6K+hC1RcWkVdhh3ejwE2BtrN7T9OhTHhau1w+jnaLpnPt
	Q4H96ZxjN2iOvH8harYGchJJofZOtuETBYTRDyXus6L5RbUzYw2nFd+duCJRKg==
X-Gm-Gg: AZuq6aIUwQuasQVrxNRSjKSKN4oyJda4HsQmV1HPCLG7NVog0EdhO+zdLDxklx6gGSJ
	iADpWYTRE1GE9lwNXHPNFbgT9GXGlyl15oKiKI8KzT1BQtJp/2F/iWFrzy2PKLzmA2VgQ4/qStL
	ryKIMXIPQXwSrpmyETZHDbEQfbYgMg41ZNYPHQlMpEJhqyKcyq8EikYg8/X4gFaNfgftoffzOcm
	N38uwe2Ep+oQRJN1rvPeKEub/E23b5/gPZ5wL7uWxw/cIigqRQ/AbsYM3zkN/Zv3/J3VfVijGDC
	rAy0d83xtkODSGSPJ/THCEktw3KuwmVUeXqcGG8y60m+hq3ZI6d++PY9zfAESGv1nA8uqIigl85
	p9wndcdQGyNSyot9urYzPeGutvku23nIfaK2Jv1dgydc0/yi3UHchEuy7clm3QDJs/Bigjx1wNS
	sGeApFN0AR/gm8v8GiQ77IEzGJQUZD3N1Pb4/tXAQm1QghUtH7A54xAkVI7Fo/9BiZPA==
X-Received: by 2002:a5d:5d0d:0:b0:436:684:b94a with SMTP id ffacd0b85a97d-4362933bda1mr11183212f8f.4.1770539615382;
        Sun, 08 Feb 2026 00:33:35 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fb16sm18108872f8f.25.2026.02.08.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 00:33:34 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH v2] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 09:33:31 +0100
Message-ID: <20260208083331.1594-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208000829.343627-1-logan.gallois@gmail.com>
References: <20260208000829.343627-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230686

From: Logan Gallois <logan.gallois@hexagon.com>

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not
exported to the environment.

Export TEMPLATECONF so that bitbake-setup correctly picks up templates
provided by external layers.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..0a3146fd503 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


