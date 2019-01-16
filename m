Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id CBE767BFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:34 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id x2so2401095ywc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zbTIWp2EkUrNXr2Kyym7GbwmmfUD3UyvNGcWTCOX1O0=;
	b=r5iYw2QhaKKAa3/qjyHWUzPYZFQk1zOljRG95jL0EiubST+Zrj41+IInfpxKqmw+Db
	zokEaIgRkKsosw5Y9fxYivkfiRgywlcjWaHDezofokqIdrZ5cpr7vKLEI7z7vEmAxvAc
	GHknUXdQ+Uf5CAJPeFb5KCTFtbTztY0rIjZQ12YMdRTRwpnFmKazPYr026lZsnsdBPFs
	2w/KbcODZBPYyCjZy15iys2AjXUnvMO4WwqIhvSN8EY0U2NQhUmn0h+lSIzwjUPlkjt9
	GyrH4TBagpuhTBTFTCGuFNRTGoT8J1q1uCaDl2VxYD6MfqtxB4+FBkRQBuhN0FfwsbLy
	noCQ==
X-Gm-Message-State: AJcUukcsxuhlIfQEbfkEfdclMlV7awfBlOfkcwKhrduBw2pTcNPVFeEf
	0+IQy40kKnIvjTqfe6mP07lmNwCE
X-Google-Smtp-Source: ALg8bN448M36PkZgERJcCsNnIWN2xVmFL9xmnZtz61RMLNEWccKdOlvWSvevbl7hKcVuEjdo6STgJw==
X-Received: by 2002:a81:99d6:: with SMTP id q205mr7439764ywg.106.1547643095697;
	Wed, 16 Jan 2019 04:51:35 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:35 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:15 +0000
Message-Id: <20190116125124.20177-7-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 06/15] update-alternatives: convert file renames to PACKAGE_PREPROCESS_FUNCS
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

At the moment, the update-alternatives file renaming is
happening right after copying into PKGD during packaging
time using an _append OVERRIDE to the copy function
perform_packagecopy().

This is not really readable and hard to maintain.

Additionally, this makes it impossible to e.g. populate
PACKAGES dynamically using do_split_packages() and still
do update-alternatives - update-alternatives file renaming
requires the PACKAGES variable to have been fully populated
to work correctly. On the other hand, do_split_packages()
can only execute after perform_packagecopy(), as it needs
PKGD populated; so it's impossible to insert
do_split_packages() early enough in a deterministic way in
this use-case.

As there doesn't seem to be a reason not to, convert
this to a proper function and use PACKAGE_PREPROCESS_FUNCS
instead - after all, that's what this is meant for.

No other classes or recipes in oe-core or meta-openembededd
seem to have a hard requirement on update-alterantives
executing before any other PACKAGE_PREPROCESS_FUNCS, so
this should be perfectly fine.

The only implication is that if compress_doc is inherited,
compressed man-page file names will end up being, e.g.
    eject.1.util-linux.gz
  or
    eject.1.gz.util-linux
based on the include of compress_doc.bbclass vs.
update-alternatives.bbclass order, but the symlink created
(alternative name) will always be correct.

This solves both problems:
* the code is easier to read / follow
* the above described use-case can be accomodated easily

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v4: * unconditionally assign PACKAGE_PREPROCESS_FUNCS
---
 meta/classes/update-alternatives.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index f1250f877b..f3c014a5fc 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -131,14 +131,13 @@ def gen_updatealternativesvars(d):
 populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativesvars(d)}"
 
 # We need to do the rename after the image creation step, but before
-# the split and strip steps..  packagecopy seems to be the earliest reasonable
-# place.
-python perform_packagecopy_append () {
-    if update_alternatives_enabled(d):
-        apply_update_alternative_renames(d)
-}
+# the split and strip steps..  PACKAGE_PREPROCESS_FUNCS is the right
+# place for that.
+PACKAGE_PREPROCESS_FUNCS += "apply_update_alternative_renames"
+python apply_update_alternative_renames () {
+    if not update_alternatives_enabled(d):
+       return
 
-def apply_update_alternative_renames(d):
     # Check for deprecated usage...
     pn = d.getVar('BPN')
     if d.getVar('ALTERNATIVE_LINKS') != None:
@@ -204,6 +203,7 @@ def apply_update_alternative_renames(d):
                     os.unlink(src)
                 else:
                     bb.warn('%s: Unable to resolve dangling symlink: %s' % (pn, alt_target))
+}
 
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
 
-- 
2.20.1


