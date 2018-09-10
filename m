Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5827D79660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 12:45:08 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p5-v6so2228733plk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=a2264vavEn07g83cgojgezwu5nIbnqA6FLLpAsQ8au8=;
	b=OiWDBa+KNSTw/qQcIJaYUbHzcrv0hqFwHJ9EUtd0/SHi590bEE3W+gFdotNgJDkiNP
	VxwWgEaLYcMNwYKFARPAdS+c8f3L0NR1NUTvwS5TYt+DFreqWYKmjYJ6Eah3J/vj8lxk
	4ziDRRdttKMiR6pMXmfpC7FwFxHF9ImfHphD3af5O/QxkqAt8OLtQa73ovfIsVlgLxtz
	jvLZH2W/8hzlJ6pO+sTmTzkYtNTCr2I0LItuPB7oSYYEHlNHycdOXfHuZcMoaijIXXpP
	tjQ7N6akD0V3zcPX5TwZwL9m8J9BtWWNdXs/NFgiJtT5ELkgzgjXMSgDsi/XZglKxeDI
	1mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=a2264vavEn07g83cgojgezwu5nIbnqA6FLLpAsQ8au8=;
	b=fI6WhkF7XwQNH1ir8BiAJA6VKZPAsJu57aOHihVn6MivfGe6ddOXxGDq7vYp/D2KfK
	uxGy1FA8sSPfSmSsBRT0as131ssl2ZibaJLFQZ+ML45irQv53pq/po9dWNWm4VvZ8kJu
	tUCnxVnq9qylhnmanDr5vpZIgnV1WRI1ya/qLsQR37RqfihpQuDEhTRu7wE0zfFAar0J
	94OsRi0C5n8MyfG91j2kIFrqSlKCdbIC1AGMyhWYgr/SJ2ofJQhOicl22leMTWJTRFIk
	aCpEJrejCAysXgfukUpGKfYdnq4cTwPmaudvdbXnwGFkjk2uEol2+xwdYU5/CGKLo5E8
	6N+A==
X-Gm-Message-State: APzg51A8eEMhhrYx63U0RLy4Wg9yQuWCcWdDiWvqHe6/ZjKjZAzILOGw
	SGxk9W2JGY0LA8BtW4NDoTFFxKr9B08=
X-Google-Smtp-Source: ANB0VdZ0+QkNnZsmSl6wWOZUE9QqYkjN+PhN6Ria8gGMu4N/eZb/vqGWwDlxuzzA5nqa3ONwfLD23g==
X-Received: by 2002:a17:902:a715:: with SMTP id
	w21-v6mr21763303plq.61.1536583509201; 
	Mon, 10 Sep 2018 05:45:09 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	v6-v6sm29298362pfa.28.2018.09.10.05.45.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 05:45:08 -0700 (PDT)
Date: Mon, 10 Sep 2018 12:45:03 +0000
Message-Id: <20180910124503.21183-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] tclibc-baremetal.inc: Remove BASEDEPENDS on compilerlibs
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
X-List-Received-Date: Mon, 10 Sep 2018 12:45:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Without a libc the gcc-runtime provider of compilerlibs does not
compile. As such avoid the default dependence on the
virtual/${TARGET_PREFIX}compilerlibs provider.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
index b00917913f..e04f8c8812 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -21,6 +21,9 @@ LIBC_DEPENDENCIES = ""
 EXTRA_OECONF_pn-gcc-cross-${TARGET_ARCH}_append = " --without-headers"
 DEPENDS_remove_pn-meta-toolchain = "virtual/libc virtual/${TARGET_PREFIX}compilerlibs"
 
+# certain compiler libs cannot be used without libc, avoid the dependence on compilerlibs
+BASEDEPENDS_remove_class-target = "virtual/${TARGET_PREFIX}compilerlibs"
+
 TARGET_OS = "elf"
 TARGET_OS_arm = "eabi"
 
---
2.18.0

