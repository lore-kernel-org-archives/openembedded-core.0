Return-Path: <andre.draszik@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id A201260272
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:12:30 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id e12so13431132pgn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xVYxbIuYn4Uu/4AacRWr//pgtB9w+NQ4fuJwSMmG/Us=;
	b=Vl5aRxbCQjBu3VP8orNPTsDH3BIzNYl8mmcEuPlXlVvWb7wOQ6ohbEtrrHIVX4Svxs
	ih5Ydt2Jjt7Xb83wyivtHC5PcNmPjaC8rzQpmh2QweBIWfwKXBveXbuA2sf5mKQ5T3s6
	HsbTvG3r5f/gshqUr8akCAmuuKT2VCjnrmZBRX1wpjpl1s4JjwlLairVBCmvETuTxnF1
	S4+raRX1vQS7JDhKA0Ec61rCX0NGdqpDSqFBSw+tB9xd1RP/SVu5P3nABYu28Nm1ACbQ
	H4KrKj89vDhUpQKLhlxdDEaFgsRzwp73D6Wp0M57A+hDr5y0Rs99Rm/c1P8haS0wZsOv
	EhfQ==
X-Gm-Message-State: ALQs6tD9y4hNT6nxMWepe2ZWtGmZDHEAAewQlaTe6eKeI79qvncb7kjR
	RwiOwgLm1atW/166n9t1vOB/qp1U
X-Google-Smtp-Source: AIpwx4++X3ZLcJl+DnYYaWsXkeC/RIsTKzUvUrgCFCBlk5E5QY1Up1oiyYarv+LhRwTzMRh4TnSMiA==
X-Received: by 2002:a17:902:4301:: with SMTP id
	i1-v6mr21642541pld.280.1524665551426; 
	Wed, 25 Apr 2018 07:12:31 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e190sm32120700pfe.171.2018.04.25.07.12.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 07:12:30 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 15:12:23 +0100
Message-Id: <20180425141223.6392-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [PATCH][RFC] sstate: allow specifying indirect dependencies to exclude from sysroot
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
X-List-Received-Date: Wed, 25 Apr 2018 14:12:30 -0000
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
index 68089421f5..62e784e497 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -901,6 +901,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
     # task is included in taskdependees too
     # Return - False - We need this dependency
     #        - True - We can skip this dependency
+    import re
 
     def logit(msg, log):
         if log is not None:
@@ -961,6 +962,18 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
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
2.16.2


