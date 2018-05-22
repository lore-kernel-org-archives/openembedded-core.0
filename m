Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCC5749AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:25:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f6-v6so31367874wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 05:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NqaL+JInmwVTeCXPGZjLXpq2+P/94EA9sOVHMs+939I=;
	b=CokIM8JWi00BDWoNLO81wn8XM2sG2gly+qrpAGlteRRHzpOieX7kPD0LKxRfn/0FHk
	eKvffb9XXWlUPx9JRdyyiSX8+2M3pOjkefWOGNGnPTTnBVpgk8P4DqGdfkcl9N82Y/yM
	Od+KuDFx0AzFTgZsr41qW9N4NkNjYpoq4ow1z1b4npVOYiEvZNGsBbhG4DzUjpbrL3c/
	2e4yNMhaySesQ2DxOqQIWKvBVpWNtKTwf5jvvi6e5jMku5V6awT6a9hzCplL/7WqXSKJ
	Yml0EFsVdA32RXGgfuJrJdu7Ryh2qwhul9kM7iTxhZPMKeUxHZOu+dxWgb/YIcf4v0cj
	OgQA==
X-Gm-Message-State: ALKqPwc8NLy9E0zOIuakGeWOrus5GIBec0hfrO8yNA7K0m8ZmxmvNPop
	yGHEyIVnQ3JR47Xab2iKb94FNYeV
X-Google-Smtp-Source: AB8JxZq4RzeNxeDQdW4bL1ZjIz+cZNQrSW1reimF49FbYSiYbyAgaDBX19HL7m3zT9PzELb+pQTtqw==
X-Received: by 2002:a50:e1c1:: with SMTP id
	m1-v6mr2079102edl.198.1526991954656; 
	Tue, 22 May 2018 05:25:54 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a2-v6sm8752163edd.39.2018.05.22.05.25.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 May 2018 05:25:53 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 13:25:50 +0100
Message-Id: <20180522122553.29109-1-git@andred.net>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH 1/4] sstate: allow specifying indirect dependencies to exclude from sysroot
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
X-List-Received-Date: Tue, 22 May 2018 12:25:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Currently, a dependency on any -native recipe will pull in
all dependencies of that -native recipe in the recipe
sysroot. This behaviour might not always be wanted, e.g.
when that -native recipe depends on build-tools that are
not relevant for the current recipe.

This change adds a SSTATE_EXCLUDEDEPS_SYSROOT variable,
which will be evaluated for such recursive dependencies to
be excluded. The idea is similar to
   http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html
except that the list is not hard-coded anymore.

SSTATE_EXCLUDEDEPS_SYSROOT is evaluated as two regular
expressions of recipe and dependency to ignore, e.g. in
the above flex-native / bison-native use-case, one would
specify

    SSTATE_EXCLUDEDEPS_SYSROOT = ".*->(flex|bison)-native"

in layer.conf.

The existing special handling of "-initial" as well as
"base-passwd" and "shadow-sysroot" could also be
streamlined:

    SSTATE_EXCLUDEDEPS_SYSROOT += "\
        .*->.*-initial.* \
        .*(base-passwd|shadow-sysroot)->.* \
    "

Another anticipated user is meta-java, where certain newer
JDKs can only be bootstrapped (built) using older JDKs,
but it doesn't make much sense to copy all those older
JDKs and their own build tools (ant, etc.) into the
sysroot of recipes wanting to be built using the newer JDK
(only), e.g.:

    SSTATE_EXCLUDEDEPS_SYSROOT += "\
        openjdk-8-native->(ant-native|attr-native|coreutils-native|icedtea7-native|libxslt-native|make-native|openssl-native|zip-native|unzip-native) \
    "

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/sstate.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1a95f8f2b9..e5b86ad705 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -897,6 +897,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
     # task is included in taskdependees too
     # Return - False - We need this dependency
     #        - True - We can skip this dependency
+    import re
 
     def logit(msg, log):
         if log is not None:
@@ -957,6 +958,18 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
             # Nothing need depend on libc-initial/gcc-cross-initial
             if "-initial" in taskdependees[task][0]:
                 continue
+            # Allow excluding certain recursive dependencies. If a recipe needs it should add a
+            # specific dependency itself, rather than relying on one of its dependees to pull
+            # them in.
+            # See also http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html
+            not_needed = False
+            for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or "").split():
+                if re.match(excl.split('->', 1)[0], taskdependees[dep][0]):
+                    if re.match(excl.split('->', 1)[1], taskdependees[task][0]):
+                        not_needed = True
+                        break
+            if not_needed:
+                continue
             # For meta-extsdk-toolchain we want all sysroot dependencies
             if taskdependees[dep][0] == 'meta-extsdk-toolchain':
                 return False
-- 
2.17.0


