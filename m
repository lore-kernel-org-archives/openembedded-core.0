Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF3BCD37B0
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8240.1778224356375230257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jXV/KAJe;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so1752513f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224354; x=1778829154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTWz2amJPFd8P630UY5GzXb07txCnOjpjWq9MFjQgNQ=;
        b=jXV/KAJeopzTn8PZDihbEINHPxH0vnSeIM59xj5CEIfU6nojPYUV3A679VIuSbXIn+
         nBRhidBedfQvFTP9H9HwmHDAJnw3jgQoH/uMF9lMK4HvyjOLzt+NkxBbSqElcfVzrEnr
         kgFCmCrqIVx2wdLsGNJVBjuOQEHtaMX2I2bVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224354; x=1778829154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kTWz2amJPFd8P630UY5GzXb07txCnOjpjWq9MFjQgNQ=;
        b=PwxLj/83FFklN2Ju/7a3hfZ4s1Uh6Zcg37IhKMapOm1Zs2o6r196NoogE87Xt7Wsc1
         k/l4at8nyCbcz3U5a8N2VK8sQSHtqb4H3HQvul+WUxDi38xiwXoSJ8ywipG0B42qu6SU
         ev1eCq3PgFnK1bDZbqP/oD1ayVgPwVEp47FvZxgZtCFBzJS/rYp6TWBbCeWdGSGk65JT
         EBWP7hc6RIXMcX23f3ty2Q8Zr13Sdae695FNnRXbbuQu5ialStGmS/zvhPK7WGbRZdpS
         ZAMbKZejs+txgABG86T24AjB/pmjerWYcY40vDn3briT/E5JaJ+Zt032W8TFrZ7q6Zy8
         aYMg==
X-Gm-Message-State: AOJu0YzHgoIXk9BU7Jf6Y7R0Dt+aPYMo7uMhkVb86n22/QL8HmRXnwpx
	X3gmlfaAlAnpR6TRzbyWzbAvgRMACRYoy/HeWFGRFt6lpoSe0nj0VKlFWoNozmEbVzZwJRvxZ/0
	UsUF9v3Y=
X-Gm-Gg: Acq92OE2Nw6QvLOJ3hMXT+kAqdOMT56vZBUmWsLNlF1VNQ+LcXB4LBjzFF9F8UodrV2
	Wl9I+FKqU4geOzmx7yCl7GaN/UjgA9VMCUbSZjPnWKByqoAoow8Wag5CslqQV+fQOM3Q4SnCYQ1
	p4bwNM/NELnMLcZnv6lvJZ5m9+dz3yC1nZfdERW54NXjtGjIWalsvyVYBDoQy41kyfM86U46dCG
	mNKv74v7lzW0w3CKqXz996jMkPdQeHjY+2tu4ODOXld0FIYD++qUHMVp3cAWEy+aCGvR0q085pf
	Pw+E7TnmfbNbzOZyCK5vzblwGBxFZiNy7/nU6AwK+f4FSDTT723jFB2x4H71bL1qe+jArVfywKB
	/Yjhmr5gDLzJtWYgZsh1fZjeJHGocgfq0Vm8/ICHMLqqnWjDbN++TXoKGrvYA+2FQM3xNAzHX2u
	iFfChQRb8082OgT9lcYlBsoZp6SEgLVfmNP/dSPzu3NcyqbQAMxEhVbwCdF/tLBDi8X9+opnnN5
	fc0P5SONFP51WLB0khIb39lOSA=
X-Received: by 2002:a05:6000:42c3:b0:446:6d9c:a60 with SMTP id ffacd0b85a97d-452e7e7eb49mr6048164f8f.8.1778224354299;
        Fri, 08 May 2026 00:12:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/52] package.py: fix kernel module file pre-filter and document strip asymmetry
Date: Fri,  8 May 2026 09:11:26 +0200
Message-ID: <9d64c63c37310aedaa82f86c2a4719f65ae26a87.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236675

From: Sam Kent <sam.john.kent@gmail.com>

Change the check to f.endswith(".ko"), consistent with strip_execs() and
with the /lib/modules/ guard already present in is_elf() and
splitdebuginfo().

Fixes [YOCTO #2348]

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 2f32e6a01cdd18c3a7ade348c7a50b0cd459590f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/package.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 279cd567b31..c375acc1242 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -37,7 +37,8 @@ def runstrip(file, elftype, strip, extra_strip_sections=''):
 
     stripcmd = [strip]
     skip_strip = False
-    # kernel module
+    # kernel module: use --strip-debug and --preserve-dates (required for
+    # module signing to remain valid after stripping)
     if elftype & 16:
         if is_kernel_module_signed(file):
             bb.debug(1, "Skip strip on signed module %s" % file)
@@ -1167,7 +1168,7 @@ def process_split_and_strip_files(d):
                         or (s[stat.ST_MODE] & stat.S_IXOTH) \
                         or ((file.startswith(libdir) or file.startswith(baselibdir)) \
                         and (".so" in f or ".node" in f)) \
-                        or (f.startswith('vmlinux') or ".ko" in f):
+                        or (f.startswith('vmlinux') or f.endswith(".ko")):
 
                     if cpath.islink(file):
                         checkelflinks[file] = ltarget

