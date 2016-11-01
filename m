Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 07ACB6B6F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 16:04:48 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 68so16572304wmz.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CJdIVDri7FrUl85Fwn0NMdgPVrhVuVpjDxO9O8y+f4g=;
	b=tQggg95SmSvez2u4Jkg0qGTgYhyTaOHh5uU4R7KB/mFZCL2fNGqHxQkUlcoNdKTFDR
	LMgc1D2TZlQ81MtxVyuIcSPn1zWLAEK+Va5u6uG3+WSvVX1wcDXAt82BCnBCBiAa26Q2
	OkWZ5AAoiPIOhPKa0hO2Jbdr+yDR89tZBEW2rk0Ivns2HAJvoSFCMVs8P7sWTkDffF9K
	mqsSlZKZniWPRkypcBVu7vRFDInGpUktmsPjmup3z18GISCfIaX/4NZWi8XjSdMX4qLV
	1kDLK5n4KbYkk+9XwmhtqQPqwPlBEgX5ZuNGj7ANAvund8HHlNv56FeMItoscDBoPx3P
	nhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CJdIVDri7FrUl85Fwn0NMdgPVrhVuVpjDxO9O8y+f4g=;
	b=bOq4GtyOE3gU4mdP+OtsSi45yKWm7RjTDTuHH8qBZxjtEH4BNScrEmz7zfn+XcK/6J
	Db14IT80D2fr3G89kDWnQqQkz8ZE4oZRNle6nam6eXzizMXyacmH27FZOwOetVy/eOMC
	wC95dcsbIPWvPRoVPAaqGID7jNmAt5lZqD5cIOvWhx3Mek9mIFbfKbjtEDC6yCMaE6Fs
	amMUJoRsqbHiFtkSiXYuEBqbWEZycRUimdrBad7lRkG96AIkXf4THFDgjpI1RVXUgtk7
	v/+Nm6CONhEt3LZRm85jBegRBi4Ja7t7I9RLGi4l4nmEhNN4HkvUW6WDinLXnBVg9eXI
	yUNA==
X-Gm-Message-State: ABUngvd33w3E25Ma8sunEgihafyDFszHmgaYazqaWj93GF0t0r8hNGEc4hFrOS/Made1Ag==
X-Received: by 10.194.78.195 with SMTP id d3mr26404141wjx.96.1478016289754;
	Tue, 01 Nov 2016 09:04:49 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	g17sm36396452wjs.38.2016.11.01.09.04.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 09:04:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 09:04:41 -0700
Message-Id: <1478016281-29288-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] texinfo.bbclass: use dummy dep for libtool-cross
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
X-List-Received-Date: Tue, 01 Nov 2016 16:04:49 -0000

From: Christopher Larson <chris_larson@mentor.com>

The class clearly intends build tools to depend upon the dummy texinfo, but it
does so using the class-cross override for cross recipes, and libtool-cross
doesn't inherit cross. Add a special case to cover this.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/texinfo.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/texinfo.bbclass b/meta/classes/texinfo.bbclass
index 92efbcc..6b0def0 100644
--- a/meta/classes/texinfo.bbclass
+++ b/meta/classes/texinfo.bbclass
@@ -1,10 +1,10 @@
 # This class is inherited by recipes whose upstream packages invoke the
 # texinfo utilities at build-time. Native and cross recipes are made to use the
-# dummy scripts provided by texinfo-dummy-native, for improved performance. 
-# Target architecture recipes use the genuine Texinfo utilities. By default, 
+# dummy scripts provided by texinfo-dummy-native, for improved performance.
+# Target architecture recipes use the genuine Texinfo utilities. By default,
 # they use the Texinfo utilities on the host system. If you want to use the
-# Texinfo recipe shipped with yoco, you can remove texinfo-native from 
-# ASSUME_PROVIDED and makeinfo from SANITY_REQUIRED_UTILITIES.
+# Texinfo recipe, you can remove texinfo-native from ASSUME_PROVIDED and
+# makeinfo from SANITY_REQUIRED_UTILITIES.
 
 TEXDEP = "texinfo-native"
 TEXDEP_class-native = "texinfo-dummy-native"
@@ -13,3 +13,6 @@ DEPENDS_append = " ${TEXDEP}"
 PATH_prepend_class-native = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
 PATH_prepend_class-cross = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
 
+# libtool-cross doesn't inherit cross
+TEXDEP_pn-libtool-cross = "texinfo-dummy-native"
+PATH_prepend_pn-libtool-cross = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
-- 
2.8.0


