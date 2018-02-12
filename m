Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 15F8A7826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:29 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id k6so7268185ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UI9lMDu3tuyZBQ227epFhAfTU0yCv+o/OCdl0zXq1ms=;
	b=Q02/s/1tkDaTY370z5XUV/SoDmm9cmyH0qVoZykAKDbaYIiKsxfofIolu9QijdZDQy
	pWIPOR2swt78K9CszU/IsaxEDMIVc5e6/cPBKgtsFkPcSrZYCClakwCUpvLFOXez2O3t
	I/EsH7P2ySlNNvz+pYkSZCpNjZds/jqvprSYdu3RKdHA9WLaQRZGJS+SnMbKjdX/J1ps
	jSTmquxEi0k4WqCXoe8feOEc5RYpvxDn8mEnYTGABjnjOvRO2NLsPgSntCtEyhC4RkzW
	65PXoj7IPos9JuWYViRJRWNn6ldr77F8cFQsubXSrOoU/9AGtpSGh1uqCjrP34qssPtX
	teUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UI9lMDu3tuyZBQ227epFhAfTU0yCv+o/OCdl0zXq1ms=;
	b=SzRzpHCXqKsbU0Lmsvk8bsWS/92kiZlAQhnZ+eIb6YHYZ4NgXbxlhvFPiQXEVNlDRB
	CDgo2ntVKm1YZpND27bbZN4Scfo1VSWzf7ckj3aF4De6YdMDamFMVqRGbohom3huWJIA
	31vpCiFiuyHeTJL01Vf6oEhwGVo2cscPsoY7jNJp+em3pQIWTOWql++aO7jemoLMxIjK
	x3iej6HttGcztbPm95q5eF4j3HkPu3FdPxAlt0kaTLaE04OZvtBo+/V6nPTmpIdpYvbt
	xbK3YFAMbCmu9k4DgVO4EZv8G3+ry4v2Cat2+Y/yzTxmzHegRUEg+gpvVdb+rFa/gdvR
	FhTw==
X-Gm-Message-State: APf1xPDnVBimOfbTOwOkq8NahhzmoISYOS09oXtm7CnkfKLiY84USFho
	u3dwRg+vsT9s70D8oJtyzEVdjt50
X-Google-Smtp-Source: AH8x227VqXOP8tMtRVaEGUcuNHHXwel8YPQlSyADm9xh1PT+f0T3HrTQ2++Il5C6y9JN3POpMUuvHQ==
X-Received: by 10.36.181.87 with SMTP id j23mr5847576iti.48.1518454350227;
	Mon, 12 Feb 2018 08:52:30 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:29 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:03 -0600
Message-Id: <505ce9fa455677bd20a46c2eeecf324d29034b07.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 08/17] icecc-create-env: Archive directory
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:29 -0000

Taring up the toolchain is now done by adding the entire working
directory, instead of listing all the files individually. This is done
because the list of files may contain ".." entries, which tar does not
like and strips out, resulting in bad archives. This should result in an
identical archive to what was previously generated.

In addition, symbolic links are no longer dereferenced when creating the
archive, as they are purposely included to provide alternate names for
files

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env/icecc-create-env              | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 0791bd54b27..426b093d91c 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -256,7 +256,11 @@ if test -z "$silent"; then
 fi
 
 cd $tempdir
-tar -czhf "$mydir/$archive_name" $target_files || {
+# Add everything in the temp directory. Tar doesn't like to be given files with
+# ".." in them, which frequently happens in $target_files, and will strip off
+# the path prefix past the offending "..". This makes the archive generate
+# incorrectly
+tar -czf "$mydir/$archive_name" . || {
     if test -z "$silent"; then
         echo "Couldn't create archive"
     fi
-- 
2.14.3


