Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFACC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 15:44:55 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.15991.1634053494707581588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 08:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ist87ZNr;
 spf=pass (domain: gmail.com, ip: 209.85.166.178,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id w11so18871588ilv.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QgKe+ZMBm6IxSNlLwbGEoqfqCtBXlIvIDZL3Bw1qrmM=;
        b=ist87ZNrJsQAIBbZGbn+77/tcX0VeCYOzyOCZIccOHNGIw6LV4J3F0+41sNt79THxH
         F/MILkkBfZKGLscsYglT06B7uM3gpN3WZGYWUr5hZ2RJlCri2TEQfn6xv+aMKqBJl5qj
         +xSfoLL/G2YXtZyd7gKlT7sTVaJOP2T59vydUx0u8+e9XU2OYsL4XSQyODfVCsso9HAW
         SObnkOQ9sfGAsI4QjAYwWmxzfa0qftOe4ksMq7pRYdaQBuW8zhY8Rt8Xbkxckxb2vMZg
         efPamVFBy7fny0U9w3DbS9SJN3T1u8xXNdpQTmfIA5QVG455mb2SeRLerfvIxMDqTzk8
         Mbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QgKe+ZMBm6IxSNlLwbGEoqfqCtBXlIvIDZL3Bw1qrmM=;
        b=DdxYoStyJiIomJf4kcPhiKJFgt/kZvRQzSoBhU3wagGlhLrbHhJlURbntDE6pfWdOR
         B9K6CWw44atBgcKaO+OLDwVBMSdfdx/mBm4Dvg8u8LtWjChPVcDFg5eYa3TeqrkmIx1a
         cYmgLHnRG6n5isxxyTDOTL+iklMyjB/xQDTQ8hJf663ClyGZbx2ejHgtIPY0dGs4Llh6
         x92l5U02x4ttiNYqUt0rZaZbGyGudQm67AmMOCrbXD8xPy9tTBQqYNGGgVLjAhbQUHwG
         +30xxqE6x5osopg10LXjxJXU1eKaxe8xGeTMMfqxMML0u7XjljJRdlp7SOsX/jvg05AD
         PQDg==
X-Gm-Message-State: AOAM530xUj2Gr5YBxaCvdFe1WXzw10ZFMvT4GqdumahyATyjrb6GJQBk
	vLgAkxnEAHEWEUUg1SxmYl+QueKD/8I=
X-Google-Smtp-Source: 
 ABdhPJwMoveX9e+Xf7B2TaGDzUri3eaUiZ/gzEl98CvF3lvpVOKq5ppGPjsT+tAKyVp/UFL3ML3b2A==
X-Received: by 2002:a05:6e02:188c:: with SMTP id
 o12mr18128995ilu.321.1634053494011;
        Tue, 12 Oct 2021 08:44:54 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa
 (204-83-204-143.prna.hsdb.sasknet.sk.ca. [204.83.204.143])
        by smtp.gmail.com with ESMTPSA id
 h2sm5594942ioh.14.2021.10.12.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 08:44:53 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 1/3] bison: prevent checking for textstyle.
Date: Tue, 12 Oct 2021 09:44:48 -0600
Message-Id: <20211012154450.1279395-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 15:44:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156882

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Bison's autoconf is also very good at finding textstyle, force it
to not find it unless it's explictly enabled.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/bison/bison_3.7.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bison/bison_3.7.6.bb b/meta/recipes-devtools/bison/bison_3.7.6.bb
index c85ae049766..b09ed81d291 100644
--- a/meta/recipes-devtools/bison/bison_3.7.6.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.6.bb
@@ -33,7 +33,9 @@ PACKAGECONFIG[textstyle] = "--with-libtextstyle-prefix,--without-libtextstyle-pr
 CACHED_CONFIGUREVARS += "${@bb.utils.contains('PACKAGECONFIG', 'readline', '', ' \
                            ac_cv_header_readline_history_h=no \
                            ac_cv_header_readline_readline_h=no \
-                           gl_cv_lib_readline=no', d)}"
+                           gl_cv_lib_readline=no', d)} \
+                         ${@bb.utils.contains('PACKAGECONFIG', 'textstyle', '', ' \
+                           ac_cv_libtextstyle=no', d)}"
 
 # The automatic m4 path detection gets confused, so force the right value
 acpaths = "-I ./m4"
-- 
2.31.1


