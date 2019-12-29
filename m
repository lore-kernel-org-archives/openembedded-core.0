Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 59A4D7C426
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 09:31:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b19so11764322wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 01:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=p5t2UMkvDo10H95xtgOiFEveoZ6flJkqaJj3uY0hKHU=;
	b=o4UvLY1K23Hcg/nk0p8v9zX3eiXRuN7caR1zqNkMOOvJKP10z1ize9KOt19Ret4wvy
	ECVtF7iGKLOc4g7+Y20jHgpqWIDqUHNvwg/8u0f8Ebgx/nXslZmB9FtIhVaf2yFrTmJ4
	aKHr4VYUXeaRnLKtJ8F8DXdxsRRzxgIz12oFWXsDb1b9FnOPv78mtT2Vzk44mnDd2/jS
	/cBmHc54BWOHKk/b7HiomHTxC1mNwGiOEgww0zecPG1ocI93/8KV9YypSbx32aoD7TZg
	lHXTkqK8lfD47hKU7AyAlE5mIxSO03ys/mVcZHoUb9mKy4D6TyHzUGlD0SuwuKKKLFj0
	4ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p5t2UMkvDo10H95xtgOiFEveoZ6flJkqaJj3uY0hKHU=;
	b=b9MDmPvjUK/TVcKqZMP2gozBPnAKtNrJ/pHbAY0T0wHDg2CoGOSK57bOWZVZFO+ssc
	hemEumPiACPpAUsTSkvktKJjGzI+KJ3i6x42DEK9S79v99ra02Z4QhQWiULpOZ0yUf5J
	D1JtkQjNnfFUlSld0Lf1vrR9SwVBp/w8DPpI4YjxcNFrupsJ9ZYI9s0aCT1kR/ulS1VF
	O2XiJl+Lkrae50nkKJYw74DrKPALqOVS2kJvyB7Khr+1Of4YRTTlv4KDHUR8Jo4K+pPq
	VDgyrCwK4SjXB8bOYOW/ebi4Dr33+9GiHyqdxTZXyDHok8pLB2MGfhz9KgGe7cTx5+Dx
	LIBw==
X-Gm-Message-State: APjAAAVZ9MOH+sl8k60t2478g5NzofWvc3CoCE9Qu3e2yL7zvw24ZOAL
	IzsgYv+i2j91JQs4mQdvTNKBy/ZM
X-Google-Smtp-Source: APXvYqxsmCKSDs3DDpzb4UdIuRHfLNnThGaI5IdxByITvruRCRis4UlBz9D6aAWVNhq+7Awo65Dodw==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr28385148wmi.146.1577611909821;
	Sun, 29 Dec 2019 01:31:49 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	x1sm40557301wru.50.2019.12.29.01.31.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 01:31:49 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 09:31:46 +0000
Message-Id: <20191229093146.40360-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lib/oe/qa: handle missing data attribute in __exit__
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
X-List-Received-Date: Sun, 29 Dec 2019 09:31:50 -0000

If mmap fails in open, we don't have a data attribute so when we execute
as a context manager the call to self.data.close needs to handle the
missing attribute:

  File: '/home/akiernan/nanohub/build/../poky/meta/classes/chrpath.bbclass', lineno: 11, function: process_file_linux
       0007:    with oe.qa.ELFFile(fpath) as elf:
       0008:        try:
       0009:            elf.open()
       0010:        except oe.qa.NotELFFileError:
   *** 0011:            return
       0012:
       0013:    p = sub.Popen([cmd, '-l', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
       0014:    out, err = p.communicate()
       0015:    # If returned successfully, process stdout for results
  File: '/home/akiernan/nanohub/build/../poky/meta/lib/oe/qa.py', lineno: 50, function: __exit__
       0046:    def __enter__(self):
       0047:        return self
       0048:
       0049:    def __exit__(self, exc_type, exc_value, traceback):
   *** 0050:        self.data.close()
       0051:
       0052:    def open(self):
       0053:        with open(self.name, "rb") as f:
       0054:            try:
  Exception: AttributeError: 'ELFFile' object has no attribute 'data'

Fixes: 7785c41d0b95 ("chrpath: do less work")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/lib/oe/qa.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 21066c4dc3b3..d85206f155f0 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -47,7 +47,11 @@ class ELFFile:
         return self
 
     def __exit__(self, exc_type, exc_value, traceback):
-        self.data.close()
+        try:
+            self.data.close()
+        except AttributeError:
+            # If we failed to mmap in open then the data attribute won't exist
+            pass
 
     def open(self):
         with open(self.name, "rb") as f:
-- 
2.17.1


