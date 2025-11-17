Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4600CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 17:14:39 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14762.1763399671054037000
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 09:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2cyvewvp;
 spf=pass (domain: smile.fr, ip: 209.85.208.177, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so39856851fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 09:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763399669; x=1764004469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qemv4dt8H+EzaQAka3QLVfTVPgyXCsqihKZinYtUqUM=;
        b=2cyvewvpMR69jonJm26Xoh8oo4zeKCMJh6caz7usi1e3U+ZxkjN0Xmet0FpZK8Pafl
         bS2Tk14l8RY/mjpxdP4NErD9c65rLBsFt6ozXbzpu4VETaFFMcXlcmebYMqlWGSLfZ8E
         vSibAcw4YzEH6EcBLKoMmAX5xRljkVCWsrHVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399669; x=1764004469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qemv4dt8H+EzaQAka3QLVfTVPgyXCsqihKZinYtUqUM=;
        b=P+p13YiGz7fFD7RlPnHEeuFXNXZcAXqMMpgYi88Ox/1BRI7CECpNib6/ugg3cv3dn1
         MCXNQxggQdFO35qteSB4SoKeNC5ocZla3WfT21ec22kUkKEoD4GSiKVh08DR/VeZ7s7h
         iBU0uYmoXgV5vGfZ16yNDCv6IEytlwbWrC5QHuNDcoHnRtTIU70wfJwgEN+/Giw7T/5T
         DYxz26KHlDxZSXjhjWbfoXIXk8QqYqkd71XwT2lFvZITVDC4n0XwBFvqbHkYZPO9LFTN
         BOsCqfvVXVY9X8rPc3Dya6Nz9rF1SpSRJqS18rSII0OCP5S655RTCM0Q08itSrjE9VK6
         u26A==
X-Gm-Message-State: AOJu0YyLFRG4vz79/Q3EGRD1IUMnFcHpzuKGu77wZk0z7hhzrWHJnSMr
	yD6IvpHLolIrB1weQsUBqlPag8XVReHOKoOn4HxkBvSaNRLEhVKo1qmKR8WxeLB4SeCvzjRwxfd
	w+S+CRV/6Bg==
X-Gm-Gg: ASbGncufTM2VI+j4YGVqbKEOKHj4w5Nkplwlo/BHfDZHjalKETd6/S1tpRQnHzOn8Q6
	kCY2OOBXFT9xBSSrvXTL+MPD2vh3T5v/2knJROKT97TCiDx6tTPo/u+txBkntUfOJwKMnmSYdzt
	sTySlNrTt3U271ORg/HlCJIPvS9o6R0Pzy463947vyrvG5nshe1M1WCrX2QYlOPJmraTFYX9IYZ
	cVp5lmAcDhe/13CHc6wW6p1BkPifZay1bmjcayEZY5iLmPn6olF6eWRkAzI6fYqa+Fy7b7NT4Kb
	WtO4RX55qoPBBk/7Wn+ocOmK9n0RQRvoRNQLgbGkM3SiTXkhsM0DG2vikRJLvNuag4pY/QDvni3
	Qxj+t+ahmM9NFmj/pvBnVLPmn4V1MSaY3CZUJgLNxckQaiJyMrVa/dnKhXD1cu7QrC2Sl7BIVOp
	2LgHiCLDlbhB04ss3ca2AF
X-Google-Smtp-Source: AGHT+IEdnFPzWJ5mOijmZAubT8h7cGfNH8cF4aUQvsMu1j3LnJSWMJ9EwrY7nXNYQOWIGSXSjIwKDw==
X-Received: by 2002:a2e:900e:0:b0:37b:aac1:282e with SMTP id 38308e7fff4ca-37babd5cd6amr30079871fa.28.1763399668865;
        Mon, 17 Nov 2025 09:14:28 -0800 (PST)
Received: from heaven.lan ([2001:861:3080:b0f0:8ab:bf5a:da73:c932])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce25408sm28748101fa.20.2025.11.17.09.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:14:28 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v2 1/2] insane.bbclass: check revision for every git URI
Date: Mon, 17 Nov 2025 18:12:22 +0100
Message-ID: <20251117171223.919666-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 17:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226504

Every git URI into SRC_URI variable should have a revision. However, if
the revision is missing (SRCREV), BitBake will perform a query on the
remote repository every time it parses a recipe.

This check will raise an error if a git URI is not provided alongside a revision.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
v2: add support of rev= parameter

 meta/classes-global/insane.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index fed8163c3e..63490ecf25 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1495,7 +1495,33 @@ python do_recipe_qa() {
                 error_msg = "%s: invalid PACKAGECONFIG(s): %s" % (pn, " ".join(sorted(invalid_pkgconfigs)))
                 oe.qa.handle_error("invalid-packageconfig", error_msg, d)
 
+    def test_git_missing_srcrev(pn, d):
+        sha1_re = re.compile(r'^[0-9a-f]{40}$')
+        for uri in d.getVar('SRC_URI').split():
+            if not uri.startswith('git://'):
+                continue
+
+            # Get parameters for the current URI
+            params = bb.fetch2.decodeurl(uri)[5]
+            name = params.get('name', '')
+            rev = params.get('rev', '')
+
+            # Revision is provided as a 'rev' parameter
+            if rev:
+                # Prevent any revision that doesn't look like a SHA-1
+                if not sha1_re.match(rev or ''):
+                    oe.qa.handle_error("missing-srcrev", "%s: ;rev=%s URL parameter doesn't look like a SHA-1" % (pn, rev), d)
+            # git URI has a "name" parameter
+            elif name:
+                rev = d.getVar('SRCREV_' + name)
+                if not rev:
+                    oe.qa.handle_error("missing-srcrev", "%s: no revision (%s) defined for URI %s" % (pn, 'SRCREV_' + name, uri), d)
+            else:
+                if d.getVar('SRCREV') == "INVALID":
+                    oe.qa.handle_error("missing-srcrev", "%s: no revision (SRCREV) defined for URI %s" % (pn, uri), d)
+
     pn = d.getVar('PN')
+    test_git_missing_srcrev(pn, d)
     test_naming(pn, d)
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
-- 
2.49.0


