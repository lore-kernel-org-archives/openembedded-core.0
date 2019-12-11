Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 36BF17FA30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:16:06 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 6so11001245pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 08:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=9a+XYu7lK2SinSOSzD0ygYSQCor04tAyzkWVb6FJtOM=;
	b=dVlGEGx0iHBVaeXJa666mADXtZHswE/ivh64oxjLvkw/E80h7GFePKXgEAUfavWjjp
	4PB89ROJYvTtOQUJ/P/nrHm15CfURVKoaYtPf/07sOdf8uJg2NA2SqVfsFFKGFDuhGvd
	gq16O4cbkZMrI0qVMHPJW5RDRg0NjKp1uu8VzacTNUsZcsE1hZ2uETy2xcsaWKauhD0e
	dtGQtUHqIGgF//4u+h8rP7kRM8Dd5MU4JITyjQYd/dx7Ld8cNxEMAqVyyAWGSnxUdL4N
	vvHKIdwCQMs1O5GlyS3z5jmdnuvcqvBcMa++hBIxFUh4giX7y+6v1nzR1NgQCvxidfKu
	6BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9a+XYu7lK2SinSOSzD0ygYSQCor04tAyzkWVb6FJtOM=;
	b=E++db6QEj1aLtmtVfX0+mphvH02T3IsgqnsVglwnglz7R/dRUVHIabqP0ViptkIxV4
	XKihJ2RY5Vpc2+jQ2xIoqEXubw7kplH8kuKWbD+pqxUPioQYVnR+hBxCI9Y/8cWD+qEk
	vlFoOCGJWai0cPjzOy1W9HGnH5WNXPPcKZsaujOK6orx+5pdu4GNSaayRpaijWKNEqEb
	+XJp4qsC0ON7ZuMVMXyrjKe3QYQrr+Gx+boBesHD5Q8zNGhimi9WI0MWgwcE6NTQU7T2
	ARKFaIabJpOBMIbr3t4xfkJUkIgecivSAaclalZm2PIXAX4FXMLQZI/y/sbUkgiAoyL7
	q1eA==
X-Gm-Message-State: APjAAAUL5p/44v76XSKFCI3Ob3nUACNEs7Xe7YVWq1faryAIWCV0v/Bx
	dXqsmKHsIehUaOSCUb6FLCQmb5DdgEs=
X-Google-Smtp-Source: APXvYqzxMUpY+kc4ZuKCNL+jk5Tjwv/1nLCAkcF4aEeT1LwAlEahX9gBJmhb31+Uzx6wo8Kkq7LnCg==
X-Received: by 2002:a65:6815:: with SMTP id l21mr4864228pgt.283.1576080966841; 
	Wed, 11 Dec 2019 08:16:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:50a9:9288:81a1:163b])
	by smtp.gmail.com with ESMTPSA id d2sm3008206pjv.18.2019.12.11.08.16.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Dec 2019 08:16:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 08:16:04 -0800
Message-Id: <1576080964-13796-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V2][PATCH] cve-check: fail gracefully when file not found
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
X-List-Received-Date: Wed, 11 Dec 2019 16:16:06 -0000

With out these changes, a traceback displayed when a file
is listed in the SRC_URI but the file does not exist.

raise FileNotFoundError and print the patch then mark the task as failed.

[v2]
forgot to refresh patch.
now print missing file

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 01b3637..7412436 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -52,7 +52,10 @@ python do_cve_check () {
     """
 
     if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
-        patched_cves = get_patches_cves(d)
+        try:
+            patched_cves = get_patches_cves(d)
+        except FileNotFoundError:
+            bb.fatal("Failure in searching patches")
         patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
@@ -129,6 +132,10 @@ def get_patches_cves(d):
     for url in src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
+        if not os.path.isfile(patch_file):
+            bb.error("File Not found: %s" % patch_file)
+            raise FileNotFoundError
+
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
         if fname_match:
-- 
2.7.4


