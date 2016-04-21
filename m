Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id A554E73177
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:29:48 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id r5so26139031pag.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=M+L8o6r/hz3lwHjV6OwwkE2wZGmoaikfQ8Hiu2DhSKY=;
	b=Yf1u/zpUMjH+7arse5Szar1Xnh0S+vP1f7+Cvskjz5fe4+5H0tcSql0MD+P63kqcz2
	hfWdddewCtTYeI2Rmi/GCwfWVVvFj3m7KlsUBdEojjcWOsuc/OHku++Q1tom+ROgQRaD
	Fc37+iBWU1UjflouAv4y6kz+7mixkA/LheZ9gy3iLQlLCvL09DbtRWg1E6NNjwzBCkgM
	5s5mrbGamev0rzReuYT5aMgfbG3XRPLKo45xx3t8bBrSjc0Nre0xkVjNVwmNfXtXytYi
	Qm+5hFRY2wVh2EkPUS5OjYcmb97nqOrvCxHqQ8+MTuETJgSJMc7KB6SULrg+luCVEw6o
	nzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M+L8o6r/hz3lwHjV6OwwkE2wZGmoaikfQ8Hiu2DhSKY=;
	b=U1IVe1T5VkboewneqZ7rI9fJNm9nK1h5+MI0/3GFgRXGtr5HLDqtvLCA+PQBKb5NHK
	2HsJUkrGFMLQhhPvy7zePohbmhDcFvz5Zj3ATE3daiBjdi6wqtUHEIK8H9ceiWTsZx+q
	1sb7wJwf7P93TkVUSA9KtZpcBMmi3uqs05c2Gl0xI3se/Nmd861c371tbiMhzOeQ5Z5G
	X1jXCYBxWEwZKDvuZEc6/ohMg1RLfLW5r42AkJI9q1lbg8HctlVfZm/P61PvzNyqghvJ
	RWB8H7EYvQHX+F+wGZw2Y5tFuBib55OJikkM9D1a0Z36XLGpTiUeLLbzl51iAm5omRMJ
	Yj6w==
X-Gm-Message-State: AOPr4FWh0NiqSG3tsOuDmQsJsl43SUkgEPWOZD1axnvaf0A/Olwfco3nYm9ld2Sh0BIjTA==
X-Received: by 10.66.66.77 with SMTP id d13mr20476581pat.75.1461241788967;
	Thu, 21 Apr 2016 05:29:48 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id 127sm889567pfe.72.2016.04.21.05.29.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Apr 2016 05:29:48 -0700 (PDT)
From: Sujith Haridasan <sujith.h@gmail.com>
X-Google-Original-From: Sujith Haridasan <Sujith_Haridasan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 17:59:35 +0530
Message-Id: <1461241775-9474-1-git-send-email-Sujith_Haridasan@mentor.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] gobject-introspection: fix floating dep on python-mako
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
X-List-Received-Date: Thu, 21 Apr 2016 12:29:49 -0000

From: Christopher Larson <chris_larson@mentor.com>

This was resulting in non-deterministic builds where g-ir-doc-tool may or may
not exist depending on whether python-mako was built previously. Add
a PACKAGECONFIG so the dependency is explicit.

Signed-off-by: Sujith H <sujith.h@gmail.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
---
 .../recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
index 9b16147..67891a2 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
@@ -108,6 +108,8 @@ EXTRA_OECONF_class-target += "--enable-host-gi \
                               ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
                              "
 
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python-mako,"
 
 do_compile_prepend_class-target() {
         # This prevents g-ir-scanner from writing cache data to $HOME
-- 
1.9.1


