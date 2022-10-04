Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646ECC43217
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:48 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.12241.1664898702000238135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4hJixYU2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 70so13206826pjo.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=qgciL1UPMjA/3ol3QJT6K/9wYszsO4DeZtwbRy+TCyc=;
        b=4hJixYU2F3koujUwpCMGJ78l9pTxnv95KP+jfUNa0HAYcE9V8lpkDIdb/wEyDh6jAf
         SAISOFbHqIFdzRn9FEcDOJZtQLlS+w28UuFBrtte+/JfEkf0oIT8xRmQu+zJWPA08UgD
         tKqdi379GNB9HB7vxx9EormYgKLd+5zFGSGIEqGHTxGyQYV4QLZzno7piXt3Nd6JEZCt
         1eIc30ajpFganXtsTBBoln18nXbT4ENU8PjcJaTGeXzpjbNnSKOXX45kJL9u6KFNOHhy
         9aALDMfctV+Kh3iU5aOKwZKoGbxg35+GEYJPkxG4QZMjRQk/BW3LLE4G+JKRUsOelc+l
         XEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qgciL1UPMjA/3ol3QJT6K/9wYszsO4DeZtwbRy+TCyc=;
        b=eu+CtKfsVcXcYc4GJigpyhGuFFMMFtjDqeorrhlO4JcsphPGX4b4GnsA1KsJLa4mR0
         3tmI4U2/PSieKaP8z5fMVthaqGzm2zoq0gBYlB5rUFno/nqHR+R8x7T1YLnqpIe5bvus
         ZBMIGlFtvCsl3Gpx7StPjHZiUUDp6ZCCPWUkXuNybFlCbsHspir4ZyaPqB0I9lS4uqda
         odJ+ybJokivozXrsscFsb3VrWFLjzQYCyHQ6JAPRJNZAF3oH9gsvF8dta/pcA3gYJJZd
         90toU+yeZyElcHc8ve0tuqBbWRke0weeNzX+Oehk0tIQ2QIfTQ55j4fWo8lVgqxQP3ar
         r7Aw==
X-Gm-Message-State: ACrzQf04j4QJiM+jheEoJAs3s+7t+rPGos2DoYpC0QbWK/HL6RwZEB6S
	p15Oi99E74MqaKFzgy27Ue1+JcAIpJhzxpNz
X-Google-Smtp-Source: 
 AMsMyM6sgg0mbCO7TbgyY8HJXf2ZM9Zb9+H2mieL5Q6SAo7r3zwACxRkLuELbEkNSvqRyomSgHVEjQ==
X-Received: by 2002:a17:902:d708:b0:178:a2be:649b with SMTP id
 w8-20020a170902d70800b00178a2be649bmr27858816ply.121.1664898701082;
        Tue, 04 Oct 2022 08:51:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/18] glibc-locale: explicitly remove empty dirs
 in ${libdir}
Date: Tue,  4 Oct 2022 05:50:45 -1000
Message-Id: 
 <46b703dbbddf612f70d9fd402b8538fca9c757e4.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171423

From: Denys Dmytriyenko <denis@denix.org>

glibc-locale defaults to ENABLE_BINARY_LOCALE_GENERATION ?= "0", but gets
changed to "1" in the default-distrovars.inc

When it is explicitly set back to "0", it fails with this error:

ERROR: glibc-locale-2.35-r0 do_package: QA Issue: glibc-locale: Files/directories were installed but not shipped in any package:
  /usr/lib/locale
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
glibc-locale: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: glibc-locale-2.35-r0 do_package: Fatal QA errors were found, failing task.

There's a code to remove empty dirs in ${libdir}, but it's keyed off of
PACKAGE_NO_GCONV to clean up $[libdir]/gconv, just extend it to also cover
other empty dirs, including ${libdir}/locale.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index b8de7d3192..7c14abfe99 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -87,10 +87,9 @@ do_install() {
 	if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
 		copy_locale_files ${libdir}/gconv 0755
 		copy_locale_files ${datadir}/i18n 0644
-	else
-		# Remove the libdir if it is empty when gconv is not copied
-		find ${D}${libdir} -type d -empty -delete
 	fi
+	# Remove empty dirs in libdir when gconv or locales are not copied
+	find ${D}${libdir} -type d -empty -delete
 	copy_locale_files ${datadir}/locale 0644
 	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
 }
-- 
2.25.1


