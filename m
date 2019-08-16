Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id C53D47F2F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 16:12:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p77so3496273wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Bn4QD7ZS2r3qdYshf9C5oM/P54JZ4Co19R5kyhbZxe8=;
	b=OJX22C9tY4tosVPY6sVVeQKLOFLeqvubXNfeB9K9HzeY0e6opd3akbLoffTJkySyWk
	31OrtiZamyGBMXn1jbnd5lLpgpUGFXmmyaRlT59/H2ulLhr8nYiGJKXM6uNw6uJgtWv6
	K03DqXjD16F9pUB7Em06UPwlBG+gMlEmtYHQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Bn4QD7ZS2r3qdYshf9C5oM/P54JZ4Co19R5kyhbZxe8=;
	b=HZT/sNdocb/xKVitq5elowNEl+LWuye8BNJLHdGmPMqGdSp7l18kL07z5PEDxWxlVi
	gGdqCqfVcAaUlZu7CvK6jYPDCBwWe0oI+HWNvhOmMViX7gd4+zgQbbMYiICxLKuk2gXH
	6+23ekcMibZ+qjWPJndZtEHgD/mZ9bHGv9JQ+AtJ+zGktA5z1/Pk4Z9w20pqx2SilqyJ
	L0afZ+uyy8p0mgiE7n/PnAedT8DEjxhEnqBs9N50U5yN4Jf/5LyVWo+1q9DsHvpwHyCu
	qclOqcdLBb2QemBkmdKLwuCMtyqeE97K9Beeb4D+FDcHVXpV7WAMpablV2hLNYZSXSnC
	7W7g==
X-Gm-Message-State: APjAAAV3HYRrYc69tb89mdesfIPOLpJFGI78sFmmVabCsafxKZrptlKI
	HhiyKulU4mCPcifvo0u6kzNq4Cb5M8mUDA==
X-Google-Smtp-Source: APXvYqwvb/EJKS3EL1ciZfyCmrvP7XByH1C9RrEd7oSArEbfH8R+NZrcC0eFdT7jkgXHaDYHYsOP1g==
X-Received: by 2002:a1c:7009:: with SMTP id l9mr8171709wmc.159.1565971938138; 
	Fri, 16 Aug 2019 09:12:18 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e11sm15327243wrc.4.2019.08.16.09.12.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 09:12:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 17:12:15 +0100
Message-Id: <20190816161216.24423-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] yocto-check-layer: Ensure we use OEBasicHash as the signature handler
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
X-List-Received-Date: Fri, 16 Aug 2019 16:12:18 -0000
Content-Transfer-Encoding: 8bit

The layer checks are designed to work with OEBasicHash so ensure that handler
is in use rather than the new hash equivalency one as an example.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/checklayer/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 8244cf07208..5aeec2f00f7 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -245,7 +245,7 @@ def get_signatures(builddir, failsafe=False, machine=None):
     sigs = {}
     tune2tasks = {}
 
-    cmd = ''
+    cmd = 'BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE BB_SIGNATURE_HANDLER" BB_SIGNATURE_HANDLER="OEBasicHash" '
     if machine:
         cmd += 'MACHINE=%s ' % machine
     cmd += 'bitbake '
-- 
2.20.1


