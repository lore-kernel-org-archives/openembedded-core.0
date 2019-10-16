Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 55B4B7F3F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:18:34 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id v17so1911096wml.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/bJvNmvXW8rwIq328+W0tKYsKrSuKbDLbUEo9EjP4hA=;
	b=Y/h7BxfWo9EGztjLq5qvLmVF8bbfA4VYbCu5jv26uc0Z3Rik5ijTu+TbfEp3BDM/u2
	AhEGeGFmz1i5eJBBuwWpNAZfnmm/8DRg6pB/b11tzFGkRMiCNXZpoWeePIOq4eejjNWq
	XdM0bh7zyV4bfxZjmvUB3jf2X8A79yt6pmJx/Bb2K57urAC5VEriFZyf1tP3HGUyE+J/
	lscu6JWNucLguonVwyocxlwco8pFCWVMQ/xYbN4RSyYmEdkYXQrnGKJOlOiDIPbKj4UF
	aJICwEpCO2hPpVKAWzpE9wCxxoVQPaGAWJlP8Ku+2zkW/OcI5WgMcE8qCdHlmlXiBrV1
	1wJg==
X-Gm-Message-State: APjAAAVrEEGJFyBTv4Ql8CsLdsIxY0AR3G8BdOE+Okr/h7bz+pNXiJ5J
	Mn9X/2fdC4Op5yYX+1m+O43POqI9
X-Google-Smtp-Source: APXvYqzhN1ZXrXqg6OMV9j+iD8Gv457HAac6lSKnMMCcQ7kMSVf2ObThPT7kbkC91pMTWA7aWRjHiw==
X-Received: by 2002:a1c:3284:: with SMTP id y126mr2542920wmy.164.1571217514683;
	Wed, 16 Oct 2019 02:18:34 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v8sm31907518wra.79.2019.10.16.02.18.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 02:18:33 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 10:18:22 +0100
Message-Id: <20191016091825.1910-4-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191016091825.1910-1-git@andred.net>
References: <20191016091825.1910-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/6] oeqa/runtime/df: don't fail on long device names
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
X-List-Received-Date: Wed, 16 Oct 2019 09:18:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When device names are long (more than 20 characters), the
df test will fail with an exception:
    self.assertTrue(int(output)>5120, msg=msg)
    ValueError: invalid literal for int() with base 10: ''
at least when busybox is in use.

The reason is that busybox breaks the line in that case:
    Filesystem           1K-blocks      Used Available Use% Mounted on
    /dev/disk/by-partuuid/8e991e5a-cebd-4f88-9494-c9db4f30cb02
                           1998672     87024   1790408   5% /
and the code tries to extract the fourth field from the
second line, which is empty of course.

df can be told not to break lines, though, using the -P
flag, which turns on the POSIX output format, and is
supported by busybox df and coreutils df:
    Filesystem           1024-blocks    Used Available Capacity Mounted on
    /dev/disk/by-partuuid/8e991e5a-cebd-4f88-9494-c9db4f30cb02   1998672     87024   1790408   5% /

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/runtime/cases/df.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index d8d79f32ea..89fd0fb901 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -11,7 +11,7 @@ class DfTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
     def test_df(self):
-        cmd = "df / | sed -n '2p' | awk '{print $4}'"
+        cmd = "df -P / | sed -n '2p' | awk '{print $4}'"
         (status,output) = self.target.run(cmd)
         msg = 'Not enough space on image. Current size is %s' % output
         self.assertTrue(int(output)>5120, msg=msg)
-- 
2.23.0.rc1


