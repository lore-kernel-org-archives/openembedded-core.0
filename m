Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7718C7F395
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:18:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r3so27148958wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sHvlKXTg8vqtFHqKz1AzprkWkgl1+FuPtf4B5W4/V7Q=;
	b=Y38l/KYsRanzEARbxv9PuoJLBThw4mxqEzpZFsj5OAAXwrAHvNKCNw/ykNGe29haII
	5rqUbCgKc1lql17aqs4r2w9AsEJP0iyIpORk1cNSliuOwKciQijteBAV4pMwnKEtSdTo
	cRn3J0vLy1Nmh51U02mSQDcypb2n2Udb97KicfZtIYUzrtfScjkqXbkuBsYBg/9ZYSqN
	F7Wickhlwxv2ImCzZxmTjQcLTJkLtj28Vpw/CiLOGdnDs/p2ItTNWxkkDJ4ste1Goltf
	69GBfj5hBjy5hsnBxFlwBzP4NRZk0Tu6YrFqq3l7W04m+zESDuX7vvBemYrxWnRhSDVe
	qosw==
X-Gm-Message-State: APjAAAVQ1ZjvzSyTSx+A8kIORi3vZcLDhAGs5zIHzehx/6EAlyGWtD0t
	kcxWLjyd+J1zCF7nsPCJG36KZsR7
X-Google-Smtp-Source: APXvYqxg6fNMR7ufXJauIEopKJwGVKG551SUvdiU7dUJMFsIedDTLliwW3gjSMHllt5ZRKOT7X/Irg==
X-Received: by 2002:adf:fcd2:: with SMTP id f18mr1917059wrs.388.1571217512969; 
	Wed, 16 Oct 2019 02:18:32 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v8sm31907518wra.79.2019.10.16.02.18.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 02:18:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 10:18:20 +0100
Message-Id: <20191016091825.1910-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191016091825.1910-1-git@andred.net>
References: <20191016091825.1910-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 1/6] testimage.bbclass: support hardware-controlled targets
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
X-List-Received-Date: Wed, 16 Oct 2019 09:18:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Since the introduction of the new runtime framework for target
testing in commit 2aa5a4954d76
("testimage.bbclass: Migrate class to use new runtime framework")
commit 3857e5c91da6 in poky.git, target controllers have no
access to the global datastore 'd' anymore.

This makes it impossible for a specific OEQA (hardware)
controller to access documented properties like
TEST_POWERCONTROL_CMD, TEST_SERIALCONTROL_CMD, etc,
meaning it's impossible for those controllers to actually
control the hardware.

To solve this, simply add those documented variables into
the target_kwargs[].

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/testimage.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 525c5a6173..befda6b72c 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -262,6 +262,12 @@ def testimage_main(d):
     # It would be better to find these modules using instrospection.
     target_kwargs['target_modules_path'] = d.getVar('BBPATH')
 
+    # hardware controlled targets might need further access
+    target_kwargs['powercontrol_cmd'] = d.getVar("TEST_POWERCONTROL_CMD") or None
+    target_kwargs['powercontrol_extra_args'] = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS") or ""
+    target_kwargs['serialcontrol_cmd'] = d.getVar("TEST_SERIALCONTROL_CMD") or None
+    target_kwargs['serialcontrol_extra_args'] = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS") or ""
+
     # runtime use network for download projects for build
     export_proxies(d)
 
-- 
2.23.0.rc1


