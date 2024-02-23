Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BD4C54E49
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 20:31:08 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.5344.1708720263026449903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 12:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QD/0UoOR;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29a950152bcso253075a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708720261; x=1709325061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmeXEq74V+kbem0nkHknhQlZKLV7XZOQNb9JpxgNzx0=;
        b=QD/0UoORAAnO5ArpcUc3ERW8YTLep9GNhrzHbnuebE6yp8XoG90IJc7PbYcp6vM+Cr
         EItLjaeaqDiwC5X0o1CT8E7zkhLlURNAs3YMnIL7d+vWLntvSYjlDt7GHWeUYrLnEME8
         qO7HTNfvJy7vOfnLp7ODQgf4+vrlQmQEQ3uvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708720261; x=1709325061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmeXEq74V+kbem0nkHknhQlZKLV7XZOQNb9JpxgNzx0=;
        b=Cv9KiBjqa6RSNqKqwmCLTP6cVE/YTi7+Oe0aTZOzJ3vjNHOnzrPvTs18NAdeESl+j2
         LqUyGGg2uD5S9CxvqiFMth6otpczUQzR30h5upssiaiIc0nWhITgkXJ/zCEQIPau80n0
         cJuGKyFME/enIMLjdTkw+Aw2q+6zVp7pQ5lYp+RCPO7NbaESv7SzQ8mmjn3Ndgx1Pu5M
         9bUeGqxtZk2Y7BDzPgMv/sDVCIEp64V1GMP28kajFlTelq6+Dc90IU6k9A3FlZJ6NnX6
         EXzW+0iA865o1HvsaJP3AKPreXyl2rTtR62gA2kW5D/vo/MSv0Ji/6V1YlxZ3zwxOA7Q
         DDYA==
X-Gm-Message-State: AOJu0YzMxpJ4ZC5uATI7bfomruU43EyTNEt3jTrYaud10xiQFtyu+HGu
	77Xh9/APv/0j4pxXaYoMo9Q56L+oL4o4+/ofmbhJsxQFA6wUJRZfvrMa8UiL2BunpopW2jV7AEd
	V
X-Google-Smtp-Source: AGHT+IGz9CctzieAMWy56y5JgGRU4yDhRXnhRra3bXIMpPqpTc5uFeJKGOqbKbtaQA5FqaBJkVSk4A==
X-Received: by 2002:a17:90a:ce8e:b0:29a:9829:67f9 with SMTP id g14-20020a17090ace8e00b0029a982967f9mr532881pju.19.1708720261259;
        Fri, 23 Feb 2024 12:31:01 -0800 (PST)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id kx3-20020a17090b228300b0029681231ae1sm1929346pjb.28.2024.02.23.12.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 12:31:00 -0800 (PST)
Received: by brown (sSMTP sendmail emulation); Fri, 23 Feb 2024 12:30:53 -0800
From: jpuhlman@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [PATCH] package_rpm: Fix backtrace on missing directory.
Date: Fri, 23 Feb 2024 12:30:51 -0800
Message-Id: <20240223203051.1575654-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 20:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196109

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

This seems to work around the following issue. The recipe in quesiton
places all of its content in /opt, and we turn on license collection
globally. Systemd is turned on so usrmerge is also on. I doubt this
is the correct way to deal with this as it is not clear why it is
looking for /usr//usr in the first place. Not sure if its just a
wierd edge case or what.

File:
'/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
lineno: 527, function: write_specfile
     0523:            spec_scriptlets_bottom.append('')
     0524:
     0525:        # Now process files
     0526:        file_list = []
 *** 0527:        walk_files(root, file_list, conffiles, dirfiles)
     0528:        if not file_list and localdata.getVar('ALLOW_EMPTY',
False) != "1":
     0529:            bb.note("Not creating empty RPM package for %s" %
splitname)
     0530:        else:
     0531:            spec_files_bottom.append('%%files -n %s' %
splitname)
File:
'/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
lineno: 249, function: walk_files
     0245:                    target.append(get_attr(dir) + '%dir "' +
escape_chars(p) + '"')
     0246:            else:
     0247:                # packages own only empty directories or
explict directory.
     0248:                # This will prevent the overlapping of
security permission.
 *** 0249:                attr = get_attr(path)
     0250:                if path and not files and not dirs:
     0251:                    target.append(attr + '%dir "' +
escape_chars(path) + '"')
     0252:                elif path and path in dirfiles:
     0253:                    target.append(attr + '%dir "' +
escape_chars(path) + '"')
File:
'/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
lineno: 203, function: get_attr
     0199:        # of the walk, the isdir() test would then fail and
the walk code would assume its a file
     0200:        # hence we check for the names in files too.
     0201:        for rootpath, dirs, files in os.walk(walkpath):
     0202:            def get_attr(path):
 *** 0203:                stat_f = os.stat(rootpath + "/" + path,
follow_symlinks=False)
     0204:                mode = stat.S_IMODE(stat_f.st_mode)
     0205:                try:
     0206:                    owner =
pwd.getpwuid(stat_f.st_uid).pw_name
     0207:                except Exception as e:
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/build/tmp/work/corei7-64-montavista-linux/mvtest/2.0/packages-split/mvtest-lic/opt//opt'

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/classes-global/package_rpm.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2e3e4e8c79..a6885ac74e 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -200,6 +200,8 @@ python write_specfile () {
         # hence we check for the names in files too.
         for rootpath, dirs, files in os.walk(walkpath):
             def get_attr(path):
+                if not os.path.exists(rootpath + "/" + path):
+                   return "" 
                 stat_f = os.stat(rootpath + "/" + path, follow_symlinks=False)
                 mode = stat.S_IMODE(stat_f.st_mode)
                 try:
@@ -243,7 +245,7 @@ python write_specfile () {
                     p = path + '/' + dir
                     # All packages own the directories their files are in...
                     target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
-            elif path:
+            elif path and os.path.exists(path):
                 # packages own only empty directories or explict directory.
                 # This will prevent the overlapping of security permission.
                 attr = get_attr(path)
@@ -257,7 +259,7 @@ python write_specfile () {
                 p = path + '/' + file
                 if conffiles.count(p):
                     target.append(attr + '%config "' + escape_chars(p) + '"')
-                else:
+                elif attr:
                     target.append(attr + '"' + escape_chars(p) + '"')
 
     # Prevent the prerm/postrm scripts from being run during an upgrade
-- 
2.31.1


