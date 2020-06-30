Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.7660.1593486302813430322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vLo3kS6/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id 207so8589680pfu.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PrQEZi2xvA0UBds1p9bS28i97o60ieW/+VDdsikoRKs=;
        b=vLo3kS6/xysc3mSrDmYIbwaomeUJLYBy1uj4h2u+a3YzImvqX/+rDReSNxAV/R9osA
         qVsztCC0znrNeRcjxRKW9/WiRclZzSKr+MM7T4bIsdRZ2TKm9ZXSaYqzkST8SPhNX94o
         Fvd8rSG7RtOFv3x7hemyTeFAr/uUXM5HJtl1qJixbx0/8oNh4nXk/yx0XdFnaQluKk+D
         iXlSmmX3KamAgZ319QGmYU4pqdBcyownZCTUrgNtXM20ixItUUkunGS3xG1/jjQodc+A
         Bh66ZDIRsQ3sGJTTRIwo0HUYptFd2oatLrA3iSuc/JIOC58Rh1zpLhPlvDewFYbiN3n6
         OjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PrQEZi2xvA0UBds1p9bS28i97o60ieW/+VDdsikoRKs=;
        b=NWqhcGKjgpeDJXG7ufmP1OSC8fut4YkoJ/XmOf0zgFt+QMtL3xkvm+nHnP2FIU8rvM
         I80Rlg2txxfoBhumt3YNLFyF74XAVJRKV12n4VlLfPHY+OJwKeBUMVLPgsxRLLOgTHte
         3T98pWVcNdygtAY0x0igge3GxMh8kyh12DSjlkU2Sk4Vp60ViPwfug3loCnsc2JTxe2W
         3d4Zk+YQs43KhIOZzLpUqWL1Bx+o0icNtfr9lxbhv5P++6wpw+zTNsq9tjGd9lrRuz/E
         BQ1GlkOPLdnpz0Yn+9FVCB4ZESwQpmh7qVL1U8F0EKhTY4kJ0JPsYcAGbODgw79pEKFc
         SGyg==
X-Gm-Message-State: AOAM533LPu03d7EMfp4ENgLtdr37/FgOmbrKdY24ApbJNrxebxGdDJzT
	n6tI+ABjBokFkUXqui1a4Jj4gzNn2tg9bQ==
X-Google-Smtp-Source: ABdhPJzgi7LSTJB7MD4wP/X+ZWU6G0Lfe5n95oJoHhU/ZXFwDIfSLdx5gGqrnttKXTcxxVKOOdxOAQ==
X-Received: by 2002:a63:1549:: with SMTP id 9mr12938074pgv.408.1593486301865;
        Mon, 29 Jun 2020 20:05:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:05:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/22] scripts/install-buildtools: Handle new format checksum files
Date: Mon, 29 Jun 2020 17:03:13 -1000
Message-Id: <877a082b5f3f5ccf8191a2438e7707b419174ea9.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Autobuilder generated checksum files only have a single space between the sum and the
filename, tweak it to account for this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1e71bf5b399372166eb40bb0d99c8fb52231600)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 1a458a2cc7..fbf6a4bc38 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -239,7 +239,7 @@ def main():
                 if ret != 0:
                     logger.error("Could not download file from %s" % check_url)
                     return ret
-            regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s\s(?P<path>.*/)?(?P<filename>.*)$")
+            regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path>.*/)?(?P<filename>.*)$")
             with open(tmpbuildtools_checksum, 'rb') as f:
                 original = f.read()
                 m = re.search(regex, original.decode("utf-8"))
-- 
2.17.1

