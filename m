Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C8B5172FAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:04:58 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so21025115wmu.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 10:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E0y0iTbvYgOib9+9Ur1uiJ/nmEiCJkwzkTwBjDe9WZw=;
	b=TzcrEKG9LUz7agSGrcnwutinhjKJMnYuwoJUUH4Q5dEwcCIS8gJgp+qIeB9pO9dx5j
	BTXMNkjOotZWmo/EkbR6AIXrVGEvHXPFCH6/iwPCTjLjnVCy4V5cQckgf5+T5mXr9tGx
	blMYPqrK0YJBpvUFiUCAwZvDnSFgO2K1WHkK596y8hwk2B42OEnfWVwzITWOfcKKk547
	4Fz4CKaWhUr+op/xnhB/QD5primg4qoZ7wzJXsg9wFZWhqZL+/6aGXQkufS2CTbXsgi5
	szsqPcMAiqB8hPXnLLI/W0rPZidiV7yU8ZBYE0cFeZxbwcQoUjceLmHu+gST8gCFJpV1
	iVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E0y0iTbvYgOib9+9Ur1uiJ/nmEiCJkwzkTwBjDe9WZw=;
	b=WRQgybMYcCiOCGKDZfO05OPeJ4vCzG34EY/Gc7uyt9QRfxYGUyFvpZ2qiqfN6FLbNn
	GWs/FDSiGeMkFwTXm8kxmYYNb3LxatR5UWWfYBqQ7Qdt0eppDpHjK2kn2m+CLk0wCTne
	w1rIQ1CmSMsi+k9CRdUFW73Zxw6D6o1iprUHr3WPayAjTRusad/tzuvJS69wT7nZyVla
	KTYK69FvnSQNZw5PMznvzdxrTdTqsB7vWCTt3T9cR0TAp7CweZpbbyDYhvgKijCIz0VW
	uMMF5un8DfacsAn8OG8GYicSVhWM9C3KVikp3FoEnuJ3yWfOwVv78C/u08fnC9BpXqcG
	Uxhw==
X-Gm-Message-State: AMke39lPHOJBR5NAfEpjcLAn5mw8fdaWb5BPZ8s6K2mvDqA38Ek2PH8iBD6xU86DOv+QvQ==
X-Received: by 10.28.129.5 with SMTP id c5mr15032489wmd.19.1487700300030;
	Tue, 21 Feb 2017 10:05:00 -0800 (PST)
Received: from localhost.localdomain ([62.179.106.250])
	by smtp.gmail.com with ESMTPSA id
	d75sm14290546wmd.25.2017.02.21.10.04.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 10:04:59 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 10:04:49 -0800
Message-Id: <1487700290-3110-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
References: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2][morty] image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types
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
X-List-Received-Date: Tue, 21 Feb 2017 18:04:59 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

Previously if IMAGE_TYPEDEP_* contained a conversion type of the form,
"foo.bar", the dependency on CONVERSION_DEPENDS_bar would not get added
to the task depends for do_rootfs.

[YOCTO #10883]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 037d39898e0e16c6d5b24a8d3844abfb328d3c14)
---
 meta/classes/image_types.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 1ce8334..5020a5a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -17,17 +17,25 @@ def imagetypes_getdepends(d):
                 d += ":do_populate_sysroot"
             deps.add(d)
 
+    # Take a type in the form of foo.bar.car and split it into the items
+    # needed for the image deps "foo", and the conversion deps ["bar", "car"]
+    def split_types(typestring):
+        types = typestring.split(".")
+        return types[0], types[1:]
+
     fstypes = set((d.getVar('IMAGE_FSTYPES', True) or "").split())
     fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS', True) or "").split())
 
     deps = set()
     for typestring in fstypes:
-        types = typestring.split(".")
-        basetype, resttypes = types[0], types[1:]
-
+        basetype, resttypes = split_types(typestring)
         adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)
+
         for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
+            base, rest = split_types(typedepends)
+            resttypes += rest
             adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , deps)
+
         for ctype in resttypes:
             adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype, True), deps)
             adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
-- 
1.9.1


