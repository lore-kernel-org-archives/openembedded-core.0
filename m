Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id C48EC7D946
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:31 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id h4so2876930wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q71sPuTa9XKDnS04jUkw1hy6sPpF3/xnmBKGbMuz1nU=;
	b=PxQxC/cd02U5qb+/cwKcignDe6R0owe4YJGTX+80N+IZXs1LSQ8YBeeAoekfh9Tk0f
	o+Lfena8uUe0XBzb64fTbjlZz604weKVzVe7hOquL9nOJiHqa0joctdS16bd0gi58N/D
	C3plJ9qqv3KiQfL2ZWSi8UEPC1zLUjNkiHtyYyKGA1QiURC2OiuBW7rY3r2UBZo+8znu
	8P/dD+lAyIGFtpbatC4iJrO/vGUOw8KiJIWXERULWZZuAwaVyrx9AcU8yCYaNbgbxP9j
	F0bnk/SVG7aV4B28BXkmRO8260JTRC1QqimO2vL+P1MNi5izEuxaRBc2WCjM+FMZSfaw
	DXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q71sPuTa9XKDnS04jUkw1hy6sPpF3/xnmBKGbMuz1nU=;
	b=apVeDICde2SUXQrlvbQOj7vlC+h7J7od1OocwakqqNDc2XGV0EqSWUtW/VKoRJZgV7
	1dCd27k9o7Qp1nO1dIr32tSAq3pVwo5qc+tUVVhKG7ITAfrP8QYy5HFhfq0OiGBXyZ4i
	9OJrpT6XXS5iouz9OjJUcViQqcWgtt1yotgf00byrt8oENIwd1AKhOERIoi3TNRBs3d9
	Xd4zJ0ziAxPGUURx0cI7NnGnTIe9xYQhV3L8EUGkpMnOQZ6iwbRzknqwIXLCMfVonSP+
	vGzqlR+7/A+r/6FPtHYH+Kw9YLakv3xwJDHH7dOQuv+qLAQCJmkIQ5TqMOZ/TDlbQQ90
	I81w==
X-Gm-Message-State: APjAAAUmCe969WhlXicryAlXfk45dR2V5LVWlG3ico/AXF0O04WLqo4Q
	ekJ4beLU44Y4igS57c1l4wH446tcPto=
X-Google-Smtp-Source: APXvYqy88Npnrh/IahAkF+urj/HWnvuAxm3ktr/mYeVpLz/grDXfc6YCeCjsNdfZOJ5K1ECefddpBQ==
X-Received: by 2002:adf:f285:: with SMTP id k5mr12474302wro.110.1554901952369; 
	Wed, 10 Apr 2019 06:12:32 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:45 +0530
Message-Id: <c8331fa157b83a3ed77f77a6e884c7fbc4f1d91b.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 26/33] wic/engine.py: Load paths from PATH environment variable
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:32 -0000

From: William Bourque <wbourque@gmail.com>

Load self.paths from environment variable and
if it fails, fall back to hardcoded list.
This is required for users that would need to load
different e2fsprogs binaries if their system's ones
are not recent enought

(From OE-Core rev: a88bcbae850a2e6d182291d3f8e167aabdbe4842)

Signed-off-by: William Bourque <wbourque@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/engine.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 951bf30..c127045 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -244,8 +244,13 @@ class Disk:
         self._psector_size = None
         self._ptable_format = None
 
-        # find parted
-        self.paths = "/bin:/usr/bin:/usr/sbin:/sbin/"
+        # read paths from $PATH environment variable
+        # if it fails, use hardcoded paths
+        try:
+            self.paths = os.environ['PATH']
+        except KeyError:
+            self.paths = "/bin:/usr/bin:/usr/sbin:/sbin/"
+
         if native_sysroot:
             for path in self.paths.split(':'):
                 self.paths = "%s%s:%s" % (native_sysroot, path, self.paths)
-- 
2.7.4


