Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com
	[209.85.161.43])
	by mail.openembedded.org (Postfix) with ESMTP id 79BFA7C03C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:46 +0000 (UTC)
Received: by mail-yw1-f43.google.com with SMTP id d190so8541449ywb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=th6xlf4P2Rh7fZj7O+8qUYV/BvZoj3lTrhI3Q0EKBkA=;
	b=RJMMXKJOoY//UNzoOwjSwY8owkj7x4vogkB2KLycDSQBjRgu2cSOm9ggCSsL1gNQeV
	UAGQBj1OKG2QHy5Dr8jNIjHVIIv3HydM/+6JvCIYtLy8Vz4pFwN33wKafyYT6OPm6iTL
	FRV0prR/cdAr6YSbxUajowDETwF5Rv/bVYlHHE2I0FDQqO1HJ973I0PB7lMn1JLkyHg1
	RbJA3lkWHqCO5+BEVjE2LO8tNhvLeWp1qGp7UZmWWoXqzrWS7uZGc94C0+JPVFReMtwL
	YqLAHSFfCrpElPwRPn4KK8EL/27YfrHaOt2S0naqBqgSJGLZ/uxwt+pQ1o2SA3aGb5vn
	jrMg==
X-Gm-Message-State: AJcUukekqWPza6u3fisEWSkwJ4dEgcGH6E6mFIrojaDlFBUovcs9J5o8
	pOwuZ6u4FRS84XNHBQH3JpWs7gmh
X-Google-Smtp-Source: ALg8bN5R97dJo2oKzVSxvChJtOsq3zasjpQfubo7r217zHTtRAtVHiuhCdC0zDXDkxyuVYerIzAewg==
X-Received: by 2002:a81:ad09:: with SMTP id l9mr24056997ywh.4.1547470607272;
	Mon, 14 Jan 2019 04:56:47 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:46 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:26 +0000
Message-Id: <20190114125632.4780-7-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 06/12] update-alternatives: allow hooks before renaming files
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:46 -0000
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


