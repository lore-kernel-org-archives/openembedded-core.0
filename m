Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB05C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:08:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.5147.1659622114571565437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=L4T8oChl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d16so11325451pll.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E3nz8SLb6Tkr0Ii3zablwUamWwe9U7uy5ediw6ylS8Q=;
        b=L4T8oChlGLc1fUUO57CeKa+D/9PHfkRp6nlJo9vPXBRAFIOhtKna1ytAIEKxgUFy6G
         Okqrp/2s3Md38qTznQ91AwMRi+IRxcKH/MMK6SlS+KQkctBl7UOYe9mnZ1AoEnxXe+gM
         iCfs42YkRu53NBD9Oyph85sr+EzsqDDPUUEExKwbcO/rPAIMY1DvaRdFyDIbESGwMbm6
         vAFkYppqnNJsOrgCv9Si4Cqn0up9nxQcki8TymthnpdBxo0YSxC1Ic7iTmHXPpLSufU4
         4tan6OmrQpH2otonCARQTzOZrq/RvpPw/xfLSRLrMpaJoiiw6OMIwRatdxF2woOAGKOp
         zEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E3nz8SLb6Tkr0Ii3zablwUamWwe9U7uy5ediw6ylS8Q=;
        b=nwvkHxEJzMt8ixaRY9UWRj6yplRUwjVOSNxVirL0HSuqmpBqIUdpc48mVeyPuJp4xr
         jIkTaTazqGKiIecnDe7FY7COYJdrg/HlvCE9u/dX53B64TkA/dzSzUICSesDTTKE9ooK
         8EZJHOgP2hlsfq7F5aaygxD2Zp7LUVRPp1rxFwXWzKl3yhPT2mSnWj8nus9SNraTH/nq
         1es3F2OGggZRjGuJyG429Gc2G33LNXY3BvIM6g6Cf2S1qTbrxfZRRruMJE/vDH1r8Kuw
         yW5KUniH1uyeU+vSfBX1PevAvKMVSBAllICtEJHTHZrz3mMwmAQLTsBgAMf2yVp/8X+o
         IY0w==
X-Gm-Message-State: ACgBeo0UPw0pYhzGy6gNQ9zg8rhHMaSHOMU4REjX8fTv1EMFHYTBAvRL
	hwCZPBzQDGrp8B4ZC9uQHv19djfwUMWdpxod
X-Google-Smtp-Source: 
 AA6agR6DWb0R1XcaDa00dsLspvV/Q9b81ZolAJ4d5Uuq68OqS5PiMR57pSIzXkKrB72b3Mqy/vy4Xg==
X-Received: by 2002:a17:903:24c:b0:16f:8937:6ac7 with SMTP id
 j12-20020a170903024c00b0016f89376ac7mr660369plh.6.1659622113436;
        Thu, 04 Aug 2022 07:08:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6215cd000000b0052d5e93fcb7sm970261pfv.191.2022.08.04.07.08.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:08:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] package_manager/ipk: do not pipe stderr to
 stdout
Date: Thu,  4 Aug 2022 04:06:05 -1000
Message-Id: 
 <fd5689696731fefa0d035fde86f27a0135dc31f1.1659621460.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659621460.git.steve@sakoman.com>
References: <cover.1659621460.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168851

From: Shruthi Ravichandran <shruthi.ravichandran@ni.com>

Some opkg commands print an error during cleanup when the tmp_dir
does not exist and an attempt is made to delete it. The error messages
are harmless and the opkg commands eventually succeed.
When these commands are run and stderr is piped to stdout, the error
messages may clobber the stdout and cause unexpected results while
parsing the output of the command. Therefore, when parsing the output
of a command, do not pipe stderr to stdout. Instead, capture stderr
and stdout separately, and upon success, send stderr to bb.note().

Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f2167ae80258253eb47a5b148546b265320284cc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 23 ++++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 4cd3963111..9f60f3abcc 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -102,12 +102,14 @@ class OpkgDpkgPM(PackageManager):
         This method extracts the common parts for Opkg and Dpkg
         """
 
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
-        except subprocess.CalledProcessError as e:
+        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
+        if proc.returncode:
             bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-        return opkg_query(output)
+                     "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
+        elif proc.stderr:
+            bb.note("Command '%s' returned stderr: %s" % (cmd, proc.stderr))
+
+        return opkg_query(proc.stdout)
 
     def extract(self, pkg, pkg_info):
         """
@@ -443,15 +445,16 @@ class OpkgPM(OpkgDpkgPM):
         cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
                                                 opkg_args,
                                                 ' '.join(pkgs))
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-        except subprocess.CalledProcessError as e:
+        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
+        if proc.returncode:
             bb.fatal("Unable to dummy install packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
+        elif proc.stderr:
+            bb.note("Command '%s' returned stderr: %s" % (cmd, proc.stderr))
 
         bb.utils.remove(temp_rootfs, True)
 
-        return output
+        return proc.stdout
 
     def backup_packaging_data(self):
         # Save the opkglib for increment ipk image generation
-- 
2.25.1


