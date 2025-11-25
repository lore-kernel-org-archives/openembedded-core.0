Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1DED0EE3D
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:10 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4354.1764104346773483879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kt+W9K9j;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7ade456b6abso4839948b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104346; x=1764709146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4VlydmI6xZO0FwGkoO1t2nwyxOA6zLQkRmSLwb7gs0=;
        b=Kt+W9K9jVlBMuHWi2lOJv7ltqsD/GiZFZaY47Uo1cHK6i2v8w+0h9azsltu8eTG3ed
         cpF9fHvgeKliyfrvmKUvVsSt4Ff2y9yjVwBdQbxOwcdJKXsDyMUUxxf07SRrrOLL39s4
         T3tYknxrBm00SKYdCwzKpR68iuTGqAtR6rDxHPLhpFmhnnlkDT8wIB44/rXlQ9+N4Qw+
         UaxoB0nkyl+TqWnOZUHZrQZS2eXzYW//n5UIsK7i/ieJxEZw32Nwk8zcX3CKdrtBxG2Y
         HJ2543zB5quH6TIQOotS4tEUHMS/X8AErPFu/6Ukt7xyNjGetEl4E8tDMuLraYqcuTn3
         9FaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104346; x=1764709146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T4VlydmI6xZO0FwGkoO1t2nwyxOA6zLQkRmSLwb7gs0=;
        b=HlRM2FubbWS8vPgw6+86n8KlTjyx0jh/0tl1ZpEV9Eo1IlCrUfBPy5j2CaSxo07tDR
         dJGVJEsiEveuQI4DlT8R06LcR/JEDiE5dthKumF++AU79t4xiQ9URpIlSxYgeWgPBx/J
         L02SlG4FV5S6M0eT65ia2Z9W0quA1zJv9hMAkI0cSOqL6aJzdqbCK3lji4tYfY0Aw3Qv
         MQZtT+m7+7O79vcgQqh49LqkyM47bUH8q1j56RODxF+tLhZzQYeiU6V4IOkyDpqCLBec
         Ozh+QFaBmdpAzuiJ7L6pNvsTyPee4huDXUJuo7ymbIXsYPOTofPrpPX6AfR0Q/pgWv0r
         nN0Q==
X-Gm-Message-State: AOJu0Yxwcmd8d8kPrwl70mB9b6X09VsP8lPw3GuzBfPVhprOKWkzkr+Z
	sXbXyF8fSdC52dELlTi0TsrUp0IUsx5KaHhTGUsXSyHaizYVidb8YqilvCAnrTzhNW/0gjMfIfG
	+eJEx
X-Gm-Gg: ASbGnct3GsHrbufrA/4OYi4V/XGy3m6Q0yVPr33LBCWT5mzgtLOLH9wuczLU5T543bS
	rdHdVJMos9WyXDHbCokbVbw1Y+xWRBA91ihnFoimam1rgt6ZMez8ULOXcI7b1JNlbDLoBImFcAv
	xXRiviFDHa41Orgv7CijJJFgeUrr93Q91Zb3Gh6amU8yEmBWgCRXs/sabJLPZU53RtSMqacO9Oa
	RZxnnVUayxxQqAEp5P0hTEhvnnxpkhWTzAP/aC0Kpf+b0Tc/3L//RwRPFuQPmPfz9SRceWyMMPz
	8hObbxxMaKah7yYY1c/E9jeY8Sx3zpY9No+u/S/js38V9OWkbwEyyzU+yXsIK59omylsLNayOw1
	nrS5aLL3LvcE2s+UAeC8H9IGnrZwXpiWw24CuMz2UfRkovJq9uW6UafAdagInr3TDWNG99vgDS3
	TcHA==
X-Google-Smtp-Source: AGHT+IFPxEGKNLdvzukELz2S+EL1dtA6owKzZZYA57hOERTdSwfgU5NI7nbKGMchy4ZO03aYuRgjgA==
X-Received: by 2002:a05:6a21:9994:b0:360:1b2e:5257 with SMTP id adf61e73a8af0-36150e1fcb2mr19134933637.2.1764104346033;
        Tue, 25 Nov 2025 12:59:06 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.59.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:59:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/9] vex: fix rootfs manifest
Date: Tue, 25 Nov 2025 12:58:44 -0800
Message-ID: <7493eeed6d53bc704f558a0ccf8a0b5195381873.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764104199.git.steve@sakoman.com>
References: <cover.1764104199.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226791

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

Rootfs VEX file is created by gathering files from CVE_CHECK_DIR
(deploy directory), however recipes generate the files only in
CVE_CHECK_DIR (log directory).
This make the rootfs VEX be always empty without any message.

The code is copied from cve_check class, which writes to both, so let
keep them aligned and make also vex write both files.

Also add a warning for case that a cve file would be still missing.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee6541d0940c65685aaafd7d41a59a9406392e7d)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/vex.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index c447b37db8..707e6f45a1 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -213,6 +213,8 @@ python vex_write_rootfs_manifest () {
             with open(pkgfilepath) as j:
                 data = json.load(j)
                 cve_check_merge_jsons(json_data, data)
+        else:
+            bb.warn("Missing cve file for %s" % pkg)
 
     d.setVar("PN", save_pn)
 
@@ -306,9 +308,12 @@ def cve_write_data_json(d, cve_data, cve_status):
     cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
     index_path = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
     bb.utils.mkdirhier(cvelogpath)
+    bb.utils.mkdirhier(os.path.dirname(deploy_file))
     fragment_file = os.path.basename(deploy_file)
     fragment_path = os.path.join(cvelogpath, fragment_file)
     with open(fragment_path, "w") as f:
         f.write(write_string)
+    with open(deploy_file, "w") as f:
+        f.write(write_string)
     with open(index_path, "a+") as f:
         f.write("%s\n" % fragment_path)
-- 
2.43.0


