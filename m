Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id AA85477C04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:57:09 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id f22so56303702oib.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q0K23lSotkgSnbHhe/i5EDAYoEewEcAmbvqAnBuiuo8=;
	b=uVhZfQEZMu/QmqLQtQosubX/iiHgLTW45XE7PKtIE1pJJdrkxXb+c7pHTl4eabMSSc
	2WqXyeu17K229rhEuClRpYOBXczMs85sh7Dveyu8LhCBQxAbl82HLVfRGgnPl8Rx9LDc
	h0BGlkk9igBa0iqyGDgFZ1MOT1RpRa5I9/3TpPLu5/q49YqeCm5pra+JSqFZhbldbW8i
	qQQRQau8Q3TOkvrAk5Sj/NrYaopQ0zY+zs/Uetp/QHQj+QRIqyJDplvgRvmHaTUd3Dw+
	nYLtSDOQCOQGFsi72ndu6X4VUpfGi+6hUu4PRhP4h9VaRu7LwcNrZuP2XDnmPRTUiOYT
	4yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q0K23lSotkgSnbHhe/i5EDAYoEewEcAmbvqAnBuiuo8=;
	b=YS9sHeL/gFlj1bSKuVTiOj+3oN5jt0nMiKka/5BL3mgugjeq/xJViGTvxOktkyYsjr
	AO2neDrAMG/7sBEwWz6OYeZxRkK5EfN+aRPCbZj4KXdGCv0W7Ro263ZeGw/P333TzBrX
	zOxaSq+KioM9T3VvJaN6ExNWiHHAn099cTfBSfu18wxXojgQiZV1jY1V8LUvMxyEBNV2
	lOppG6pI6RB8BpSDx8edqSVStOIH3alWOxztJ9aGoUA92nzYsWntQGziDgDAjwIPHgmI
	hU5zId5JF/MO6TWUzc2TqJC8GlN5VXXdaRlUPh9TLEwlnT2DramdWieVRt6lbjKFaibe
	iZWQ==
X-Gm-Message-State: AN3rC/7oYA9TgQc66uscUG21BCX3MvwBdS4dYrbX1yXTRTHx+s2jWeaW
	H0Fw0met33JOvAWN+lw=
X-Received: by 10.36.33.67 with SMTP id e64mr16357526ita.42.1491922630452;
	Tue, 11 Apr 2017 07:57:10 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 71sm8025298iof.29.2017.04.11.07.57.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 07:57:09 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:56:54 +0200
Message-Id: <639e9c496d4dbe799e4246477d6bcc9348a5a3be.1491922350.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 1/8] go-cross: avoid libgcc dependency
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
X-List-Received-Date: Tue, 11 Apr 2017 14:57:09 -0000

libgcc gets compiled differently depending on the tune flags for the
target. That dependency would make go-cross also tune specific and
prevent sharing it between different machines using the same
architecture.

For example, MACHINE=intel-corei7-64 and MACHINE=qemux86-64 shared the
same go-cross-x86_64, but compiled libgcc differently.

The libgcc dependency gets inherited from go.inc, but does not seem to
be necessary for go-cross (compiling go-helloworld still succeeds).
The dependency is left in go.inc just in case that it is relevant for
the various on-target recipes which inherit that.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/go/go-cross.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 68f5efd..9b49738 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -4,6 +4,10 @@ DEPENDS += "gcc-cross-${TARGET_ARCH}"
 
 PN = "go-cross-${TARGET_ARCH}"
 
+# go-cross is built once per target architecture, and thus must not
+# depend on the tune-specific libgcc.
+DEPENDS_remove = "libgcc"
+
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
 
 GOROOT_FINAL = "${libdir}/go"
-- 
git-series 0.9.1

