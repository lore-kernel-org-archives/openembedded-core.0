Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1C3C71137
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:44:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.83229.1749548665042784903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U3b2X0eg;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so32699385e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548663; x=1750153463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1Y0tiP3ZYl73olFrPOkVMmjkmXF17p6SSPE4HI//QQ=;
        b=U3b2X0egV9+in+5ieJEnuOLIhT9UoCtgq9YfpZe64e9z4q1q7rYOuXx+wT+c94JHlD
         vHvaSS6dsdbqE1fT9NMKRHKYYey+4Emo0Kk70HIHfKZhE0FxYdgNRZyfuJYcQJPHuDKu
         Lwao1rE03Ky4l6vdJvoah8QDLjwUOsK0Kdk8uzd/kDWVPVoBR2Nm7p1RxUuhgE05kPhK
         fQa+2aAVD4zWwKc8zTZIq6p4iKMUW63GgquZFTjdvhEacft7aw7m3tENjyyIQzTj+uXn
         GAsDXsI9ROBS/sAjLiqeSL+vrCanK7cXpocku3T4NTrs3rck4pArOPcxYmC3dEDvtpqD
         iQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548663; x=1750153463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1Y0tiP3ZYl73olFrPOkVMmjkmXF17p6SSPE4HI//QQ=;
        b=Iw0wZ/MpNbuaxmE47/nSlBfUYyssMQKPcaaZUAHBCm8iS67FEWMpbKZKJ6oeJuOSgI
         t+JJsd5S9ASwtx2KTy1IZp1zY5nX/BW4HlHtLSpe6eqUFJxnodW8DYZaqee98xObyWr4
         BejOv8HqP3yUYCI4RNZNR+VhqKeOzr21FSSLXfL7hj+rAUbHPAnsNe91PoFkdeTUyz8O
         NCrpQUC5jEvuGYmc80MDS8rLPK1xVZ1DOe6UhZWwm40QWkyhqZdjzDBMQL1pbRQxuPzv
         3o28klHzhNJoa+Rlebx7KzHq9OF2fcB4Kc9PMEmm4wEAYQgRiZ0D1lVic32EAaAjvZvx
         tK/g==
X-Gm-Message-State: AOJu0Yw+iBPiOZ+Jg4DmhVoGS3FGSWWqSQdALQLJco63E0q7YUR22s9g
	3/VGsvdnKGJpy2ecziJZExth3MtZCL58LxUL11YNEtTWiWKePTy2Y+iaFwl0IQ==
X-Gm-Gg: ASbGncsRIZBDcHXaUt/5v1nTPw6avbV44HpWIT7lF5pGDM0ch7Syy3d8rDAEiz78LmK
	PWJLYN4yzUl2ixIwFt2Iqds+q62mkkKN6UzhwgBVoZ67BANulJu7KdPTS2MGS7mzQk6471hqGam
	mm9YhN9lF6UZ2IEJ6Q2dwUmSRXrxuG1W4bVrryowkmlu4ZBRAqWMrtkuPs+5AVvZZyHtBbfeXyT
	i/Mma8J5Sx395gS8ucFm7pPhj7sBBj+mxEwr8NUfAuFLg5DIXmRoYoRZdNMD54aaIUG11y5eis6
	ihVH5j5i+TZzXJKlpKoKdjWETtNfxnwbWnWKnMfPNYNjp09lK1OzzBoDVaXKfS732jwUJBs0VM+
	o3ldORlRR1h31YyzKPmgdFaI=
X-Google-Smtp-Source: AGHT+IH5YT4OUBlpGiE/eoKNGsluqpgdRJEvVIuXaKEvVXN5eQTPbBJh7EOJ88T/WtQ+r5aHibgQgQ==
X-Received: by 2002:a05:600c:1907:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-45201414a65mr122108965e9.21.1749548663212;
        Tue, 10 Jun 2025 02:44:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm136569125e9.39.2025.06.10.02.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:44:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 9/9] base.bbclass: drop compatibility moving of sources into workdir
Date: Tue, 10 Jun 2025 11:44:00 +0200
Message-Id: <20250610094400.1653931-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610094400.1653931-1-alex.kanavin@gmail.com>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218334

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


