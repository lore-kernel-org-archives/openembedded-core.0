Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C88646086F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 15:58:09 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id w16-v6so12046269wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4QmxmfDK/TaZLOScLYmjZxxuJpyqKGCRG8hk889RfeA=;
	b=Z5f3p7tvky+akalFawXnel/AXrlzjaQLtJJ9QpnYVY0MhUKpSAhk95bsNos0uxTG2q
	/ABDsDHn9e3txScotYSSKDr9j5+o0+C1i9hOBPC4bTy8HeYROLEcyYBn+v/+sQx8JMmy
	UoYi3SMy5ww3aL5iGyoeN+3XgV6TBnn/82q9LIItn1c/fdV/yLgp1+NdKLJ0BtcrhqlV
	01JbvbE8dr1qyPxv+gzsLmfhYCAA7ROyO5mDW/Uf+52OQneJXkKdvCAn9XYR6PTAKhE6
	v7F9RKw6sv6OiYv+zwQPILwq8SAgtsyfuYvxvvAE9p+X2YyFTijZ3gqNdYI16vE3alf0
	Kk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4QmxmfDK/TaZLOScLYmjZxxuJpyqKGCRG8hk889RfeA=;
	b=niMfM0XQ6q5xD6shD7kztSmK4iIzVwvprUnyNE/escZlOqOcFQ3hQMn1jlWMaJXsyl
	/xUtyK+BVvW49icQ24ieMlmikt4XKkYMjerZ3IJqI5KMgVDJxiu9DXdDsKTus64+6o3C
	k8xPPmvOHDV9VYfbNqJxVFNar8T5n1UgJbU/E4aV68zgc+oxaAbWH/In9ZSNAx3xsx90
	kR2D0m8yYmHhImTS0Rh3im1YWvciOjz+OqSoTHytQw9CfcWfu+UNRejrafveB2ysFcV0
	FcPhRDPX4oOq3Vr97HhcrlTb7u89AjHTG4jy1TlMyYvfEmjLCPRv+C/HK2reTFumMtH0
	SbEA==
X-Gm-Message-State: APt69E3sxU2oxH+TTJwpVJF0tLNeHhDa9f1xKmPCU4UVBIys12QxnP6D
	yncLfrijrAyjMvy+ir277qYJTonV
X-Google-Smtp-Source: AAOMgpcECqCRdOAJHWpecpCyiorMK/CvhdgLcwDSaAajrTg+DxHDtKPgvDLwDEZXji8ohJQfZ1YJ6g==
X-Received: by 2002:adf:ab95:: with SMTP id
	s21-v6mr5396589wrc.90.1530806290064; 
	Thu, 05 Jul 2018 08:58:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r194-v6sm12188065wmd.36.2018.07.05.08.58.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 16:58:05 +0100
Message-Id: <20180705155805.20847-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180705155805.20847-1-ross.burton@intel.com>
References: <20180705155805.20847-1-ross.burton@intel.com>
Subject: [PATCH 2/2] distutils: clean the build tree in do_configure
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
X-List-Received-Date: Thu, 05 Jul 2018 15:58:10 -0000

base_do_configure() tries to do "make clean" if there is a Makefile present.
For most recipes using distutils there is not a Makefile, but we do know that
"setup.py clean" will work so call that instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/distutils3.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 6c303068820..99ad64d287d 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -8,6 +8,12 @@ DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
 DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}"
 
+distutils3_do_configure() {
+	if [ "${CLEANBROKEN}" != "1" ] ; then
+		${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py clean
+	fi
+}
+
 distutils3_do_compile() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
@@ -71,6 +77,6 @@ distutils3_do_install() {
 }
 distutils3_do_install[vardepsexclude] = "MACHINE"
 
-EXPORT_FUNCTIONS do_compile do_install
+EXPORT_FUNCTIONS do_configure do_compile do_install
 
 export LDSHARED="${CCLD} -shared"
-- 
2.11.0


