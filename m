Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580B0C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 23:15:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.902.1641597305908598559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 15:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OwWhIhM4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id h10so3639345wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 15:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xgCno5tOPCy5EgzrefLbpXxdT0zQ3JZ3WnyLalRAh10=;
        b=OwWhIhM4nkkerbZSstc/fb7KmisWLy0fZgXBBc2JstFfkeBn0ewn9diVvGUheQfhT4
         3Z5d9LPiF7xfw6AC9kAMT1u+BGdj4hHEOgcKBF99pe5SFV5xL03vfSc2b/cJXc2+AAPe
         n2JL563rqDiN1XnqI8JuMVqgD6yBG42lKHqts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xgCno5tOPCy5EgzrefLbpXxdT0zQ3JZ3WnyLalRAh10=;
        b=ahQd0NhDTjyNO+aUbJhbb8J9EDQHxdUiuMS5T76kLzGbPrn2IC8O+gJUV1grodQ3P/
         bYXhaqTdi5+4Q5V5tAo7/3WkUZLFG3Y3mFSKOKg+vhOzR8Ma/aIdKjoeGfF9u+l46FA2
         kmqR1p97z7qA+cGDpRy+qLek+CIxDh9aPModgHLRMYS98wMkloQTnzNhMIlJhRKW+gu+
         FLgku0VH1siYYrVNlPtMHZjJMBCCZcexsuHgqfdUakY1/MO/H1QtpGNBUJ3qr1eTxDPW
         qmjtWvyJblcBdTP5EDo/k/XlKnRXannG/zBErk7zQtgCjDcby7ICcd7uSn0GixD+vlRr
         JXXg==
X-Gm-Message-State: AOAM532U7oGdY3PKuoHWK8yRQ9hjmjdNSCQj+5kzSSMLPepGmMAB/UT+
	kvVNz2XOco+a7vZFmK/pN0l/UoBIpdpBFA==
X-Google-Smtp-Source: 
 ABdhPJz9q5Ep0fk+rfchE2WD3pEfWcUvpn4r1t9yF5D+ylzgy4DSfTzKhMTnLYkVtW5lQS0weeSwlg==
X-Received: by 2002:a5d:4e8e:: with SMTP id e14mr8922622wru.220.1641597304175;
        Fri, 07 Jan 2022 15:15:04 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82])
        by smtp.gmail.com with ESMTPSA id n12sm84277wmq.30.2022.01.07.15.15.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 15:15:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes: Only allow network in existing network accessing
 code
Date: Fri,  7 Jan 2022 23:15:01 +0000
Message-Id: <20220107231501.1517483-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 23:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160271

Use the newly added network task flag against tasks where network
access is expected. This is do_fetch, do_checkuri, do_testimage, do_testsdk
and do_testsdkext.

We can't disable networking in sstate tasks due to sstate downloads and
also so we can report hash equivalence to the server so network access
is enabled in sstate tasks.

Access within build-appliance do_image is also allowed due to the use
of pip, this is a poor example made rather obvious now and needs to be reworked.

Network access anywhere else in any other task isn't allowed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                                | 1 +
 meta/classes/sstate.bbclass                              | 2 ++
 meta/classes/testimage.bbclass                           | 1 +
 meta/classes/testsdk.bbclass                             | 2 ++
 meta/classes/utility-tasks.bbclass                       | 1 +
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 ++
 6 files changed, 9 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b709777f243..5f4956a1d31 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -150,6 +150,7 @@ do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
 do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
 do_fetch[vardeps] += "SRCREV"
+do_fetch[network] = "1"
 python base_do_fetch() {
 
     src_uri = (d.getVar('SRC_URI') or "").split()
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0326d27c743..645377fdd8f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -158,6 +158,8 @@ python () {
     for task in unique_tasks:
         d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
         d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
+        d.setVarFlag(task, 'network', '1')
+        d.setVarFlag(task + "_setscene", 'network', '1')
 }
 
 def sstate_init(task, d):
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 1c5fd4ee6a4..898248992c8 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -139,6 +139,7 @@ python do_testimage() {
 
 addtask testimage
 do_testimage[nostamp] = "1"
+do_testimage[network] = "1"
 do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TESTIMAGELOCK}"
 
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 758a23ac553..8b2e74f6069 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -36,12 +36,14 @@ python do_testsdk() {
 }
 addtask testsdk
 do_testsdk[nostamp] = "1"
+do_testsdk[network] = "1"
 
 python do_testsdkext() {
     import_and_run('TESTSDKEXT_CLASS_NAME', d)
 }
 addtask testsdkext
 do_testsdkext[nostamp] = "1"
+do_testsdkext[network] = "1"
 
 python () {
     if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 34d6b8f4d52..0466325c131 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -38,6 +38,7 @@ python do_clean() {
 
 addtask checkuri
 do_checkuri[nostamp] = "1"
+do_checkuri[network] = "1"
 python do_checkuri() {
     src_uri = (d.getVar('SRC_URI') or "").split()
     if len(src_uri) == 0:
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index ce72a944e74..b774095b971 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -109,6 +109,8 @@ fakeroot do_populate_poky_src () {
 }
 
 IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
+# For pip usage above
+do_image[network] = "1"
 
 addtask rootfs after do_unpack
 
-- 
2.32.0


