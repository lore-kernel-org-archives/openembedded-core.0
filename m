Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8E3C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 14:11:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.8701.1634134290973830248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 07:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hi6z/Uwv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id e3so8747669wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ylN3bcBoi2Nv/TWC1wDoC2B0q/SmuNmbAFioS4zELRA=;
        b=Hi6z/Uwv7pzy0gk8IYUpcY7/cV8Aq5dLxj3fk76qLGs5LSMWmmU76Ahg8yxa3cDj6Z
         6q0+DHTgpuy9O9LoAtRqIi4lmq+ko5iwBVPZvVjlcZGYQ3vlEz4VsCuZCGMJq2+xvQeq
         7QvY8bysUf6kMIxpf6quHvKcwr4vX5QQAan8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ylN3bcBoi2Nv/TWC1wDoC2B0q/SmuNmbAFioS4zELRA=;
        b=PqLd/nMC9Q3IuOX5PCp7bXbMCNyiJJDu9K1wFzUxBA5UsJOxJzLONv46JRizcZRZ7N
         JY6c4l9oPtjUAsjmPqShfmIi8KNP1pgy4ZX/hubH8yfvdl+0wL9iwNcfOAeR4QgEJth2
         BaaGBaWc1GjhaSg09tb1WSgAI/j0Voq2aDOxm+oGwbOJD3nht4jJ1+vepBdBkaBl15J5
         PXb6ZjNPABFzKknnqYRIBT789JyN+jrOj4P5hAS9NrNu641+7CT2t3EoYHp214VVP3yF
         bUEx/aFHNnZZOsYx3BS/HZ+hsoFSNGlaZJyry0eNkOakmyoVGX7uX+GIGUK+K/XPtvCl
         NCuQ==
X-Gm-Message-State: AOAM533p120gSt2OCKKbZQcMnMyuLSBlJ4wLhr0Nxj+Xn0H0kviicImf
	y94F6efjMKNGRRGVmNkaslRvDKlx6wvpJg==
X-Google-Smtp-Source: 
 ABdhPJzexhUPu3mSB8xaQUKKjank6D7Ee/fCUscIndYRo2cJgnyyyiMQiJ1I8F58K80jfPCaHHvT6g==
X-Received: by 2002:adf:bd8a:: with SMTP id
 l10mr39884704wrh.159.1634134287922;
        Wed, 13 Oct 2021 07:11:27 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:65b2:89df:e6ae:44c4])
        by smtp.gmail.com with ESMTPSA id
 l6sm5912830wmg.10.2021.10.13.07.11.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:11:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] base: Clean up unneeded len() calls
Date: Wed, 13 Oct 2021 15:11:25 +0100
Message-Id: <20211013141127.2870066-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 14:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156911

This code pattern isn't very pythonic, improve it to drop the unneeded
len() calls.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 340ebe7d789..35a5e683033 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -153,7 +153,7 @@ do_fetch[vardeps] += "SRCREV"
 python base_do_fetch() {
 
     src_uri = (d.getVar('SRC_URI') or "").split()
-    if len(src_uri) == 0:
+    if not src_uri:
         return
 
     try:
@@ -170,7 +170,7 @@ do_unpack[cleandirs] = "${@d.getVar('S') if os.path.normpath(d.getVar('S')) != o
 
 python base_do_unpack() {
     src_uri = (d.getVar('SRC_URI') or "").split()
-    if len(src_uri) == 0:
+    if not src_uri:
         return
 
     try:
@@ -693,7 +693,7 @@ python () {
             if os.path.basename(p) == machine and os.path.isdir(p):
                 paths.append(p)
 
-        if len(paths) != 0:
+        if paths:
             for s in srcuri.split():
                 if not s.startswith("file://"):
                     continue
@@ -726,7 +726,7 @@ do_cleansstate[nostamp] = "1"
 
 python do_cleanall() {
     src_uri = (d.getVar('SRC_URI') or "").split()
-    if len(src_uri) == 0:
+    if not src_uri:
         return
 
     try:
-- 
2.32.0


