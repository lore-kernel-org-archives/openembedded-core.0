Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 45FCC78E25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:50:50 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id s13-v6so1042456pfi.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G27y9opvAnVJrtKfskCz0TDKWfwTBxfYX20OfxTeEL8=;
	b=ftxrgl6jicPhVee78xJB+cctU8eu84rLUuwdGy4f9VXhsKj2qjY0m6upgEgcOSpVAa
	OzZih4HnvPT/vxoweziY4uyOl4IK/V2b9RnOJydlMYDhTfFquE2k+0W6uH4mIvLOvK0J
	yCDpydxQwGRMp7R75yEovZVHt7pHzQsFTqum4SVpjfRAvLyoYIOaOiJhAg+SZyBbaMhy
	Sut6Zxs9vglmbIv0wj2QZhZwJ6xy4qI17laEvFTtVGt5/7Ffom6C5AhjKtnhKRKqflje
	8Qw2NGHx7YH2jJeCKLNnkh3CLSHSwnfJUoDQNJs0TovihbkJTs5a12SJxaybP6HjXW/R
	qFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G27y9opvAnVJrtKfskCz0TDKWfwTBxfYX20OfxTeEL8=;
	b=Qr6dvPxqzqDb5qWSgEKQg8LfwklCtZpyL1m194jd6MVRF2rDiWZ+rAFajOVFdxESfH
	sAl/EPNFQoEembTzzDy9I7hGezihB/e8wNv4nuZMHrl4Tcown9sBqWhLxg1om2Ate703
	5QVbP8stfyFKqey5P7q6uf8ydqmPJdmQ5DaARq0iZJYkfNqyIQMYSqk+e5OUGF+JCCt8
	X3VR9iCCtf7G9mNrBL8Cc5N//SRgC/LHuqCiM0L5tFkS8z8NghyTNMO7irou+nXYZv4N
	4mGBJtnbRflvQdWcUvCdDy2YBUWTjtMlVC1ZaVnO5K6SaYoK1Nz/Xt13NvpmG04i4f8R
	MqLg==
X-Gm-Message-State: APzg51DZyrPQBp8081tzNBvSI/bgqWObSZz4P7HICL7Ncq75rx57jDnl
	O8Z7Le4cGLBfvc0jrdkr3Eg/3bm+
X-Google-Smtp-Source: ANB0Vdagk9uL/6wGKIhHVla/Sd7rld60PmAQLbbuR100JuJ2OCMJqK3oQER+IFVqi4hXlEluF+kPaQ==
X-Received: by 2002:a63:4757:: with SMTP id
	w23-v6mr2553500pgk.140.1535478651017; 
	Tue, 28 Aug 2018 10:50:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	g184-v6sm3330295pgc.22.2018.08.28.10.50.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 10:50:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 10:50:37 -0700
Message-Id: <4835cadb099621a1510834e2d653864ba7a78a6d.1535478536.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535478536.git.raj.khem@gmail.com>
References: <cover.1535478536.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] distutils-common-base.bbclass: Define commonly used compiler variables
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
X-List-Received-Date: Tue, 28 Aug 2018 17:50:50 -0000

This is inspired from
https://github.com/python/cpython/blob/master/configure.ac

Helps cross compiling python C modules in some cases where they do
not respect normal CFLAGS

Errors like using gcc to link when compiler is clang is fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils-common-base.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 824a1b68b1..94b5fd426d 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -1,6 +1,18 @@
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+# LDSHARED is the ld *command* used to create shared library
+export LDSHARED  = "${CCLD} -shared"
+# LDXXSHARED is the ld *command* used to create shared library of C++
+# objects
+export LDCXXSHARED  = "${CXX} -shared"
+# CCSHARED are the C *flags* used to create objects to go into a shared
+# library (module)
+export CCSHARED  = "-fPIC -DPIC"
+# LINKFORSHARED are the flags passed to the $(CC) command that links
+# the python executable
+export LINKFORSHARED = "{SECURITY_CFLAGS} -Xlinker -export-dynamic"
+
 FILES_${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
 FILES_${PN}-staticdev += "\
-- 
2.18.0


