Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.62245.1600092777021060068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fX8ECfmO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id w7so12756632pfi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sMzbOX4LHZtqKOF0bekaX9PidyTa8FigbW3wUn7AYZ0=;
        b=fX8ECfmOvWhctnab3q+TSA4wdbBzwEUKl0n2TD1CgGZ2q+/Lzi+UXtyiQZdDhw7MiL
         J5h8RM8jkSpeQ767o5UwVm1NqP/MHG0/yxH68eVKna3O5E/moSvDuF9mhlJPI7geFU9S
         aER7rgeivJZW3LKOUbIha+Ba8tG2AFpY6PQCx9xpWmRG91kSo/GpP6gUEMqE1RFRUc91
         5Oiz2v++r/PTZ4eAIrk0gS9m10oEIHhs56qFAy7w3sSC6vr2H/8+nb5BhCi78ycwriAj
         /H3/xg0oALkkWsxBQTp9LYQCMbiTxE7hz3belqWCJcaqU2tQj+wL+T9OE2+IATZoL4ww
         ywVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sMzbOX4LHZtqKOF0bekaX9PidyTa8FigbW3wUn7AYZ0=;
        b=is1BVfZJeqU+unJJHubawEUuFeD7RRuo9I1D5aChhZObYzbxcK1O+nIwF8e7v6vh+b
         /PuxwcV7BrXOXLEa6PXeawbCUaEybyAuSFMdhsBlu6zjm37tkGQL/zGt1Cr4VbOdO388
         PD48XWb7h7NdL8PfKz36kWa3tKr5nTVI3ObxLR2+TTUtlUsG8xHat1U224zIj31RTy9P
         cN4+GT9ZG+/Db2zioKnoPdW13RnXECOsgATJRG8UD1/brXZNwpWqBBR68suL8JYY58KI
         al+UNrTd8jUrDSmejeRKCT7UvE9fBYFPKXaN049Uy8deEOhNfB57Hs8LZvIJrUmmy+I+
         XDWg==
X-Gm-Message-State: AOAM533aA5bIVmvFeHUSZ65/ISwzmTetDOBpyXK9gXuF//R+0pmJAf7c
	ECJAy4Toduzq9KU04/RF1RkSjLAN66OGCaJF/s8=
X-Google-Smtp-Source: ABdhPJxDw6H8Po9LqJWNxgXKGFCeTu46X5JJxDqjTB0uVUieB0/ucHCcL6QTCVdMwoRxCKPIfDUNyA==
X-Received: by 2002:a63:1925:: with SMTP id z37mr3995697pgl.23.1600092776063;
        Mon, 14 Sep 2020 07:12:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/24] cve-update-db-native: add progress handler
Date: Mon, 14 Sep 2020 04:11:39 -1000
Message-Id: <10822d186f7e17fd4b780412c1669673a2613363.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79ae2e82b8ec11578177f428060b568d6c7d44ca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 90 ++++++++++---------
 1 file changed, 47 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 32d6dbdffc..2221825bf8 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -29,6 +29,7 @@ python do_populate_cve_db() {
     Update NVD database with json data feed
     """
     import bb.utils
+    import bb.progress
     import sqlite3, urllib, urllib.parse, shutil, gzip
     from datetime import date
 
@@ -60,54 +61,57 @@ python do_populate_cve_db() {
 
     initialize_db(c)
 
-    for year in range(YEAR_START, date.today().year + 1):
-        year_url = BASE_URL + str(year)
-        meta_url = year_url + ".meta"
-        json_url = year_url + ".json.gz"
+    with bb.progress.ProgressHandler(d) as ph:
+        total_years = date.today().year + 1 - YEAR_START
+        for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
+            ph.update((float(i + 1) / total_years) * 100)
+            year_url = BASE_URL + str(year)
+            meta_url = year_url + ".meta"
+            json_url = year_url + ".json.gz"
 
-        # Retrieve meta last modified date
-        try:
-            response = urllib.request.urlopen(meta_url)
-        except urllib.error.URLError as e:
-            cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
-            bb.warn("Failed to fetch CVE data (%s)" % e.reason)
-            return
-
-        if response:
-            for l in response.read().decode("utf-8").splitlines():
-                key, value = l.split(":", 1)
-                if key == "lastModifiedDate":
-                    last_modified = value
-                    break
-            else:
-                bb.warn("Cannot parse CVE metadata, update failed")
-                return
-
-        # Compare with current db last modified date
-        c.execute("select DATE from META where YEAR = ?", (year,))
-        meta = c.fetchone()
-        if not meta or meta[0] != last_modified:
-            # Clear products table entries corresponding to current year
-            c.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,))
-
-            # Update db with current year json file
+            # Retrieve meta last modified date
             try:
-                response = urllib.request.urlopen(json_url)
-                if response:
-                    update_db(c, gzip.decompress(response.read()).decode('utf-8'))
-                c.execute("insert or replace into META values (?, ?)", [year, last_modified])
+                response = urllib.request.urlopen(meta_url)
             except urllib.error.URLError as e:
-                cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
-                bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
+                cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
+                bb.warn("Failed to fetch CVE data (%s)" % e.reason)
                 return
 
-        # Update success, set the date to cve_check file.
-        if year == date.today().year:
-            cve_f.write('CVE database update : %s\n\n' % date.today())
-
-    cve_f.close()
-    conn.commit()
-    conn.close()
+            if response:
+                for l in response.read().decode("utf-8").splitlines():
+                    key, value = l.split(":", 1)
+                    if key == "lastModifiedDate":
+                        last_modified = value
+                        break
+                else:
+                    bb.warn("Cannot parse CVE metadata, update failed")
+                    return
+
+            # Compare with current db last modified date
+            c.execute("select DATE from META where YEAR = ?", (year,))
+            meta = c.fetchone()
+            if not meta or meta[0] != last_modified:
+                # Clear products table entries corresponding to current year
+                c.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,))
+
+                # Update db with current year json file
+                try:
+                    response = urllib.request.urlopen(json_url)
+                    if response:
+                        update_db(c, gzip.decompress(response.read()).decode('utf-8'))
+                    c.execute("insert or replace into META values (?, ?)", [year, last_modified])
+                except urllib.error.URLError as e:
+                    cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
+                    bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
+                    return
+
+            # Update success, set the date to cve_check file.
+            if year == date.today().year:
+                cve_f.write('CVE database update : %s\n\n' % date.today())
+
+        cve_f.close()
+        conn.commit()
+        conn.close()
 }
 
 def initialize_db(c):
-- 
2.17.1

