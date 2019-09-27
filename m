Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6D98D7F290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:21:20 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q17so2473891wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 05:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NTaBGmYnJTUDOi8o7zVpji0jcQYBB0QNGg1v5jNqyS4=;
	b=H+uanNBtsSZNPOOKsiiMYMrCKv8KHmUTCQfgnjLcesq8UYggeT10/sSdJbkljKmCnI
	5GiEv/cGMVhv/fFrRP4awhW3ZZYoDN4ipVzsOcEv/DnA+Jfcl1zGqWOJsAz7NouKNa9k
	UPyjByDa2ymtB31sIVy7he5C+z4/gSz9DQubc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NTaBGmYnJTUDOi8o7zVpji0jcQYBB0QNGg1v5jNqyS4=;
	b=a/jzJFuKkSU9FNPDAAeoXTQOU0XjrdLAwv5LGsH2xmBBgmxNNOnv2+Ao1/Gt6ez+/6
	EG2cZiPZRI4Z3/UxjH/SPMSvukgj5u4nVrIQ86CA8WQF0VFcDA+3FhgRpkj5jlF7coSN
	4eSbEHdg6948PVgso68fnFSGmjc3vmfrBrWxozp2lgQl5780i1etzkihcaVWU1MmH8Lk
	Ypk7nVl2qm8PgPH1UZAw/mCGR9zrc1D/9DYsA1RYhC4zCgTF1zb0acAfTMJlP6ZofOOe
	FQkw9RhjZbpWlEc0X8IjqPAaWPJaa8piklt+VTOYID/ra/OQuT8oMfOCQlUA5msz74ay
	otFw==
X-Gm-Message-State: APjAAAWKBN7xUE9WKL3jtnfNg5Mw4/+KXouoflsqE6a1K7xrYowdorxX
	DZD/zFGnazm4LQpJtf1xwyU/CAHD24U=
X-Google-Smtp-Source: APXvYqyxbACVpC4Zw4HbYeJQoGcPqOIvDMusPQCkZm8fkDEDcL1WSC0BXqyXa7FTmpL2yX2mNxv37Q==
X-Received: by 2002:adf:e607:: with SMTP id p7mr2708329wrm.230.1569586880800; 
	Fri, 27 Sep 2019 05:21:20 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d9sm3973609wrf.62.2019.09.27.05.21.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 05:21:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 13:21:15 +0100
Message-Id: <20190927122117.19023-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927122117.19023-1-richard.purdie@linuxfoundation.org>
References: <20190927122117.19023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/4] oeqa/selftest/signing: Fix for hash equivlance server
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
X-List-Received-Date: Fri, 27 Sep 2019 12:21:20 -0000
Content-Transfer-Encoding: 8bit

There were two issues with the test one is that an equivalent hash
could come from the server meaning the signature didn't change when it
should. A uuid string is injected to ensure this does not happen.

If there were multiple warnings the test would also fail as only the
first is prefixed with WARNING. Tweak the string to avoid that failure
mode.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index b390f37d8e6..5c4e01b2c36 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -180,6 +180,8 @@ class LockedSignatures(OESelftestTestCase):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
+        import uuid
+
         test_recipe = 'ed'
         locked_sigs_file = 'locked-sigs.inc'
 
@@ -197,9 +199,10 @@ class LockedSignatures(OESelftestTestCase):
         bitbake(test_recipe)
 
         # Make a change that should cause the locked task signature to change
+        # Use uuid so hash equivalance server isn't triggered
         recipe_append_file = test_recipe + '_' + get_bb_var('PV', test_recipe) + '.bbappend'
         recipe_append_path = os.path.join(self.testlayer_path, 'recipes-test', test_recipe, recipe_append_file)
-        feature = 'SUMMARY += "test locked signature"\n'
+        feature = 'SUMMARY_${PN} = "test locked signature%s"\n' % uuid.uuid4()
 
         os.mkdir(os.path.join(self.testlayer_path, 'recipes-test', test_recipe))
         write_file(recipe_append_path, feature)
@@ -210,7 +213,7 @@ class LockedSignatures(OESelftestTestCase):
         ret = bitbake(test_recipe)
 
         # Verify you get the warning and that the real task *isn't* run (i.e. the locked signature has worked)
-        patt = r'WARNING: The %s:do_package sig is computed to be \S+, but the sig is locked to \S+ in SIGGEN_LOCKEDSIGS\S+' % test_recipe
+        patt = r'The %s:do_package sig is computed to be \S+, but the sig is locked to \S+ in SIGGEN_LOCKEDSIGS\S+' % test_recipe
         found_warn = re.search(patt, ret.output)
 
         self.assertIsNotNone(found_warn, "Didn't find the expected warning message. Output: %s" % ret.output)
-- 
2.20.1


