Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.5964.1609856784779923002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LYbISSFa;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id e2so21387712pgi.5
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7KKW4KOt8J5pOw7QiGkfFs0GpAEw8F0FQaJkpc08q3I=;
        b=LYbISSFa1M9FzRP+V4RSRgAsqCYjKweznmn2X/gOB/kFOJhqrTV0E4QRKd0ueuLCdn
         HztSUcVwv2iYI0kXGxpSFSVaA7ji9NyXF06Mpux35tfJVMF2uu9JxvPL5qgXlbHrXOmU
         JWY2DSGqFA3FK2OW0QoOqBrDVI96jARGv94/+vpRxh6goMPU5GJyDIH0L4PU24G69ZFa
         boQwxms64P6E+US74hLarP8cU6ORe/w1cjlhztjRAN5ml7rQv8ARNYECfCL3kaVvNjJC
         nwFV905WKLRVLS80ffvKmiN20+FnjE22BDQlZFNSaMu8l0EDhjtJvCLEyYRj6HxaoT8i
         BCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7KKW4KOt8J5pOw7QiGkfFs0GpAEw8F0FQaJkpc08q3I=;
        b=t5HystqO66MRUAHxWLGdQQoWdbuCsRkrwggdA2Lbq76PTyIt08/rypX+0iS6u29OVf
         qmBCyTEA2ryiFiNNGR7qHq7mVz8/GSHzPOz40KggX5E23n+fZ6A9AxsNplX7IJuABUNW
         w2wZeqNwvikAJk/6vUwz30wVqNoE7ODvUAc1z1KCGt9EkGV0wbrn9aVARAiFOqTSY4dr
         cCEUL+Y1eg7xkCtvoPFqKHEk15KsetKBsEdYxjrRe5mRIntyrKfPZhpNd/buHQV2TdgJ
         vPGO/jwFAFxThrEZ0+aJzkgeLODQeH0ExSyuF4KCYBsJC02Mf4d0FYYO/6YbPqLxe2kv
         snzQ==
X-Gm-Message-State: AOAM533rInSSwnKGwTm9Z9OfxON4N+Q8/sH8xSiqJvQvE758o2gsPnvp
	1EINOHML3u2CSiG5VKjWCozpWSrglh8eC8NdjTc=
X-Google-Smtp-Source: ABdhPJwTN15nSuACMgY5mjaXZuNga4YDipnYtnjGqCbJXUKKOlTfOYXeqUyXywvUe9yjKl80UAwbTg==
X-Received: by 2002:a62:380a:0:b029:1a9:5aa1:6d0d with SMTP id f10-20020a62380a0000b02901a95aa16d0dmr68585021pfa.45.1609856783936;
        Tue, 05 Jan 2021 06:26:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/30] wic/direct/kparser: ensure fsuuid for vfat and msdos align with format
Date: Tue,  5 Jan 2021 04:23:50 -1000
Message-Id: <974e09f3460a27c85a599d8269e3dea66df5ddd2.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

vfat/msdos filesystem should have fsuuid in format 0xYYYYYYYY where "0x"
in front follow with 8 hexadecimal number in uppercase. In wic, when using
custom fsuuid for vfat/msdos partition in wks, it is able to set the value
in any length, with or without leading "0x". This can cause fsuuid
missaligned when fstab updates, fstab expect exactly 10 character
fsuuid for vfat/msdos partition and all in uppercase.

if custom fsuuid for vfat/msdos is set, check the length and format,
error if it exceed the format size. Amend it so it is align with format
0xYYYYYYYY. This is done before image create and fstab update to ensure the
fsuuid are same in all followup process. if custom fsuuid length less than
expected, fill in "0".

[YOCTO #14161]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9686ae511ef10a504becfd81bfe296b788e1456)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/ksparser.py              | 17 +++++++++++++++++
 scripts/lib/wic/plugins/imager/direct.py |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 76cc55b848..127ca79ade 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -228,6 +228,23 @@ class KickStart():
                                 err = "%s:%d: SquashFS does not support LABEL" \
                                        % (confpath, lineno)
                                 raise KickStartError(err)
+                        if parsed.fstype == 'msdos' or parsed.fstype == 'vfat':
+                            if parsed.fsuuid:
+                                if parsed.fsuuid.upper().startswith('0X'):
+                                    if len(parsed.fsuuid) > 10:
+                                        err = "%s:%d: fsuuid %s given in wks kickstart file " \
+                                              "exceeds the length limit for %s filesystem. " \
+                                              "It should be in the form of a 32 bit hexadecimal" \
+                                              "number (for example, 0xABCD1234)." \
+                                              % (confpath, lineno, parsed.fsuuid, parsed.fstype)
+                                        raise KickStartError(err)
+                                elif len(parsed.fsuuid) > 8:
+                                    err = "%s:%d: fsuuid %s given in wks kickstart file " \
+                                          "exceeds the length limit for %s filesystem. " \
+                                          "It should be in the form of a 32 bit hexadecimal" \
+                                          "number (for example, 0xABCD1234)." \
+                                          % (confpath, lineno, parsed.fsuuid, parsed.fstype)
+                                    raise KickStartError(err)
                         if parsed.use_label and not parsed.label:
                             err = "%s:%d: Must set the label with --label" \
                                   % (confpath, lineno)
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 55db826e93..0ca67b77d5 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -343,6 +343,13 @@ class PartitionedImage():
                     part.fsuuid = '0x' + str(uuid.uuid4())[:8].upper()
                 else:
                     part.fsuuid = str(uuid.uuid4())
+            else:
+                #make sure the fsuuid for vfat/msdos align with format 0xYYYYYYYY
+                if part.fstype == 'vfat' or part.fstype == 'msdos':
+                    if part.fsuuid.upper().startswith("0X"):
+                        part.fsuuid = '0x' + part.fsuuid.upper()[2:].rjust(8,"0")
+                    else:
+                        part.fsuuid = '0x' + part.fsuuid.upper().rjust(8,"0")
 
     def prepare(self, imager):
         """Prepare an image. Call prepare method of all image partitions."""
-- 
2.17.1

