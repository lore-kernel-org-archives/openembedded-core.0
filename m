Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.9202.1588607582387258173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 08:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qq/Cp+tC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id v8so338737wma.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 08:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOsmcdUaetP4YHtII4JdiELkNobgelM5M44v+GDAfQQ=;
        b=Qq/Cp+tCWBUNPwy9MWKbYo7dXOMyrpPuw3KBgjYKQWhK5zkKzNseQ4dm40JKCQtBvz
         LjeSVssdzAVgAuD4vAT+KkU8XYl02zdywV34zOHp8JBdMLysMCK97IjhehW0+WPLDjnJ
         fvgQd6A4/o0PakHiKdfokq71domAfhm0HfTjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOsmcdUaetP4YHtII4JdiELkNobgelM5M44v+GDAfQQ=;
        b=mrpFwtOTLNo7Fkca+MNRePPd4pVtLDNuDJKl9UHouejzFmzQLjSf94wvzT0MLXu1CV
         ldkRYmx+g7ShrggyntFHQbHqS2mAG4yrN0kCBW+quEGG5Sgig5Acrf9xIhtj8QNvT+Qd
         aCx1ls5auyBeF0EqSuOK+H8aD8Z4ciGdsxrZcEwD0vrOOrGvmJdj0jNKZJmNNHiIidga
         4l62MQyFdvwe4TGE+2vH7tha0PC8I4FkISxhrcBqhqncX8sNLZvQvESNSdVO9AAoSGCd
         9kW/MLixKfsrxP5QW4PyS8RJLHGWe/+Hz/6R8DwUmO6KEKvOy8VJsqmCuHRa4kyEWUvZ
         W2zg==
X-Gm-Message-State: AGi0PubV1BpWbFskgkXQY5fCniTFo0B8NlX7KL/SlWWfbVj9cn6c7r1+
	QKrbM/oUOiAwzhKkmnWVnLfP4KZOZoc=
X-Google-Smtp-Source: APiQypLIj1zeXfqslpyLrGIUHWHsSCFCi47dyWxlJkVR1UWHWCLd2YzrHnBFMRJwoshfAWEVn0Hp1Q==
X-Received: by 2002:a1c:492:: with SMTP id 140mr16253598wme.9.1588607580425;
        Mon, 04 May 2020 08:53:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v7sm651266wmg.3.2020.05.04.08.52.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 08:52:59 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] utils: Drop is_machine_specific()/machine_path()
Date: Mon,  4 May 2020 16:52:58 +0100
Message-Id: <20200504155258.3231675-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There appear to be no users of these in OE-Core and their functionality
is questionable at best too. Probably safest to remove that entirely
at this point.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index c32b868aa88..120bcc64a64 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -1,20 +1,3 @@
-def machine_paths(d):
-    """List any existing machine specific filespath directories"""
-    machine = d.getVar("MACHINE")
-    for basepath in d.getVar("FILESPATHBASE").split(":"):
-        machinepath = os.path.join(basepath, machine)
-        if os.path.isdir(machinepath):
-            yield machinepath
-
-def is_machine_specific(d):
-    """Determine whether the current recipe is machine specific"""
-    machinepaths = set(machine_paths(d))
-    srcuri = d.getVar("SRC_URI").split()
-    for url in srcuri:
-        fetcher = bb.fetch2.Fetch([srcuri], d)
-        if url.startswith("file://"):
-            if any(fetcher.localpath(url).startswith(mp + "/") for mp in machinepaths):
-                return True
 
 oe_soinstall() {
 	# Purpose: Install shared library file and
-- 
2.25.1

