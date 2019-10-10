Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0C72F7F510
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:19:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h4so7397216wrv.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9rt3SRBzwUoGFsQcTtocgmrHLjDZOLV55SjkPATGSRg=;
	b=Rrq7GuJtLXVEf2ZfciwBSOGx4ks4JmqpcxF0dtf30WY4krn5qIPHId1JVBUcbaN2Qx
	v4qf1hhj47XUvGa8JH08utvsda8Y2HkIxK7+HYNaHBtgcT0DSZYX9aihZ5wYQs3IFUyt
	ysdaazACasEtlDTNlmkFgZyyI1hJhoFLjRYRjGzA+8sNIYsnLk+AMm1PqCRCT2Divzry
	/9W3FvLi6SZi4QaN4qrksBVcE4zFigR1kOgDWtk53xBZFikHasrYmGqgBKM/FoqbFeHC
	xrrAvub7ceJWaGQ5jSmxowF7g0M4Ja4R7WMCZLB9FpzNUEBTStfXufcELfiyOwPCpwCQ
	CKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9rt3SRBzwUoGFsQcTtocgmrHLjDZOLV55SjkPATGSRg=;
	b=qj1O0lc5dGAJmqhAcy3fEzwAJsOL/BMv7QO+4s/MW4/N4VoiOmSfAj6Ts4r/KkPBY+
	Q5f+9qPm/DffU9bqbv3+Ze1r4SlKw1APjXfiDg1lLoQBN71LLlkDMzCollmUlf5EKP6v
	Vow5Ji3oMf1dUvqRuEaKGlyGWbCV6mEgxmF1SnQdBsL/vMLTVsnPDBv1RIyEEJ3L30Ho
	69FjwTewq553U8Vxh9z9NNxhqJVHktCdwO5jXoQS4RA8MxPmvUsmAd00jrJl59nWGARY
	O3PZ1ot2wkZQ6JiNwpoZldvb7MnEnQAhLfqBjdn6KsOUMaLu0yMaRK34tQWtC/gkSJXJ
	C87Q==
X-Gm-Message-State: APjAAAVZA7isK3rAU+ugWaRxwvz77s3eK++ab5KHx3STpFLeoafAeZcw
	mrOH9Bnw7d9GdjyLhrTzY+rM97fCFc8=
X-Google-Smtp-Source: APXvYqzvavDDwa/W+345sZtr0CdnA9Z8dQty0nzqA7eVDdj7RPlBzu2zL9lgvKIijrDV8HGM643Jqg==
X-Received: by 2002:a05:6000:112:: with SMTP id
	o18mr8521104wrx.323.1570706341599; 
	Thu, 10 Oct 2019 04:19:01 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.19.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:19:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:47 +0200
Message-Id: <20191010111848.3825-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010111848.3825-1-alex.kanavin@gmail.com>
References: <20191010111848.3825-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/10] license.bbclass: split incompatible license check into a helper function
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
X-List-Received-Date: Thu, 10 Oct 2019 11:19:01 -0000

This would help with checking incompatible licenses at do_rootfs step
in image creation, where it is beneficial to pass the license string
directly to the function.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/license.bbclass | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index adca881c85b..648a4d78922 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -287,17 +287,7 @@ def incompatible_license_contains(license, truevalue, falsevalue, d):
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
     return truevalue if license in bad_licenses else falsevalue
 
-def incompatible_license(d, dont_want_licenses, package=None):
-    """
-    This function checks if a recipe has only incompatible licenses. It also
-    take into consideration 'or' operand.  dont_want_licenses should be passed
-    as canonical (SPDX) names.
-    """
-    import oe.license
-    license = d.getVar("LICENSE_%s" % package) if package else None
-    if not license:
-        license = d.getVar('LICENSE')
-
+def incompatible_pkg_license(d, dont_want_licenses, license):
     # Handles an "or" or two license sets provided by
     # flattened_licenses(), pick one that works if possible.
     def choose_lic_set(a, b):
@@ -311,6 +301,19 @@ def incompatible_license(d, dont_want_licenses, package=None):
     return any(not oe.license.license_ok(canonical_license(d, l), \
                dont_want_licenses) for l in licenses)
 
+def incompatible_license(d, dont_want_licenses, package=None):
+    """
+    This function checks if a recipe has only incompatible licenses. It also
+    take into consideration 'or' operand.  dont_want_licenses should be passed
+    as canonical (SPDX) names.
+    """
+    import oe.license
+    license = d.getVar("LICENSE_%s" % package) if package else None
+    if not license:
+        license = d.getVar('LICENSE')
+
+    return incompatible_pkg_license(d, dont_want_licenses, license)
+
 def check_license_flags(d):
     """
     This function checks if a recipe has any LICENSE_FLAGS that
-- 
2.17.1


