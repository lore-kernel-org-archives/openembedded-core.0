Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A46C7115A
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:50:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.26738.1750067412031244656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FWxKd7uS;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a361b8a664so4350345f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067410; x=1750672210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1Y0tiP3ZYl73olFrPOkVMmjkmXF17p6SSPE4HI//QQ=;
        b=FWxKd7uSWDPfJ21zz+OeKnj5XI9bRMVxQ9Nlb0IlJTd8uWx25UvKK665XsjsB6bLfw
         TtnFRdejFLM7NlLenoXqNJ7QT8GaYcUE8IYPfwHNqLxPVtULn62WNeRLUt+ssd14KcyZ
         Uv6UPFIltN6fBScN1AfeO8KRXHHW8kNWmFZ3cmxoiPS55+COhnnPaUZB930Yqj4YyiBy
         OedDrVocBFw0lMHdY8h4BWf0Qw4egtyGjehU7aY86I6/xEgVW0Utt5WDN5abCe+dGU/x
         RWrgow5kbnzDrVI2tCDeqMltgrveDA7wbEd8b1g19wkiMXJaM5Jor0zkcSDPFPrqOny7
         p1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067410; x=1750672210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1Y0tiP3ZYl73olFrPOkVMmjkmXF17p6SSPE4HI//QQ=;
        b=EhnVxjxgp0L36x0FOZ1RXILwExYPWtvcQO03DY43XEBsNPQUVw3yH0ROqg4G15MAiD
         G2FTT4BZoRe9wpbjX4aXBzA6aYexxzp3gXwCWfq1BTnFTikv9DEp6vfFIQzRXKG8W5gV
         lR9kxQxC+Lr/8L5Ph4Z30EkCehxWpEtV7aAML77QpiZCTFxQnICZs6qQPG8/eAAxqUpA
         TMBSQWfrKQGYf5rlTdXSbgbh2fYYwNeOTeIhmGXFf8udHTUikF4MZjJEGJTX4+tsQZSf
         M4dDAo4gRlLEaNyo8q5hxiS2fySsgCvHKQ2PnwYmQHX4Tp/RBXW9cbgmgVNlmT1B41Jw
         YUAA==
X-Gm-Message-State: AOJu0YxVAMEWHeRXZqOotgoV25ekZkrDJmukpkxwS17MG0zm5wKUsMai
	k0bvTN8J7q2wAkyvNw4IFE2WubzBqWWWPjLtfO5WHUpvOnmymWzYD2Cg7DV2Rg==
X-Gm-Gg: ASbGncveTQkMyy5wUMBvlWXXDW/2eh9RRpXWFlEkuo3LOHwliBeYLFoANvxNIxB15GP
	FfKFzr8dMaXnXnIwDMGc84BYCAiKOr6t9WwhtPpQ9UGcMnZoJQfTlz8i0aF3CL2yOr4ZKjYP6Uw
	uI/ysBfhLxcgoUFxiOjnZy/XYRS/u0qvG/quaMjoKIRtYV4PeOc3JfhnzT6bYmvyhItr2+IKvHw
	GSAO7YhpDQSBEYJsRw1f6+iGfhxWlUt+vgSKpLWlO/0rP98X8IZHgoMWK1M1Z51TcL3rbyEUF07
	/dxPVyOZjBmFb5Cx9n+VwkL7UUdV3hMoPkrxXdvmSH4rEwmVfilsRtuqM+Cs/acI0RNe9lstV8U
	P5S2YH9+t8Kw5PCpKzKCQo2M=
X-Google-Smtp-Source: AGHT+IGAhIHWvw73POeTNZ6YocVL6l/p/deYwwD+nyvWHljLLNyv7YpPEiue5Aug45QAuJ2XxsbzKQ==
X-Received: by 2002:a05:6000:40c9:b0:3a5:39d5:d962 with SMTP id ffacd0b85a97d-3a572e8bfc9mr5855879f8f.41.1750067410165;
        Mon, 16 Jun 2025 02:50:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm72811805e9.23.2025.06.16.02.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/10] base.bbclass: drop compatibility moving of sources into workdir
Date: Mon, 16 Jun 2025 11:49:59 +0200
Message-Id: <20250616095000.2918921-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616095000.2918921-1-alex.kanavin@gmail.com>
References: <20250616095000.2918921-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218807

From: Alexander Kanavin <alex@linutronix.de>

Potentially there could be a grace period for fixing recipes (with warnings, etc),
on the other hand, changes to git unpacking destination would already
break various layers, so we might as well make this a hard qa error and drop
the magic at the same time.

I commit to sending fixes for layers included in autobuilder testing
(meta-oe/arm/intel/virt/agl/aws/mingw/etc).

SOURCE_BASEDIR is at the same time adjusted to be calculated relative
to UNPACKDIR (previously it only worked if S was set to
WORKDIR/something/otherthing, and that is no longer working). It is also
no longer removed from the filesystem, as content of unpackdir is managed elsewhere.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/base.bbclass | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 8215969c7bb..0f4efa272cb 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -168,23 +168,16 @@ python base_do_unpack() {
 
     basedir = None
     unpackdir = d.getVar('UNPACKDIR')
-    workdir = d.getVar('WORKDIR')
-    if sourcedir.startswith(workdir) and not sourcedir.startswith(unpackdir):
-        basedir = sourcedir.replace(workdir, '').strip("/").split('/')[0]
+    if sourcedir.startswith(unpackdir):
+        basedir = sourcedir.replace(unpackdir, '').strip("/").split('/')[0]
         if basedir:
-            bb.utils.remove(workdir + '/' + basedir, True)
-            d.setVar("SOURCE_BASEDIR", workdir + '/' + basedir)
+            d.setVar("SOURCE_BASEDIR", unpackdir + '/' + basedir)
 
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.unpack(d.getVar('UNPACKDIR'))
     except bb.fetch2.BBFetchException as e:
         bb.fatal("Bitbake Fetcher Error: " + repr(e))
-
-    if basedir and os.path.exists(unpackdir + '/' + basedir):
-        # Compatibility magic to ensure ${WORKDIR}/git and ${WORKDIR}/${BP}
-        # as often used in S work as expected.
-        shutil.move(unpackdir + '/' + basedir, workdir + '/' + basedir)
 }
 
 SSTATETASKS += "do_deploy_source_date_epoch"
-- 
2.39.5


