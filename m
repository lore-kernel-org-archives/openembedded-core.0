Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200A2F55126
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:17 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19047.1772923992742376332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:53:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rdedFA5t;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so7080231f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923991; x=1773528791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrXin+/BxoEdBjBVSUTfE+iM5flf4TUK2XcBa2YBdIg=;
        b=rdedFA5tIT896fen2mC48LTfmGpdSzIM6cyEANY6faR8UUQXMKl0r/lKo88+cHkPVX
         N3IqP5L9Rg0naVbtR902//R4C3wfZc3GU7shInmoOu7uO8awFPkXaDKRrDQupPnT4Sbb
         mWD+EThPmQPKr5Z4oPSbcTM+xMmFX4V8QrNHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923991; x=1773528791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrXin+/BxoEdBjBVSUTfE+iM5flf4TUK2XcBa2YBdIg=;
        b=g40iqthz5279AdrPZuyhqN4a4mqNVRlxb87/rFMNWfgFCDLXCL2NL4iIAu2ZybJ0ff
         kAt81tOgnh7p0Z8ZMAnPZJtzYrP9msD2n2QeDZ9jt4atdHs1eTa9pKEHnqkvE/WYEaGy
         YzcCQZ/biLDMRgCOmk3aOt439MmyzOLPStyYuotY498igZO1c0G7Sn7/J0dyHKDbWrcf
         vzgfnD6/dpFsap3JFy2SeN0KWgMWrSnRy/EUNvg8fYWUUJSBn9EeDzBzvArRRHNe+Gkb
         pMcK6TDv6Gv5NQuyPDOvkZIzJ19vWCelUdqvw166nYtcnKspdLpF3Pz6pctZCS7A/lqs
         2sZg==
X-Gm-Message-State: AOJu0YwFF+xviQB2weBm9MkOCygDr3NoG92FAuxnk8kixGBqV1m4XVE1
	yVX1WIouAoPYyDOD6G81VVt9o0S0WPqp0gSG6AgO2g5BUM9KO3dGjBcdP/BWO2RSJp33GQRltbr
	OBxDc
X-Gm-Gg: ATEYQzz/hFylmWo5zzaz3oV8gArxslzEAwX7R7uVKomvld1dIaox0Mhv+zWPh/6IVdV
	HqKN2h4LvNVMa18tDieo3BRKBzQOmSWSTSeSwvmGVtXBNBSDQOGhtfCMQijr7uUYdNTFT4YdJEp
	znJpFUVrYG30o6DUmZE9/Tj0gDKyXSBmlL6rfPzTfjrQwbmTQVO/xmZ14MYW48wSeh6ssIxvn5l
	mH+S3xkvhbyiIViAsG7Zq9+fYVehPczL0tRLT6TqHQ+HgeXDqRHCYP5HorL7wO1DImCRq0JKKV9
	a2Boh9fTWz4nEIfdBXQzoKeN4p+52MqzuyHsKyIM3zBTuuyR+COsPd+FegaIgy73zSWOrBYru0k
	V1rl7kc+ZfsaBYVJiPsLRrp6WE3jPfObWa21FmfupWheXyn16tHzdRe1B3PBzStS/mRICrPMLvT
	D4WYwi+ce1wovtifcSnQsoWGG1WmN53apWPmFPOXI4jt5V0DbjM/wNvE23H1A3MJrK5Uk3KDn4a
	ALCO7BSWBqW3JX8u05S1aKq4SQ=
X-Received: by 2002:a05:600c:64c7:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-485268bd694mr120904695e9.0.1772923990921;
        Sat, 07 Mar 2026 14:53:10 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.53.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:53:10 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/11] create-pull-request: Keep commit hash to be pulled in cover email
Date: Sat,  7 Mar 2026 23:52:27 +0100
Message-ID: <f3ab36d30e3661e5968969ba70967e1b4e365413.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232635

From: Paul Barker <paul@pbarker.dev>

The cover email mangling in create-pull-request was cutting off the
actual commit hash to be pulled, making it difficult to verify that the
changes a maintainer merges exactly match those intended by the pull
request author.

The extra lines we want to include are, for example from a recent
whinlatter stable branch PR:

    for you to fetch changes up to 6c4c6d39ea3202d756acc13f8ce81b114a468541:

      cups: upgrade from 2.4.14 to 2.4.15 (2025-12-29 09:49:31 -0800)

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c78f5ae4a5ba3675b78cc226feb7b9fbbfd8da19)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 885105fab3d..5c4414ecd5f 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -219,7 +219,7 @@ fi
 
 # The cover letter already has a diffstat, remove it from the pull-msg
 # before inserting it.
-sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
+sed -n "0,\#^----------------------------------------------------------------# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
 rm "$PM"
 
 # If this is an RFC, make that clear in the cover letter

