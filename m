Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id C7BC561005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2013 21:44:32 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id el20so3755937lab.40
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2013 14:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=6v6zrlIIkKMW9uwLqlxP1IPwS5qI7Mmivfo9+KZC3ms=;
	b=i9BrtJ0Nm+TxowwgjdJqA7FAe1lVZPzCSBW3/kl7aMkALXemmLfS37wSw30LWb9Oh6
	1S+kExxx1qSPPu8sYtiGAXDCFGd0NFVBvefjiJZOMHw4mK/5D5lKs87Z8CYi/k3uwacw
	QKGqla9Z+ttsca7MlpBfYbYCxhvK569tlZnJhEaFcf8EIgaH/fJtlHkPnVm/8lsXYNpC
	Z/m/6vkg6EMaK+TMmPN9ocmyV+9wTITdO2DA5tLmX2FrWfb5gHebKBh413R9hoxp1yuC
	G+kZjfr/7tWfhwYrs184lBnONi+ns8NHDrH03Yewppy7wxdjJdSwSnu9xDGmm84UuLed
	ubsg==
X-Received: by 10.152.37.103 with SMTP id x7mr3773582laj.28.1380491073379;
	Sun, 29 Sep 2013 14:44:33 -0700 (PDT)
Received: from nysan (c-5eeaaaac-74736162.cust.telenor.se. [94.234.170.172])
	by mx.google.com with ESMTPSA id vx8sm13643160lbb.8.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 29 Sep 2013 14:44:32 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id D280F40087A; Sun, 29 Sep 2013 23:44:29 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2013 23:44:23 +0200
Message-Id: <1380491063-11425-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] nss: Fix return codes in postinstall
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
X-List-Received-Date: Sun, 29 Sep 2013 21:44:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

exit 0 was done if $D != NULL, if one or more
shlibsign executions fails.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-support/nss/nss.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 11f1b7f..2b2b668 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -168,6 +168,9 @@ pkg_postinst_${PN} () {
             BN=`basename $I .chk`
             FN=$DN/$BN.so
             shlibsign -i $FN
+	    if [ $? -ne 0 ]; then
+	       exit 1
+	    fi
         done
         exit 0
     fi
-- 
1.8.3.2


