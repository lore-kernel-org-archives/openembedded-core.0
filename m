Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 822677C87F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 11:05:05 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t5so1493631wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 04:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=19tAh6d7qOt7XtW8k9yonPUJZcm44kEA04P7z0aSkSA=;
	b=tqVG4JA/tVNyJG9ypuuOzUoArPj16zgKIzTC51tYOkrK0nwMGmBSL9BRXtCC/ywMbG
	pIEFGwhiPn9xquD32e4Ba4Hneaso9XcTWSL6RwBkmQd7vyOF+0X8X7DI1DflHn88jmaR
	kNkmddfcMr84K0eYys+oHfQk7qOea56YV8npSq7LQlitK6Zk3qbFFJV2jw+fVxqjkWAh
	WdHz8w23n5QBWh8PiW0GgRukc67fx3grdNzWkpEG1IUlgnFy+OIUisKjguKvMhJMXWu+
	KUfrzvXFtO2eYDqCrLeSc6kzSPaopm1/J4fXEqYPLFo1Z3a9Iz13E+TQeady7l069dqT
	wEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=19tAh6d7qOt7XtW8k9yonPUJZcm44kEA04P7z0aSkSA=;
	b=iF2xQxbRgKRUUicECejI9Nwpkot8CehZB/75p3v5mqJ8YOuCkSJBdViXgf8dVt44DB
	/8FcmF1Zi+HDbU/4cQB7WtdG3VLAlpIcsMfF5QS/1I9s7bpDkyUTn2TH5cN6Kb/ZjEW8
	CzSCLvsLs/3HI6vEwHLLjxJb/XCIWrIhPsgzbT/BERgNqCV+kPDmA3h2xkXe8ixTfzWq
	ouz+0DVjElGe/oqajyl8kVPzIe1v6bG3UIFpd0uuHy6fMxfGSHGuXH2gajUU7tIe825x
	c9Xmbu2E+CMy7JS6TDQpYbDGm/PpjSRDALUN29jLsJex28pNHkpzbKFpM7mQDrZR32Y9
	I6cA==
X-Gm-Message-State: APjAAAXF96yG2TAIkkHPZMjS0rdYAXUoCV62w97chDmPzyrK9jBB6Zjs
	4+RkYIuKnjOemr+84QgirxdLQDB7I6A=
X-Google-Smtp-Source: APXvYqwQqCQWuFrHW/1DK2tPbCp+HlzgXQZ1TxLztuWVDBcbss3g/tkaCOfMFrqcdJEnpfu9+pXO5w==
X-Received: by 2002:a1c:305:: with SMTP id 5mr3359460wmd.101.1559905505818;
	Fri, 07 Jun 2019 04:05:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 67sm1690403wmd.38.2019.06.07.04.05.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 04:05:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 12:05:02 +0100
Message-Id: <20190607110502.31175-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] wic/filemap: handle FIGETBSZ failing
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
X-List-Received-Date: Fri, 07 Jun 2019 11:05:05 -0000

Some file systems don't support fetching the block size (notably the file system
Docker uses for containers), so handle the iotctl() failing and raise the
expected error.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lib/wic/filemap.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 244c07a71cf..a3919fbcad8 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -32,7 +32,10 @@ def get_block_size(file_obj):
     """
     # Get the block size of the host file-system for the image file by calling
     # the FIGETBSZ ioctl (number 2).
-    binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
+    try:
+        binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
+    except OSError:
+        raise IOError("Unable to determine block size")
     bsize = struct.unpack('I', binary_data)[0]
     if not bsize:
         import os
-- 
2.11.0


