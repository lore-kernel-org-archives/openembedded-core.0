Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id C94CA7F2B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:57:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w16so11151318pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=ll1C742ROeUApG0oKiZ/SSjNP+qDovF8FCaEw8U8jNw=;
	b=XvzPDUzc6ItjCR2ePiIS7HK9xIhEeOt0lv/R17RrZGxdBjefTBd0V6deks32EITwv4
	sBEAjgIAC+cm2tsxLznLdYQVqOtknqyX67vkux5tGpBaKl2yG70vQseogvCtEgW6dPB+
	hd7Vvdm2QqYDViZs6O8Yg0SqalJibInkIhmUUF7fXgRaqzIVQEQJAhBIdq7hFmvlD/y4
	CoFc84nxgyR6ov84MUhlhATAIZ8+SNYfnm3N/FHqEhWuxCPOOeVNEawUn2ASDvJEwhVS
	rcTKNVPMn/3VWqsJWzudfx89SJ1Mnb7QSDTPBjn+96TRN92MjkOkr19TPAuBGduMdQna
	j31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=ll1C742ROeUApG0oKiZ/SSjNP+qDovF8FCaEw8U8jNw=;
	b=MGFOWXwgMxdWra4kdf2RguNJ89y1ZCCBXU7bT6ZQNuLEyRYGwPpX2JUSvd0ul57E7y
	3X9HvHE2QC8fZgBwl19tqOIOJ5bzVFCqbYODL9tEIX0mUyU0DxycPdfY1JPa8CsBpTG/
	LetVzZPSh2BMpDPZ+muuICgRnnKigiiW3YdH3924dXOduK9CaiGeky5AdyV/6w2QbiKW
	Hg27XkLgn6pyvW/jjaEgl/tY6jo8d3lNKBoGGkx6K+GRb8U94RaXOIMDSBDE/9gcq9cF
	TzTi03fmBpyGz6v8B4WC8DmKjMXdNMZySs8/Nu+MQehz55KG7ZHzD4HqXagppTf2y6zV
	tKow==
X-Gm-Message-State: APjAAAULWAdPApSaW9Y0hGdYdQnluBheFseSbSwpgdcD8I0RneRJhKMD
	xKlrkpXtqgUnf9ubqSBe/UF0JLkds5pULg==
X-Google-Smtp-Source: APXvYqy4CUDt83R9gejdDQEty2ELuvbeTB4IIMwHb3JOljK4MgV2/HoBL4T42rU8Gz2ASxwHVApmeA==
X-Received: by 2002:a17:90a:cb89:: with SMTP id a9mr235060pju.93.1567529829441;
	Tue, 03 Sep 2019 09:57:09 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	p10sm79716pjr.14.2019.09.03.09.57.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:57:08 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-1-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 01/12] dejagnu: Add dejagnu for binutils/gcc test suites
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
X-List-Received-Date: Tue, 03 Sep 2019 16:57:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The binutils and gcc test suites use dejagnu for execution. Copy the
dejagnu recipe from meta-oe, and update it to 1.6.2.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- New
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
new file mode 100644
index 0000000000..7dc4e417f6
--- /dev/null
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "devel"
+
+DEPENDS += "expect-native"
+
+inherit autotools
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "e1b07516533f351b3aba3423fafeffd6"
+SRC_URI[sha256sum] = "0d0671e1b45189c5fc8ade4b3b01635fb9eeab45cf54f57db23e4c4c1a17d261"
+
+BBCLASSEXTEND = "native"
---
2.23.0.rc1

