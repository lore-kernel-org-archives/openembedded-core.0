Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF237CDF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:09:27 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id f18so14508356lja.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=olD3aJQm/2Awr2MAXStp94iYiRcgFQpv3xdXDjO/Q7o=;
	b=iXk5nW5tiDisoma7oURIb0apgMNGOlIRUSTEHn+b9ShkRFAVtnFSUv2FSUxTkUA+rl
	59/71YcJ6Q2EhTuPSWpQF4lXX+hGS7nO4iCBJSCZTdA2QJxxt0VyxpNxxBZQrejf8ydO
	AH/bY2GGA8wDzvnnjqs+oLIbXMlEnKO44KOrmum38a/OO00C8AEA0tnlp0kSqv9IXUQ6
	EkhcksTyD3unKV3B9yk4j9C59qXy1xTJAPFI1eI3DYIjB/rx3aZx53JtalWtad1NIxLq
	dts2/4xQvNs4m5vFumcasvrdqD1yJYKRUfy6bS0C5ldDtsF5WYHZco7zNKaCXjOmUJMM
	PKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=olD3aJQm/2Awr2MAXStp94iYiRcgFQpv3xdXDjO/Q7o=;
	b=RjOgvdZsiYyscAkUT7KilouNt/CvhVRoMnjurMMIVWURWjlC/fOoKEiK15zLtzoryJ
	Dli32UBOMBF1pI85f2qqBKFU91PrvxWHozmc6R4eHZbGmzG6QhpLNoI2o7RiMEUkVgbw
	W0KXSF4pKFH/zAKxj81Ww3PdnjLvquE8c+qXCyGFji+WO+8mlvEJQi6H0O6A7mld47f9
	PisLfrEgB5LMa0i7Kh8lw6DHuE/GcE+Vp6DSNK8GsVixtFN5WDh7rvYS/M/u1Vok9AFI
	4vfsLwwp17VyYEDywAF7UA4SRuLscRsPUoNf5nrcCQ5oL9rr6VBs3FQcK+gePNI/wJkc
	ZUsg==
X-Gm-Message-State: APjAAAX3x6weIwoQp3qxGb8T744H6JIeRyMZAMHyrn+FdzZo+n/iP8ud
	vydZrUZtMW1pct1Hij9sTP50itN3
X-Google-Smtp-Source: APXvYqyOBQsCEEZ81GZ3Zh+mRNKpsuw5BFU29A2SyAp3wVlclX2w/wNd3VnAk87TTKUivv+pneIuTg==
X-Received: by 2002:a2e:288:: with SMTP id y8mr5692617lje.62.1553695767868;
	Wed, 27 Mar 2019 07:09:27 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 1sm4704382ljw.56.2019.03.27.07.09.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 07:09:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 15:09:15 +0100
Message-Id: <20190327140922.109867-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/8] db: fix upstream version check
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
X-List-Received-Date: Wed, 27 Mar 2019 14:09:27 -0000

The new regex excludes the 5.3.28+dfsg1 which is a Debian
repackaging of the original tarball:

* Repack the .orig tarball to eliminate prebuilt binaries that need a
    Visual Studio plugin to build from source. (Closes: #898215)

https://metadata.ftp-master.debian.org/changelogs/main/d/db5.3/unstable_changelog

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 46536efe86f..8975647daf4 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -30,7 +30,7 @@ SRC_URI += "file://fix-parallel-build.patch \
 # We are not interested in official latest 6.x versions;
 # let's track what debian is using.
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/db5.3/"
-UPSTREAM_CHECK_REGEX = "db5\.3_(?P<pver>.+)\.orig"
+UPSTREAM_CHECK_REGEX = "db5\.3_(?P<pver>\d+(\.\d+)+).+\.orig"
 
 SRC_URI[md5sum] = "b99454564d5b4479750567031d66fe24"
 SRC_URI[sha256sum] = "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe72478043172c3628"
-- 
2.17.1


