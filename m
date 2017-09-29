Return-Path: <matt@madison.systems>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 30D2F779C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 14:16:25 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id 188so853018pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 07:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fB/I+6hfOby4tomPvHj7bLvHPnYe++U6ibWved8mOQQ=;
	b=y7GN0ZBGp5kKyzirGL6pzKQp6aG8aj29h9pkKrjQa9eH0Y4q6vA1uWS875XMfOl9Ns
	6H+Dmv214KEsVaBNSTDKrALfDz26uEXEvSLBy+9QZMy0XfhNEjy8mALrjbOZNvVTmZ+X
	c2XaJ0Ca0K0rBQlSKZikBV/Qi4/5aNKcfilArYbTb60ELg6doGEK6KwNakMLFsri6S2n
	wQDCEFxTz0n+h5JoQx7ZvLZEu826gKSnutuw1zcxLtnWmYnV+5TEiwcxl07X+RbIQDLE
	5AdR3SPiofNuaGirAbsOqNo3xnaD+dVzwS/c3mMbXVlPzJHYivJROrltSppfyBJB++Ep
	xWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fB/I+6hfOby4tomPvHj7bLvHPnYe++U6ibWved8mOQQ=;
	b=oNJz4ZP2MS6dcd6yp+mDxcKY3TVyqPuWerhkPAOd8AwhsN6R39glzYEKKgDIIGiXCi
	anyhf56ea/XtTlsVx8JAlxs+f3b0iY5valjmr42LPrPwWBbniY/zfjMpKnmiH4xuGL/s
	Yi3yqrCjMFU4ypKii8Agf7SL/q6OoDdJ2FjaNxQWyf48WYe7SbDhMJalgQxS0tPsKjue
	H4ig+nQ8RO7nIAfQ68Rq03x/z2uMNY65+Kd3pGn0vdTer2RVE9wD61q/7uzfa5s8I8LS
	T5s5/j1v4112CpDZr8xLLJwjd6Ndf8LAFbJrXPXVVoDuOdIAQGXiqw2OhN2yHolvTUGb
	ebXQ==
X-Gm-Message-State: AHPjjUhgbleBjzbY8N0Vz/Cmvl8VPUAa9OEdlt8bpmTOx7g+keEsow3n
	gEmum1X1L7y0VSPKiHZWagueJi3YjOI=
X-Google-Smtp-Source: AOwi7QBmc78zxZHj0ozARFh+O98RhOM5i6SkvZnhXHICbRTqw/5sKbJBOMXIkgiCFvZWZMVWjuGIiQ==
X-Received: by 10.84.225.130 with SMTP id u2mr7214700plj.44.1506694586773;
	Fri, 29 Sep 2017 07:16:26 -0700 (PDT)
Received: from ip-172-31-1-8.us-west-2.compute.internal
	(ec2-52-89-23-9.us-west-2.compute.amazonaws.com. [52.89.23.9])
	by smtp.gmail.com with ESMTPSA id 4sm7214283pfs.1.2017.09.29.07.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Sep 2017 07:16:25 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Sep 2017 14:15:51 +0000
Message-Id: <1506694551-4487-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Cc: otavio@ossystems.com.br
Subject: [PATCH] go-runtime: prevent host leakage into target objects
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
X-List-Received-Date: Fri, 29 Sep 2017 14:16:26 -0000

When building for a target whose architecture matches
the build host's, the second pass through make.bash
to build the shareable runtime would also overwrite
the target's static cgo library with host-compatibile
binaries.

Fix this by running the host-side build once and
target-only passes of make.bash twice, for static
and shareable.  This ensures that what gets installed
is target-compatible.

[YOCTO #12136]

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-runtime.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 934d1aa..bd26e2e 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -23,9 +23,13 @@ do_compile() {
 	rm -rf ${GOBIN} ${B}/pkg
 	mkdir ${GOBIN}
 	cd src
-	GO_FLAGS="" ./make.bash
+	./make.bash --host-only
+	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
+	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
+	./make.bash --target-only
 	if [ -n "${GO_DYNLINK}" ]; then
-		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash
+		cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
+		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash --target-only
 	fi
 	cd ${B}
 }
@@ -41,8 +45,9 @@ do_install() {
 	rm -rf ${D}${libdir}/go/pkg/obj
 	rm -rf ${D}${libdir}/go/pkg/bootstrap
 	find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
-		[ "$srcdir" = "./cmd" ] || cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
+		cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
 	done
+	rm -f ${D}${libdir}/go/src/cmd/dist/dist
 }
 
 # Remove test binaries that cannot be relocated
-- 
2.7.4


