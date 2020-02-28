Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 25C4A61949
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 22:54:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l7so2445708pff.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x7O5+gnEjlgVswTvN/N7bW/0oVdUIQuAeZAZwvF05oU=;
	b=aZi5AQbjB0FZFkNlX28YJFFQ2UJlbpfEoQDEwciNUYxmqII8+phU8vTlTr68WC53BA
	xLB07HA0BUbHZX/wo8N7GAABhqLhX5d2gdqaQ5XU2KtXzKakxxt04y6He/fEGseHdjpk
	gagNQqQim6uKHtBrPgyQ12c0BdOFuSViUDEeRZI8VjNblcRYVS+MpL1wp9QWXZJ6HNak
	iz0YivRLaQ+PnidYfZLFEtpXSm6frVaTJ50svUzda4imZ20oWAwMDF0qFy9ezprlkGg2
	iVMqTqbj3cnnE2ubyioe5yAV+dysCCWrrBYPDJ+lMbKbI8W0H1tbQef1NG0czzV39yWf
	4N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=x7O5+gnEjlgVswTvN/N7bW/0oVdUIQuAeZAZwvF05oU=;
	b=klWpyMZlooMpx9nUYMltBLKyq/56ztdidcfYJNFzm5Uv7KuXKzheuF2a437w4FmvlR
	+TbWxBPxGwrpKMR/yzOi6rOFG1vFl2ECGI9KvwusgQ+9SLu2iVBDFTbkMpW4zhEDVng5
	I+80IIty2Oes3Gd4++9yf/SDh/OMSfZEvn3R9HuP8Fc07fNaajTTAm0xkGi5eE9JoA6M
	DelUXLOiPciZoyh5nJZcRNLq10MdS0pi48/yPLGluQXe++cB19D8hLtsogmRNYk3js1m
	9niod41sBC2phdecRXBrFJABogFKv2SIHlQY1/lJqXjvHupKf07LqyYlA2q5UCbehsxR
	c+QA==
X-Gm-Message-State: APjAAAVlEotb6gHrnMU72awFIfcrdnJKE/1Yr9+XjUnYX70AaoBeJ+Ek
	edR6SgBpZ/EdhVN7eldAyQLFnPTK
X-Google-Smtp-Source: APXvYqxRUymd6eclLcLw2y9VHmrzGlSBctR0SYv77Jhwo7rBINw/6vrQBQc74IANq1yqMgDGK678+w==
X-Received: by 2002:aa7:8ec1:: with SMTP id b1mr6599024pfr.95.1582930452054;
	Fri, 28 Feb 2020 14:54:12 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	e189sm7111321pfa.139.2020.02.28.14.54.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 14:54:11 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id D29E72A053D; Fri, 28 Feb 2020 14:54:10 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 14:54:09 -0800
Message-Id: <20200228225409.28256-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] binutils: fix multilib header difference
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
X-List-Received-Date: Fri, 28 Feb 2020 22:54:11 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

bfd_stdint.h encodes the name of the compiler in the header
which is different between mutlilibs. Remvoe target prefix to
make the headers match.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 6ed40a1486..b0937e62fc 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -163,6 +163,8 @@ do_install () {
 	done
 
 	oe_multilib_header bfd.h
+        # bfd_stdint.h encodes the compiler name in the header
+        sed -i ${D}${includedir}/bfd_stdint.h -e "s,${TARGET_PREFIX},,"
 }
 
 inherit update-alternatives
-- 
2.20.1


