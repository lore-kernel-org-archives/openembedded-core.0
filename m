Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 35C04734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 07:47:27 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 9so84124746iom.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 23:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2p69hStXyrxloj4wnKAZf6+qd3nxCXQuaIxRy5kQEQ0=;
	b=vz5D0cLtqa4WshtEcy4QNkTwmgymi4mlTTown5R/jgpDa7mWj8E9ZjwSRkT+ijkEUr
	1elrPkmTUNBhJtJNVIEOVuguaac9WrRJod1UE3U2pYu5iHtDEYJXQw0ZWHbDILx0xwER
	5wty3wJD1i6d2u8Hez++Y1g1kHndX1TXNtHJjuXCT+TD9oDgADaT41t5kXfxUZXCY+Z2
	DWyyNz3Rf2BqtdvbjpIGlm5pnENrzlkykEkO4JB4JUJHH1XM9dO0fEj0lr/uicrwXwu1
	iR98tEl0U5MN5dAvN1mgIktXlwcTvFfQfoaC98REr5skCcopXwENFG4ogB62mswV8BX9
	MIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2p69hStXyrxloj4wnKAZf6+qd3nxCXQuaIxRy5kQEQ0=;
	b=TqLTIcx+HompVMtZ+eJNN1LiE/f1m8ZZIorLvowLnqFiekFuU383Yzv+Y+2WVRu82w
	eOREi/xu3shTJLgPyOqgi0klSnBovuLWMPRb/Z/VBYeov1pPaxow+4zPmkpxxyui4X/T
	J+TqZsrRx8+jS8Q2lK5ehElKSiMvzyEM/muMk/cNA5ZoQJSEm1iFaRsbXpytvGRtP3y/
	EPnVAG4NGMA609EVauA99NaiN3D4xC0Uv1yF4WeAUA0ZSmNHDTNPklqE7Cuq0NR6IOKB
	VW+oQRnHVK70pCxppGJjch3hv5HlxjobzJS16ug64S96bkKoddMxqLyJX/KZgBLT45mp
	R48Q==
X-Gm-Message-State: AG10YOQPB++0ArjXmTyorUMmEy+3UBGFjVo+W52gnFuKPqlZavzed+S6f6ko4Ez+2gqNczkA
X-Received: by 10.107.15.223 with SMTP id 92mr1361499iop.3.1455263248637;
	Thu, 11 Feb 2016 23:47:28 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8D0EA.dip0.t-ipconnect.de.
	[93.232.208.234]) by smtp.gmail.com with ESMTPSA id
	z138sm5784215iod.37.2016.02.11.23.47.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Feb 2016 23:47:27 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 08:47:23 +0100
Message-Id: <1455263243-17993-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] base.bbclass: fix support for gitsm://
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
X-List-Received-Date: Fri, 12 Feb 2016 07:47:29 -0000

Before the "Improve handling of SRCPV" change, gitsm SRC_URI entries
were merely missing a dependency on git for do_fetch. But after that
change, the special handling for "needsrcrev" was not applied, leading
to a fetcher error (older bitbake) or even a parse error (recent
bitbake).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8ce9dd4..1372f38 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -564,7 +564,7 @@ python () {
             d.appendVarFlag('do_fetch', 'depends', ' subversion-native:do_populate_sysroot')
 
         # Git packages should DEPEND on git-native
-        elif scheme == "git":
+        elif scheme in ("git", "gitsm"):
             needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' git-native:do_populate_sysroot')
 
-- 
2.1.4


