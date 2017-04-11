Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 13F8277CFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:38:54 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id t68so15796411iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k4naCzNXhXX6XNIcNplvdzZCzrSOE1Y0vrq25dnE+PM=;
	b=AE6yRE+aaQ2CXnKdoMkhsODxnKRIGVu2DJYgzQMIy1sAi+NeYK533cPiDPAsVD5l2S
	20AWkfAMLgcAskN7WgM1BejmHGmxbLUga7VaeuFD6ME+7v33xLiMASZLAecI8P3IhKPJ
	Oms224Oys+PzhKUQubYMJlcCBy2354t70Q81jj9WSPFHEFf/ldWOiC6wsLuUcxmwg6UG
	Jxwt8/Xasgm9h/kf20j9MdP2zJ9qud0rbTYaoPzbwqf4o3/FO8iBkvIZ9bnEtZ6fu/5c
	Qv6ovPA295LxMsl46igv4Ugyjw1yNdVhKjtdWxoCK6Zc8+xOGUcf7y8IeB9pyW2Qly3R
	YgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k4naCzNXhXX6XNIcNplvdzZCzrSOE1Y0vrq25dnE+PM=;
	b=R/yuXisEOSrr2ljax7AK5VVlht1WSRqgm42fQnORQVgDpnWuZF3x0QGOujz3u4ijfW
	7jmgtcMHH2NgtLhQBQehUTZ66Huac6ge0Sg9Dsrs/D66row0Ww5sZSaMLFNCrR72P29A
	vGPWyNhrji0vGpT7GqByxuWvDBrxPB7lDWHn4ZgUvafYTzU35MfEFaVryfYei94RBZWr
	41sbL8IMW/QhhmIHusKv3iRN0xsHZ+8H590oMJO9AZPDvSx9AdghAlcgqb/UyDs98D7b
	Ong/F1ujisbcxFSofCQsiVPsdH/dz5QZ8ka9yeCwz3cH+If9FaQuThT17o6dOPt9QfZE
	nEzA==
X-Gm-Message-State: AN3rC/7cw3fQ1vS6Bdc2yeF7kuFgP90vIKEZ51Q+Rcq6P/sex+TCOjBOya+6MNSFVJoo1bOa
X-Received: by 10.107.140.10 with SMTP id o10mr7594875iod.139.1491935935811;
	Tue, 11 Apr 2017 11:38:55 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162]) by smtp.gmail.com with ESMTPSA id
	m63sm8260499ioa.15.2017.04.11.11.38.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 11:38:54 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 20:38:36 +0200
Message-Id: <4c9f8d6b68e6049ef6da1064043acbb3bd8f5cba.1491935802.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
References: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 1/8] go-cross: avoid libgcc dependency
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
X-List-Received-Date: Tue, 11 Apr 2017 18:38:55 -0000

libgcc gets compiled differently depending on the tune flags for the
target. That dependency would make go-cross also tune specific and
prevent sharing it between different machines using the same
architecture.

For example, MACHINE=intel-corei7-64 and MACHINE=qemux86-64 shared the
same go-cross-x86_64, but compiled libgcc differently.

The libgcc dependency gets inherited from go.inc, but does not seem to
be necessary for go-cross (compiling go-helloworld still succeeds).
The dependency is left in go.inc conditionally, just in case that it
really is relevant for the various on-target recipes which inherit
that.

Because go-cross*.bb includes go*.bb, moving the DEPENDS into a .inc
file that only gets included for the target recipes doesn't
work. Reshuffling the content of three .bb files seems too intrusive
at this point.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/go/go.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
index 5ccbf73..25437dd 100644
--- a/meta/recipes-devtools/go/go.inc
+++ b/meta/recipes-devtools/go/go.inc
@@ -1,6 +1,13 @@
 inherit goarch
-# libgcc is required for the target specific libraries to build properly
-DEPENDS += "go-bootstrap-native libgcc"
+DEPENDS += "go-bootstrap-native"
+
+# libgcc is required for the target specific libraries to build
+# properly, but apparently not for go-cross and, more importantly,
+# also can't be used there because go-cross cannot depend on
+# the tune-specific libgcc. Otherwise go-cross also would have
+# to be tune-specific.
+DEPENDS += "${@ 'libgcc' if not oe.utils.inherits(d, 'cross') else ''}"
+
 # Prevent runstrip from running because you get errors when the host arch != target arch
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
-- 
git-series 0.9.1

