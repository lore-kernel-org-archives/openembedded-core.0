Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id ADFD2600EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 13:38:59 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id c5-v6so29055398itj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=iumW66yAwNgi2b8viychDrErwNpgW1WdDLnREJ9dE4A=;
	b=YlyOwFUzeXXeUUrunPqixY/CX6+n+5nMQ+ierYWNueud3vMlX9UxaW30Gzqgzcdeyg
	2RGxm9BsmjtI9mqOAOC3MgF81rdJw98YKvmOxMWtPwPCsWelMQ3icsGld3jGKv5zzBuw
	WWv+XM3ybLvP5iac5WKX1symjsxMsC1Da0BZl9oYJlNBeST/OiQfe/eyRHu5rmw3QQAl
	dtp26hSOhT4rxIlVXyIDco/s0409mAI4l0Q1nkAabJu7cJCs8ZEUWPO8y5pWCig8JL+C
	6xLdJhPCO0E/GRqD+bpJBB/4xAp9/wDU6w5YBRKJkIaNxFpIBMD8r9EjFkiaqLdpNX17
	FXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iumW66yAwNgi2b8viychDrErwNpgW1WdDLnREJ9dE4A=;
	b=R4vtSavdO5VCqY9PkoMosb26fUpv7pLm9LJQ981UTKWoeP/MxJsl4iutn2qpv9oj+x
	Tn11mpqpB7EhpAGv63J6UGsfcgG2BjPXrNelt9K1WKr/72UbswH87mDTscodtqHdsoxi
	314gZ4a3lbzIsKqCPQFngKUkPrCVDXgHfDGJKJG5WromsmMJTkiIT/fr2pagXC0PyPYP
	AceHltP53v1Te2wO64eMPoaip2+O213GX3b5YXYtNe17kiH9LBDaCz23yj6eY/VhLoA4
	GAatVTSTuvCcWJl/ASL2FglY2256w1d1GMqP64CLIAh77Y2dgRPinRipu4Sr744Y8zqE
	vVgQ==
X-Gm-Message-State: ALKqPwcZLTW4raprJ33GKvumguGfopZg6jWYNg76MbXN/U1xJBqDByhA
	BGmjMNVGyuPFz/n6WKCj3+Z88nkS
X-Google-Smtp-Source: ADUXVKIfuFfFjSRZ5KttO1elkKC4FXFZT7xixnrk5EUn+dKFbX9jBnmTHTTQJKyPxVbqOJrL1HqLTA==
X-Received: by 2002:a24:9d95:: with SMTP id
	f143-v6mr15284340itd.150.1527601139877; 
	Tue, 29 May 2018 06:38:59 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	h66-v6sm10733384itc.13.2018.05.29.06.38.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 May 2018 06:38:58 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 09:38:40 -0400
Message-Id: <20180529133840.11820-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [PATCH] patchtest.sh: optionally specify start branch
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
X-List-Received-Date: Tue, 29 May 2018 13:38:59 -0000

Allow the user to optionally specify a starting branch, otherwise assume
master.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/contrib/patchtest.sh | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
index 7fe566666e..2a4aea1d28 100755
--- a/scripts/contrib/patchtest.sh
+++ b/scripts/contrib/patchtest.sh
@@ -2,7 +2,7 @@
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-# patchtest: Run patchtest on commits starting at master
+# patchtest: Run patchtest on commits starting at specified branch, or master
 #
 # Copyright (c) 2017, Intel Corporation.
 # All rights reserved.
@@ -29,8 +29,9 @@ pokydir=''
 usage() {
 CMD=$(basename $0)
 cat <<EOM
-Usage: $CMD [-h] [-p pokydir]
-  -p pokydir  Defaults to current directory
+Usage: $CMD [-h] [-p pokydir] [-b startbranch]
+  -p pokydir        Defaults to current directory
+  -b startbranch    Defaults to master
 EOM
 >&2
     exit 1
@@ -46,11 +47,14 @@ function clone() {
     fi
 }
 
-while getopts ":p:h" opt; do
+while getopts ":p:hb:" opt; do
     case $opt in
 	p)
 	    pokydir=$OPTARG
 	    ;;
+	b)
+	    branch=$OPTARG
+	    ;;
 	h)
 	    usage
 	    ;;
@@ -73,6 +77,11 @@ if [ -z "$pokydir" ]; then
     pokydir="$CDIR"
 fi
 
+# default branch to master if the user did not specify otherwise
+if [ -z "$branch" ]; then
+    branch="master"
+fi
+
 PTENV="$PWD/patchtest"
 PT="$PTENV/patchtest"
 PTOE="$PTENV/patchtest-oe"
@@ -99,7 +108,7 @@ pip install -r $PTOE/requirements.txt --quiet
 PATH="$PT:$PT/scripts:$PATH"
 
 # loop through parent to HEAD and execute patchtest on each commit
-for commit in $(git rev-list master..HEAD --reverse)
+for commit in $(git rev-list ${branch}..HEAD --reverse)
 do
     shortlog="$(git log "$commit^1..$commit" --pretty='%h: %aN: %cd: %s')"
     log="$(git format-patch "$commit^1..$commit" --stdout | patchtest - -r $pokydir -s $PTOE/tests --base-commit $commit^1 --json 2>/dev/null | create-summary --fail --only-results)"
-- 
2.17.0.582.gccdcbd54c


