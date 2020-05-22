Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.14821.1590160423504849392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 08:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JO9KZ5rU;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 202so6718241lfe.5
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0jnnHPNGIGnZ7jXK2lJei3CjTEsz+y2/VJbBGS1tcNo=;
        b=JO9KZ5rUzLJREMxVD+J/DSF71hAkceHpoKrY4mAxgj2rvnqbgKFaP+ilVtHBXARA8p
         DxnVQF029HE2NZMboutCx3EYpmhhiTP7jqiIaOuzRy7JVjYsPHX4dLk+3DcpudiuAnjG
         54IRCEq+rxsxPwK2h6F+7IDeE6aTOJRyxwW7TvjlyhBRUvfDZkmCZVjeNRMkQH9kNnXV
         CJUYSAa4G6nlZGY6gYhI+gBYtULYhRxAhOIKN9/9k49dCmeqdti2QNnEKDsdGKbGafHi
         gNk67ALyJRPwRpNkK98ZvgmEEd4htcahSxNq/gyJ7u0IcJGvREo45t6BCZw0KJAbSv8F
         FVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0jnnHPNGIGnZ7jXK2lJei3CjTEsz+y2/VJbBGS1tcNo=;
        b=mLdiJI1SJO3uqWzOZod6WtBF/2END/Cao70M/LMSvvKYaw2mFgRq+pzPK903Zs5TvG
         QFwBE4HqaY1wYmyeM+Cimlyjdxe2gtT/m4MTW2EQV+KQcSPbeFzrRlzGREIzXmczRlc+
         R4XveZtKB73owlQ/SJNp7NJUFDyI0R+vzTrudBwTLthUob7r8Kz4xBSTO0x856oRWDe0
         hc9MnrGrWQQymX2xSGxVVyj1AVU7Dw8sLtFZbueeW1qilJ+IPn1Yn5py3Mk71qPqMYtd
         jFb3BW6498D4026EpDBgQIPsChH1Wgc9lOF9xivWFDfPjBpTFJlFZZVNC6+b4+i8A30q
         vNqg==
X-Gm-Message-State: AOAM530ixOwnrbEvywJDRJQj2o0MU8Wde5vQiFWCnJlsUGPnuHK94JzQ
	v7ZndpH9og/muGJjARLMe80U0SUrQA==
X-Google-Smtp-Source: ABdhPJwRSHhQB2QfsckUhe/CmHWxuhta/x3R04zKxvdl9LBIIxCwXX2khIulX6hCbWwZjUxawP7ojw==
X-Received: by 2002:a19:86c3:: with SMTP id i186mr1347662lfd.166.1590160421208;
        Fri, 22 May 2020 08:13:41 -0700 (PDT)
Return-Path: <ptsneves@gmail.com>
Received: from localhost.localdomain ([176.221.120.36])
        by smtp.gmail.com with ESMTPSA id i1sm2388025lja.3.2020.05.22.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 08:13:40 -0700 (PDT)
From: "Paulo Neve" <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [meta-oe][PATCH] 2/2] package_{ipk, deb, rpm}.bbclass: support per package user-defined metadata.
Date: Fri, 22 May 2020 17:13:35 +0200
Message-Id: <20200522151335.7918-2-ptsneves@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522151335.7918-1-ptsneves@gmail.com>
References: <20200522151335.7918-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up to now the user defined metadata was set recipe wide,
meaning all the packages generated in a recipe where the
variable was set would get the same metadata. That is not
always ideal and is counter to the per package control that
is usually available.

Keep support for package agnostic metadata but also add option
to add it to a specific option like:
PACKAGE_ADD_METADATA_${PN}_IPK = "mymeta: myvalue"

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/package.bbclass     | 4 ++--
 meta/classes/package_deb.bbclass | 2 +-
 meta/classes/package_ipk.bbclass | 2 +-
 meta/classes/package_rpm.bbclass | 5 +++--
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0b5cf47749..1678e0d794 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepkg, d, depversions=None):
 
     return pkg
 
-def get_package_additional_metadata (pkg_type, d):
+def get_package_additional_metadata (pkg_type, pkg_name, d):
     base_key = "PACKAGE_ADD_METADATA"
-    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
+    for key in ("%s_%s" % (base_key, pkg_type.upper()), "%s_%s_%s" % (base_key, pkg_name, pkg_type.upper()), base_key):
         if d.getVar(key, False) is None:
             continue
         d.setVarFlag(key, "type", "list")
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 790b26aef2..6ef9c8cb3a 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):
 
         # more fields
 
-        custom_fields_chunk = get_package_additional_metadata("deb", localdata)
+        custom_fields_chunk = get_package_additional_metadata("deb", pkgname, localdata)
         if custom_fields_chunk:
             ctrlfile.write(custom_fields_chunk)
             ctrlfile.write("\n")
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c008559e4a..f78cec7a70 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):
             else:
                 ctrlfile.write(c % tuple(pullData(fs, localdata)))
 
-        custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
+        custom_fields_chunk = get_package_additional_metadata("ipk", pkgname, localdata)
         if custom_fields_chunk is not None:
             ctrlfile.write(custom_fields_chunk)
             ctrlfile.write("\n")
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9145717f98..ab019192da 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -295,7 +295,6 @@ python write_specfile () {
     srcmaintainer  = d.getVar('MAINTAINER')
     srchomepage    = d.getVar('HOMEPAGE')
     srcdescription = d.getVar('DESCRIPTION') or "."
-    srccustomtagschunk = get_package_additional_metadata("rpm", d)
 
     srcdepends     = d.getVar('DEPENDS')
     srcrdepends    = []
@@ -333,6 +332,8 @@ python write_specfile () {
         pkgname = localdata.getVar('PKG_%s' % pkg)
         if not pkgname:
             pkgname = pkg
+
+        srccustomtagschunk = get_package_additional_metadata("rpm", pkgname, d)
         localdata.setVar('PKG', pkgname)
 
         localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
@@ -351,7 +352,7 @@ python write_specfile () {
         splitlicense = (localdata.getVar('LICENSE') or "")
         splitsection = (localdata.getVar('SECTION') or "")
         splitdescription = (localdata.getVar('DESCRIPTION') or ".")
-        splitcustomtagschunk = get_package_additional_metadata("rpm", localdata)
+        splitcustomtagschunk = get_package_additional_metadata("rpm", pkgname, localdata)
 
         translate_vers('RDEPENDS', localdata)
         translate_vers('RRECOMMENDS', localdata)
-- 
2.20.1

