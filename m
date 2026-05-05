Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35706FF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 18:29:06 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.673.1778005739369802693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 11:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W3IWkGwN;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-448528f4e69so3314537f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 11:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005737; x=1778610537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCYcdYqlipwQ0HIF+cbtW4+7S1dXpvXs59A5ca87gPU=;
        b=W3IWkGwNxZB30niGsab/m2PEDnzwb72LdpBRIKxSBEE026YJ5V1gBL/VEGb3Tv84xQ
         JPuLVwsG6rqE2TR9skaGi7Bolq2Dv09ad2dH+GveS7SkVwHjJK/Qz142d4s0lHjPhd4p
         HWlyzc2NEH0XUvSU3GRkfflqcwqvqaFs39Zwn8QxqudBHIlxN88UDXjvPx/N3zC/D//k
         DJ/hHv+PRJlTjicmTLTo+UPCWCzfYfdLa1WVhdmMIf6fxjIEtoMVanHCyu4DFpF91epi
         3uavk/wF87rG1nJupgyDjnlu+Nibfw2Tky/qOsriFhLa9mn1eby3F0WStQVkn6PXBtQ1
         zqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005737; x=1778610537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bCYcdYqlipwQ0HIF+cbtW4+7S1dXpvXs59A5ca87gPU=;
        b=QCIzipRA0LZKsMotFxFsORdGu3TsyXzqa8TjS3OT2PW68Q2/Ky7QCEBFi2iuXTqKHM
         HMI5w+u1VC+Q6UYAr45NjsQYfCiM73MfKfveJjcyzoMhzbrww/jtRzzZHaWQrvi3ag5X
         p1E7vFFyzkFis/iIARo2G+CWG4LcAHkom+R7Ze8ReL4tMZtKFBnzm4BdmbuLtVLGMv8s
         m8EjRuhqZArUkNQOYkF3iDMPvqfSzdAqwICjXDeOwJo5OvzDClO/5LOCJNb1Yq5Pf3QS
         DAT3vsmAW24H7ZkNU/gehHhqZCH7lKJvMAlv3/ckBZPQLYXAtoVAUdLfw+tuLDyT7y10
         XvQQ==
X-Gm-Message-State: AOJu0YwMyiyt3zjeI6UEK/RSeHFE2Po3PWccrv5p2y1QV4Ukujx1Q/yU
	I78Tvurl1vMojhFHPzKRQBA+kQ5gp6oECUPagOejUcsfb8Q0vXiPTmjg7wpkNN62UUMc4A==
X-Gm-Gg: AeBDievYH514FcIrlle+VaNLGBlM9LyUEGDq249hNXYNvsIptow/wJSctCcmtBu0F75
	RdLORU+f+nWdodhxlYUAAFtMyDnZbj7ilcoOKrXDXGcX4GH9hIPrE5NnPbVWSIrhBTRapE0EJQE
	MdRP4oqNUqeJ59EW0U1sLDwLSzCipanywI3ViIQYgI6uFPjMnv4pa+9/tKKKTMW8VOwzINidfGO
	M50ndM6hvsMTA6clY+3FczeMMPMGnGDeWu3Xw9WsPDTKs7O0i8QE4jAErYJdXueKE+BE2284Vqw
	Iq1IHrDmQoDuzl4W3FmACbtcw/5ZH5Stal68tEhO9hdEkDFUuZKSx+6V12C2GENWym1hXeZQ1W2
	ywXGeSseI7IaSdAhvP/FjDpwwVDPfE9NdPl9XpwhD82QQGe5RGICXKrxqqnMohlCltbUH052K00
	afDRZXWdPY3TZsJObjUjweQkDxldSE7RVkhqu+PO8+K7lrcMNEOl3jpl1p/WKFmcdEjjIgwmg1j
	QGk8W0=
X-Received: by 2002:a05:6000:2f83:b0:43c:fe0e:5bbc with SMTP id ffacd0b85a97d-4515bae9122mr422910f8f.19.1778005737223;
        Tue, 05 May 2026 11:28:57 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([45.12.242.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03d4csm6818780f8f.22.2026.05.05.11.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:28:56 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v5 1/3] oe-pkgdata-util: fix empty runtime-rprovides directory handling
Date: Tue,  5 May 2026 19:28:42 +0100
Message-Id: <20260505182844.1136632-1-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505170521.1129945-1-sam.john.kent@gmail.com>
References: <20260505170521.1129945-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 18:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236524

An empty runtime-provides directory caused lookup-recipe, package-info
and list-pkg-files to skip the runtime-reverse fallback.

Use os.listdir() to ensure the folder is not empty and use
os.path.isdir( to ensure it is not a file.

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
---
 scripts/oe-pkgdata-util | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index bbfc6a2..904008b 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -289,8 +289,9 @@ def lookup_recipe(args):
 
     for pkg in pkgs:
         providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-        if os.path.exists(providepkgpath):
-            for f in os.listdir(providepkgpath):
+        rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+        if rprovides:
+            for f in rprovides:
                 if f != pkg:
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
@@ -355,8 +356,9 @@ def package_info(args):
 
     for pkg in packages:
         providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-        if os.path.exists(providepkgpath):
-            for f in os.listdir(providepkgpath):
+        rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+        if rprovides:
+            for f in rprovides:
                 if f != pkg:
                     print("%s is in the RPROVIDES of %s:" % (pkg, f))
                 pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
@@ -507,8 +509,9 @@ def list_pkg_files(args):
 
         else:
             providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-            if os.path.exists(providepkgpath):
-                for f in os.listdir(providepkgpath):
+            rprovides = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+            if rprovides:
+                for f in rprovides:
                     if f != pkg:
                         print("%s is in the RPROVIDES of %s:" % (pkg, f))
                     pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
-- 
2.34.1


