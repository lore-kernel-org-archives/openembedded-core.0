Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBCAC27C5F
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 14:06:33 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.15393.1717682789771042018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 07:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YyFLCgUz;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7e1fcd2662cso45986839f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717682788; x=1718287588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh1IySEFEKksIaDhxMgS+bHqF53D2RKWomUMJFy4f/0=;
        b=YyFLCgUz8atfPj33bvAqqVk7Lx/IpF90efGkV7xD5CXy4D54z6sDSaU6AZTBxBXIgW
         7Y9Zv9fSzpoVz8H5tiNKA0/uiFv3WtOguM6OKbEDQRjhmmioCIxFEidEUoKznKhvDM+g
         SYiJtsDpL6M3sj7tNy1+1KNTAr3HFy+Dh9IpXIb68jcbrDTwc4N8k6o/TF0ngGZjb6cz
         /mkk2hMKLflnILpyzneIjOPgTlVDDLC1er+1P9HnKeyu+nxQJhwroAp5v3n+JEhLJfyO
         f6Kgm0VMfJIfYqBGA8TzDzwY1tGdMJo2eHDlAqodx66tiUf9rQocTA6YECn/eSf7cowQ
         rh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717682788; x=1718287588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bh1IySEFEKksIaDhxMgS+bHqF53D2RKWomUMJFy4f/0=;
        b=T0gUVmuCf9bnZ7Q9//JAEVcXBmlef1y8u2+5mJKnoe8fUhCTGvHXs3YuyPBmJo094r
         GmRd+iR4Br97WjmVp1sytfIRb8nk/2nX1zcuszFSyZv8D36pdq/8eMIpsPqv8MIOATVo
         swb0s3258aMCLaCYWCRQZ6igamGOQsy0gN31Ta8AI2Uw31oRmA2qMcZg/3EniYst8Eby
         t2CiQ4IG72B0WbObhUziOXjmQ8VerXxKZfBlYb9SSSuapje4cD9ht9y5kkMtc0/Cb91B
         Bqr4vasL7OlX4Z+XXvy1byB5jjC7xJH+UrO7oUjoEaLNY2cFb6n8yn1okYO+MDCj3+lk
         ZsLQ==
X-Gm-Message-State: AOJu0YxSf1QdcrEwo9FMPLJfQTLkGMivY2yQGKkiV7ewlh48HlSWncbl
	6fzwcDoj7vBxoAeafF2D1+pIsyYnVrsIqQWNPtvCSEPvbAVchP/k7fvJtQ==
X-Google-Smtp-Source: AGHT+IGmfy3F8TKHefGI+IOMU0g9DqN66Y3XnyvCwu/y37Twz/GpUjQE+PXZSnCbiATjK4mOdwS48Q==
X-Received: by 2002:a05:6602:29cf:b0:7e1:b3fa:6470 with SMTP id ca18e2360f4ac-7eb3c91b9bfmr577775339f.19.1717682788255;
        Thu, 06 Jun 2024 07:06:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::3969])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b7a2070f95sm346411173.0.2024.06.06.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:06:27 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC 2/2] classes-global/base: Add manifest to do_unpack
Date: Thu,  6 Jun 2024 08:03:04 -0600
Message-ID: <20240606140622.2494668-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240606140622.2494668-1-JPEWhacker@gmail.com>
References: <20240606140622.2494668-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 14:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200404

Writes a manifest of files unpacked in do_unpack

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index b6940bbb6ff..e543e206d08 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -177,10 +177,12 @@ python base_do_unpack() {
 
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
-        fetcher.unpack(d.getVar('UNPACKDIR'))
+        fetcher.unpack(unpackdir)
     except bb.fetch2.BBFetchException as e:
         bb.fatal("Bitbake Fetcher Error: " + repr(e))
 
+    oe.utils.write_file_manifest(unpackdir, workdir + "/unpack-manifest.json", extract_lic=True, ignore_dirs=[".git"])
+
     if basedir and os.path.exists(unpackdir + '/' + basedir):
         # Compatibility magic to ensure ${WORKDIR}/git and ${WORKDIR}/${BP}
         # as often used in S work as expected.
-- 
2.43.2


