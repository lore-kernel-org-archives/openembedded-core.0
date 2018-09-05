Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D40B274C97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:52:37 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r1-v6so12250229wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pKbcFo0hCLTpVqlwwb9T0ggg3j9GlHFxlHNSrE11228=;
	b=Bzvo/Kkycy2Q1YT4E+iZct2LyJ57RqB7lNehruTvw6IJjETXzU0i1ZhQTLESPkXAkq
	vstPzuLIp4yqyzve2ra26OdpWo1hi/olvoCYv5i/o6/KFG4031J5AnypukycAGW+XBqJ
	hXyHs4mQHD2n8bK3A27p3OMR9Pm7CX8FwaQGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pKbcFo0hCLTpVqlwwb9T0ggg3j9GlHFxlHNSrE11228=;
	b=gMm54OWTVAaeV5uD4dZhX3W9xDw2mFC7kjimoKPTme7rcTFXce6TfLY09IW70sj2fT
	6vV8z5curD0n895g6/Rd1BsjKD56XNnceW6l/iz5D36EHp5qtnk+LHLxFCK8bHCeiUXD
	Aeh/fbW9f/n5X0t6ae7r/0lMYN3HtqqELPej7NZuGS9gFhaSUefGlxQzsgY9rXezwbPg
	Raoq+IsSN50NdfJ2ox7eD2GAnAB9tIMq6wI6NBblfB89439UcSBrVkPikhaKN1hlrSqc
	PtFQ/PxhZXqOS0SXX+54qrOA0HSUfvgkCnK3hg6dlPBuDlq4OmhseKB5TvaYk828Q7AH
	wt3g==
X-Gm-Message-State: APzg51AXcRnvpgMVD1NTHZsXA7oSgJWbZ5sCmA7xaYf35yZci34poMfY
	nmjldvkSXaHZBZ+lZ4Lx9bLzQrjIgWo=
X-Google-Smtp-Source: ANB0VdbwxyANb1/Mtj2wD3SjIu7Gs99VGjwVOtjQEz6pxRyaqBGNVH+0GddTermqUkIgux1HSpheXg==
X-Received: by 2002:a1c:8955:: with SMTP id
	l82-v6mr740307wmd.110.1536166358372; 
	Wed, 05 Sep 2018 09:52:38 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u65-v6sm3476169wmd.31.2018.09.05.09.52.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 09:52:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 17:52:26 +0100
Message-Id: <20180905165227.29435-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/8] busybox: Put klogd/syslogd alternative links in syslog package
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
X-List-Received-Date: Wed, 05 Sep 2018 16:52:38 -0000

Currently these are in ${PN} and ${PN}-syslog may get replaced by
other packages but update-alternatives would error in the postinst
if other files were installed first. Avoid the problems by putting
the links in the correct package.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/busybox/busybox.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 586d5342e60..c26ef56bf78 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -367,7 +367,10 @@ python do_package_prepend () {
             # Match coreutils
             if alt_name == '[':
                 alt_name = 'lbracket'
-            d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
+            if alt_name == 'klogd' or alt_name == 'syslogd':
+                d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' ' + alt_name)
+            else:
+                d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
             d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
             if os.path.exists('%s%s' % (dvar, target)):
                 d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)
-- 
2.17.1


