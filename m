Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89D1C43219
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:31 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.16727.1667744306937325343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GLSQk8M/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id io19so8913244plb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYOE1waCo1uqFxjNWCEi2N4oXXjN97Sg0RjuJKbu1qw=;
        b=GLSQk8M/wkASw+oboSrmKthlh11riSEktiLiOQnOUCtzpmVDmyJsHRwfwdBEwe7222
         BJj/hxi9MxPuWCfrKb8Nc3+dE7YShZmHs4ZGlM3BGSNeyvg7p2oVWOH0Xm0J5HejU1ck
         vfL9UtZiKcI94HY0WzrO8Q32difmx2OsTMN22ILUV3waDrRoYoMUPhhDiDf4swiKyYqU
         nRLazg+mq/+Q59JDA/g7D6Refq0/iS2LcssYAR5LPmz9KnWRVeHclGH9Iw11Tf8zSLIq
         KgGwrb2bIBfkNroRGMFCSVr+qWJTZ6/hABErYfTcLxg9+wHBDguLoE/ru3oVXWXkAmUs
         7hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYOE1waCo1uqFxjNWCEi2N4oXXjN97Sg0RjuJKbu1qw=;
        b=KE/vUgrI/LrF2rPe8ONd8fqn8kcgBL+QQMSE/4IQdfY51RW+LZjKqTmOJExZvmMGkp
         IY3k02x3QS9A+Uk1tajeMNBOExWEX81jRmCKHpxcu+1JMCi++HveHQHf65AI4/51BQvl
         3kiIp45L90qJqO65TJlEt8c5tslcfZ9Jb+SyNtr1tera5+C0p5VkVVHTcJX0pfCocFJ/
         Tx4q7BAK5295kddU47GHNcVkkDYxz6eGFcPjrHW5oslan5XqrZgGDvUN5DyKro+r+KKf
         y1D/oEbccddduxUPA8u79nSaXV8+HgXHISVq9o5U7ShAezeGKTK8kVAbDnjOmql/nF+f
         dc5Q==
X-Gm-Message-State: ACrzQf2n9+UrrsfrnITeF7IsFdIXUfoKNIEbfOvJfS1f1nVRidRjU4KS
	fCfoph5QXKH+PKZa8rNJ2/5vfkBh3QGfosFW
X-Google-Smtp-Source: AMsMyM4QxcL351zhjuL7vNjwIUj4QPg6GVfnu7uv5EdBj1XzsEy39Soc0I1EmFtawEfx0btLbB2QMA==
X-Received: by 2002:a17:90b:1095:b0:213:ee6a:f268 with SMTP id gj21-20020a17090b109500b00213ee6af268mr34477027pjb.213.1667744306017;
        Sun, 06 Nov 2022 06:18:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 28/34] kernel-yocto: improve fatal error messages of symbol_why.py
Date: Sun,  6 Nov 2022 04:17:11 -1000
Message-Id: <97cb48ce09d80e5496e4f887a8cf02125c66c6c5.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172796

From: Jose Quaresma <quaresma.jose@gmail.com>

Improve the fatal error message of the yocto-kernel-tools symbol_why.py
and shows the command that generate the error as it can help understand
the root cause of the error.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 54ae08779071f2e97bff0ff6514ede3124312c3b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 8eda0dcaf3..1a6695ba7e 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -506,7 +506,7 @@ python do_config_analysis() {
                 try:
                     analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c], cwd=s, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
                 outfile = d.getVar( 'CONFIG_ANALYSIS_FILE' )
 
@@ -514,7 +514,7 @@ python do_config_analysis() {
                 try:
                     analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary', '--extended', '--sanity', c], cwd=s, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
                 outfile = d.getVar( 'CONFIG_AUDIT_FILE' )
 
@@ -575,7 +575,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
@@ -597,7 +597,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
@@ -616,7 +616,7 @@ python do_kernel_configcheck() {
     try:
         analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed: %s" % e.output.decode('utf-8'))
+        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
     if analysis:
         outfile = "{}/{}/cfg/redefinition.txt".format(s,kmeta)
-- 
2.25.1


