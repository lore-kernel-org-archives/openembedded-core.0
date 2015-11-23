Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 91FB16012C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 12:19:08 +0000 (UTC)
Received: by wmww144 with SMTP id w144so93705441wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 04:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nFimM0GOGPPvZ0zaGwo3yJ2FJF5eZC8fSdKbqwMNCVA=;
	b=J4CcSMPp1+EBVEpHxeoUlfgrfGwoZ7oIIyk5eQHVb5wfRD1ZwyIIbANf12pY1KYJ5w
	cok8GWHL8MpzEtRP/xHDPoq5LAkzYTenn1chWBRujaFhmmAiTz+GgqqZNaqY7gkYdEYL
	NLTRmCACZkTJJfnBLY17DMx0xfzf5dQB1WbXPYCfTw4a8RvQX1kjJJHLOMjTq5BVHnSi
	fhYPSi/NSvmdmN316WM6xcXeW11kQcA6Qu4H1q1Ina2bnR+SEL7VfoRVfYzSlIy5jinS
	xuIlAcho47hPl1YFuq68Oo241QAuhgfkOjKiWlFTS7dV2uDi5zc1bhKUZ0PJYyhAlWjG
	KL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nFimM0GOGPPvZ0zaGwo3yJ2FJF5eZC8fSdKbqwMNCVA=;
	b=C0mHDoLgvB4DgHP4Si5UMcToUQPJgizuoLO3NP1PjV25kHrHUJbpb8TIHw6U4elSPc
	ZzowRkNkKzWrsw7B33tDv87yhajLdUq4lzNZgZFyc2jWrIeiC6DxQAxYfJPZ4vKUVBxB
	RpMIo6DNPpll7OxyYWpACZs8AoaiSoze34vKbrn69Jl75ghm+zhIFbf0TN3hXZGXjveS
	eA3zS2uPjJUhi5r4vXnZ32dSVTlnOWQGFzxywb8vvk/OBjNhSVB0WF2v/0QpGpYO7hCK
	oSrzA0p5KL7ZJVUo2yJDO34ratZgsiRH/byxtAgFEC33t9/YzJYqQuUB4tMs5xjZUprv
	v90g==
X-Gm-Message-State: ALoCoQlOIYga39sxHMaFGHMhH2A9aQcLyIBOmfP+r9/yfVDWdKkCqzXk/5B9VLzvVVg9byluwr26
X-Received: by 10.28.175.144 with SMTP id y138mr15849407wme.47.1448281149117; 
	Mon, 23 Nov 2015 04:19:09 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k125sm6258257wmf.2.2015.11.23.04.19.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 04:19:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 12:10:25 +0000
Message-Id: <1448280627-22439-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1448280627-22439-1-git-send-email-ross.burton@intel.com>
References: <1448280627-22439-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] base: add automatic dependency on lzip-native for .lz SRC_URI
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
X-List-Received-Date: Mon, 23 Nov 2015 12:19:10 -0000

Now that the SRC_URI is parsed this can be done without false-positives.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 64820a7..e6d1599 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -550,6 +550,10 @@ python () {
         if path.endswith('.lz4'):
             d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')
 
+        # *.lz should DEPEND on lzip-native for unpacking
+        elif path.endswith('.lz'):
+            d.appendVarFlag('do_unpack', 'depends', ' lzip-native:do_populate_sysroot')
+
         # *.xz should DEPEND on xz-native for unpacking
         elif path.endswith('.xz'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
-- 
2.1.4


