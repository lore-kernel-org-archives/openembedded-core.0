Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DC1C27C44
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:26 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.36170.1717244722540327236
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ktsZiJL+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6c4926bf9baso1187625a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244722; x=1717849522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLBZNC9MOCZA818NHSsDITzDvaxmznFPKrebneg9Uu0=;
        b=ktsZiJL+Dqz+wGXe6NRob0I+dNtyjov4zPQcFT58tbbdLzXqFjh2S0kytnW9im/0eS
         B+tW+LU+D6KXLFCxNAitFqi/w62/JWEcDNnYtZHzHo2I3wOIWxP04vrOXcOOyR4EC4Zv
         q2+AZ9QlLX3UcHO8M4xMrQzCuLys6OSFqtxIYyX8WdbzkSiXtt7PtcxemfhECEopVgE3
         dVBDvQHoiwuI34gMXmz62tu99GRioL3db1AGrezPPrycuO1Yb9S3t+udy0bTZ1GzWvKV
         Muc0FPDXlCyK3UScZuLj+RbW4xhutzUkgrFzbMO21rbHnaNCBBtqB70fy7j6B8zr6zfd
         cXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244722; x=1717849522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLBZNC9MOCZA818NHSsDITzDvaxmznFPKrebneg9Uu0=;
        b=wggnHd8XSy583NdYPVRU4LzYll1/giaPEGZ0g4+2iXgprSQHJKqzSgp1d9FPRb/5oR
         KbyoSKb1smF7sA+VbYuUyUopmTOKmqcZlScsZPel8OFOAvgqPjKgcFTvEuLXjxO1m8EX
         ESJXJG7hYrWPyaoRAv0hJhBH+vpLLZFvtDk0jt2WKNJxXUS02zFP03mXyHBYsE7g1ERH
         jo4VDqoaMU9GQ/521Xwv4AUxLohr9/H6dVc52wCfiToHI2Of9jX8iGXvv6G7oMJbkuoa
         +i7J7QNwe3ri81OjOxzxsTDTKgjjXAUBY/2YBmSU84k4WoM/LBZ4wy1rLjmUsfkZlTWF
         uacg==
X-Gm-Message-State: AOJu0YyeMXuALN3Kp3wxfP15lTk8QFXXHydUKkHTevNdUE+iYjr2OPdv
	QMuij+8Ll7pl1ua5/5/3IRgpyxZI2nY2GHReNNibZZnGjF6Q8imHZjnIPqO7dynW8j/5QX7vINz
	1
X-Google-Smtp-Source: AGHT+IFOS1WxlwyTt59c/PjdTvF5Cv+BK+xyEQNFofdIcd9nuFsGSApXKoLrOWBgG1ORdBjLZyrfLA==
X-Received: by 2002:a17:902:d548:b0:1f4:a6cb:db3d with SMTP id d9443c01a7336-1f6370cebbamr53734445ad.44.1717244721778;
        Sat, 01 Jun 2024 05:25:21 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/21] ipk: Fix clean up of extracted IPK payload
Date: Sat,  1 Jun 2024 05:24:46 -0700
Message-Id: <ec1c6bc79f5ca219e77a379bbabc2dad808d2020.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200116

From: Philip Lorenz <philip.lorenz@bmw.de>

It turns out that the IPK payload tarball was actually cleaned up in the
concrete package manager implementation (most likely because at some
point Debian and IPK packages used different compression algorithms).

Globbing removes this ambiguity so move the removal of the payload into
the common extract method.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e2b02a54f482159e21902eeb997b21e00e9588e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 0f0038d00d..47e72cc7a6 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -159,6 +159,7 @@ class OpkgDpkgPM(PackageManager):
         bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
         bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
         bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
+        bb.utils.remove(os.path.join(tmp_dir, data_tar))
         os.chdir(current_dir)
 
         return tmp_dir
@@ -511,7 +512,4 @@ class OpkgPM(OpkgDpkgPM):
             bb.fatal("Unable to get information for package '%s' while "
                      "trying to extract the package."  % pkg)
 
-        tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
-        bb.utils.remove(os.path.join(tmp_dir, "data.tar.zst"))
-
-        return tmp_dir
+        return super(OpkgPM, self).extract(pkg, pkg_info)
-- 
2.34.1


