Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 289737E591
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 16:59:16 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u13so8795116iop.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OV32WueSF9x+KLkNj+BMFCFGI6/lt8qdB8TozaqhdS4=;
	b=NIxfZODXzUGISShwstmJn0/VU5czhfH1U67fsGqLtwhKZZWBERajYFT1F7gz8ZGKP0
	+dMnpf+ybMD8VHs2Q5eEmGSsibgAl0bu/Qqlj43+UgwAi+haM+/icX3f24+KsZRGrWwA
	tuU+wjhrcrmRWRNxI9ZOunGjRsA14LzFLbNCZu/oY+okT1LFllfYzeYCtV/fRAobxd5+
	4OWJuSqV74Z4djIbANg8tUL4iGY34nOAOndw+oXszxOOCEq9dGz9q4oreQYmQPMYazOr
	inlc5qwPi9ZfcZRZHVHWMQKG35DmXb0N4DnZapf7RJqAg3MUeeOpNaWpX9SCqt5rHcqx
	Op1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OV32WueSF9x+KLkNj+BMFCFGI6/lt8qdB8TozaqhdS4=;
	b=IaQrG5UlsofdrKVwv/PrV9Z1ex1qWMMnwhMHddoqskXBqiCk8dnK9bLR5Uip+Z8w+O
	nMYZi9rzidEGHn2RIRr8pMUSh8e+T9hbWEqvH8E6S7AKk/oi414HoKwA+JnYTD3oDh96
	B/m5ahU5XQJZipblqJX4u/ZzIID/+51fvR+7yZPNGwVqBgIfccWI1hUHWeylvJ/Ny11O
	1JHUCG5VfEIBQAJj+VIHygKer1M5t8cqIVkCHTrI8ECTSAHxcN9qlVP46+Fckbod88VK
	r0ZUr1AKSzTKxpg9xebVe1Q509VgrNwRJMA8es7LlNPW952TNxAPge1LfDAOocIw4b84
	QaMw==
X-Gm-Message-State: APjAAAW2FcaNy0WesIQx4Zpi3R92t/Y8C4Vo0Ml/S6ATrhPrlAdBYttb
	qZTL49CpoLv/1u4P/8R5Mswpraym
X-Google-Smtp-Source: APXvYqwT/+F85lRjeWthjNYRJkxVOd/6ToPnQiAjTPYAbfMmPqjsCD/ltd+SntPqKN0dCNnSWTJsrA==
X-Received: by 2002:a5e:c605:: with SMTP id f5mr7613909iok.78.1559321956769;
	Fri, 31 May 2019 09:59:16 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id s6sm2008541ioo.31.2019.05.31.09.59.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 31 May 2019 09:59:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 11:57:34 -0500
Message-Id: <20190531165734.14435-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] bash: Replace uninative loader path in ptest
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
X-List-Received-Date: Fri, 31 May 2019 16:59:16 -0000
Content-Transfer-Encoding: 8bit

The Makefile used for bash-ptest can pick up the path to the uninative
loader through BUILD_LDFLAGS. This includes the full path to the
uninative loader, which is not reproducible. Replace it with the target
loader in the event that these programs need to be compiled for bash
tests.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/bash/bash.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 4b3692c6139..55f2b7704e6 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -4,7 +4,7 @@ SECTION = "base/shell"
 
 DEPENDS = "ncurses bison-native virtual/libiconv"
 
-inherit autotools gettext texinfo update-alternatives ptest
+inherit autotools gettext texinfo update-alternatives ptest linuxloader
 
 EXTRA_AUTORECONF += "--exclude=autoheader --exclude=aclocal"
 EXTRA_OECONF = "--enable-job-control --without-bash-malloc bash_cv_wexitstatus_offset=8"
@@ -70,6 +70,7 @@ do_install_ptest () {
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:${UNINATIVE_LOADER}:${@get_linuxloader(d)}:g' \
 	     ${D}${PTEST_PATH}/Makefile
 }
 
-- 
2.21.0


