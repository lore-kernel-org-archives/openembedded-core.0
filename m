Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D804D5B141
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3019.1765620143249627060
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LsRgxDXf;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29f0f875bc5so24830805ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620142; x=1766224942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyyO6CF0xqv/pHda6rWck4hXJzvdVnqnnp7cZ6IEF2A=;
        b=LsRgxDXfsYbM9gn46Yn1QFzAVGoZuuf2csY8Xzej8mxITuxLdxcWorCr8nGatlcjHm
         GisdjObRA5D5LbLP3dyB0PajWmy8oVFChWRsdk016mgRlkLyAhOWRQB355HHqUvYTYsf
         VTECQ/9HR9q5oScTC3rIIgCq69PSYO/gltKQAtXEctCl7uSIH71/UoWGAcTVxIf1CDbk
         bUr+CqMxXbfzS3s5VZaGuTHBHj7Z5LlULjN/qR6NIC/r8wsxMPaYW2z6e6AN2V4DgYPa
         LZB5DQTPUDB9I0G4r1AbXY/17clH44kSuycREbMZAD61KEonl8vNbHTGZmpUtMQmdyCR
         a6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620142; x=1766224942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XyyO6CF0xqv/pHda6rWck4hXJzvdVnqnnp7cZ6IEF2A=;
        b=Uco8BknZ7nXBIHh48K9JNVbB/txh7GJjVsk24RX/d95MgzvdwnXNlGnHBh1sugkhP8
         4XUGXj3kZM06JoI/sxSsCmTRZNdwJd4iag01hsnGUu/FeZ39uINx7hyliFmqyCBFIi3E
         5Zg2l6spUbcKzcw/KmD0XBDD62TR7BMqBjnr/YHFos9kf2nwDB4aByoUenIO/ycKVQea
         cbZ4H4kFkMZl8Zp32RkSYFU8D0/W3q3V8b3BMJSiPt9vGhgcsL06JJDuo1cSZtBmgbry
         7tTMq56RQZ+Cxyuh172Luqb42F7WvAg0bx0gS623U8fug25ee0HXya0DtHGQb5zCWBlA
         7akA==
X-Gm-Message-State: AOJu0Yy7XwuE8Yy7pqkfb54IdvYOrYCMPYhGHlq9xLyYj1Jss5Qnd4/v
	nK+XC6Ww3umkyp38KDUEHGZB/6XpBr6Lv/ScGYgdrSbto0hMVT3BF88ffW9WNYI5
X-Gm-Gg: AY/fxX7k9no+fSdZFmzSokc7l3+k79OwmBpsQXIeWtQuZSBdhIwiQ2tIAo4sE6wxpSN
	B4btABWpOoSvgOUZdo9i4bEL1NSXB3BRhVc9THIJQfjxp305vdkFZxzrCLgSPYFk2JXMyRovyZi
	w1ayApHklzEbsRa7L8q6hME70Aw7aQ1zvgqfP53X7b8k4uxAb0prbhlnV7MeO+tiHbPJGtLyBCO
	8bYO5/X7GwJkbhbyQ/QkssRIn6iKZab2yosNws8cxHVk6jQsfKSFiWscwvHEImEkO8h68h7RQkk
	POl3ahO8D3lNUqyUzBjrFQW21sh7n9K4OeZ/+/K4fSkc+cKky8L3hjgmxVgUYrdLJpdt4hCoZh1
	0ZMUd3usu5WJ0etPBPAD/zGQ0bCRoG68skKwJR+LsWeRW8fcjySsahnP25/+2wluSV7HebvrQjr
	r2oUBLFRbfhThFf2gscuS23Zn2
X-Google-Smtp-Source: AGHT+IHpWyuLbEYJTBLSheSlaGQGszMg2w+jwFQDF5ceAgKxa7vtkvt4mX9vH6QsYHypNHmbzZ2g/Q==
X-Received: by 2002:a17:903:17cc:b0:29f:178f:f363 with SMTP id d9443c01a7336-29f24151688mr42417245ad.32.1765620142493;
        Sat, 13 Dec 2025 02:02:22 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 58/67] classes/create-spdx-2.2: Fix CPE reference type
Date: Sat, 13 Dec 2025 15:29:22 +0530
Message-ID: <20251213095931.2571498-58-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227676

From: Joshua Watt <jpewhacker@gmail.com>

The CPE reference type should be the short name ("cpe23Type") not the
full RDF IRI.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44dc2f9a4ad7dd0e0debc08d02d3a3b3f38e7f12)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 94e0108815..0ffaeba0e9 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -489,7 +489,7 @@ python do_create_spdx() {
         for cpe_id in cpe_ids:
             cpe = oe.spdx.SPDXExternalReference()
             cpe.referenceCategory = "SECURITY"
-            cpe.referenceType = "http://spdx.org/rdf/references/cpe23Type"
+            cpe.referenceType = "cpe23Type"
             cpe.referenceLocator = cpe_id
             recipe.externalRefs.append(cpe)
 

