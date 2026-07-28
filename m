Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE764C54F9C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2802.1785277326039541951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YG2vh6Nu;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493f75f7172so2414305e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277324; x=1785882124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nT/p/ugL2UdURY1embxTI+oyyduUuhJkjzLc+1jMOQc=;
        b=YG2vh6NupWfiJhH/X8+BSZHD393+BZn1+2e2V0CaQ3/52P/x546MoM5PjbT91w4+JI
         Z2YvQUApxXTGUQlSQDqN+ibpSKl839k8wQXjqbkFJWbsqDWyk1OXL+HV+/O/ajOFXdvt
         ZALVSN8X4cajK8aoODqRlPcoto/T8OTxj+Qj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277324; x=1785882124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nT/p/ugL2UdURY1embxTI+oyyduUuhJkjzLc+1jMOQc=;
        b=BVGtG33cBMfXERZHh29FTMQR2irxTssNiC3rEEQaVThV6OhfwzejnrqG/ks4l3Fyrz
         r9X01inilAiuPAODcqIj25q3e1EkSQhMkCgYV/jbupBlXbc1vyCgLa3mpAAlAXmvVu7J
         lY3fdN9xawB6k6W36KzieIeFtTG8mD+dHs5B6N5WU1t/cLs7lf0/bnvjEtbanbZJAhnz
         gNN2tH76mmkYt6jyxBzNe0NDN3UbAv5mOc/2znbQadb+CS4tiO5ZrN/OuFb0lPrTbCDY
         J6T04B26PTdfavgwmzjH+0d+p8Zo6r662rQjZuiSHD8+h9Z55VFVvyxyrygDlHyMgvC6
         t9Lg==
X-Gm-Message-State: AOJu0YxziAvw3/jXAbdClbn6SlGb8U/GcwfxO3mQPv0vqRWts4nmtco1
	4cclMH9SR/37bFWo6hAz0dAhXOQ8WthcYPVXwb4Qs/pGk1HyockcmSjNCi7HCGbJU7z3grkWjBk
	ohCqxneM=
X-Gm-Gg: AR+sD10Zw+ukp+qS0txsxovIefanoNvPpOdKClxK0h4QvXFQ0Fmv2Ol/QDgteN9+ZRB
	QIwgaoxy1jQJYxlYOa1FcLj8YGoFH5yxjL/b2hxGAOE7NASFGU4J83OZ+Mh65cl2twfwyJY0JaI
	eKrkSOn1grwmHAYOwfJ/GIG4kfefSq6EUowdU2OQpJdOxce4OLEaMGKK+tF3ChG1W2VZXcHRgpy
	tYmMqe/iLCDkbwCJzYnYRFptI20Mkn9GCK6TYxCZE5hQpoh4+kWiYjlns29ygU+K6mUS0yaeSpp
	F1ZvG+OUpOVwbGOBIsTSgYh6TzNf8jcPBciNu5KhDBR7VQmOP4WHUkv9dWvfSk9N3JFsGiTTumb
	Hqz+oJGG5kmIVBIQxMQ+uO/9gKLubWkOmj7pBaj9GGGnAOc5fXswprHLraWG28JxD9uAhQNXNIW
	HMzQTTKsikevTslaYlQ+2oyFBABM7qC2n8YDm1L+dNV0HLg3nelHxZA2KH9DRmpVmZvKHtoPKu5
	lNLuQ/9XOsCxUy8f18+M1jSfLKkajFfa8eH0dGzZlvY8mRs0yBsuYUMppHabfdw
X-Received: by 2002:a05:600c:5298:b0:495:4df2:b8c1 with SMTP id 5b1f17b1804b1-496c659dd06mr41682355e9.35.1785277324316;
        Tue, 28 Jul 2026 15:22:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/19] package.bbclass: hardcode emit_pkgdata to run last
Date: Wed, 29 Jul 2026 00:21:37 +0200
Message-ID: <358a847c9dfaf56291f9eb5e2f150cae56044c7c.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242205

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Ensure emit_pkgdata runs after all PACKAGEFUNCS to allow layers to
extend packaging behavior.
Layers can now append custom functions via PACKAGEFUNCS += "func_name"
and they will run before emit_pkgdata generates package metadata.

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa85baff9ebdd3f932811c3b43d1918c38373cb9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index aa1eb5e901c..ffe3ed93eff 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -468,8 +468,7 @@ PACKAGEFUNCS += " \
                 package_do_shlibs \
                 package_do_pkgconfig \
                 read_shlibdeps \
-                package_depchains \
-                emit_pkgdata"
+                package_depchains"
 
 python do_package () {
     # Change the following version to cause sstate to invalidate the package
@@ -561,9 +560,13 @@ python do_package () {
             for file in files:
                 pkgfiles[pkg].append(walkroot + os.sep + file)
 
+
+    # We want emit_pkgdata to run last, after everything
     for f in (d.getVar('PACKAGEFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
+    bb.build.exec_func("emit_pkgdata", d)
+
     oe.qa.exit_if_errors(d)
 }
 

