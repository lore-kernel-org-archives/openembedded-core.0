Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQxu-0003kf-Cs
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:56:58 +0200
Received: by pvc30 with SMTP id 30so1379643pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=fzqcOCpiBdHCDlCbDe5OsGRdiddKSCyyXWEUn4n6X3k=;
	b=WRinKZERqAAEj2dnQrHMFrRILdFxNzG0nRf6BtEOBtkDvCoPPbQp4KfRwSFBniIrZw
	snueHcKN+y56xxKwX4NxU7mz/JLMRRkSNEyyq76q9+5/BM9MlBMrnLRqhCF1B8Pw5aQo
	2SMSgfnJOJW/Zw+qbN9ts9EdzFC4Vb/skzhtU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Nx1/Xhx36aUxmAA8jzQBz6jW6G2V/l+RhgXbaE91Z4MZRHIbjJPJmTwhTphtvN6U+9
	ruEx+xqqDUlV7b8rA4qNkusOyi3TBPwwtBX2yQvDmwrqMFR5uvO/hwuEeBJYaxy+RCet
	yxqxc3nhGk1zA7pYUy4m0bYMfeDdhBTfCkiz0=
Received: by 10.143.177.5 with SMTP id e5mr2599265wfp.50.1303757668994;
	Mon, 25 Apr 2011 11:54:28 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z10sm8091760wfj.12.2011.04.25.11.54.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:54:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:54:23 -0700
Message-Id: <4e4ad27e7940760928c4ed79ca0b1948912ac881.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 01/17] gettext.bbclass: Use _append instead of =+
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2011 18:56:58 -0000

Ensure gettext and gettext-native are removed from DEPENDS when
not using NLS

Use append instead of += to get gettext dependecies processed
correctly in all cases

Dont remove gettext-native for native recipes as ENABLE_NLS is
only for target and not for native recipes

Replace using 1 for a boolean type with True

Honor INHIBIT_DEFAULT_DEPS

Remove the added dependencies for gettext if INHIBIT_DEFAULT_DEPS is non
null

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/gettext.bbclass |   31 +++++++++++++++++++------------
 1 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index a40e74f..a6f80f2 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,17 +1,24 @@
 def gettext_after_parse(d):
-    # Remove the NLS bits if USE_NLS is no.
-    if bb.data.getVar('USE_NLS', d, 1) == 'no':
-        cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
-        cfg += " --disable-nls"
-        depends = bb.data.getVar('DEPENDS', d, 1) or ""
-        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
-        bb.data.setVar('EXTRA_OECONF', cfg, d)
-
+   # Remove the NLS bits if USE_NLS is no.
+   if bb.data.getVar('USE_NLS', d, True) == 'no':
+       cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
+       cfg += " --disable-nls"
+       depends = bb.data.getVar('DEPENDS', d, True) or ""
+       depends = oe_filter_out('^(virtual/libiconv|virtual/libintl|virtual/gettext|gettext)$', depends, d)
+       if not oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crosssdk'):
+           depends = oe_filter_out('^(gettext-native)$', depends, d)
+       bb.data.setVar('DEPENDS', depends, d)
+       bb.data.setVar('EXTRA_OECONF', cfg, d)
+   # check if INHIBIT_DEFAULT_DEPS is 1 then we forcibly remove dependencies
+   # added by this class through DEPENDS_GETTEXT
+   if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True):
+       depends = bb.data.getVar('DEPENDS', d, True) or ""
+       gettext_deps = '^(' + bb.data.getVar('DEPENDS_GETTEXT', d, True) + ')$'
+       depends = oe_filter_out(gettext_deps, depends, d)
+       bb.data.setVar('DEPENDS', depends, d)
 python () {
     gettext_after_parse(d)
 }
-
-DEPENDS_GETTEXT = "gettext gettext-native"
-
-DEPENDS =+ "${DEPENDS_GETTEXT}"
 EXTRA_OECONF += "--enable-nls"
+DEPENDS_GETTEXT ?= "virtual/gettext"
+DEPENDS_append = " ${DEPENDS_GETTEXT} "
-- 
1.7.4.1



