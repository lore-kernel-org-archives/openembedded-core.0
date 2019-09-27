Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 466C67F281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:21:22 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so6374408wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BXVXVbN3gUZ3Yerl6JyjzfvtapBHs1Z4nsn0C4FH0hc=;
	b=VLHFv/jP9GopDC09qDTu4bG0cDJWo0hmLKAPPR7oFa1vh1tiaRoug9icVSveuoEn9G
	y9+Svm0PuoNCwL6Bd0gkFZrMsdswpbwRQj5kAn6Bwom9t/PWlcvDzKFzGmnCndRn1bCs
	WkT4GilPen7JG0GVJRaZyMlCcEBBI6jut40Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BXVXVbN3gUZ3Yerl6JyjzfvtapBHs1Z4nsn0C4FH0hc=;
	b=UHWGsco3zQucrjpiJjDz7hUuE9tKc2gzu2BSPgW/RUqpD0e0Hs9FQFOtFfUVKzwDoS
	qj1ZYaqXVhyBMrbemR87TFUWPAhsvpVBRJe4k1BYAUub2quHTzPehJLdmu7iQIWZZOxD
	q/XXQlKbV1lnIXiM43DXIqMG2AhQ+52K64drU6+eXP2Wkxnj9QNK7csIxRQ0vBEcc3b8
	KlusTTFE4+lwFniIFux6NYkkZJDeisq3o/FpsrxR+wLwBQtDW+vSxM5A507KG4lKzkoR
	bYjDvNDtqGqOpNGZxb6nKkO9DkNkw/LrntYPeq3uHljzjtdMdNjO89yILQ7jORQtVJKc
	t7vw==
X-Gm-Message-State: APjAAAWnTWYS6Sm2VHBn+Dym/3AbgK8ndFo7q1swmPp46rqcHFJgSQp2
	eL3a3WQbVrPl+2bTxbXfqwyXvOqrI2o=
X-Google-Smtp-Source: APXvYqwl0oSIjSJSGE9mD3BI+ht8oT0a6AE0ensB8RGnpZJ8lAvsTt+7+P8NipnTHWC4v3A/LFoX6w==
X-Received: by 2002:a1c:1f89:: with SMTP id f131mr6661440wmf.72.1569586882769; 
	Fri, 27 Sep 2019 05:21:22 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d9sm3973609wrf.62.2019.09.27.05.21.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 05:21:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 13:21:17 +0100
Message-Id: <20190927122117.19023-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927122117.19023-1-richard.purdie@linuxfoundation.org>
References: <20190927122117.19023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/4] populate_sdk_ext: Fix for hash equiv
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
X-List-Received-Date: Fri, 27 Sep 2019 12:21:22 -0000
Content-Transfer-Encoding: 8bit

Write out the hash equiv cache file into any eSDK so that it doesn't rely
on having to call the hash server for the basic data requests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 086f55df0c1..9fda1c9e78e 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -379,6 +379,11 @@ python copy_buildsystem () {
             f.write('require conf/locked-sigs.inc\n')
             f.write('require conf/unlocked-sigs.inc\n')
 
+    if os.path.exists(builddir + '/cache/bb_unihashes.dat'):
+        bb.parse.siggen.save_unitaskhashes()
+        bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
+        shutil.copyfile(builddir + '/cache/bb_unihashes.dat', baseoutpath + '/cache/bb_unihashes.dat')
+
     # Write a templateconf.cfg
     with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
         f.write('meta/conf\n')
@@ -440,6 +445,11 @@ python copy_buildsystem () {
     else:
         tasklistfn = None
 
+    if os.path.exists(builddir + '/cache/bb_unihashes.dat'):
+        bb.parse.siggen.save_unitaskhashes()
+        bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
+        shutil.copyfile(builddir + '/cache/bb_unihashes.dat', baseoutpath + '/cache/bb_unihashes.dat')
+
     # Add packagedata if enabled
     if d.getVar('SDK_INCLUDE_PKGDATA') == '1':
         lockedsigs_base = d.getVar('WORKDIR') + '/locked-sigs-base.inc'
-- 
2.20.1


