Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 61D656C248
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:30:44 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t5so6343849wri.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sq8ioZ5XLuTr+J/pP4z1uPQ7odfRhr/0cMlrHc4zel8=;
	b=c33aqqdhPzmOdPMCDjo//QPIKmwh0qgyKRsTZLheYOzcAATlfeDas1QWq+Ui/OLGT/
	QqD1I73xCV4srN2NbxnXd9gzcnTByKE2gtjDbxokmmE5q3ytcXMOhmB20/DWfjt1n7nq
	KEBvZKGCBeqRxU8TsTnvE6VlxGg3k6STlvgGePzNsDUTqHPBmZfZGk84Sy1PtREY6MkT
	a5YlwxnnO6MV2+AMTMMUSXVsEEg9zRUpgHeViwcnq2kF/aX2WjSfDSuBYVMguwJgE3K6
	n+OnsT36Zp5Bio72Qe1/7J/TW3669vkXDRvwy7hVrF0Oj5LCuzDLjVX/PKwiiQht9mUG
	OZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sq8ioZ5XLuTr+J/pP4z1uPQ7odfRhr/0cMlrHc4zel8=;
	b=YcZPqVsfWsTDdzizvXRa9tevemE9qx6kt3vxDt97MdxeAGQ03LjkGikrVMd2AsXiMd
	Kq4DwigjHFsRhxLfjTLkl9jYB9GNbH8M4lfWTZDAUtg8RiBJn0P7pFbK2rfNCeXEMmWn
	FLSGBFsVAbwZ9pIKMY+O0hZAKo8rG66jdmft0AOdHum1YN6N5NjVYS+6ETZjWK0FqYq1
	mfMiCSrRJXD1EHnfzQMEOZC0MYSDr94bpc334pQkbz9oL52xE9mgFYqHhrFAQAmb0KZz
	P6VqXtDbRSEUo9654iPttfwr8XkZ2JjsFpNe4jvAeBqFNqy8BotPEscfwizjIw2wqWXk
	1M5Q==
X-Gm-Message-State: APjAAAXbnO+uX022K2QQPFbnV7VKONxIT3vqu8gT0aUVMxam5jIirrEA
	GIH95zK4ArdEPyAxXLjKkY+ijcXr+3I=
X-Google-Smtp-Source: APXvYqwWM1+BgaqB1Q//7iHyjkbjV2RetPNHdlHv9RGAOlkAJv/Xdhm77FQJuBu3DVuYJXXlU1PoNg==
X-Received: by 2002:a5d:53c9:: with SMTP id a9mr2607889wrw.59.1553171444744;
	Thu, 21 Mar 2019 05:30:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o133sm4923788wmb.18.2019.03.21.05.30.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:30:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:30:42 +0000
Message-Id: <20190321123042.2947-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] insane: improve license checksumming logic
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
X-List-Received-Date: Thu, 21 Mar 2019 12:30:44 -0000

Instead of opening files as bytes and battling decoding to UTF-8 which can throw
exceptions, open directly as strings and replace invalid codepoints.  This
handles licenses in encodings which are not UTF-8 but are based on ASCII much
better.

Also instead of extracting the license lines, writing them to a file, and then
hashing the file, hash the lines directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 81 ++++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 49 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a2adfee835e..37b8bb0032d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -458,7 +458,6 @@ python populate_lic_qa_checksum() {
     """
     Check for changes in the license files.
     """
-    import tempfile
     sane = True
 
     lic_files = d.getVar('LIC_FILES_CHKSUM') or ''
@@ -496,61 +495,45 @@ python populate_lic_qa_checksum() {
 
         if (not beginline) and (not endline):
             md5chksum = bb.utils.md5_file(srclicfile)
-            with open(srclicfile, 'rb') as f:
-                license = f.read()
+            with open(srclicfile, 'r', errors='replace') as f:
+                license = f.read().splitlines()
         else:
-            fi = open(srclicfile, 'rb')
-            fo = tempfile.NamedTemporaryFile(mode='wb', prefix='poky.', suffix='.tmp', delete=False)
-            tmplicfile = fo.name;
-            lineno = 0
-            linesout = 0
-            license = []
-            for line in fi:
-                lineno += 1
-                if (lineno >= beginline):
-                    if ((lineno <= endline) or not endline):
-                        fo.write(line)
-                        license.append(line)
-                        linesout += 1
-                    else:
-                        break
-            fo.flush()
-            fo.close()
-            fi.close()
-            md5chksum = bb.utils.md5_file(tmplicfile)
-            license = b''.join(license)
-            os.unlink(tmplicfile)
-
+            with open(srclicfile, 'rb') as f:
+                import hashlib
+                lineno = 0
+                license = []
+                m = hashlib.md5()
+                for line in f:
+                    lineno += 1
+                    if (lineno >= beginline):
+                        if ((lineno <= endline) or not endline):
+                            m.update(line)
+                            license.append(line.decode('utf-8', errors='replace').rstrip())
+                        else:
+                            break
+                md5chksum = m.hexdigest()
         if recipemd5 == md5chksum:
             bb.note (pn + ": md5 checksum matched for ", url)
         else:
             if recipemd5:
                 msg = pn + ": The LIC_FILES_CHKSUM does not match for " + url
                 msg = msg + "\n" + pn + ": The new md5 checksum is " + md5chksum
-                try:
-                    license_lines = license.decode('utf-8').split('\n')
-                except:
-                    # License text might not be valid UTF-8, in which
-                    # case we don't know how to include it in our output
-                    # and have to skip it.
-                    pass
-                else:
-                    max_lines = int(d.getVar('QA_MAX_LICENSE_LINES') or 20)
-                    if not license_lines or license_lines[-1] != '':
-                        # Ensure that our license text ends with a line break
-                        # (will be added with join() below).
-                        license_lines.append('')
-                    remove = len(license_lines) - max_lines
-                    if remove > 0:
-                        start = max_lines // 2
-                        end = start + remove - 1
-                        del license_lines[start:end]
-                        license_lines.insert(start, '...')
-                    msg = msg + "\n" + pn + ": Here is the selected license text:" + \
-                          "\n" + \
-                          "{:v^70}".format(" beginline=%d " % beginline if beginline else "") + \
-                          "\n" + "\n".join(license_lines) + \
-                          "{:^^70}".format(" endline=%d " % endline if endline else "")
+                max_lines = int(d.getVar('QA_MAX_LICENSE_LINES') or 20)
+                if not license or license[-1] != '':
+                    # Ensure that our license text ends with a line break
+                    # (will be added with join() below).
+                    license.append('')
+                remove = len(license) - max_lines
+                if remove > 0:
+                    start = max_lines // 2
+                    end = start + remove - 1
+                    del license[start:end]
+                    license.insert(start, '...')
+                msg = msg + "\n" + pn + ": Here is the selected license text:" + \
+                        "\n" + \
+                        "{:v^70}".format(" beginline=%d " % beginline if beginline else "") + \
+                        "\n" + "\n".join(license) + \
+                        "{:^^70}".format(" endline=%d " % endline if endline else "")
                 if beginline:
                     if endline:
                         srcfiledesc = "%s (lines %d through to %d)" % (srclicfile, beginline, endline)
-- 
2.11.0


