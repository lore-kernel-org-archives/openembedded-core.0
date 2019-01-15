Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
	[209.85.219.173])
	by mail.openembedded.org (Postfix) with ESMTP id 49A7C7C07B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:45:37 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id w186so1144499ybg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=th6xlf4P2Rh7fZj7O+8qUYV/BvZoj3lTrhI3Q0EKBkA=;
	b=L2zXg9kMfes+Sy31Z6vJIKwNCAO2WrmY6JNihFCNz+osmh9z4F/599wO24bFPEYex+
	pxP9r5fnkTwf4pJq8jTPva3lBRsNwwGaG5UE9Z1Ry1NjFSjUwRd2OVjhMRLH88nq/OD7
	EV5EzOxynUPcwzDSUDYj4uJcyoN7Gr5e/2B23tAc9jiOMSe5HlKh0UKvm9t8INU1UbGu
	6Xg9qhoY/PHAOcoT5593/kL+U7nx58J8/fe5q8sCZMYTwU9OMGplbgz+513oZknx9OwM
	OfukH+UEcssgLrL1RkL+3CnfOrs9B3a0gyZ5t4z4F2fMEBAkXWmdWeW0Vy301tzZhzSU
	Pq+Q==
X-Gm-Message-State: AJcUukcBHI3go/bBkR6/85TC1G2BSbd9k8ffxz9LgaeXvJ+Cy3TNfmWE
	AzzXd6nzoP9h73zH2lYzG8iBXIsw
X-Google-Smtp-Source: ALg8bN4eW9qz1h63JNPPSUIcQxKtBz9ZK7cmC/lGBMPw+fgxwodJG4ChotzuZYWhM3PCt9BcGVz3tg==
X-Received: by 2002:a25:2182:: with SMTP id h124mr3194463ybh.271.1547563537812;
	Tue, 15 Jan 2019 06:45:37 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i13sm1261220ywe.53.2019.01.15.06.45.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 06:45:37 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:45:16 +0000
Message-Id: <20190115144525.29388-7-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115144525.29388-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 06/15] update-alternatives: allow hooks before renaming files
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
X-List-Received-Date: Tue, 15 Jan 2019 14:45:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

At the moment, the update alternatives handling is happening
right after copying into PKGD during packaging time using
an _append OVERRIDE to the copy function. This means that at
this point the PACKAGES variable must have been fully
populated, as that is a prerequisite for update-alternatives.

In other words, this makes it impossible to e.g. populate
PACKAGES dynamically using do_split_packages() and still do
update-alternatives, as do_split_packages() can never
execute early enough in a deterministic way.

By converting the existing python function from a 'def'
type function to a 'python' type function, we now make it
possible for somebody to hook themselves between copying
into PKGD and execution of update-alternatives, via
a _prepend OVERRIDE, which is not possible with 'def' type
functions.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/update-alternatives.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index f1250f877b..ffedada2f6 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -135,10 +135,10 @@ populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativesvars(d)}"
 # place.
 python perform_packagecopy_append () {
     if update_alternatives_enabled(d):
-        apply_update_alternative_renames(d)
+        bb.build.exec_func('apply_update_alternative_renames', d)
 }
 
-def apply_update_alternative_renames(d):
+python apply_update_alternative_renames () {
     # Check for deprecated usage...
     pn = d.getVar('BPN')
     if d.getVar('ALTERNATIVE_LINKS') != None:
@@ -204,6 +204,7 @@ def apply_update_alternative_renames(d):
                     os.unlink(src)
                 else:
                     bb.warn('%s: Unable to resolve dangling symlink: %s' % (pn, alt_target))
+}
 
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
 
-- 
2.20.1


