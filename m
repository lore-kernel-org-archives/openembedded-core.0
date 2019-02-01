Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 39E417C38E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 04:19:35 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b85so2531041pfc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 20:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DyGNevJmfp8IBRc9gSCU7572Cyc6wrqezWtG2i2gHlU=;
	b=rLIk7aSoXPQxmgc/cuiwTjWXmolRBlxNZuw0d7w0vhk2Cltq198bsltaMAl0mPuZf9
	YXzl3psKy5rEThJJQzf8VttRRVzf7UnNyIRjXl/qcd5O5qlQ1T+peAkWhXjWv2uAk+KV
	mTxFXjcEGTDpGgfXcxQkQKneVQjuq1NxAsmqzak+q9Br1EM3HQdmbU4XLGlWa11tet6q
	ioGZNji2lQQdIlNJ70jaen8VuvOXil17PWdRD4K+Z/1aLJoc9+6LurWFqN4BAgBPsdFy
	DzpaCt0pvLxV7WjDdwMdHTk2564fu0hM1Jmwl5g45BsuHU/+hhAjll+2c94dkZFivs9X
	JAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DyGNevJmfp8IBRc9gSCU7572Cyc6wrqezWtG2i2gHlU=;
	b=D7OV7YdttKng0Mz/OJ1QjC/OUX5gLccdB2Jp3DXbFsNVDBG/T86oZFgjRwUQ2+EJcW
	COKy5VoOJDWd5ViKbN11735fyHZFFiac3p+gg8lA3Z3rO0n0nbXS7/4XL4Wjx2o0/s+f
	LkIqPU6MnI1ci0uJ0qoHWLUCIoTFZmYs+aZzMs9iQPAUatrC+vrQbbH1EIyC+Xpe8w/p
	Pa2Go7himX+xB0qors6H67ig34fySJFwKvBHCywzaEl5HKzN/O382v8RVEBilOWFZy2/
	kDQ6FM2VZbhV/Iu4laOpiE8eeL5eUBg3aonrHR0kh0IKOPYh01kIsKomyXmQtETtEnsx
	DcNA==
X-Gm-Message-State: AHQUAuZt1D2GOGhHYa0aA1yTBew61s0g/IOQuaGPL7xgHGqJtAdLHjB0
	iBBowoIPrQhl0n2Ip+fOtQLyQL/s
X-Google-Smtp-Source: AHgI3Ib924lU5scBJpj70mGXm2GPvYGtMRgjAVLqyznUel41oZpB3BD2PPlfmHLH4OrW07+gziwf6w==
X-Received: by 2002:a63:374e:: with SMTP id g14mr784511pgn.59.1548994775698;
	Thu, 31 Jan 2019 20:19:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5276])
	by smtp.gmail.com with ESMTPSA id
	p64sm8901655pfi.56.2019.01.31.20.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 20:19:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 20:19:25 -0800
Message-Id: <20190201041926.19257-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2] multilib_header: Place a #include guard to avoid infinite inclusion of headers
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
X-List-Received-Date: Fri, 01 Feb 2019 04:19:35 -0000
Content-Transfer-Encoding: 8bit

In cases where extra preprocessing tools are used such as clang-tidy
e.g. and these tools are not passed the knowledge about architecture
then a corner case comes where we enter into include loop for
bits/wordsize.h, since this template does explicitly include
bits/wordsize.h

so it synthesized a guard out of file name e.g.

bits/wordsize.h -> __BITS_WORDSIZE_H__

and emits the guard at beginning of file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop space changes, not needed, and fix a typo > to >>

 meta/classes/multilib_header.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index e03f5b13b2..70b7117da8 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -33,10 +33,13 @@ oe_multilib_header() {
 	      continue
 	   fi
 	   stem=$(echo $each_header | sed 's#\.h$##')
+	   include_guard=$(echo $each_header | tr '/.' '_' | tr '[a-z]' '[A-Z]' | sed 's/^/__/' | sed 's/$/__/')
 	   # if mips64/n32 set ident to n32
 	   mv ${D}/${includedir}/$each_header ${D}/${includedir}/${stem}-${ident}.h
-
-	   sed -e "s#ENTER_HEADER_FILENAME_HERE#${stem}#g" ${COREBASE}/scripts/multilib_header_wrapper.h > ${D}/${includedir}/$each_header
+	   echo "#ifndef $include_guard" > ${D}/${includedir}/$each_header
+	   echo "#define $include_guard" >> ${D}/${includedir}/$each_header
+	   sed -e "s#ENTER_HEADER_FILENAME_HERE#${stem}#g" ${COREBASE}/scripts/multilib_header_wrapper.h >> ${D}/${includedir}/$each_header
+	   echo "#endif /* $include_guard */" >> ${D}/${includedir}/$each_header
 	done
 }
 
-- 
2.20.1


