Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1A09C7C346
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Feb 2019 19:43:35 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d9so1028435pgl.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 11:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qy3xsuvThMeYTlyiWh19BThnwCwUoeN6fmZCq5WnZiw=;
	b=BZ/OGYnybIUQc4u5HcoW/Q8/wDX09/myOq9RtW0w1Et/6zzfjSa/2soe6XWtDu4hde
	yRQZBfHnZRugZFDj0zQrNCyQDfHaXhLhUrMXTrJWL8+r9/wizmjSZiORQfC3sxce0aY8
	pQU19zm1jBK/TTC9K1+SO4C/jxZ4bI+BHYD06RLpqNIkvVI8fZruM8Lsoam22Ndcuwid
	QYue8Lpu/06Y2DYCdi14mKghGWqoZs6CXDqZIURYk/lmVn27QhkbeCX2/ti5H/sbz7ea
	3nWBLXsg2oetVnqZnmV5Kpi/UjwtGm64LheUNatfy2UpXoyqonkTIHPUkyKp+G/ppLHi
	Zabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qy3xsuvThMeYTlyiWh19BThnwCwUoeN6fmZCq5WnZiw=;
	b=i1DS4jKH7aeJZPqBub6TTmuVPVt9OA1ON76GfgMcPXzN5EZ9PYgeL7XCYZRDkpaGan
	9gnm7zt2F/eKPb3cVqmQvJI0C08jra9NFX63nJRebFfUYcjKh2s0J8tT5A76HHkvTmPR
	te78OeRxGkMxhh6zgiy/x8VX9LXvkXOIyJN8X+aE/JU9n+aTiKRvICwBVN/SRjJH9Gxm
	AnWjqnRAI3pHwT/6MYPB+aaaHACB0aurYiEFzpO34pOFgnSO2c0jfkp3nEIUeOXJaHfQ
	sS6Ep1Ei38QC++rAPlLEiQsMJfb0GzyN6XiSc2+U7GGKiGk1Fl1gqfz8mJJlVUO1uusQ
	1OPQ==
X-Gm-Message-State: AJcUukc9qnbhMAqQkaeu9cpOju+2YAC3ytdG8u5Y23U9DoZpDMQdlKUs
	hHLCqknD3fHI0YI7rXbOmUsC4rDK
X-Google-Smtp-Source: ALg8bN46NIbPqlWlWMOSJHAsLeWWl47L1ckl2otBtVxgjKrxVSNepEoLxlCYFVx8faVIadbmYDItIQ==
X-Received: by 2002:aa7:824f:: with SMTP id e15mr43643189pfn.192.1549136616521;
	Sat, 02 Feb 2019 11:43:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id
	j21sm15541962pfn.175.2019.02.02.11.43.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 11:43:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Feb 2019 11:43:25 -0800
Message-Id: <20190202194326.42388-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2 1/2] multilib_header: Place a #include guard to avoid infinite inclusion of headers
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
X-List-Received-Date: Sat, 02 Feb 2019 19:43:36 -0000
Content-Transfer-Encoding: 8bit

In cases where extra preprocessing tools are used such as clang-tidy
e.g. and these tools are not passed the knowledge about architecture
then a corner case comes where we enter into include loop for
bits/wordsize.h, since this template does explicitly include
bits/wordsize.h

so it synthesized a guard out of file name e.g.

bits/wordsize.h -> __OE_BITS_WORDSIZE_H__

and emits the guard at beginning of file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2:
 - No Changes, just rebased

 meta/classes/multilib_header.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index e03f5b13b2..2036dc8594 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -33,10 +33,13 @@ oe_multilib_header() {
 	      continue
 	   fi
 	   stem=$(echo $each_header | sed 's#\.h$##')
+	   include_guard=$(echo $each_header | tr '/.' '_' | tr '[a-z]' '[A-Z]' | sed 's/^/__OE_/' | sed 's/$/__/')
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


