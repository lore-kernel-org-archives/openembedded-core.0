Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 392EA75E2D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 19:55:13 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so50727378wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Nov 2015 11:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=on6Ng8ZNwnBa8D5z3P45VCEagaSqVMuZPmE3uiGf1hU=;
	b=KWAIy65pTYA6nbq8hAyZp30minmkEzapsQTwqlOi1wOYOMLQfrNtT40lYURJ4FnP7L
	kWfZZnkYA3NORLlBeWVJQLhTQOiLpKrpyHrDL+rz4NczRaIRBC7e/OgpZ+/paFnJatES
	lj9wl76Dje1Xj7XGky5Pi6k2rDUAjLXtKbem4sRmymIXi6RAiyaURclGHpzF6Xq0Wrg7
	Bjn7SFZnbhatvJkmYparS8gsAn8eQl9A+r7O6oWquJTSosplTBk8ZVU6JVnAJW4NdcUg
	WlYi14poSoy2ohuPuNXf8l9Dck/pz/ffD+IqKIHGa0Moq2Ti183sZwWV06LkEdOX5GlZ
	qtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=on6Ng8ZNwnBa8D5z3P45VCEagaSqVMuZPmE3uiGf1hU=;
	b=KkHdWebSOSocOCc2vemD2l+AVkeMjnhpPiVuQXYsunpLrH7Cr6XHC9/rNXCpmHNUHk
	kVw3w50mGSU8hH9iMOkIdEwAL03Qk4cwn0aSW1JllrVPWvF55iV6oJUweKiPTbyTpQ4M
	/HBsqItAWMi1Bm/8gTVRftZHepq9sW05YeokqM8ZX3UzZFugDZO6izehLsGl3ROOpltv
	syOE9rhu7ky8nlcY4A15okaQQ8SuyOMJbbc6cJS71VhrKC3x6B/LYwgZcpA+pxYTfPvp
	onjL4oOmAPnrqFLc4fbPnI+uHTq3nz2Wu/OmNpj+V0lvNB42loAIIqWQGINZoD9X7w94
	XgLw==
X-Gm-Message-State: ALoCoQmoVf021xh4+//JXBqAOgwEvjNDWriCKuMr7SweIxu3rI9PwnfpRIEuUAaSAmpZxUmKzRi9
X-Received: by 10.28.211.143 with SMTP id k137mr5697142wmg.49.1446666913927;
	Wed, 04 Nov 2015 11:55:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w9sm3206881wjf.20.2015.11.04.11.55.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Nov 2015 11:55:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 19:47:01 +0000
Message-Id: <1446666421-2549-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1446666421-2549-1-git-send-email-ross.burton@intel.com>
References: <1446666421-2549-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] at: modify sources in do_patch
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
X-List-Received-Date: Wed, 04 Nov 2015 19:55:16 -0000

Instead of copying the forked source files into ${S} in do_compile_prepend(), do
it in a do_patch() postfunc.  This ensures that the source archiver sees the
changes for compliance and legal verification.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/at/at_3.1.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.16.bb b/meta/recipes-extended/at/at_3.1.16.bb
index 0512bcb..b11b587 100644
--- a/meta/recipes-extended/at/at_3.1.16.bb
+++ b/meta/recipes-extended/at/at_3.1.16.bb
@@ -47,10 +47,10 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE_${PN} = "atd.service"
 
-
-do_compile_prepend () {
+copy_sources() {
 	cp -f ${WORKDIR}/posixtm.[ch] ${S}
 }
+do_patch[postfuncs] += "copy_sources"
 
 do_install () {
 	oe_runmake -e "IROOT=${D}" install
-- 
2.1.4


