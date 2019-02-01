Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B85457C238
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 05:17:23 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c123so2605493pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 21:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IePCzmVUeo/wi2j41zVs0Ff1sRnPrznliGdOYvAenwM=;
	b=UzJOsVGw9x+/7gnlIWmQi8vCDuLejVX6gwHegwoh50/KMvuUv7B3HkLudTHvCYWGFE
	9w3dwL0XkuiSISgsZkkH+E655z49UfSzl64yQmjThghobSAJKOmppT0779xJ+bn6Td8O
	Ji4UJX3HEA56zprjU787P1tJaAFUq1iQmgogpyS7SNmvFETm1LBVwAyX1Y6fZNUTSNdg
	Emc3H4iuB5gwDMoBtFrl3KEyequGlwhw7uEdalVF9dsjtmolzdQnRFP8MBx9OJbKItZo
	rn9BGOoKuii1d/nmvvceQS9FDGPJupi6F+ZGZ3fCJe2JqqCWUzAZ+HILPqv84JkIkk77
	CURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IePCzmVUeo/wi2j41zVs0Ff1sRnPrznliGdOYvAenwM=;
	b=r88f7YgcRGSaPmIZlubS2S+c40w3kl3DFronGxcGSAth+aJCqNTgEq4tLlZzZ7lr6J
	DiHfP5I4uJ7fVuLFHXq9YqYVR8FMa/ucsCGxSKobpNC8lSBbDaLHN4WBPaTfGVPJCMHb
	EPaYaFxV9bXaeRq/x1mLA8bZMg8i2i98DCBPSX/TW76rF3a17R+TkHFb8FFuZ1gKk00s
	RgkmUDc4EzpxYQy6yiVETi7UymbODn0x+2riNuLm+UABFcCUkP2JXTov6KRHNzcUT7YZ
	b8vjwGw0PEOLkXe4p5G9vKelCFjw0jLJw1Q64GhyV1p/pskBow4FDfB+1SWijaguPaIo
	UiIw==
X-Gm-Message-State: AJcUukfeTD3w7vXAfPxEdZPjdkukv01C8QczbhfSuaw68rjmuQzu3Ecx
	Xbyrcnokj3BgDNdJbMLIEYBFPKaO
X-Google-Smtp-Source: ALg8bN7v4F5tJ1Y+N09OTbFqMeSiDAUB02a1FXA0wvecPh5Lp/FH+x7LyQqEqb3DtSMl3CzRETOiZA==
X-Received: by 2002:a62:b15:: with SMTP id t21mr39248480pfi.136.1548998244060; 
	Thu, 31 Jan 2019 21:17:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5276])
	by smtp.gmail.com with ESMTPSA id z7sm8809076pga.6.2019.01.31.21.17.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 21:17:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 21:17:16 -0800
Message-Id: <20190201051716.41462-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V3] multilib_header: Place a #include guard to avoid infinite inclusion of headers
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
X-List-Received-Date: Fri, 01 Feb 2019 05:17:23 -0000
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
v2: Drop space changes, not needed, and fix a typo > to >><Paste>
v3: Prepend `OE` to include guard to make it not conflict with other headers

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

