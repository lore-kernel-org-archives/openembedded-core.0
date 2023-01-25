Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C80C61D9D
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:17 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.46700.1674657730495147498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KCy1Kx7/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 36so13503905pgp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Urs+MdjWSoG/sVGpyHZfZbyUUD3zDh3ZXk9qq7crb5o=;
        b=KCy1Kx7/qFZOQnmMMWE+5ra7tzFcV4fcFCpbi35sNpx9+EQ1B2ytaILbn1JwyS02PO
         qjjJT1k545CRJuoKDAZlQ6QDtF6YPyPvwI3mqwn7g5vUiAzA8Rptx0erInFbBCfGuXcH
         CxqlgxgrC0aoV2LPwhuX25kRsX3VzgMnZOncd8aCsz+rHwAhVOlbiY5t7981hxNMqkt7
         cZubnp9R55eDOBAHwjSzR+P7Ir9PCkjbhNCyVSA1hGNkq+NmRdEGrFCNPw+zb8cXCZKu
         9G+vegrly7bHUSmZzm5hf3RP9K62KGqoMYAv/XD85B3l3bnBn/3BGafLfZ28jFGRKuev
         DP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Urs+MdjWSoG/sVGpyHZfZbyUUD3zDh3ZXk9qq7crb5o=;
        b=0PWfO0LZrlJsnm9/aEh6Edfhk/NwKC3QCiFpDeUZtx2v+AqFOSrD668SwH2lm1HgaG
         yH0+PkU/WOqZdIRc0xCHblQ/r9ahCg5Im4FqedKyAyKlRnvNsqDCZ29kKwS2i903IF8M
         rfod2zk/EuawEbUJ0v6Xv36byLMyIETqUo8V/torBjWLyOU8dv3XWC3hmjIeO9Hb5pgB
         Jmtlsj+OD8POLbd6Cs1pBe/JdskkOZxmgBotQojxdkWjXzNm6kqKlUtlPLDZKZFtIchk
         /KMlF9615F4Aubka4oz7jtVA4Si3ijAlCv2Ui3FVbJSITAqN2hSZf2L++/SCiFeTsHut
         Mqbg==
X-Gm-Message-State: AFqh2kqkncTspDISOiPV+YjHOI1KoGXyB5L6vmD2m3PzEWEvWZEDAqm5
	MbVJcwfqBmY/moCan6STylqI5nvh6ETKnVnmEPI=
X-Google-Smtp-Source: AMrXdXuJshgOMCxp37i/bcb9s70+DLnI3taD4XLc8wgLsKZJPvDm5ZiwP0XBYhCx59PPajP3TRnjjg==
X-Received: by 2002:aa7:9634:0:b0:57d:56f1:6ae7 with SMTP id r20-20020aa79634000000b0057d56f16ae7mr32201470pfg.33.1674657729537;
        Wed, 25 Jan 2023 06:42:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/16] cve-update-db-native: add more logging when fetching
Date: Wed, 25 Jan 2023 04:41:45 -1000
Message-Id: <60fa8135437ab1e2bc7cead5f838ac787c8dab26.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176353

From: Ross Burton <ross@burtonini.com>

Add some debug logging when fetching the CVE data.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b230584664873af2ab453b8153b1ad276d3b0af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 355ee2a2a3..e267671628 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -75,6 +75,7 @@ python do_fetch() {
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
         total_years = date.today().year + 1 - YEAR_START
         for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
+            bb.debug(2, "Updating %d" % year)
             ph.update((float(i + 1) / total_years) * 100)
             year_url = (d.getVar('NVDCVE_URL')) + str(year)
             meta_url = year_url + ".meta"
@@ -104,6 +105,7 @@ python do_fetch() {
             cursor.close()
 
             if not meta or meta[0] != last_modified:
+                bb.debug(2, "Updating entries")
                 # Clear products table entries corresponding to current year
                 conn.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,)).close()
 
@@ -117,7 +119,8 @@ python do_fetch() {
                     cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
                     bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
                     return
-
+            else:
+                bb.debug(2, "Already up to date (last modified %s)" % last_modified)
             # Update success, set the date to cve_check file.
             if year == date.today().year:
                 cve_f.write('CVE database update : %s\n\n' % date.today())
-- 
2.25.1


