Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 31D297C4DB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 20:07:46 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id h20so2010403itk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9yNGaDdJtIykrvpEJjW6F8TiYPBUQPXoMEPHP/6gS0c=;
	b=Sug1bv0D3EWPP8rEDkgkvYdFW6Y3pLKTdFIUVoRlJCEHVjdhzpZ2F6gbPgs3o7nZ1Z
	AUgvegp7uHWemvOXC0pi8Nnv0Azgpj0Af+2M1rUiFGjGBhgcjwzBcmjsLnIEZzucWbDO
	QOGubwuj/tnJNSsOk0cyFepV3vR7gQHXgIXxEWYiq2+uwtvjmozh8nSVehT5mvkk/9VO
	xizosON9lulDUNLiVjGWU7W2pRbHdseZz6JkUYcd6yBAAyVsUOMgH54NmGq3q0S3Anl2
	esBwpJWQOeG6RxzjGBsmxOk27fKb9ZEXrzOcbQOZSLI0+kxl6M36TTJQnDhUJ4e3hvAH
	YNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9yNGaDdJtIykrvpEJjW6F8TiYPBUQPXoMEPHP/6gS0c=;
	b=Ma4dZYpH8pHnP6derZ7Xc7joQdjbGDqRFXVA8DFhevW6Dou1U1h/i+F3pf1HUrq0p+
	ITeHgHs4cm4fu1WLyGC6+OQfhAQi7Eu5cHDM3kaqOQNwf6XGUEbFXXb8YeQx6i3ts8YH
	kxu5gpas30gwMS3I/EcuHTBhoeBY7GqFPvov+zScIS1MWjBFcJ3fsL24RM3TLXjb0vUl
	L74I+KNFuG6xHg3JwTTRrS70CYHRxSFHMh5PjxBRz8N8zB3J8BE+t4AdaUU7cAvKx1qg
	HHF2hYDlaF6AxZntHlM+A8KMurfU/a2mEwhynnPIu0vx1WjF/JYUDeRqFZqd4FcOL9op
	ntQg==
X-Gm-Message-State: APjAAAUD4Qd0I0DFEtpBj6AJCBrgeKclbeVH7fERRY1bxnyLol0MQJ4L
	ZME8zGFUBh1sPGXmb2wBhCrZjyRw
X-Google-Smtp-Source: APXvYqwbpueTV0doZuhew9fiaP96bQrRjVTb5dGqaWhRiEpD2AXNCbtdDGcQT1rKxjOwM1j9r1c/3w==
X-Received: by 2002:a24:2550:: with SMTP id g77mr1350942itg.95.1559851667664; 
	Thu, 06 Jun 2019 13:07:47 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	r62sm1405565ita.37.2019.06.06.13.07.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 06 Jun 2019 13:07:46 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 15:07:41 -0500
Message-Id: <20190606200741.31305-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603152719.17295-1-JPEWhacker@gmail.com>
References: <20190603152719.17295-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3] bash: Replace uninative loader path in ptest
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
X-List-Received-Date: Thu, 06 Jun 2019 20:07:47 -0000
Content-Transfer-Encoding: 8bit

The Makefile used for bash-ptest can pick up the path to the uninative
loader through BUILD_LDFLAGS. This includes the full path to the
uninative loader, which is not reproducible. Replace it with /bin/false.
It doesn't appear as if these native programs are used in the test
suites and if there are likely to be other problems related to building
them using the BUILD_* flags.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/bash/bash.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index dbb803ddefd..4cf1054967c 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -78,8 +78,13 @@ do_install_ptest () {
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:${UNINATIVE_LOADER}:${base_bindir}/false:g' \
 	     ${D}${PTEST_PATH}/Makefile
 }
+# The uninative loader is different on i386 & x86_64 hosts. Since it is only
+# being replaced with /bin/false anyway, it doesn't need to be part of the task
+# hash
+do_install_ptest[vardepsexclude] += "UNINATIVE_LOADER"
 
 pkg_postinst_${PN} () {
 	grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo ${base_bindir}/bash >> $D${sysconfdir}/shells
-- 
2.21.0


