Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id BFB4371F50
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 13:40:52 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so12873978wgh.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 05:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qJT+0lIz9wyfKkVCl/0AWFzEEGJFf82Kzsy4dGX0+18=;
	b=R3WzXKQqVEzz8KueCfOTQvsu4pesWBB7QssuH+to//l86/oVXn9bR89de/EtRy5FxQ
	diwaW2ZwCbZBmiktX8PZbGbdMevRBZHgvA/ToVcH45k8pjVEAFFKnNBUeL7sH9XLMOUd
	W0qANoRhIJdYbrXxXitMCesO9cQkF81Mt2k7gzvHMF2xDqqfbeJL8/GUcr/cYoipI5tO
	lLVn4I6ktIaMrOgJDR1ROIZL9kn82LM81GV6zhRuztd8V2jKGBB8CD/lrTObK371LSCa
	FXm2Z8ohypk7u4thhmN9ID4yI2MqYAFMeHlDyhd96HSCRJbLm80JYTZqfP9v6cyOI9LX
	A3og==
X-Gm-Message-State: ALoCoQkTtXqV5wxyCdUMD+pvSTM/wV9xLQ0Lt8nX7Tx2qBBYfSlMCjBAbtaObg3ENIjChzqnP0bL
X-Received: by 10.194.203.234 with SMTP id kt10mr2666650wjc.135.1415108453256; 
	Tue, 04 Nov 2014 05:40:53 -0800 (PST)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id ei1sm1072853wib.20.2014.11.04.05.40.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Nov 2014 05:40:52 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 14:40:46 +0100
Message-Id: <1415108447-16821-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1415108447-16821-1-git-send-email-koen.kooi@linaro.org>
References: <1415108447-16821-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 2/3] lsb 4.1: fix /usr/lib/ hardcodes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Nov 2014 13:40:58 -0000

Also collapse do_install and do_install_append.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 34a70d0..897520a 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -72,9 +72,7 @@ do_install(){
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc64
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc64
 	fi
-}
 
-do_install_append(){
        install -d ${D}${sysconfdir}/core-lsb
        install -d ${D}/${baselib}/lsb
        for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
@@ -84,9 +82,9 @@ do_install_append(){
        install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
 
        # creat links for LSB test
-       install -d ${D}/usr/lib/lsb
-       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/install_initd
-       ln -sf ${sbindir}/chkconfig ${D}/usr/lib/lsb/remove_initd
+       install -d ${D}${libdir}/lsb
+       ln -sf ${sbindir}/chkconfig ${D}${libdir}/lsb/install_initd
+       ln -sf ${sbindir}/chkconfig ${D}${libdir}/lsb/remove_initd
        install -d ${D}/${libdir}
        ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
 
@@ -120,8 +118,9 @@ do_install_append(){
                ln -sf ld.so.1 ld-lsb-ppc32.so.3
        fi
 }
+
 FILES_${PN} += "/lib64 \
-		/usr/lib/lsb \
+		${libdir}/lsb \
                 ${base_libdir}/lsb/* \
 		${libdir}/sendmail \
                "
-- 
1.9.3


