Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 559A56093B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 14:48:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p190so29773499wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 06:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/+xqxSnfXgnNr0JAGWvManhgopTctnJnNCbHqzyxUAA=;
	b=VBNeLoykcwSHdKE8SQU9aq0gOe1O9icoX1QfsR755ZFTTIj3yZOPVeJvmFVUgxHfEO
	6u4FUa5WUAk5xTp7I1ANZKDbstHwKxdgMkFk07NgSLztsKtfOB1ErmI7eXQRFYNGGGPL
	JxAMmKWdoA9aDW1EtIDH625t7gwQhFeqjxrn0rUiO+6u3IKxAfjmhKJXaERnmhKo/CQW
	HJIalIGtTaDfN+viN37foqJwqjzcqCsUib3T0Uv1TB8NMUzqwPZHDVhtGgYJfMCNZVK4
	JojacIU+yLgiKqkuCajyj0PaCCWrejRytUS+/mpJa5nsx5kVY/Ro/DpyUXLcsoVgT7rY
	8DVg==
X-Gm-Message-State: ABUngve0wORX6UAiU1G2ZezJ5LJQBdOBpbAnsKsiWSBuZBEjjdWPH6hARQz5P3MVORHqDw==
X-Received: by 10.28.166.208 with SMTP id p199mr22499017wme.27.1478702934714; 
	Wed, 09 Nov 2016 06:48:54 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id b184sm671009wma.0.2016.11.09.06.48.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Nov 2016 06:48:53 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2016 14:48:53 +0000
Message-Id: <20161109144853.4452-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] openssl: fix bashism in c_rehash shell script
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
X-List-Received-Date: Wed, 09 Nov 2016 14:48:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This script claims to be a /bin/sh script, but it uses
a bashism:

from checkbashisms:

possible bashism in meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh line 151 (should be 'b = a'):
	    if [ "x/" == "x$( echo ${FILE} | cut -c1 -)" ]

This causes build issues on systems that don't have
/bin/sh symlinked to bash:

Updating certificates in ${WORKDIR}/rootfs/etc/ssl/certs...
<builddir>/tmp/sysroots/x86_64-linux/usr/bin/c_rehash: 151: [: x/: unexpected operator
 ...

Fix this by using POSIX shell syntax for the comparison.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Reviewed-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
index 25ea729..6620fdc 100644
--- a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
@@ -148,7 +148,7 @@ hash_dir()
 	then
 	    FILE=$( readlink ${FILE} )
 	    # check the symlink is absolute (or dangling in other word)
-	    if [ "x/" == "x$( echo ${FILE} | cut -c1 -)" ]
+	    if [ "x/" = "x$( echo ${FILE} | cut -c1 -)" ]
 	    then
 		REAL_FILE=${SYSROOT}/${FILE}
 	    fi
-- 
2.10.2


