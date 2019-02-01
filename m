Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1367C2CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 04:06:46 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c73so2487145pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 20:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CntbPpWMowS3uoWzNxI9LpHWuxzQpR4uNp/B/kcS2oQ=;
	b=h9ErdW7X19bA60+d70td69HuxXaUCoEundEWl7KgU8aCArR+g85WLUhILabGgANKM8
	LfGCokZ6ZMiqBLtv7xaFEX6ZJkUwoY6TF0Ws9SP5bxNnq+wN6Cn1QTL8mY97jzwXmQkU
	jmto4NZfM+Z7jIsEIsjVhIDGctDdaDLbRN/o21o7n6L1kGObjWQSzgSXW4pk6yRkuUO4
	VkflwFXUaOIufy8MBjaUEeQQ+3VW7dH4byi1YVV3ztzxCXZT2vmYqOcwSDVv61IhFjnF
	bx9CQQQNBvOL9HIu+UOFCy4+klnymvnoc+Gp4aBjKLHucBSETodrH25yk1cU8nEp2XdY
	KQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CntbPpWMowS3uoWzNxI9LpHWuxzQpR4uNp/B/kcS2oQ=;
	b=iGhwx7L8d5rpdQMwOCIFW9+dGjl+ohLXOJdIWmQ8tJcnlPI+Mtzoz7uoUgAwdiIwJJ
	BKqWkzE9VSBcYnVCv//cp6CKq9UkcGgDZ2dw2qGHqgfUuzGxaCjwR0vHXT4mdhr9xYsn
	JQUdUj06Gm+HjuKbDOND7UtLhZciBCUvV2vjEeWlpnjpJ5NR9RDrQM6bIXPTKUdBKEHT
	HefgTrVd/HmNJOMw4GY88X5fbUpt67RnNsmup+f9jHqI0axNAHCclT48+rMczkaUvSjf
	CllvMRyvH/Bucth4nQiBggFo9zy/ldCDHMOYRYbhLUL7JGGf//m2yljM3AjZelJvyfGM
	ihgQ==
X-Gm-Message-State: AHQUAuZoPYLpTCe2tGzHKScNp4wO+RpBSO0xG6G1eo0zIIJZjhLAt02t
	KRNly4+lkp6Ta/Q4A/e7tTVVKQm/KkE=
X-Google-Smtp-Source: AHgI3IZF3T2iR7ih+OoG7DjPqnrUpDk/mOJzFnAF5hs1F1aNT207GPtja+23jotWjYgheoqXpC48Bg==
X-Received: by 2002:a63:680a:: with SMTP id d10mr732548pgc.396.1548994006394; 
	Thu, 31 Jan 2019 20:06:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5276])
	by smtp.gmail.com with ESMTPSA id
	p77sm10970083pfi.85.2019.01.31.20.06.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 20:06:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 20:06:38 -0800
Message-Id: <20190201040638.25250-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] multilib_header: Place a #include guard to avoid infinite inclusion of headers
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
X-List-Received-Date: Fri, 01 Feb 2019 04:06:47 -0000
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
 meta/classes/multilib_header.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index e03f5b13b2..959e9cac74 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -18,9 +18,9 @@ oe_multilib_header() {
         case ${TARGET_ARCH} in
         mips*)  case "${MIPSPKGSFX_ABI}" in
                 "-n32")
-                       ident=n32   
+                       ident=n32
                        ;;
-                *)     
+                *)
                        ident=${SITEINFO_BITS}
                        ;;
                 esac
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
+	   echo "#endif /* $include_guard */" > ${D}/${includedir}/$each_header
 	done
 }
 
-- 
2.20.1


