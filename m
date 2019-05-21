Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBF27E075
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:27 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d30so7675259pgm.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4nUTIh1NDHCoVIy3g7YHwwq3RBH8vgDz+8vOE/1iElA=;
	b=inz/LzVLKB1YzGBxE6K0bsRFGIDSyIJfWK+uMMchLsEBoeg7oE/Hxx3mmcE60kthUb
	jAzLeCJ0ADc7SY0xLEVxba+uBapMejv3JYMtY3/+m4wMJ3EtTyRDiUdi1HRN5/QZNty0
	d24XhAenGcEfHAlIjbgfa1+XnfT473mIDtM3vr4VDD36Ob8pNEyoQ10Owz0mX00o/7hF
	qP3aSymTB12WwW+i4gFk7bUtxcze5JsTzRa8Y0PqPZ7SEVGl0b0gOxCnV0j0nzsNoLiW
	4Ilai2jWpEsL5CxqLih3I4ZTCqGjzLsXyALvd4qm1bb2pFTuZeMwn33RIg4LQ2bMwZZl
	/78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4nUTIh1NDHCoVIy3g7YHwwq3RBH8vgDz+8vOE/1iElA=;
	b=twLtt+WoeMV90N6CbfBSFa/kZZPCZFgkTFH2yaKbQEjZhuNOp5dU1OtaNYZlJ8APWV
	F/nmwZIIRXhDqJ1RmX5cZjfrwFu5AyXDxAvec1InVqG7LJu/mY1A4VspXfdaEZBeZIpD
	yAWhEIHxVQFaz56jokHhDLEAn+kElDoMlds9+LiajRXC8MyhTR1GyNT0/RoOQA9wZuYS
	DNsySpX0k5nsTSfo0igehqZOT9LRyiQy4Iqn0xYXxuaAIwSM2lmDnl4+D3V030jAT7Pp
	esssEJ+HtKwRFN2XVC4Etp5ECghd66OISOpttkqWsK6O1FH0/4UVXG9F2hOehgzeWmMy
	qN2w==
X-Gm-Message-State: APjAAAXV97zT0PUhNBFgYMffU6gsL9fJRJ0K7Pgthwl4vNqfyC7SlpnF
	/1x7eexY1mGzwyRq15S9xfW8QIqw
X-Google-Smtp-Source: APXvYqytnJUt8klHVBHH/EXoqatJeZvkJYFhOBjtx1jtyAZf/mQDWh7iYjq2ieHWEysdpjGnhzOWZw==
X-Received: by 2002:a62:1ec1:: with SMTP id
	e184mr16984618pfe.185.1558403008522; 
	Mon, 20 May 2019 18:43:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:10 -0700
Message-Id: <48f745041af3a01173dc2ad755cf8538a99028a4.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 08/15] run-postinsts: Fix full execution of scripts at first boot
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
X-List-Received-Date: Tue, 21 May 2019 01:43:27 -0000

From: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>

run-postinsts runs a given set of scripts during the first boot of the
device, when one of these scripts prints something to stdout (isnt
daemonized correctly), since stdout is not available at that time,
the script execution immediately returns with an error (exit_group()),
this error causes the script to terminate all threads within the process,
causing undesired behavior since the script might still had to execute
some other code.

Replace eval built-in with (), since () executes in a subshell,
even if one of the scripts exits, all threads of that process will only
be within that session, this ensures other scripts meant to be run are
still run afterwards.

[YOCTO #13266]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 95eff04..f84a7e1 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -67,7 +67,7 @@ exec_postinst_scriptlets() {
 		echo "Running postinst $i..."
 		[ "$POSTINST_LOGGING" = "1" ] && eval echo "Running postinst $i..." $append_log
 		if [ -x $i ]; then
-			eval sh -c $i $append_log
+			(sh -c $i $append_log)
 			rm $i
 		else
 			echo "ERROR: postinst $i failed."
-- 
2.7.4


