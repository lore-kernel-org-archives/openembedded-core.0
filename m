Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6721C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5548.1788326837793506149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HledwrnC;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso3711645e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326836; x=1788931636; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QN7MDTL/f7+pm94+Q5/15el1JwGtzF10TbfDrMABNOQ=;
        b=HledwrnCm3AXkIihxYQFW+kT3hx30Vh1swd4wYYwQRYxkc24tVCknoHdawyFpjQpM3
         5MZuKecg/dskEYVRSt0e9QC3SxrWImRtX+wKAjb0K+Gx1FR7myu3FLsfqAna06MZavJj
         36WTcPROY0Sbz55oKv2jFjVFNbEypNe/5rluQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326836; x=1788931636;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QN7MDTL/f7+pm94+Q5/15el1JwGtzF10TbfDrMABNOQ=;
        b=ZoeFhcv1Gt0iM5ObLji6YbfUYnK80NgCc8hLdUNNYBiVvD7BXOAuCi38p3RtzG24lZ
         +EY3KSdBogyuotDcQOI49/Ocyh2VtLZyiMAZlJtWsbR5XWft/sw/nDMWkxILvd+f858O
         1hsdekSQa5nojB8R8p35cdWAoH0uMP3VXOugs//k7W6CGW29LlZg5eHUpkifh28EDrey
         YXQgsPurAzxacTrV7ne9+NrLjWLz7A7M/5zQNhzt4ylfiYBUwPOiJuVipb8IFKEvokKI
         TuxKGRAjRIqH9phFw8EPrOv9bahT/VSzeLBbzoHGHtlqOt1hVe+XGo66nTNmy4DqFBbg
         8Kxw==
X-Gm-Message-State: AFuF++kAZ2asfAtSIQN3uiDMxMLrbEe8fajjwkaUIgSKUiOCxTEh4CBT
	NWspaayy3o9suP7SIy7SyRcEboLhuTw6m1eBdV4CdqvF+6v/j68ewuoM8wkFVIYEF0w90/DopcT
	G4xME/Xo=
X-Gm-Gg: AR+sD12NgwIwC+ug/80uXzR9e95Mh8ag5jYNoXXk+H90AQVoGzEgDVaV4Fztv2GwMHI
	mAm1+xeKgIP2PVr8zhdeLoKkGlXdC07lSSPg5fc4AVYz3lEvAdJlVjA9Fkt1HopV9x+/MTgt2pn
	RKLXf0q/YVAz7ca7BemF0LlLSdGc1ZZsjzPIXJZS0GbLFk+3LRvNdF/GZojJOob47CROPj8huSz
	EwMDVAh13RAcp/EYBprtfyaLiZkVQtiEX2zSfrzps1EzmCO3XfUyrnX27O65oWBOLx40fG2GltB
	JBdYcDuzxZI5+p3FOWqRB81OsEUtntFa+WLP7TLEfS0n1BJX2dQA/TyeQ0s8xXjqCv/TyMhOtfC
	z1TcH+yT/nY3LFf5EiA+sdrOkbv525l7kAWI582SjyY1TqSGzDbWLpX7EDbg+/eJFz7355+4XV3
	HxBm6WnGJ7LjbrXGIu6cH1UrMWFUdjdkytsAOrxHKfrpBU6iHj0okoq1aQdfzqoysgejTgReGZz
	Oym57hJyV1eMi+oZQ==
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49ce5842935mr41312845e9.9.1788326836061;
        Tue, 01 Sep 2026 22:27:16 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/27] patch: Fix CVE-2026-56288
Date: Wed,  2 Sep 2026 07:25:44 +0200
Message-ID: <1b1e13055b4eed838e1411d91dea46de08e1d72f.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244878

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced by NVD in [2], using
the commit shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=e6d6a4e021660679d7fc9150f981d4920f722313
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56288

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a30cd69993f9f48d5cf55e57181e49171f0a1b7a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../patch/patch/CVE-2026-56288.patch          | 75 +++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56288.patch

diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch b/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
new file mode 100644
index 00000000000..03e1211f2ed
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
@@ -0,0 +1,75 @@
+From f98fd4b5f696d1fcc9d86f81555370cf4b21150f Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 21 Apr 2026 10:05:02 -0700
+Subject: [PATCH] Avoid null pointer derefence with bad hunks
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Michał Majchrowicz.
+* src/pch.c (another_hunk): Keep chars_read positive
+even with malformed hunks.
+
+CVE: CVE-2026-56288
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=e6d6a4e021660679d7fc9150f981d4920f722313]
+
+(cherry picked from commit e6d6a4e021660679d7fc9150f981d4920f722313)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/pch.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index 6f9f36f..0a31f72 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -1728,7 +1728,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    p_end = filldst-1;
+ 		    malformed ();
+ 		}
+-		chars_read -= fillsrc == p_ptrn_lines && incomplete_line ();
++		chars_read -= (1 < chars_read && fillsrc == p_ptrn_lines
++			       && incomplete_line ());
+ 		p_Char[fillsrc] = ch;
+ 		p_line[fillsrc] = s;
+ 		p_len[fillsrc++] = chars_read;
+@@ -1745,7 +1746,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    malformed ();
+ 		}
+ 		context++;
+-		chars_read -= fillsrc == p_ptrn_lines && incomplete_line ();
++		chars_read -= (1 < chars_read && fillsrc == p_ptrn_lines
++			       && incomplete_line ());
+ 		p_Char[fillsrc] = ch;
+ 		p_line[fillsrc] = s;
+ 		p_len[fillsrc++] = chars_read;
+@@ -1765,7 +1767,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    p_end = fillsrc-1;
+ 		    malformed ();
+ 		}
+-		chars_read -= filldst == p_end && incomplete_line ();
++		chars_read -= (1 < chars_read && filldst == p_end
++			       && incomplete_line ());
+ 		p_Char[filldst] = ch;
+ 		p_line[filldst] = s;
+ 		p_len[filldst++] = chars_read;
+@@ -1852,7 +1855,8 @@ another_hunk (enum diff difftype, bool rev)
+ 	    if (buf[0] != '<' || (buf[1] != ' ' && buf[1] != '\t'))
+ 	      fatal ("'<' followed by space or tab expected at line %s of patch",
+ 		     format_linenum (numbuf0, p_input_line));
+-	    chars_read -= 2 + (i == p_ptrn_lines && incomplete_line ());
++	    chars_read -= 2 + (3 < chars_read && i == p_ptrn_lines
++			       && incomplete_line ());
+ 	    p_len[i] = chars_read;
+ 	    p_line[i] = savebuf (buf + 2, chars_read);
+ 	    if (chars_read && ! p_line[i]) {
+@@ -1897,7 +1901,8 @@ another_hunk (enum diff difftype, bool rev)
+ 	    if (buf[0] != '>' || (buf[1] != ' ' && buf[1] != '\t'))
+ 	      fatal ("'>' followed by space or tab expected at line %s of patch",
+ 		     format_linenum (numbuf0, p_input_line));
+-	    chars_read -= 2 + (i == p_end && incomplete_line ());
++	    chars_read -= 2 + (3 < chars_read && i == p_end
++			       && incomplete_line ());
+ 	    p_len[i] = chars_read;
+ 	    p_line[i] = savebuf (buf + 2, chars_read);
+ 	    if (chars_read && ! p_line[i]) {
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 74d9085c6b9..53e96dea0f8 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
             file://CVE-2019-20633.patch \
             file://CVE-2026-56289.patch \
+            file://CVE-2026-56288.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"

