Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id ED0637423D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 05:07:18 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id 124so7848580pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 21:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vegIqSMceHyO3wrLukJnudKuYj7o2jxbeuNlKW+CG2U=;
	b=ZGxmhXI2r5v/TV4Ft9/tHb7CwJImOn1DCSx4jXHpM/vlWQoe8uY4iOzuUfG2TSlQk5
	I1j7YQMuz/XzD/WRdnH77ujfhYhbyDnj60bdRI3HnbKtuVwys4VLd9WXMK6O3Bs6mcpq
	4ERt8E6ADAjpIhPtMz4Iml0XvhvU+c+p8j5Tk1N4jLi3EukuGIQxkqi8uLX0IzLXxl7q
	8ULV4QfRUcRwGH8dozlVDaXHwfDjgGAO/3wHOW3yBRJNEqocJOb+732kWszVZ30Alk3D
	0CUtRi3o/TfbtFcgPpAd1c8AIEEvmpFZEMOZaMFAmXSCr+6mMos9sopShr2yTpJq5vhf
	mEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vegIqSMceHyO3wrLukJnudKuYj7o2jxbeuNlKW+CG2U=;
	b=Hyp1XFpR2TSbN5IyjVB8rnxDrQsG+60/+cvEMji6nELP7CocRnyrAcGP2goT/Vk4X/
	CTmMBaheG1Q3MN5Adazpmd6Ujkw4cmvpxlvg/UWDtnQsHgbv0VOEpQguUnagT84m/s0x
	STISl1PFupTQqnPG4YEFrlgPygATaiq8AEgEa07JJ/OoY7o0PDcgiOkuHpzjICuDOQcv
	lKlA2KVU1Xb8rTJB13QZIN9k+qO7ysU/pFL5f3ybd7OvPjHHEvlTb51ranLEAImOPqy/
	4fSU32yiyQWnJDR+UEQg01uuNYCvsRkcXsAnaSRUu/J7to8kLi6X+R1dsmyroZMqnZTf
	BsEw==
X-Gm-Message-State: AD7BkJKdZIcMl+4Gh6lznUchEmFo0TYNvZj6orhej7ctuGQ5ZPHyBkXmY5vQbGVa0w1yWg==
X-Received: by 10.98.34.212 with SMTP id p81mr973177pfj.23.1456981639553;
	Wed, 02 Mar 2016 21:07:19 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	dg1sm56770988pad.18.2016.03.02.21.07.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Mar 2016 21:07:18 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 21:07:13 -0800
Message-Id: <1456981633-16756-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gcc-runtime.inc: disable libitm for little endian MIPS too
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
X-List-Received-Date: Thu, 03 Mar 2016 05:07:19 -0000

libitm is already disabled for big endian MIPS, but needs to be
disabled for little endian MIPS targets too.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 707db37..1c3dd54 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -12,7 +12,9 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
 RUNTIMELIBITM = "libitm"
 RUNTIMELIBITM_mips = ""
+RUNTIMELIBITM_mipsel = ""
 RUNTIMELIBITM_mips64 = ""
+RUNTIMELIBITM_mips64el = ""
 
 RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
-- 
1.9.1


