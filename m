Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F50CC43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:59 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.108.1667835443548726819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wMKnSMP4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id l6so10961954pjj.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJ6/D3QG73dtJ+HPH6y/bY+gVkjjmF7gZmK38ZbN7PU=;
        b=wMKnSMP4bDbOOfJCRFDXD8SwFpHtj1Z/rphq7R2cjBE8iHwxHiKmV+DEflm+h8lsZH
         atqhhW4sDG5o0d1HdrL97NL3BP3ZaqrqIGdmdrQiQrnnoqJcY0d6iXJqzuuTiV4sxjeQ
         iJR7NjF3NxllnQofBthXC+jPkn+faAwf082aH4HGPd7he4b5AMM22fRLgBG+yVoLzn47
         WB1O8HFXjVpGDSc3bxpBramUOlhVgYlhQN72up5KRldY1v8DCAsAEIU3Rr0hwxBheZxf
         ayZzIwavLMjQw9/ag7/jirRSyFYcnqxtD5w5dRQUHYbmQNjv2wAt69V8phN2w68VNq77
         WY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJ6/D3QG73dtJ+HPH6y/bY+gVkjjmF7gZmK38ZbN7PU=;
        b=pf8oQSahhBJVuye/O8HI+xOrtYTZv2p9PGIAgfR10Atnxtb4jYYrozCFz01dTDh1KC
         k8ioeuK/LKlLKYpvcQJeLAnDN6aGciFr5MFreZFI+NHkQPpnRon48bwHZqNmhqkLQjh+
         U7X2zD7rJjnvcK4ttVrYa0nKiH7J5zv5ib4vtui4oVZ4M7Rba0T3bSS/Nc5jo71MF69l
         XCbrAKIYae/xobdvaO3d01juCC/L13tV+7KJeZVuyRUCEcbP4Aa4vzxlwjVyzxeotX23
         HdiH7WBZggzb+MADM5FgkZiE5N+j8GZWjMHGpPZP/RODWZmyPJKPG/TB4M+Ofs1m7QWM
         I0YA==
X-Gm-Message-State: ACrzQf0f6cY+WWbuPJiFN4VFgkg1JGWTYEn8KMW8hSOGetpQSX0Ex3wN
	4bPEHk9d+XlQ0SEOUWBcX/UIiJHO+Z2B5phu
X-Google-Smtp-Source: AMsMyM4T/llLORf/sDVHQkjaPL+2cRW2s09aF3Xx7I3IKodIKNIfgr9PCqS6cIdPQeDBPbOAzXiubQ==
X-Received: by 2002:a17:902:e5d1:b0:187:3593:a86f with SMTP id u17-20020a170902e5d100b001873593a86fmr35702442plf.15.1667835442581;
        Mon, 07 Nov 2022 07:37:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/25] kernel-yocto: improve fatal error messages of symbol_why.py
Date: Mon,  7 Nov 2022 05:36:33 -1000
Message-Id: <e09d98cb1f940119600f90045ed4525987f4f481.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172913

From: Jose Quaresma <quaresma.jose@gmail.com>

Improve the fatal error message of the yocto-kernel-tools symbol_why.py
and shows the command that generate the error as it can help understand
the root cause of the error.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 54ae08779071f2e97bff0ff6514ede3124312c3b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index e8046bb8f6..82e792351f 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -500,7 +500,7 @@ python do_config_analysis() {
                 try:
                     analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c], cwd=s, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
                 outfile = d.getVar( 'CONFIG_ANALYSIS_FILE' )
 
@@ -508,7 +508,7 @@ python do_config_analysis() {
                 try:
                     analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary', '--extended', '--sanity', c], cwd=s, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
                 outfile = d.getVar( 'CONFIG_AUDIT_FILE' )
 
@@ -569,7 +569,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
@@ -591,7 +591,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
@@ -610,7 +610,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/redefinition.txt".format(s,kmeta)
-- 
2.25.1


