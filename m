Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E629C001DE
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.350.1688831782798721095
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=S8npY0Na;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b8ad8383faso21061175ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831782; x=1691423782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi+COrKqfHoSuH1v8vMmA9pmlOCQxb3n+Vtr9ASvE68=;
        b=S8npY0NajecCc01QxJLjul8tUgsAtQdvxWWWZ2voFJHg+IHxnfoHobSoy/UJG3WuA6
         k3E5X/ZYF4WWVlTD+pKMKhnivizOlm6O0kFvfccxvnSbHWjY+1DRL0ogCC70dN8KkJvA
         X5bl6tPK+p9QnTfpH7Kv3bmoCGs+kabZMZO2VDuCwdvxLdmVkRvX/J/lykeR0TgbD7CP
         y+6mqXIZ6rGiPGPhwEDQ2mU5fG9fh3XNkyLjVgW7z4GXmWtjGbkqQoEt4ge4rdJUu/M8
         /0J5Yv39p643opNY1XpcX3Fmpn77xeMgg2FlPIQoEZUp2VVjMjwRxCXbUEB+SPoKFBLK
         i9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831782; x=1691423782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi+COrKqfHoSuH1v8vMmA9pmlOCQxb3n+Vtr9ASvE68=;
        b=hxsSWREg1Hj9SSzdkW5SchOwJF7ao7Euzd14iuKYuNIyhKxfwpwr+q/OOk6AjIg5uc
         mt1rYTIaBg78t3ua6ZZ1nBQIUJf/EXDXlXJriL5EG18lwyg6zmIg3i2Sy9oJcjeGbrUi
         5+ME2At1cMIzl3EjXVFWNMHnDGyKgru3HRHSpgcGWCQSjpP8VeZVFbB5iDpxsg0MZNJS
         15W4eTYk34wCMo/hnK/d8kldsiAR8xNE66eCXXtLzz4ndJzBaPZ++fDSeP2YS6b2ILfs
         dvD+gitIqBvVK3mrOEOhRMdIcrcw95glHWB3p2glbdMM7sgGeK0/wXJ870NCmyh0StYr
         nr/A==
X-Gm-Message-State: ABy/qLZujDlEOaNlG3Op8uAinswMFAQ6sTddx8eCqYMbqILo/FBeBPC2
	+13D+dxg2P/aYF1XtOkA765aS2umwY0RVr+Nkx0=
X-Google-Smtp-Source: APBJJlHr8uIE8dkn1ECNYwZM+e9EIzgM61DbBITKkhJECpUgj9o3plbvVKrIb1/mkvPZgnzGj4A4hg==
X-Received: by 2002:a17:90b:4a92:b0:263:5d42:79f7 with SMTP id lp18-20020a17090b4a9200b002635d4279f7mr8801058pjb.23.1688831781778;
        Sat, 08 Jul 2023 08:56:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/17] pm-utils: fix multilib conflictions
Date: Sat,  8 Jul 2023 05:55:46 -1000
Message-Id: <292ff56250d2f916370c508fd7a94f3ab769a356.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184032

From: Kai Kang <kai.kang@windriver.com>

It fails to instal pm-utils and lib32-pm-utils at same time:

Error: Transaction test error:
  file /usr/bin/pm-is-supported conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-hibernate conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-powersave conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-suspend conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-suspend-hybrid conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64

All of the conflicted files either is script which source a file in
${libdir}, or a link file to some file in ${libdir}. Compare the content
of installed files in ${libdir} exclude binaries, only the paths of
${libdir} diff. So re-define libdir with ${nonarch_libdir} to fix the
conflicts.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f836541bcfdbf033a37537530b4e3b87b0a7f003)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index cac09101c4..fa3b993788 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -19,9 +19,12 @@ PACKAGECONFIG[manpages] = "--enable-doc, --disable-doc, libxslt-native xmlto-nat
 
 RDEPENDS_${PN} = "grep bash"
 
+EXTRA_OECONF = "--libdir=${nonarch_libdir}"
+
 do_configure_prepend () {
 	( cd ${S}; autoreconf -f -i -s )
 }
 
-FILES_${PN} += "${libdir}/${BPN}/*"
+FILES_${PN} += "${nonarch_libdir}/${BPN}/*"
 FILES_${PN}-dbg += "${datadir}/doc/pm-utils/README.debugging"
+FILES_${PN}-dev += "${nonarch_libdir}/pkgconfig/pm-utils.pc"
-- 
2.34.1


