Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F58C43217
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:13:14 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.2804.1668348779511320811
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HHHq6rao;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id v3so8164224pgh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 06:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpJfuI4s21/vx0yeMdf+dEkCsnBrKSSZLAjrShsO6tI=;
        b=HHHq6raonYGkeOqNQD5usP5yS98nukviMc+ZI98oMbrfDVBThYM2LHOSQdy02JLNFl
         P7lkM3CD3N9Mh0me2F4NUTAx3RNPUYMw0repdvo0HVxUQnlCOtrvgPV21oyu9eVQiAAT
         1HqcMlKKCijekU7Rr12B6p+Ssfa6dOhgBzWhhxs+adrUw3HIkcGWiP43K6BzlbNWXZT2
         GzuBdc3XoWZ4ZxL6RpSkGbPdNTgCbrutN+3jwdNazzSKf5bxKP5EU6RXlEWwIJkXYgJT
         VGANgTdPNLix7jDDBhKDa9yBMmp5fcG/8zBlOI9B5nck6lov2kABiD7JmsJxOelBunrw
         1TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpJfuI4s21/vx0yeMdf+dEkCsnBrKSSZLAjrShsO6tI=;
        b=MVaqqOI0cKi6alIRbyGXoAUfj3J8Q/yyjwKMxMpUWM8dcqT5ejYKRC8SbnB8judpKz
         grb/7Av0CgCB3eWqQapVNOGZVrK4CLqb2+K2dzDWIPHonJYjtpxjri8hciWalLr4trch
         6MWUdp8DUxgJP5wFJBDP4FGgdcCXCIsOIfpEdk9StSD7SwY75keQRbNot7zkJnCYEDfH
         UgWwSZisX97vSFTG9vKagaA1Smr0vMclJME06e95xMUtW1bZ8736V7sDX5WeK6QKPztu
         BHnIX3cvm0DzmAIlv6ucL8u48vB8Vz462RA9TFR65Eketrdsw5to7DVjYJPu5QOhqjQx
         JwZA==
X-Gm-Message-State: ANoB5pmeJ5vQD4zKfvGo3NUalF8Y/KNPe8p5jVtKqWuP6popE0TMdVUJ
	HRGOUFW5QGEzsmVk8mxXrS8XNADmJW1/IDzn
X-Google-Smtp-Source: AA0mqf5CX7KeBObY6cqvaBDwMJpus+b3LwEjuRDNdnc6kWp4OVOYK0+91iM1ZD0EHrRcfJDlmzDDmQ==
X-Received: by 2002:a63:5d5f:0:b0:46f:fea7:4816 with SMTP id o31-20020a635d5f000000b0046ffea74816mr8598802pgm.532.1668348790144;
        Sun, 13 Nov 2022 06:13:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w34-20020a634762000000b0046b2ebb0a52sm4198771pgk.17.2022.11.13.06.13.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 06:13:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] sanity: check for GNU tar specifically
Date: Sun, 13 Nov 2022 04:12:44 -1000
Message-Id: <238993097826461a0f8bc2545c9383d8cfc0beea.1668348622.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668348622.git.steve@sakoman.com>
References: <cover.1668348622.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173200

From: Ross Burton <ross.burton@arm.com>

We need the system tar to be GNU tar, as we reply on --xattrs.  Some
distributions may be using libarchive's tar binary, which is definitely
not as featureful, so check for this and abort early with a clear
message instead of later with mysterious errors.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7dd2b1cd1bb10e67485dab8600c0787df6c2eee7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5c97effb96..f2b2e4dfaf 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -498,6 +498,14 @@ def check_tar_version(sanity_data):
     version = result.split()[3]
     if bb.utils.vercmp_string_op(version, "1.28", "<"):
         return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the project's buildtools-tarball from our last release or use scripts/install-buildtools).\n"
+
+    try:
+        result = subprocess.check_output(["tar", "--help"], stderr=subprocess.STDOUT).decode('utf-8')
+        if "--xattrs" not in result:
+            return "Your tar doesn't support --xattrs, please use GNU tar.\n"
+    except subprocess.CalledProcessError as e:
+        return "Unable to execute tar --help, exit code %d\n%s\n" % (e.returncode, e.output)
+
     return None
 
 # We use git parameters and functionality only found in 1.7.8 or later
-- 
2.25.1


