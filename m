Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.4539.1588176712216402708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JDkVDu4w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id z1so1291380pfn.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LjNsXSi7jv5/pA/pTGrnFmxISMtsdHhqWclotDAPc4U=;
        b=JDkVDu4w8AYJJb5gSruUwT82zk9Qxn9hnuutS2Y3zparYvmQWNJxU7M0Cry/W2/oC8
         KYaYmiWc7EvQMoactVDySVjQNjEWG/NtRIef2ziHWnM9GRKjBNIoRZcEMQmlfD/1Sb/V
         xVKCZKbXD3cxeoI8e2DCHPs32cs+HVb1koo29oAELF7b2Lux4aI3gL79kgl2KCv58KDL
         ahjgvHIOHyEVjkQH9A7u9nBHmJZtpamFBDIfElHlL7H9Md2CD9PZPcRtn41t71BygsOX
         QADOafj+uztaxyQFoMDt9Ibi1BBmQKj+DVfpawcK+uWNDOcQdgCN/+INT+HQ3xZPDuXG
         425w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LjNsXSi7jv5/pA/pTGrnFmxISMtsdHhqWclotDAPc4U=;
        b=csGQBVw16e92MyMmvM9YfKqzLPdVbQNdXNby474KImfGBktxnqn6R+EUynX3aJtynv
         Za0ONvoVUbot2lQVdIsYEX1Z8YRLV1EZ8RqviP+Bsq8zqxUJ6zUwHTWDu4+Ow8KZnZaE
         50ANWWpb0ltkPdy1e6td/iAsrrzzYjUXyYFyp8lUsGlzqZGwdnV7amsiph28+IB93IAO
         z97qQf2NOWklu9VUkX+obkwtdv7qJJmgAYJpmteplwZ9RjF/sUUieo2rjmv85RQKHrHf
         6LFWQvLrQx5NveRfa9Yih2apdP/3crSYAFdP7MSp2r2NCmN1WQYpXmBjPKPlkyXSWcOD
         4ZPw==
X-Gm-Message-State: AGi0PuaUM+EwjydlyWKltxs7q4W08PaHUhu74MwiJisy6zxnU0ONlukP
	7KJyK5aTPTRBAuoImPZltgikPcUpccZ7aQ==
X-Google-Smtp-Source: APiQypKXItIKPk/qKw3ci5cIhhVM2I1mZbszpi5I5+K84P3EzzuScTiJe9vuAVLB2FKNe+CBnJQePA==
X-Received: by 2002:a63:5009:: with SMTP id e9mr32220564pgb.381.1588176711315;
        Wed, 29 Apr 2020 09:11:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/16] tzdata: remove exit 0 from pkg_postinst
Date: Wed, 29 Apr 2020 06:10:54 -1000
Message-Id: <3108827db413b942e28c6075dab2eec184d54eb9.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Maxime Roussin-B?langer <maxime.roussinbelanger@gmail.com>

Documentation says that if you exit 0 in a pkg_postinst it will marked as
installed.
If you exit 0, before running postinst-intercepts defer_to_first_boot, the
pkg_postinst_ontarget script will not be present on target.

The "exit 0" in tzdata makes it difficult to have a bbappend with a
pkg_postinst_target step when you have `INSTALL_TIMEZONE_FILE = 0`

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 1e2d9bd1b9..1e2b440fb0 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -60,12 +60,8 @@ pkg_postinst_${PN} () {
 	if [ -e ${src} ] ; then
 		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
 	fi
-	
-	if [ -z "${tz}" ] ; then
-		exit 0
-	fi
-	
-	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
+
+	if [ ! -z "${tz}" -a ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
 		echo "You have an invalid TIMEZONE setting in ${src}"
 		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
 		tz="Universal"
-- 
2.17.1

