Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id D784479F18
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 08:43:21 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q5-v6so8574957pgv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 00:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=ebkY8CSpQPE1y4TjcJ+RCrXvqnOPL9eDvGhF16KSwyQ=;
	b=ioj2B99Ew57iiykHmYWD7GiP5O/V6LDJQ0gCkilbRH59lczG6NTEMaaHs+znvW3EWz
	26nAOzXtvsm/7GnRZwyUnTaz0L/0BLIGAA/273+7GIpqlLknjncDOFEjf/OffIGkydBa
	vDNvOFcVexWGO8P+Nu1xjvOc/X8D2OAuTmCj/VGK1SOuFLHtb9dlaJwJhjm1/S7NboYu
	fjpoBqfS3FhMdn1bmtnkfQYvxsUKQftt8R+IH23mhMkiV4M+foKUT/kboERgKXNgoqS3
	jbhD9h9vfNbHymUAt4VSq1GHL4vMp6hN7XXzmj0lhKxcC6eK8jNxf1ZuaND9vRTdV7vV
	bM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=ebkY8CSpQPE1y4TjcJ+RCrXvqnOPL9eDvGhF16KSwyQ=;
	b=oKQnimx3381BgJLL8YnSgQc72VMhn73GRZB+YOhEm62Ql9Jxda5qXlOUsBOi59DsQT
	LNhR7PU0E6dADIrRz0/IIEGhbhypZsAiWRfbmfX0PIzk6aioKwo/VJ3cWxJHTAYabg88
	cCPOQStBWUDk58+C5MrUU3i0rAxiR7V7U3LXrVXfSRk9/Ezwk4vH9U1hewYbhQkB3WpQ
	/0QKmDXhFaxwBDlpRFDrbMeRs7xYaSVpROOQdesArky7yfF9F8KFy9MywRslSWQqn/Mj
	Fye83H5mIHTdYMtLIXy8yPR/cQAk8GXwGyVxYw2iOp+f+Jxs8TS99Xk5gke/N04g+Odg
	Bg9Q==
X-Gm-Message-State: AGRZ1gI6HJmNef8VWqAR3T0/KwO4/tyikyzsYOXih0FPgUeuNsTrrBfj
	KAKY3T3+OAAmv/9sniqBBaAdC3SbFs8=
X-Google-Smtp-Source: AJdET5f+BNsXnGi2J76tCZZ9bTkjNkIXapYKF84e6dC06+1DsTkz5x/soABLjVvXb6DWcG2122upGw==
X-Received: by 2002:a62:3c6:: with SMTP id 189-v6mr3689678pfd.19.1541666602701;
	Thu, 08 Nov 2018 00:43:22 -0800 (PST)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	m10-v6sm5502116pfg.180.2018.11.08.00.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 00:43:22 -0800 (PST)
Date: Thu, 08 Nov 2018 08:43:12 +0000
Message-Id: <20181108084312.9306-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2] ghostscript: Define COMPATIBLE_HOST with supported platforms
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
X-List-Received-Date: Thu, 08 Nov 2018 08:43:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Setup the COMPATIBLE_HOST variable with all supported hosts based on the
provided objarch.h files. This inverts the existing pattern where
unsupported hosts (e.g. 'arc.*') are explicitly set.

This suppresses the warning message generated on hosts that are not
supported but were not listed explicitly.

  WARNING: .../ghostscript_9.25.bb: Unable to get checksum for
  ghostscript SRC_URI entry objarch.h: file could not be found

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
  - Fix up to use HOST_SYS patterns instead of OVERRIDES
  - Make i586/i686 pattern common as done in other recipes
---
 meta/recipes-extended/ghostscript/ghostscript_9.25.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
index 35eaaeb2fa..93134dfb9d 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
@@ -121,5 +121,4 @@ do_install_class-native () {
 
 BBCLASSEXTEND = "native"
 
-# ghostscript does not supports "arc"
-COMPATIBLE_HOST = "^(?!arc).*"
+COMPATIBLE_HOST = "(aarch64|arm|i.86|microblaze|mips|nios2|powerpc|x86_64).*"
---
2.19.1

