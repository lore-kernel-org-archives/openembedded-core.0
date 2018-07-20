Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id F1B7D74D59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:40:02 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f21-v6so9037544wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MHqP4YwdLFqYVQ3wcT42YwwhUHo045np4js9N8il72I=;
	b=eAIW6Ydz2h61AgCGOBtKhFoQITdL8EeS1C8S36dhwQIOYY6VhNSGi1g8F06YF0DFmO
	CajfLhCwQVq6RP3kY5gO4oIYBFGIkUVOVVcuO2xSuhaNl9zHBzf7ffJJO9xAt5tBNI/c
	mHg1GZlBCuAJbFxwmJ8i+Gk8jKDGmlzUy35cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MHqP4YwdLFqYVQ3wcT42YwwhUHo045np4js9N8il72I=;
	b=O37+TUY2Ei7cXsGw0IlYwOtCHwuc+PdYPamF4HHM5Wp6Uqg7p0WaJaJCvfsEEaQhMt
	gklul2ytK50IrYmry4S2rLn8W9gSk72jkbJmZKK7YB8gtepUjegNeBNC8/Za3gTGao9c
	5CchRnU73wGSONcAPPQ4lpIQbWvLFkE1934QEHhHVJQbfFSBKvDPnkQvoBvH6X6jELzR
	FGtCi6yWZ60YjG1bTZps13xzcCvr9c3p3Z6zWZmCLZSNNZiB7Oga/WTqehtgSpBE4D8l
	o+dbqvccw3Y1eQF2LmBuNyk85Hy8zRVlqGNLs/s/C5YF5VlyO5hc3hTRo7aQCj8NwGPA
	+XgA==
X-Gm-Message-State: AOUpUlHpSnGyDE2y+Z0sil6jMRr/v3gis1nzzUci/j+TJvbXlH0LlMOk
	ZbrbslqcC5sxO5kyDMlHOTy/LW20IVQVLg==
X-Google-Smtp-Source: AAOMgpezcvpOEwj1ANNaAG6Yk9a1psSxgpC5WbzfcLLZfWxHMSAAsdjXO33sWvd8WyJ+Kf3fDAogfg==
X-Received: by 2002:a1c:19c2:: with SMTP id 185-v6mr745199wmz.79.1532083203534;
	Fri, 20 Jul 2018 03:40:03 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.40.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:40:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:48 +0100
Message-Id: <20180720103948.30044-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
References: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/10] sstate/bitbake.conf: Use pigz if available
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
X-List-Received-Date: Fri, 20 Jul 2018 10:40:03 -0000

Currently the compression of sstate objects is single threaded. In the case
of ltp, this takes around 33s. If we add pigz into the list of non-fatal
HOSTTOOLS and then use if it available when building the sstate object,
this time drops to around 6s.

Since pigz is now widely available this is an optimisation we should
utilise.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 11 +++++++++--
 meta/conf/bitbake.conf      |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 5a0722567a5..350d3107f59 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -715,17 +715,24 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 #
 sstate_create_package () {
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
+
+        # Use pigz if available
+        OPT="-cz"
+        if [ -x "$(command -v pigz)" ]; then
+            OPT="-I pigz -c"
+        fi
+
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
 		set +e
-		tar -czf $TFILE *
+		tar $OPT -f $TFILE *
 		ret=$?
 		if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
 			exit 1
 		fi
 		set -e
 	else
-		tar -cz --file=$TFILE --files-from=/dev/null
+		tar $OPT --file=$TFILE --files-from=/dev/null
 	fi
 	chmod 0664 $TFILE
 	mv -f $TFILE ${SSTATE_PKG}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8f738545995..e28f3c7311c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -490,7 +490,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"
+HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
-- 
2.17.1


