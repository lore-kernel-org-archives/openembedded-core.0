Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.48216.1624286953684606306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 07:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XOQwPMIh;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: flowergom@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id c7-20020a17090ad907b029016faeeab0ccso1871964pjv.4
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y33w0GoYp3CUzshIBtkVs/E2QXri1GWt+2muiAigKWY=;
        b=XOQwPMIhAce6EdA9qJNp9+S+nsZUbCFMTCs9WNsBMWyPYGKhoUyZBCPcU8ZSxWD5aE
         fTc0YpiZLWHfO4KeVNSbLykEwGNTKEJ2cCojNW80IQQ2Tg8yxz1RIj6uJ3Wm/nHvUCFv
         ZHLVKh8Kq1HVV2HZHjZXkr0w2ITzmZyF7+HryFxyUkDSoXSSTVMHgQGcun+3kohJ+XJ2
         SdeCsj3m9n33Y0O7T5NHxgVFGFQar4hoQ1dU4yQ2WiJM0HZBtEe62FZTqlRs1PQtFP35
         7jTQOUyb0J7jT/6Ndnnpjs3er1bBSlJOVtCsU9jmC0ZsoWqymgPtoCpxiA9neGsQbxz1
         cxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y33w0GoYp3CUzshIBtkVs/E2QXri1GWt+2muiAigKWY=;
        b=DObB2vXd8NlxTJpQVzFgfu+RM/YPr0jmye8C6SQwirZ8+njzMpiZrI/xMy8Yi5h30n
         7RXNXtG3QuINxcm08dmzIaPjVoYC2u7ljbG1A/IyHWUUFeNTRSTFQ0HYKMG94dt3gVHw
         zBwfsk2FGljz2WZ8uW7J3LBQB4Q7I8uNdK65iEmamtu3oNOF/fsm2+1r2sLX8YGeFFDK
         zbRU7lBllf2hp5wdmtW5jtmO6SK+I0Yu+181bdVFsN8Gh/G5UdVdYxuocj3CvjoEtFNV
         SxJ9tfG4RhPOAlZooWojAIevpvOR4AFkOrEqFVKWyVgWpNMu6PDdvw89h39+Am477f8T
         PgsA==
X-Gm-Message-State: AOAM533dQgaOmVikCnPaaP4jwXCSfdnLJRf6EH1QL8dqZbV4M6d27QNv
	68hvHU34oPcDpBwEZWJx4ptnv0tQotrTXbnm
X-Google-Smtp-Source: ABdhPJyDjPUr6uGHcebsEo6POm1QNfadNERyHIfuB4JqQKNwB/PiytE7PFRwdsmYYP/xZ5wtAt38NQ==
X-Received: by 2002:a17:902:8ec7:b029:11b:acb4:ac43 with SMTP id x7-20020a1709028ec7b029011bacb4ac43mr17987256plo.1.1624286952671;
        Mon, 21 Jun 2021 07:49:12 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id v67sm15662752pfb.193.2021.06.21.07.49.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jun 2021 07:49:12 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] python3: fix CVE-2021-3426
Date: Mon, 21 Jun 2021 23:49:01 +0900
Message-Id: <20210621144901.1480-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the pydoc getfile feature

CVE-2021-3426: Remove the "getfile" feature of the pydoc module which
could be abused to read arbitrary files on the disk (directory
traversal vulnerability). Moreover, even source code of Python
modules can contain sensitive data like passwords. Vulnerability
reported by David SchwÃ¶rer.

reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-3426
https://github.com/python/cpython/pull/25015/commits/dc9580949cc82c51022a882ba43dad937ff929a8
---
 .../python/python3/CVE-2021-3426.patch        | 105 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3426.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3426.patch b/meta/recipes-devtools/python/python3/CVE-2021-3426.patch
