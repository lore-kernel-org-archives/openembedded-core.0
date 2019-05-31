Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B860C7E591
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 16:48:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u16so1110224wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M+Ho/UxqH0+Vvg+cwg9slUW372qcuJOAE+ZWXu1mDZo=;
	b=eW82v3XRSekuvOR2ARfLgoFpp+LdfpVVVVhtbqxGu1EuZXZq7vw9EqEkZOY5m5NxTZ
	lJg+aYIyGdgtaHJcBBythbltVTO2b7J2hrBo3rASGEM+L3/080g0IPfXRLyJ6u6j/OJz
	Az8h8ixAchzp7+4xGBTLhfMO1VlJoz0FtyW4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M+Ho/UxqH0+Vvg+cwg9slUW372qcuJOAE+ZWXu1mDZo=;
	b=IqYGr4pf4wx+uHe2UGWs0rLSHngqcBpyf4x+/DkoWOb5GmIOC7+D4x6w2CJhrQ4ecP
	7x6G0alwNyAh/xQu1F6dVPGaSyibIGEvVyp6T0Q6+TeZOjbUMrq8vc02VT7jC0lsM3BV
	Z1J0wYxh0i/xuywzvMWN+vdWB8qrqsJS9rZZsvmu37iZ8LcWCmTgOjsI7U9MO/ev4t07
	XZl28K/IosOaOpue8/RL2ZSFYewPPmaM69WSBRxWLjv9fD8tA8devABYXxFQMP/5vrub
	PN+nOpxADzOI9R/CxAzO2X7fsZKddo65UMsDz7bKFGxseRAc4J7kU6C4PCh1Cc8IzLTF
	ksow==
X-Gm-Message-State: APjAAAXL+zG7vnS7kn0KQ2LHByUun+pd24jjtUawQA69VcUzS62moIb4
	6neeE84PZoUbmZgCgzyYKFfPwmPZXBY=
X-Google-Smtp-Source: APXvYqzT5wc+ebt4jWsSEfEs6qJ5IFOaHEJwx4h0EM4wc/edrfIa1DG3FYX7K15wBs3GZEsoEGqyDQ==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr5954872wml.160.1559321324044; 
	Fri, 31 May 2019 09:48:44 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p3sm4065539wrd.47.2019.05.31.09.48.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 09:48:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 17:48:42 +0100
Message-Id: <20190531164842.31374-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] useradd: Ensure do_populate_sysroot has dependency on useradd variables
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
X-List-Received-Date: Fri, 31 May 2019 16:48:43 -0000
Content-Transfer-Encoding: 8bit

The do_populate_sysroot task doesn't rerun if you change any of the USERADD_PARAM
or GROUPADD_PARAM variables, only do_package will.

If another task depends on the recipe, this means it won't see any updated changes.

This patch adds in the missing vardeps ensuring the code is deterministic.

[YOCTO #13232]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/useradd.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 5e600dec849..e5f3ba24f9d 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -184,6 +184,7 @@ def update_useradd_after_parse(d):
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
+        d.appendVarFlag("do_populate_sysroot", "vardeps", "USERADD_PARAM_%s GROUPADD_PARAM_%s GROUPMEMS_PARAM_%s" % (pkg, pkg, pkg))
         if not d.getVar('USERADD_PARAM_%s' % pkg) and not d.getVar('GROUPADD_PARAM_%s' % pkg) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg):
             bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE', False), pkg))
 
-- 
2.20.1


