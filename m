Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.7059.1588683727491443084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RUHbaqNS;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id y24so2232123wma.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jSqnn+Ylif7/RLoNuGpdIXlXbPVEdI+dekAJ0XcOHM4=;
        b=RUHbaqNSDs0z+vMgGxoUPkXB4ZTL53g0lrMNvnB6rf8SyqxIRC8XIv8qJ/Sod81AE6
         24QLPeb0iwi7I0F6Q2+EkhhCKqQeYvPmTpEzbqsxgb7Uq8rge4Lp5CYblE+4tbdS0ddu
         8GkeCTXfdhjyGTZmlJs6OgVfX65WLEFJnFM9U+9/FSS7w5zeowRn438uWNnjFW2vb9Du
         Gf9+xoDYahRBme/C6xlGFyEod5Cu+yluXx0KGp0MC48kehPlidQp1JTSN7pbBjGXS81h
         bOsIMMqL8OKqD2rnkpJ8/t0UbvBykHpolTHBaA7KzzgZaO7POiq1e9kdY49jIVBKz+s4
         zChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jSqnn+Ylif7/RLoNuGpdIXlXbPVEdI+dekAJ0XcOHM4=;
        b=FQcFjhEcs3cbQ1rLCx0X8VO9O4efPCv2Ut5mwBdPoXqsP/HDanCN6E/pcpPEZOymPx
         SPXpA2ywhV59mEsLse4kvqeBZgkHJ/jxD80dJfbztBtdSv3BAG8EyWjmRXMCLHcAhjF/
         30YYvuh6xUPKWgigs/GErJljMts0Z2D/29g2NX3gWpGj0K2kiwXcmY71OansHrBzEWr1
         sarHrxbWYusE4HgKJvG/5tNjJvYBZrX+7M5jfnbc085lpoezu2JQPqT3g8oqEz/VcAPN
         yxyhXBLYKlwwDpU9t4lFKGV76ANIjQaSeVVejSkJaglLQJVn9Snbtq4Rh2PK4YMfLGh4
         zbDA==
X-Gm-Message-State: AGi0PuZhMq4ZfThVLqCrEriOZQmQoxwata+/sUjGF7XQEWSCMqnGNZJO
	zdYJWuFpPrHEs+7MrI5/vJrvG+98
X-Google-Smtp-Source: APiQypJSfgkrt7hmaRtJbn7ZstdjPxpAXHJPAxCifQwT8kmSHKGnFDfU0axWyL48yiA2WfEuvPjv7Q==
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr3226894wmj.55.1588683725818;
        Tue, 05 May 2020 06:02:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/24] testsdkext/devtool: initialize the test component's git repo
Date: Tue,  5 May 2020 15:01:14 +0200
Message-Id: <20200505130133.24930-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devtool is relying on externalsrc class, which, in order to determine
if a rebuild is needed, relies on git to checksum files (if the
component tree is a git repo), or sets a flag to always rebuild if
the component tree is not a git repo.

This is problematic in testsdkext scenario, where the test component
is inside a build directory, which itself is inside the poky repo
checkout, and listed in .gitignore. What happens is that git walks
up the tree and uses the index of the poky repo. This works okay
with older versions of git, but git 2.26 complains that we're inside
a directory that is ignored, and returns an error.

To fix the issue, the git repository is initialized directly in the
component directory, just prior to running the tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 8e92bf8064..a5c6a76e02 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -20,10 +20,16 @@ class DevtoolTest(OESDKExtTestCase):
         myapp_src = os.path.join(cls.tc.esdk_files_dir, "myapp")
         cls.myapp_dst = os.path.join(cls.tc.sdk_dir, "myapp")
         shutil.copytree(myapp_src, cls.myapp_dst)
+        subprocess.check_output(['git', 'init', '.'], cwd=cls.myapp_dst)
+        subprocess.check_output(['git', 'add', '.'], cwd=cls.myapp_dst)
+        subprocess.check_output(['git', 'commit', '-m', "'test commit'"], cwd=cls.myapp_dst)
 
         myapp_cmake_src = os.path.join(cls.tc.esdk_files_dir, "myapp_cmake")
         cls.myapp_cmake_dst = os.path.join(cls.tc.sdk_dir, "myapp_cmake")
         shutil.copytree(myapp_cmake_src, cls.myapp_cmake_dst)
+        subprocess.check_output(['git', 'init', '.'], cwd=cls.myapp_cmake_dst)
+        subprocess.check_output(['git', 'add', '.'], cwd=cls.myapp_cmake_dst)
+        subprocess.check_output(['git', 'commit', '-m', "'test commit'"], cwd=cls.myapp_cmake_dst)
 
     @classmethod
     def tearDownClass(cls):
-- 
2.26.1

