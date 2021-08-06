Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.2671.1628241835135932503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 02:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=HacnOU3Y;
 spf=pass (domain: qtec.com, ip: 209.85.208.43, mailfrom: daniel@qtec.com)
Received: by mail-ed1-f43.google.com with SMTP id x90so12160124ede.8
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 02:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NYydJqkbJSXZw0dyaFXt7KWQuZPfOxDuGR66MCw1ipU=;
        b=HacnOU3YPUA/ZnUVVEUVi6WcPCTLK/4aKhhonYvd0H1CDSRYH7eFbYOpmHL7eRY6WJ
         zPm7eAVSf0dQnWOKNXGoG96UI5nqOxHfkpu783BrYpiTL+OtUGpmY1NuecXKru3mBAvU
         nKL5la+2yBaAAgfOI8xhKNqVtHHnFqLF020OORAAkFU2kpNM6xYLLtdWk4FPTRoZ3x9l
         0UNQk3sGs00f6ekuWZVTRhxgMaZ8KDduF0B+243Ibprf8qshDDokMVVzH8TxjY0M3i+C
         gi6D355Cyw2ZvVZKnDaW2bAPjdh08tZTd3I6dDaxtK/yos7cnOYj9eBAZE41VPr0v02P
         q7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NYydJqkbJSXZw0dyaFXt7KWQuZPfOxDuGR66MCw1ipU=;
        b=BAdFjWRY7zVI8iyLuUpfmpWaMx/1JMR94vnzTYPmQHn/XwE3gftnyioLRrY3q9YaVT
         ENO7sMV6bKBIDweS7LVNRQehAmW0k4VeHo18seDU1jM5yyAX9Qrq3dmfr7LUq0vINdcN
         13X/SPjdTzFuSYCclncAz+sv5PTrv8W31cbT+MPYWE/ODowdog6Doy3RVwYlME3WYcKF
         UZfqzzpAvvQyPkKwHOzlqUAzOnxpmiLYMkuamoOxVe3UnSdZUkbl5BOJL+ghtksFhMi7
         3DqOtlgbBiGWG8ysTYwzFB5ArLHvzMTJBY2iF9x9ecMewxN7uTM2wxJbpP0sLppqEGpV
         PdAg==
X-Gm-Message-State: AOAM530k5UxgTrTKQ0n3778Me+GLeEvHZ4Du4KdHRsmcWpDp+R+RGy7w
	cEKlEI0fgZXbWpejmvWIUxtLPcz+i6BbxsYOR4Us86LXsFR9CMfJ/RR+t50yVnZLQ3Iovz79Rb0
	tts4pbctF7yoc1W+CVFruxInA9tyjfHWNxoWj+Me5yJpaKH5Do8YPDUI/igxQdY2ZK8ezqtUAnd
	2/xcwE6/qVtk8MtMc=
X-Google-Smtp-Source: ABdhPJyT/qnqcgc+8bBclFskaQlkITMhzQoc6AkfpMVyFrXeb04JQUP6hN6S8kgSW9xtxw/t85Xy6A==
X-Received: by 2002:a05:6402:6cb:: with SMTP id n11mr11866521edy.112.1628241833085;
        Fri, 06 Aug 2021 02:23:53 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o22sm3576234edr.19.2021.08.06.02.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 02:23:52 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][RFC][PATCH][dunfell] wic: Add --use-stock-fstab option
Date: Fri,  6 Aug 2021 11:23:37 +0200
Message-Id: <20210806092337.81924-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <f5204c03e3394a38e6663e56b0072d9d65bcc34d.camel@linuxfoundation.org>
References: <f5204c03e3394a38e6663e56b0072d9d65bcc34d.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When embeddding rootfs image (e.g. 'rootfs-dir') as a partition we
might want to keep the stock fstab for that image. In such case, use
this option to not update the fstab and use the stock one instead.

This option allows to specify which partitions get the updated fstab
and which get the stock fstab.

Example:
    part /export --source rootfs --rootfs-dir=hockeycam-image
    --fstype=ext4 --label export --align 1024 --use-stock-fstab

    part / --source rootfs --fstype=ext4 --label rootfs --align 1024

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---

The commit-id ce682a73b7447652f898ce1d1d0416a456df5416 reverted the
functionality to restore the stock/original fstab file in a rootfs
partition image (wic plugin).

Add back such functionality with an option to the user to select which
fstab will be used for each partition by adding the --use-stock-fstab.
In this case, the user will select whether or not the stock fstab will
be updated or kept.

If you agree with the patch I'll adapt it to the master branch.

Daniel

 scripts/lib/wic/ksparser.py  | 1 +
 scripts/lib/wic/partition.py | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 452a160232..64933e0a5b 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -184,6 +184,7 @@ class KickStart():
         part.add_argument('--use-uuid', action='store_true')
         part.add_argument('--uuid')
         part.add_argument('--fsuuid')
+        part.add_argument('--use-stock-fstab', action='store_true')

         bootloader = subparsers.add_parser('bootloader')
         bootloader.add_argument('--append')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 85f9847047..c9e45773de 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -54,6 +54,7 @@ class Partition():
         self.uuid = args.uuid
         self.fsuuid = args.fsuuid
         self.type = args.type
+        self.use_stock_fstab = args.use_stock_fstab
         self.updated_fstab_path = None
         self.has_fstab = False
         self.update_fstab_in_rootfs = False
@@ -286,7 +287,7 @@ class Partition():
             (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)

-        if self.updated_fstab_path and self.has_fstab:
+        if self.updated_fstab_path and self.has_fstab and not self.use_stock_fstab:
             debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
             with open(debugfs_script_path, "w") as f:
                 f.write("cd etc\n")
--
2.30.2

