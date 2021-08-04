Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.8566.1628082650633882086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 06:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YC/L9/5s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id l11-20020a7bcf0b0000b0290253545c2997so1428572wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 06:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3aI9sQbwocxnq0xtf7slJnTpMuClu3Wdd+xTCv9YmHA=;
        b=YC/L9/5siRUa+ulYEmJ+J5EEPJzpDPZKQrNBgdXj5d1jAtfINi5S453sPhkY9/PtgR
         v38h1+utjCZLAW9dPogJqXvhqxoiFSKVnYE9yCQYWUriWjEsiPl6ow6ZkL+zvwcXeMgW
         zwpactm0KeCfB69A6zooaqdzQlJ+xLam42dkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3aI9sQbwocxnq0xtf7slJnTpMuClu3Wdd+xTCv9YmHA=;
        b=jsZW1vsr8ay5P7a4AuxbZlIllU526E/yAk5QsMGzMpo8aUsj/3Ei1FLU9VNSXW4TiM
         uJvz0WDCIapWyRgiIxUXryPy48EalCQ03Jzlh2aoNhdp/U/wdOoGu04KpBFNgYDdyept
         EDccLmJyOgPdE5gTlvPATGtnZw2yWHfe1HPwb2ZvEwCTWlrX6F1eV48206yxCdh5ZGSd
         Dzkoy5RyGkAL5swW1kMeTYvnrUQiHn9WHyORoXudHC+sEvYHeaurbiTe+IWqv7Ejepk5
         IzZj31fckDH1TqMcDPJF5kgDgYLv81ZkF4F3U1fZYtzrPQCPD3M3dA0x47EHcJG4o6Lg
         b1CQ==
X-Gm-Message-State: AOAM533JUwfgF+KjKJOpCYMvmGfsjeTAPTM/wNnjTjxO64Bxc750U6Z5
	mqfSCMjWR12uqVSuh9pGOZmRsZQq2VHViQ==
X-Google-Smtp-Source: ABdhPJyYLIppBQqKi7waTsHUEYiiL/lvau0VbCnI7YXvuqqOkdKocOWkPXypaZ64uHNAwuATsNtlUQ==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr27508051wmq.138.1628082648845;
        Wed, 04 Aug 2021 06:10:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id y4sm2323932wmi.22.2021.08.04.06.10.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 06:10:48 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] devupstream: Allow support of native class extensions
Date: Wed,  4 Aug 2021 14:10:47 +0100
Message-Id: <20210804131047.3514984-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is useful to be able to use the class with recipes using BBCLASSEXTEND
for native extensions. This adds the magic required to do that.

[YOCTO #11449]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/devupstream.bbclass | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
index 1230fa12ea7..dc9a9472b1c 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -16,8 +16,6 @@
 # - If the fetcher requires native tools (such as subversion-native) then
 #   bitbake won't be able to add them automatically.
 
-CLASSOVERRIDE .= ":class-devupstream"
-
 python devupstream_virtclass_handler () {
     # Do nothing if this is inherited, as it's for BBCLASSEXTEND
     if "devupstream" not in (d.getVar('BBCLASSEXTEND') or ""):
@@ -25,8 +23,8 @@ python devupstream_virtclass_handler () {
         return
 
     variant = d.getVar("BBEXTENDVARIANT")
-    if variant not in ("target"):
-        bb.error("Pass the variant when using devupstream, for example devupstream:target")
+    if variant not in ("target", "native"):
+        bb.error("Unsupported variant %s. Pass the variant when using devupstream, for example devupstream:target" % variant)
         return
 
     # Develpment releases are never preferred by default
@@ -34,14 +32,22 @@ python devupstream_virtclass_handler () {
 
     uri = bb.fetch2.URI(d.getVar("SRC_URI").split()[0])
 
-    if uri.scheme == "git":
-        d.setVar("S", "${WORKDIR}/git")
+    if uri.scheme == "git" and not d.getVar("S:class-devupstream"):
+        d.setVar("S:class-devupstream", "${WORKDIR}/git")
 
     # Modify the PV if the recipe hasn't already overridden it
     pv = d.getVar("PV")
     proto_marker = "+" + uri.scheme
-    if proto_marker not in pv:
+    if proto_marker not in pv and not d.getVar("PV:class-devupstream"):
         d.setVar("PV", pv + proto_marker + "${SRCPV}")
+
+    if variant == "native":
+        pn = d.getVar("PN")
+        d.setVar("PN", "%s-native" % (pn))
+        fn = d.getVar("FILE")
+        bb.parse.BBHandler.inherit("native", fn, 0, d)
+
+    d.appendVar("CLASSOVERRIDE", ":class-devupstream")
 }
 
 addhandler devupstream_virtclass_handler
-- 
2.30.2

