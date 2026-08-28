Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C579C61DD9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2977.1787945892137537778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TF519f/B;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49557167508so12997075e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945890; x=1788550690; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SB4wRZg/UpI6tI8OEy7iSDck63+5lSCO+DZZ1/FmXeI=;
        b=TF519f/BXBsU1fQHDgsbFQKmdhARWqybXZTRey1n1mRR7v8j94Z+xsUoKLukon/jd+
         za+yZWeokvMYkm5pKMe7G98JmzpJZsw+l7oqzBNDQRX05Ml/Zho8bRjs54fT0sUEMyQ5
         pchCvDIcABKKMWyfpBiPiqctgy3FIcPE6NnUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945890; x=1788550690;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SB4wRZg/UpI6tI8OEy7iSDck63+5lSCO+DZZ1/FmXeI=;
        b=XBHQ/ggBOLRLF3xlewlWkdoKwprkyOZEtnbz81rpwLioFANfcMJY9erD8VNRk5bZBW
         q0E5HAKzREsdt80bR+HPzCxf7jNmnx9IHgAU5v2fPwLiR2MjRdUy9aVR+aT6v9rSU69E
         9IiGg+Wg3SvcALnPh2Lx6nDNTwVELhH3/A2ZzAVYpkfJa3CJTNj36OCBCvvPMHhLxNq4
         qn222lEWN4O2XA5LKpiBbPhEfesaLe1cBlib0UdruA9J1TGT58VIr/QtAcIqAnlaDpxq
         KHWk5balrp3V6yDQxHEwOxLI2qzYN8+AjphjJqDfLqB41RFsJqJWTMxkX9h8HU6J0WsN
         Fu8Q==
X-Gm-Message-State: AFuF++kr6BerjifQLyOeD/CHlqfJ0Zf+bfik/8VraGTNzV02EvaR/BU1
	8OkT6r4pvgr7LhiptOEfjLVG9SlTXy/nEeTLav7fM+rcyRDbLL7xGzr5h3qYoX4QWy/A2+kttLn
	OVyO3rn4=
X-Gm-Gg: AR+sD136KbX8MO776k7CuuuVlusk1jFAa08nHraMnqjQhJBdNfViJcpakLaj5c7KsuO
	gyXt9rnEXgevahyQrS7+DuWW8EZN7Ilbu6TwFHWm0NNcpxCrorV/cJOF29T9TBgU+BZ/ttNqsZ8
	/7kRUCgm5QzCvN7gs0+jXg2kjljdVZ95sKyENzN2lHFhyulmmFd2qB2NKqXOUisrF/M+czq4an1
	aLNB/xszkr8dAoQ761ZVNEKmh50OpC0ARv4PqDxB3+fNJQl+90boHSQZskAdAjU8lvhAmMHF6SB
	VuFTpnTnEQ5nsDr79F7vc+LES/JUiCzYL+9mJtx0g/ZYsCURMpddNFYw4PJTosUOSDs1wctwXtg
	4L68kZ3OnFDI/1dlsIPhqphnktgkDWg2wl987LZtvgJCCmXZJPHlIyrHBy0XQ5/cHCPT7dfN5jy
	sA/sAxT8LN+G048trCYL7WCFA5uk3td1vj2zSm+mWnNpL2rh41YLw4usaAIbrWy0f1ZntG+W0U0
	lY4PChfz79mlmBVl40PXHJgHDej9J58PZzwWrGgvgeBuRE0E3R+IH6+8pQg55NBDa8QZfTzJLg=
X-Received: by 2002:a05:600c:19ca:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49b91c47b3dmr134574075e9.11.1787945890338;
        Fri, 28 Aug 2026 12:38:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/56] patch: Fix CVE-2026-56288
Date: Fri, 28 Aug 2026 21:35:21 +0200
Message-ID: <08d5fa0d5e582e6543e79f0eace2687edcba4568.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244572

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
 meta/recipes-devtools/patch/patch.inc         |  4 +-
 .../patch/patch/CVE-2026-56288.patch          | 75 +++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56288.patch

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 738bec038dc..a9675d53b45 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -6,7 +6,9 @@ SECTION = "utils"
 HOMEPAGE = "http://savannah.gnu.org/projects/patch/"
 
 SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz \
-	   file://CVE-2026-56289.patch"
+	   file://CVE-2026-56289.patch \
+	   file://CVE-2026-56288.patch"
+
 
 S = "${UNPACKDIR}/patch-${PV}"
 
diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch b/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
new file mode 100644
index 00000000000..7219f5a3c7d
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
@@ -0,0 +1,75 @@
+From 101a805510356092a6d2a864bb18d440fec57f0a Mon Sep 17 00:00:00 2001
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
+index d9f5c61..41150fe 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -1694,7 +1694,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    p_end = filldst-1;
+ 		    malformed ();
+ 		}
+-		chars_read -= fillsrc == p_ptrn_lines && incomplete_line ();
++		chars_read -= (1 < chars_read && fillsrc == p_ptrn_lines
++			       && incomplete_line ());
+ 		p_Char[fillsrc] = ch;
+ 		p_line[fillsrc] = s;
+ 		p_len[fillsrc++] = chars_read;
+@@ -1711,7 +1712,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    malformed ();
+ 		}
+ 		context++;
+-		chars_read -= fillsrc == p_ptrn_lines && incomplete_line ();
++		chars_read -= (1 < chars_read && fillsrc == p_ptrn_lines
++			       && incomplete_line ());
+ 		p_Char[fillsrc] = ch;
+ 		p_line[fillsrc] = s;
+ 		p_len[fillsrc++] = chars_read;
+@@ -1725,7 +1727,8 @@ another_hunk (enum diff difftype, bool rev)
+ 		    p_end = fillsrc-1;
+ 		    malformed ();
+ 		}
+-		chars_read -= filldst == p_end && incomplete_line ();
++		chars_read -= (1 < chars_read && filldst == p_end
++			       && incomplete_line ());
+ 		p_Char[filldst] = ch;
+ 		p_line[filldst] = s;
+ 		p_len[filldst++] = chars_read;
+@@ -1808,7 +1811,8 @@ another_hunk (enum diff difftype, bool rev)
+ 	      fatal (("'<' followed by space or tab expected"
+ 		      " at line %td of patch"),
+ 		     p_input_line);
+-	    chars_read -= 2 + (i == p_ptrn_lines && incomplete_line ());
++	    chars_read -= 2 + (3 < chars_read && i == p_ptrn_lines
++			       && incomplete_line ());
+ 	    p_len[i] = chars_read;
+ 	    p_line[i] = savebuf (patchbuf + 2, chars_read);
+ 	    p_Char[i] = '-';
+@@ -1833,7 +1837,8 @@ another_hunk (enum diff difftype, bool rev)
+ 	      fatal (("'>' followed by space or tab expected"
+ 		      " at line %td of patch"),
+ 		     p_input_line);
+-	    chars_read -= 2 + (i == p_end && incomplete_line ());
++	    chars_read -= 2 + (3 < chars_read && i == p_end
++			       && incomplete_line ());
+ 	    p_len[i] = chars_read;
+ 	    p_line[i] = savebuf (patchbuf + 2, chars_read);
+ 	    p_Char[i] = '+';

