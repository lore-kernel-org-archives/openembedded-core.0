Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id D08E460F4E
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:25 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x185so2420731pfc.5
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ReGwlpihcjghkjlnNrslVZryhpF7Us/My8kRtdVN5d4=;
	b=hbB5hQcsg++TPF+0uZ3QnwWbHNZBhvyWf6K6c7HldVufRrIw7hgHmAG7gwE18pJqwm
	0EpbkysoVh3LJRbTamPaIQa+33YDY7HRImu+r9zmyu/ovGfjb8UG9k6k9NRHenUgw79N
	KKI7pSMxtonD0TXUDh4wY+1uW6kLOlkyVjZZCn8VUa7xf84h56WFvUYZCeMUq0nqUMXC
	afqPAJuVwbjD3l01Iygzk+gqfiNY5cSySwILYa9D5hqsdjHy5j5bFL2oj0WWi18/LK5/
	GEiV4OmgbubtTOnFMqlln6RdDPS7qA0mM8z6FlNgMolGoJg3sywO3FU8iyKeruvg1tcV
	pl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ReGwlpihcjghkjlnNrslVZryhpF7Us/My8kRtdVN5d4=;
	b=jnl/q487DeFqtrDpPx8TTT6Hswzk9jC80zM3SiEUqdDTnmgo4+wQ72hUADnsugLOEI
	6w5WFI1eoZt/e2HIvvH56HnDVa3Rt217uvHd+OUEnM1nDXwuU/jVRdcmZfg+hr0FBIEc
	B4ub+2G9KYytUSnWCnnSEDtUc6P8WxsW8TIQiEs3GoV3BQldEdR45HvEbAY3e8Y3tJpA
	OKeZtW37troYlp5Eb2NgfpFKpVm6PHfBHCqk7UDZTq1hgsIagRUU1ZGR8gGyUKnREQ3k
	OIi0DC1udEd+S6HTRmxvFszFmr23T95m+5tP5y0LXE0shPiwCvNQBsR/6woXh6npAtGI
	3RGg==
X-Gm-Message-State: APjAAAXsKbU2pfAkLvS8Mau7IU01iDoHQSPOLE5S3bHqk3aaeWmaZHSD
	AvRuXA7aiCWAyrAtpuipZtGbSis2
X-Google-Smtp-Source: APXvYqwQS0x4n8cDP868klFopio6lnrI15Qn1Nj5abjdUpotIFevYtH0FOhX7OflT3aCLgkARcGnqg==
X-Received: by 2002:a62:cfc4:: with SMTP id b187mr8910360pfg.155.1581264626495;
	Sun, 09 Feb 2020 08:10:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.25
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:56 -0800
Message-Id: <d67a8e540973ee0428dfaebaebabfe38f67419a4.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 28/29] libevdev: Fix determinism issue
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:26 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We need to sort python dict output to be deterministic and generate consistent
header files.

(From OE-Core rev: 75e4cedb986379db2e8a897df52ee1363f9a9a80)

(From OE-Core rev: fc6e8e527698a82bf8047d02e0e792c4a1a64449)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libevdev/libevdev/determinism.patch       | 34 +++++++++++++++++++
 .../libevdev/libevdev_1.8.0.bb                |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libevdev/libevdev/determinism.patch

diff --git a/meta/recipes-support/libevdev/libevdev/determinism.patch b/meta/recipes-support/libevdev/libevdev/determinism.patch
new file mode 100644
index 0000000000..33a6076b78
--- /dev/null
+++ b/meta/recipes-support/libevdev/libevdev/determinism.patch
@@ -0,0 +1,34 @@
+The order of dict values is not deterministic leading to differing header file generation.
+Sort to remove this inconsistency.
+
+RP 2020/2/7
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: a/libevdev/make-event-names.py
+===================================================================
+--- a/libevdev/make-event-names.py
++++ b/libevdev/make-event-names.py
+@@ -67,10 +67,10 @@ def print_bits(bits, prefix):
+ 	if  not hasattr(bits, prefix):
+ 		return
+ 	print("static const char * const %s_map[%s_MAX + 1] = {" % (prefix, prefix.upper()))
+-	for val, name in list(getattr(bits, prefix).items()):
++	for val, name in sorted(list(getattr(bits, prefix).items())):
+ 		print("	[%s] = \"%s\"," % (name, name))
+ 	if prefix == "key":
+-		for val, name in list(getattr(bits, "btn").items()):
++		for val, name in sorted(list(getattr(bits, "btn").items())):
+ 			print("	[%s] = \"%s\"," % (name, name))
+ 	print("};")
+ 	print("")
+@@ -111,7 +111,7 @@ def print_lookup(bits, prefix):
+ 	if not hasattr(bits, prefix):
+ 		return
+ 
+-	names = list(getattr(bits, prefix).items())
++	names = sorted(list(getattr(bits, prefix).items()))
+ 	if prefix == "btn":
+ 		names = names + btn_additional;
+ 
diff --git a/meta/recipes-support/libevdev/libevdev_1.8.0.bb b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
index 84274987d7..46ed5d786a 100644
--- a/meta/recipes-support/libevdev/libevdev_1.8.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
@@ -6,7 +6,8 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
                     file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
 
-SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz \
+           file://determinism.patch"
 SRC_URI[md5sum] = "879631080be18526737e33b63d848039"
 SRC_URI[sha256sum] = "20d3cae4efd277f485abdf8f2a7c46588e539998b5a08c2c4d368218379d4211"
 
-- 
2.17.1


