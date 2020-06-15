Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.18432.1592228664660520477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 06:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=rkpJ6w66;
 spf=pass (domain: burtonini.com, ip: 209.85.221.65, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f65.google.com with SMTP id y17so17158397wrn.11
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n7tF1YrDToaCeEfxxfkKG8orkhUrz3nxMPZPY3pllSo=;
        b=rkpJ6w66VZNecKdZp9MHdvisdLSqjcHJdcMtRDHGUAbakmRh9cBJNeXuv+D4ZLvhdw
         R6Zt17pFbsQ23KKpklulJ2OYkHoYXFk1sfifG4xDe694sWjo+Oj5L2Obj15bp5n9cRYx
         Ty42rkarSgdfrs0WSGqSDZ+6A3XUpWsA+2OtUXqKnyYNy26p7goXWv37BpamxitAo08y
         rJs6RNdUlUpZqlILblu44sstVfaroBM+tDFtRF4cuu20ZddAcfq07zsP0EUJ5aXFnwqD
         vBnYy3GYUtVaeFWyiM5E43PGo4nnOrUVWtXUJ9BO4Io0SPy0uTed6HLoCDvOPXqOEwvr
         jSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n7tF1YrDToaCeEfxxfkKG8orkhUrz3nxMPZPY3pllSo=;
        b=L8dqhOU25dhJIOtE+VU9mNW6G1TuSgNRzRAV8c08KeEga3zqdHdguhIDKKuLlLDPqs
         oSGLCXzEFY+RlorjdeW1LaFq9VY//puWWcEZoPpJrg0x1UeIveQ+D0h0YW3byhsL0Wur
         P/vy5cAf7wYjhWfUFqn6l5hDQV/p01rE+iN3VmWCUHKuUMjnA/Fm8/vIv0OhKWpf188K
         fKoyHAGIZtdsMTKDYBHb6Grvl2PrTvLDEZ9qFb849F9/2rLylZl2GQrS15BaYxa1b3Nq
         C+UxvjnrJpJplFXRtRGYm2pbjNYHgPIzWWBbuOHctlOfZ8LpF8ivn80OynkcnlUdPaSQ
         EQiQ==
X-Gm-Message-State: AOAM530ljTHN9b1W6D/Ki0/bjq7sNtNv5BhLMkItdf/0daopvMeAoHcH
	SUw+j2xHciK2blm6eT1rQ3ZXJTT6Zs2HMVIS
X-Google-Smtp-Source: ABdhPJynk/mbK48C1KhnyITf7MUFLkJ2jF6q5JfvIWak7XlfAjwJ7yrotDyMVb1sPNJeNn4AseWenA==
X-Received: by 2002:a5d:4bcb:: with SMTP id l11mr30972361wrt.363.1592228662999;
        Mon, 15 Jun 2020 06:44:22 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id y6sm11572038wmy.0.2020.06.15.06.44.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 06:44:22 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] install-buildtools: add option to disable checksum validation
Date: Mon, 15 Jun 2020 14:44:14 +0100
Message-Id: <20200615134414.1043782-3-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615134414.1043782-1-ross@burtonini.com>
References: <20200615134414.1043782-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

The --check option turns on checksum validation, but it defaults to 'on'
so is pointless.  Add a corresponding --no-check option to turn off
validation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/install-buildtools | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index a9173fa096..69ce9a1f05 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -154,9 +154,11 @@ def main():
     group.add_argument('--without-extended-buildtools', action='store_false',
                        dest='with_extended_buildtools',
                        help='disable extended buildtools (traditional buildtools tarball)')
-    parser.add_argument('-c', '--check', help='enable md5 checksum checking',
-                        default=True,
-                        action='store_true')
+    group = parser.add_mutually_exclusive_group()
+    group.add_argument('-c', '--check', help='enable checksum validation',
+                        default=True, action='store_true')
+    group.add_argument('-n', '--no-check', help='disable checksum validation',
+                        dest="check", action='store_false')
     parser.add_argument('-D', '--debug', help='enable debug output',
                         action='store_true')
     parser.add_argument('-q', '--quiet', help='print only errors',
-- 
2.26.2

