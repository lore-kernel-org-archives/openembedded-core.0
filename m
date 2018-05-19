Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id EB57F751FB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 02:14:02 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id d14-v6so447274pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 19:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=04w44CpyGTTufGVcnDcQY4NYM7KUTkRsAR5xYvE80LA=;
	b=El2UKQDsFhB1erXraji8qGQJ5lpNSZjlWmehOLTCgq1pkk4eb0GH3ZBv8FGeW7cKGP
	ifvt4fyd/x2LV1F9W2IDibkjqLW+D2ZQjiYuBH8PYV5WhlIG7hk0jmQx3oBoJpu/wB0a
	eGaQ+scM/8fUE4c5YoyV4QbNo8E+JGXTfxvAm6nhGPNah83YB41Mvi6XkBzFY4xUmmDQ
	J4/3sSUi18d5vCxYsxDDyku7UPqCF8NUbWwPW6fbWoncd0UD8cQDncTWlKx8iaiutV04
	aVRo2BFCeP1XUAEvT+qMvEL/w8LZmlqT3y7g1XMCHgTk6JR5ea/gyg/1pTAj4qNyWAm9
	Zy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=04w44CpyGTTufGVcnDcQY4NYM7KUTkRsAR5xYvE80LA=;
	b=ec7p9Lf6av/s0N2FYbA45R61vc1QdgP4L8KHL/tcjrOeWUz5UP99Wdn8Fn6ua2boRW
	M7EVM8nuxW4VetPB78EUNEKKH3U/+D8oTvuJZhA/sC081Bv6UI33ZuN4l0IUgXDYpQih
	vqbFBroDk8LwfRVX1dkrrNOuLnkjk+helWMLkgBoQwXCG4BDWxsIf/9293BnOnTqBFdg
	/dXb4XNReG/YuR4iywR8L7zz4RiU7Uxgjl7hLcYTwxs9mRJA2VUJtF5esn7CjKVYoSoS
	Oq91ZvEiOQdyGCjpsOft5ydMxqwZZQMb/PvXvmOX86oWWZVLvfNRBWN/jBD8ppR4nBjV
	uPEg==
X-Gm-Message-State: ALKqPwcjB17yo2Nfnx2GtDeUpMx9lUnBrGuL7oL/zHvTGtY+r4dHMuhM
	9cRMN2+GvaSTyDOxLBvqy+o=
X-Google-Smtp-Source: AB8JxZrnExseX30DEslgvWigTTqShH5Tu4NhaAfmYSj9v8LkW8CREW/TYUbOSI794dqsiYHHPHxnBg==
X-Received: by 2002:a65:5182:: with SMTP id h2-v6mr9512502pgq.57.1526696043986;
	Fri, 18 May 2018 19:14:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:ed41:dd75:6b53:32ea])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm19307081pfj.68.2018.05.18.19.14.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 19:14:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 19:13:54 -0700
Message-Id: <1526696034-3857-8-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526696034-3857-1-git-send-email-akuster@mvista.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 8/8] openssh: fix some ptest exec issues
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
X-List-Received-Date: Sat, 19 May 2018 02:14:03 -0000

From: Armin Kuster <akuster808@gmail.com>

SUDO needs to be empty to run some of the tests on the target.
compile check-perm which is needed for some tests.
skip "unit" tests in regress/Makefile

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/run-ptest | 2 +-
 meta/recipes-connectivity/openssh/openssh_7.7p1.bb  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index 36a3d2a..39fb521 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -4,7 +4,7 @@ export TEST_SHELL=sh
 
 cd regress
 sed -i "/\t\tagent-ptrace /d" Makefile
-make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
+make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="" tests \
         | sed -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
 
 SSHAGENT=`which ssh-agent`
diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index 691dec6..40e0fb0 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -84,7 +84,7 @@ do_configure_prepend () {
 do_compile_ptest() {
         # skip regress/unittests/ binaries: this will silently skip
         # unittests in run-ptests which is good because they are so slow.
-        oe_runmake regress/modpipe regress/setuid-allowed regress/netcat
+        oe_runmake regress/modpipe regress/setuid-allowed regress/netcat regress/check-perm
 }
 
 do_install_append () {
@@ -132,6 +132,7 @@ do_install_append () {
 
 do_install_ptest () {
 	sed -i -e "s|^SFTPSERVER=.*|SFTPSERVER=${libexecdir}/sftp-server|" regress/test-exec.sh
+	sed -i -e "s|EGRESS_TARGETS=./*unit|EGRESS_TARGETS=|" regress/Makefile
 	cp -r regress ${D}${PTEST_PATH}
 }
 
-- 
2.7.4


