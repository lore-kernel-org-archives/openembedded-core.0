Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA45C433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:29 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.2836.1668262227315437950
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JnmqvcNd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id v17so6444305plo.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrZ3+jOA/KgWS6rwNU3D7RUl077QPn6PwAiTrVVWjCY=;
        b=JnmqvcNdzaqrhbfYP1mVZgQdravZRqqczxK80oEuBnylRVUF8iv8Y2xZXaO9hI/3WE
         RVdimB3ysMAK7h5FMbFXiQNFJN4Bz5e+9kkR63cA473eb4koFH9h5pp5QUjiJeMgO1l5
         Th6vVmj06yaW/6nA4G/U8snmw/ywZEWr7etY3uicL8HlbxxwkTLrPTzRAhcul4vLn2DL
         fbvC1ewLl/baPP1JF/Xhl81VbjHdHCRL3PeI/T3bYJsey1rDxXNOenizh+8st5k0fm0i
         G8oNesNvof7UFFIPRbxR4/UaUyCZ+ytEly/3KjlewRBhQtT1LXA1YnEtHkvNba91YCSn
         J98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrZ3+jOA/KgWS6rwNU3D7RUl077QPn6PwAiTrVVWjCY=;
        b=uwSseGz6fw0zuKSkEh4xV97FxSTmhM3H1IQQZM5mFdhXTzZTSWBrvv9TWDDQJ0Kycs
         BvaVIHNJj5pDBnUvGwAa6bJ45WMhcP6v5+uHnf//Wknuxb0EFjQqQYWHC340nSSvxshS
         lSM+JX2bJWWDOyQrr12CV90ayEZD3y4CQuHxX/5URd3aFcy7afHRm66zIhIAEOm8fCat
         C2H/XMRe7ON+Ay/Vel1kyJ/1rZOaWiqCNnNWr+0BePOsB1YHXYxARpR//pxTkasrX/Px
         3yIlcT0Ac85zOkxU+q7tFe1fEDbEhUgYApquKxetNpT4B9pzgU3UhAe54JXG5HsDTSmp
         atgw==
X-Gm-Message-State: ANoB5plF8EpPrNNyQAwPHLLbehuD50NxdxCtXKqCDYz20XfV3yFRtB6v
	41K9hrPJekgpfeODcoquPaIZYgM1uHVZ8A97
X-Google-Smtp-Source: AA0mqf45RrmUYgkJRqG0T/K/NF6vkwzZOppvD888yw59V8QauJI0kGuWkOPwZnq7a963ebn8p+zmKg==
X-Received: by 2002:a17:90b:2750:b0:212:c87e:dc8b with SMTP id qi16-20020a17090b275000b00212c87edc8bmr6599955pjb.229.1668262226312;
        Sat, 12 Nov 2022 06:10:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/11] sanity: check for GNU tar specifically
Date: Sat, 12 Nov 2022 04:09:58 -1000
Message-Id: <8f852648fe730615c99bcdaace8a4748ef4e96a5.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173159

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
index 37354af9d5..33e5e5952f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -561,6 +561,14 @@ def check_tar_version(sanity_data):
     version = result.split()[3]
     if LooseVersion(version) < LooseVersion("1.28"):
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


