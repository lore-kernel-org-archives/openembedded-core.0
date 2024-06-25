Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101E9C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 19:15:25 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.5253.1719342918659719745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 12:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEILCjFt;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso48761595e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 12:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719342917; x=1719947717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=45bPqRXbvKtcD1R/zm1bRAvlC39uvYNqSnQoIKkAmC4=;
        b=TEILCjFtCpbyJyCVUhcAM2oXco+cyDINUtAA6bt5/efRFZ8aLeTBXxujxXjAvNNKlP
         oCepiaJEzzbvMZ5s9AJf2DmGtlCdZdcsq6StP7aS2o7gU2AiN5F2d48S5wKg/fzSf8Ma
         e6KE5nxR/qS8+Bpdmqs9xzvDCMlkpaL5xOPERgm5W76w9mWKuWB+XqBT5p+WB24oqZf0
         Y36ygIA2CG5CLRoctQZ+jMoTFnBc3GYOr84kBieFQ54Y2x41V486o6pzrsGIfLZnMNYp
         kzxooMkyR5qE5Swpr/zl7PTuAX4h/VnMq76aHVvqxzOW7ty62abwS+elOMpHtVJ2iaUz
         OG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342917; x=1719947717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45bPqRXbvKtcD1R/zm1bRAvlC39uvYNqSnQoIKkAmC4=;
        b=iQ5Z7RT6vw08WtnSToOu50ygIqHuaW+MhXDlsfWLsfy7t4G0hQ09UD37FHPNm3ocpA
         c8vqA+mnhZebymvlNHPBQ4tfY82FbVurUUyXa9tjjAduqxWwqrAfUq3J9Ayjp4PPkkKY
         QxLO2G9ONvKp47/FUwuB2P3bzW5e4jfnI6grojl0OOn5ULzE7rWNEwjMXAYh3IYMrBEf
         j8qPw9f3PeL+uZe+dQp6h+nNA1xGOK4CtofPjMg/FRxVvKzYloJIR4z6Nrs3BenL+Gtb
         VvKAkOtbMDKPqjvWx+SLIbPAH2uN6CJLMQ9vBxfLmhLn1adCRASK+f1FBGXNGyeXeHHP
         rtYw==
X-Gm-Message-State: AOJu0YwohJgLiTSU+4+m+PNlnhpMIXr+36RkCFApVqLb8o7k7R/SCKEY
	7t/B+vkYwvS8JEeQV+n5hlHapSp57CIUwW9sVGNCCoBmreSFpy07wepHARW0aYE=
X-Google-Smtp-Source: AGHT+IHuAL4GfI70QPtvIqK2LEcZ6k8PKqAcrwGdCKE7VsYuO0R99BOoh2Y2MY5lNcWyZMrGcgJsIQ==
X-Received: by 2002:a05:600c:993:b0:424:a5d6:6512 with SMTP id 5b1f17b1804b1-424a5d665f9mr14014785e9.20.1719342916668;
        Tue, 25 Jun 2024 12:15:16 -0700 (PDT)
Received: from ubuntu-jammy.qtasks.com (178.72-31-62.static.virginmediabusiness.co.uk. [62.31.72.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247fe1b5desm205836585e9.4.2024.06.25.12.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 12:15:16 -0700 (PDT)
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sreejith Ravi <sreejith.ravi087@gmail.com>
Subject: [PATCH] package.bbclass: Add Requires.private field in package_do_pkgconfig()
Date: Tue, 25 Jun 2024 19:15:13 +0000
Message-Id: <20240625191513.22142-1-sreejith.ravi087@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 19:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201145

Currently, the package_do_pkgconfig() only handles the "Requires" key
field from the .pc file and ignores the "Requires.private" field while
generating the dev dependency chain. This results in a broken dependency
list and requires the installation of recommended packages to resolve
the build dependencies when using the dev IPKs. This increases the
hard disk space usage and download time and installs many unnecessary
packages as part of the recommendations.

This patch ensures that the "Requires.private" field is also considered
when creating the dependency list for the dev IPKs. With this, the dev
IPK will have the proper dependencies listed, eliminating the need to
install recommended packages to resolve the build time dependencies.

Example: usr/lib/pkgconfig/libical.pc
----------
Libs: -L${libdir} -lical -licalss -licalvcal
Libs.private: -lpthread
Requires.private: icu-i18n
----------
Depends field generated for libical-dev
Depends: glib-2.0-dev, libical (= 3.0.7-r0)
------------

When trying to resolve the build time dependency with libical
package using “-dev” ipk generated, it will throw the below error.
-----------
Package icu-i18n was not found in the pkg-config search path.
Perhaps you should add the directory containing `icu-i18n.pc'
to the PKG_CONFIG_PATH environment variable
Package 'icu-i18n', required by 'libical', not found
-----------

This patch will fix the broken dependency list.

-------
libical-dev depends field generated with this patch
Depends: glib-2.0-dev, icu-dev, libical (= 3.0.7-r0)
-------

Other examples of packages generated with broken dev dependency.

libflac-dev : https://packages.debian.org/sid/libflac-dev
Without patch:
Depends: flac (= 1.3.3-r0), libflac, libflac++
with patch:
Depends: flac (= 1.3.3-r0), libflac, libflac++, libogg-dev

libglib2.0-dev : https://packages.debian.org/buster/libglib2.0-dev
without patch:
Depends: libffi-dev, libglib-2.0-0 (= 1:2.62.6-r0), libpcre-dev
with patch:
Depends: libffi-dev, libglib-2.0-0 (= 1:2.62.6-r0), libpcre-dev,
         util-linux-dev, zlib-dev

Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 67351b2510..084fe428e5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2182,7 +2182,7 @@ python package_do_pkgconfig () {
                         if m:
                             hdr = m.group(1)
                             exp = pd.expand(m.group(2))
-                            if hdr == 'Requires':
+                            if hdr == 'Requires' or hdr == 'Requires.private':
                                 pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
                                 continue
                         m = var_re.match(l)
-- 
2.34.1


