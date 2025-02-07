Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2A1C021A1
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:04 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.1173.1738966022197374447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V9bR0mDi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f61b01630so11639495ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966021; x=1739570821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FUWPbFNIunOGajG0n2TeEhrV0ES5gurAcgRBL1o4Kw=;
        b=V9bR0mDit07FztVbX6xxkSZ2WMlP1Yjtgz2hKb33MRtR4EJwj+22zujsyWHOoX554c
         fgWpkfQijI3cS+Tni2U4gtORdBGpV0aaL7J4snrQgJPcTYLyAyEjwsBeZP5INB2Br1MG
         lip1RnwpOxv5dSdXQ13ASbREIL7O9zuUj9UUJspCWoUd461n3K4enImsz1sOE+i1CNP5
         OGwfgCx7VHr1Dnj7A74n5vH8DM4XHh9KQDkB1jbMOhjT7LP3kLWNEQBkKqwpL5OxI0B7
         4rj5NoSSPqwchDZJDwADnJoUi7iLKOjffAenAAGEXNI6nvB4o8WCzTWaUO+BTf9sG578
         yL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966021; x=1739570821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FUWPbFNIunOGajG0n2TeEhrV0ES5gurAcgRBL1o4Kw=;
        b=aNUCB9XXMeSAK7iRzIl9/MvtCBj2Tf2UCoHuPRgznik1mIHrS6hJqPp8Je8YTho8mp
         lapVY1piN2V339WwIJneiUAaefs04E7oU/RJDqRoj0go6c/HHmqd3+cK4DXb8nnqqsSP
         lajoFhsBX4VektyKqKd3bvbrxTuEgjOPLvJv8fp6DX8s5hwwPhemQcNiaf33j6Ka/QJN
         OrnOcv5pnDEIJZ00NTTDcJAAgxOZMn+2zFRqvtUcEmVUYO8a+wVNBwFDLwbGmH8J+tG8
         okTrVcpGe3Ey+QoIxHQXWopY+Bh96dNgR2zwujDI5f1wkQs/n9hwSXxKTZ8lzU3a7VIt
         N/BQ==
X-Gm-Message-State: AOJu0YyzH9GRVHP//HIykzEcMJ58piqiXVucf+3v07ud1mAGpxMZuuJy
	nwXmp15ERCGuKEUX57sfMObY5CyWbioyzphFhEehX+39O979eJyeJKxsQ8Hgc97HCs0UL2nCySV
	Q
X-Gm-Gg: ASbGncsYMuZwNvc3FZUYeYA7uxz+EqT9dnHjDq4x2zOlA6w/5RapCCqPXapjvowZs1j
	lu/0tBPbTYKjowL7iuxEoQ3/jj/URZ+1VOAEDnMn2K63xcb5V1PzVo/51T9Kh3U7CfwDdgLXqTb
	aBhQdppxpzgzFdFZrYXPwKWTyv9P4yp46I+fC+vop0u+J9qtHu9Ncgc1Wunn0ppwBv771n+kKkE
	z68U/9BsXv28NeIjyBeDkKkzYftC43gR4bABFOtu5gd06Izfad576MRKPhjhPnK1a55Wr2M6ho4
	Ny5v
X-Google-Smtp-Source: AGHT+IHpBhVNpspzmAoqXEPp2lXqEZYL3Byq+sH0hLCexFEoB6hzKn+za7Oert0YvLz78LLlgtVl+g==
X-Received: by 2002:a05:6a20:d48d:b0:1e1:a920:225d with SMTP id adf61e73a8af0-1ee053cbda9mr6749152637.19.1738966021386;
        Fri, 07 Feb 2025 14:07:01 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.07.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:07:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 03/12] cve-check: fix cvesInRecord
Date: Fri,  7 Feb 2025 14:06:44 -0800
Message-ID: <0fb2bfb8d6c77009385d7deca2e758bdee5c9b07.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738965898.git.steve@sakoman.com>
References: <cover.1738965898.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211002

From: Peter Marko <peter.marko@siemens.com>

Currently flag cvesInRecord is set to false if all CVEs are ignored or
patched. This is inconsistent as it shows false if a CVE was fixed via
patch and true if this CVE was fixed by upgrade. In both cases the CVE
is valid and was fixed.

As I understand this flag, it should say if any CVE exists for
particular component's product (regardless of how this CVE is handled)
and can be used to validate if a product is correctly set.

Note that skipping ignored CVEs may make sense in some cases, as ignored
may mean that NVD DB is wrong, but in many cases it is ignored for other
reasons. Further patch can be done to evaluate ignore subtype but that
would be against my understanding of this flag as described above.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5d499693672ec9619392011b765941cf94aa319)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 33d41b912d..6e10dd915a 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -343,17 +343,18 @@ def check_cves(d, cve_data):
         for cverow in cve_cursor:
             cve = cverow[0]
 
+            # Write status once only for each product
+            if not cves_in_product:
+                cves_status.append([product, True])
+                cves_in_product = True
+                cves_in_recipe = True
+
             if cve_is_ignored(d, cve_data, cve):
                 bb.note("%s-%s ignores %s" % (product, pv, cve))
                 continue
             elif cve_is_patched(d, cve_data, cve):
                 bb.note("%s has been patched" % (cve))
                 continue
-            # Write status once only for each product
-            if not cves_in_product:
-                cves_status.append([product, True])
-                cves_in_product = True
-                cves_in_recipe = True
 
             vulnerable = False
             ignored = False
-- 
2.43.0