new file mode 100644
index 0000000000..68bd7d9296
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2021-3426.patch
@@ -0,0 +1,105 @@
+From 9b999479c0022edfc9835a8a1f06e046f3881048 Mon Sep 17 00:00:00 2001
+From: Victor Stinner <vstinner@python.org>
+Date: Mon, 29 Mar 2021 14:40:40 +0200
+Subject: [PATCH] bpo-42988: Remove the pydoc getfile feature (GH-25015)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2021-3426: Remove the "getfile" feature of the pydoc module which
+could be abused to read arbitrary files on the disk (directory
+traversal vulnerability). Moreover, even source code of Python
+modules can contain sensitive data like passwords. Vulnerability
+reported by David SchwÃ¶rer.
+
+Upstream-Status: Acepted
+[https://github.com/python/cpython/pull/25015/commits/dc9580949cc82c51022a882ba43dad937ff929a8]
+CVE: CVE-2021-3426
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
+---
+ Lib/pydoc.py                                   | 18 ------------------
+ Lib/test/test_pydoc.py                         |  6 ------
+ .../2021-03-24-14-16-56.bpo-42988.P2aNco.rst   |  4 ++++
+ 3 files changed, 4 insertions(+), 24 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.rst
+
+diff --git a/Lib/pydoc.py b/Lib/pydoc.py
+index 282a917998..753ea97ba0 100755
+--- a/Lib/pydoc.py
++++ b/Lib/pydoc.py
+@@ -2456,9 +2456,6 @@ def page(self, title, contents):
+ %s</head><body bgcolor="#f0f0f8">%s<div style="clear:both;padding-top:.5em;">%s</div>
+ </body></html>''' % (title, css_link, html_navbar(), contents)
+ 
+-        def filelink(self, url, path):
+-            return '<a href="getfile?key=%s">%s</a>' % (url, path)
+-
+ 
+     html = _HTMLDoc()
+ 
+@@ -2544,19 +2541,6 @@ def bltinlink(name):
+             'key = %s' % key, '#ffffff', '#ee77aa', '<br>'.join(results))
+         return 'Search Results', contents
+ 
+-    def html_getfile(path):
+-        """Get and display a source file listing safely."""
+-        path = urllib.parse.unquote(path)
+-        with tokenize.open(path) as fp:
+-            lines = html.escape(fp.read())
+-        body = '<pre>%s</pre>' % lines
+-        heading = html.heading(
+-            '<big><big><strong>File Listing</strong></big></big>',
+-            '#ffffff', '#7799ee')
+-        contents = heading + html.bigsection(
+-            'File: %s' % path, '#ffffff', '#ee77aa', body)
+-        return 'getfile %s' % path, contents
+-
+     def html_topics():
+         """Index of topic texts available."""
+ 
+@@ -2648,8 +2632,6 @@ def get_html_page(url):
+                 op, _, url = url.partition('=')
+                 if op == "search?key":
+                     title, content = html_search(url)
+-                elif op == "getfile?key":
+-                    title, content = html_getfile(url)
+                 elif op == "topic?key":
+                     # try topics first, then objects.
+                     try:
+diff --git a/Lib/test/test_pydoc.py b/Lib/test/test_pydoc.py
+index 2f502627f4..3bc0e9e6b5 100644
+--- a/Lib/test/test_pydoc.py
++++ b/Lib/test/test_pydoc.py
+@@ -1374,18 +1374,12 @@ def test_url_requests(self):
+             ("topic?key=def", "Pydoc: KEYWORD def"),
+             ("topic?key=STRINGS", "Pydoc: TOPIC STRINGS"),
+             ("foobar", "Pydoc: Error - foobar"),
+-            ("getfile?key=foobar", "Pydoc: Error - getfile?key=foobar"),
+             ]
+ 
+         with self.restrict_walk_packages():
+             for url, title in requests:
+                 self.call_url_handler(url, title)
+ 
+-            path = string.__file__
+-            title = "Pydoc: getfile " + path
+-            url = "getfile?key=" + path
+-            self.call_url_handler(url, title)
+-
+ 
+ class TestHelper(unittest.TestCase):
+     def test_keywords(self):
+diff --git a/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.rst b/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.rst
+new file mode 100644
+index 0000000000..4b42dd0530
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2021-03-24-14-16-56.bpo-42988.P2aNco.rst
+@@ -0,0 +1,4 @@
++CVE-2021-3426: Remove the ``getfile`` feature of the :mod:`pydoc` module which
++could be abused to read arbitrary files on the disk (directory traversal
++vulnerability). Moreover, even source code of Python modules can contain
++sensitive data like passwords. Vulnerability reported by David SchwÃ¶rer.
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 072ce97472..cbeb599705 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2020-26116.patch \
            file://CVE-2020-27619.patch \
            file://CVE-2021-3177.patch \
+           file://CVE-2021-3426.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.24.3 (Apple Git-128)

