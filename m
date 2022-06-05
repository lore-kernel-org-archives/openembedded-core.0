Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632E8C43334
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 12:26:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.19985.1654431961552951625
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gxaqQ6ha;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id q15so8225102wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dofObs7nkuzHfZWUE9jtsCYXmz1Dm3RSmQQmon3zO3s=;
        b=gxaqQ6haDzrmVmim+DZ2pwjraWJndqONUNTwgLRSlT4Ry4W//kPQ5S7nbSumWb+xaH
         wYLGRrwTFmT+TdTDkhIJXCaa7gdhKDKBGq3xi2SpWw73S9rFUsLPmO9TF9ZRt3SOjAKz
         cbkC/sk/WLy+YVs9xnMHS3WqYSkVwlNr5UnJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dofObs7nkuzHfZWUE9jtsCYXmz1Dm3RSmQQmon3zO3s=;
        b=tyNLqsgCyOcVncngDCcV5X7mTaceEKg5XxOexwyxQdhkWyvE4jFfRU8Po9PJCLgCIa
         pLmkmX0HG1xQXFhqzjEbNsyvmDlHREqZigDdt65FjvbQhLbuJVwzIPBXhU3IROwumNcZ
         00+uze+UllAjRhn5ENgL3fqzWlQJqDmiuQlezeQavI9A5+zZDLOSFTqh5FAKDpxLnRPu
         dXhpt2gGYGhSFxY/wkbo0SiXwjwJrWsuVl9Qnmk0BBEeF1seRQNyq/ZUcSAh6eWk/BPf
         sLO5jyjpFP5JorBSvEfC0cr9QlfzKUTrnG6z/sOMgo/8YvZYH8vdYbOCSzujD232ZkCD
         obFA==
X-Gm-Message-State: AOAM533rex/1pBaI3n01dYxe0wFXF33bIouYCVjf02OHzbuexKZHejOz
	E10aREutZpC5fIh4Obi/Fya25elZJ6Yx3Q==
X-Google-Smtp-Source: 
 ABdhPJwDGCDtcJwDsL4+6DBLQpaCUH56S9e+uatZE4MNMcX+R9piw33LF9ogachl5G3zYYtNbD1Juw==
X-Received: by 2002:adf:a4c2:0:b0:213:be00:9d2 with SMTP id
 h2-20020adfa4c2000000b00213be0009d2mr11227176wrb.568.1654431959580;
        Sun, 05 Jun 2022 05:25:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1a6f:63e8:c3d9:1249])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003942a244ecbsm12455927wms.16.2022.06.05.05.25.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 05:25:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] sanity: Switch to make 4.0 as a minimum version
Date: Sun,  5 Jun 2022 13:25:55 +0100
Message-Id: <20220605122558.270399-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 12:26:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166575

We can't build glibc without make 4.0 and we don't work on older distros with
older versions of make without buildtools tarball so increase the minimum
version to 4.0.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b416918013c..eb0ca058049 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -432,8 +432,7 @@ def check_patch_version(sanity_data):
     except subprocess.CalledProcessError as e:
         return "Unable to execute patch --version, exit code %d:\n%s\n" % (e.returncode, e.output)
 
-# Unpatched versions of make 3.82 are known to be broken.  See GNU Savannah Bug 30612.
-# Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to validate.
+# Glibc needs make 4.0 or later, we may as well match at this point
 def check_make_version(sanity_data):
     import subprocess
 
@@ -442,31 +441,8 @@ def check_make_version(sanity_data):
     except subprocess.CalledProcessError as e:
         return "Unable to execute make --version, exit code %d\n%s\n" % (e.returncode, e.output)
     version = result.split()[2]
-    if bb.utils.vercmp_string_op(version, "3.82", "=="):
-        # Construct a test file
-        f = open("makefile_test", "w")
-        f.write("makefile_test.a: makefile_test_a.c makefile_test_b.c makefile_test.a( makefile_test_a.c makefile_test_b.c)\n")
-        f.write("\n")
-        f.write("makefile_test_a.c:\n")
-        f.write("	touch $@\n")
-        f.write("\n")
-        f.write("makefile_test_b.c:\n")
-        f.write("	touch $@\n")
-        f.close()
-
-        # Check if make 3.82 has been patched
-        try:
-            subprocess.check_call(['make', '-f', 'makefile_test'])
-        except subprocess.CalledProcessError as e:
-            return "Your version of make 3.82 is broken. Please revert to 3.81 or install a patched version.\n"
-        finally:
-            os.remove("makefile_test")
-            if os.path.exists("makefile_test_a.c"):
-                os.remove("makefile_test_a.c")
-            if os.path.exists("makefile_test_b.c"):
-                os.remove("makefile_test_b.c")
-            if os.path.exists("makefile_test.a"):
-                os.remove("makefile_test.a")
+    if bb.utils.vercmp_string_op(version, "4.0", "<"):
+        return "Please install a make version of 4.0 or later.\n"
 
     if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
         distro = oe.lsb.distro_identifier()
-- 
2.34.1


