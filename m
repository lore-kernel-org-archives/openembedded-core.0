Return-Path: <jatedev@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id A72777F7E1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 22:05:20 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id a13so52529971ljm.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 14:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=FROVry7lQjw5jap7fopmm0OdgTUhGHkVG0PSEgFiCRw=;
	b=ID5h3opdf9lvMXyNv4FerTgfXK1yylevyAsbbmFojdYxtWqaEMgMfQ8LilWPMvTuif
	OwO0s/H1srqz2+mhiiYXQozQrl7E80VPYmEdkLnn10N+pgrsX0VzB6/HoVxBj0IANQnz
	yZd4xiQq3//QuUUvo+Cxc+VNOM2c5aq2sKDX21X/SavE1j3K93fr3T3z2HgTishK54Ss
	deq6dYecjXmR+jhmKcfibgAA0bFWKuT1/7cMfNPF9+B8RzUgum5iDR+OgtWmVOH7Us6n
	ZOpUIyhGKYrtq4+WDR3BHLPgnZePOEhdFquxQPmlHiPpu1soeOEN4JgC8OOyDrLKYYsN
	kZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=FROVry7lQjw5jap7fopmm0OdgTUhGHkVG0PSEgFiCRw=;
	b=D76GHRLqt0XnkPMr2ZzvLILKNK7p3Nj6K82c82V979+oTNlxjIvVstXJEomt85XAXb
	NtDB0cTEkvK1KyZ4QYUPVFXn6gvVFenH29qJ37fER07fdIb8gF2UafZFEb7/bdYW/r4u
	VGMgfibFDiUD4O3PcL4l+keLKALdeZcutuGu12fyCQSZO0WUq0vg4/xrio596W1DJcBO
	BtVyhU5q2D3tX2zd9lervpfEEeKsHvignqJ2R9rlSvkcqoq2UoKwrXk51S6pSPvbvO55
	wemFE3BPedDV9VrfMsRVbtbjiUD3HPWLamuq3vGI/uzENljLA9SdVsf7SzVLRzxy6D6B
	9lQw==
X-Gm-Message-State: APjAAAUG6ogdiLnd2bajtankMFzoSGMgBcEZW/zhrdfphRWzfVMBe9fh
	ym08YZ7aIFmhB98bx+jAJnYgcqste33aZCNKS6Z1lqhh
X-Google-Smtp-Source: APXvYqyXtLJ2kyTGSOHXdzwlov58Y5euD3QgaWAfoB7hVUmFuJ16dmGTsXcw1ZeABh+M7xVzoXdJ+et8O9tB4Ou4p4Y=
X-Received: by 2002:a2e:8797:: with SMTP id n23mr59098138lji.176.1578348321085;
	Mon, 06 Jan 2020 14:05:21 -0800 (PST)
MIME-Version: 1.0
From: Jate Sujjavanich <jatedev@gmail.com>
Date: Mon, 6 Jan 2020 17:05:10 -0500
Message-ID: <CAPphmgbt-QJF_-ZpE-6unayWW816uzjTdZKGaKwFfBE5vOtFRg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] zip: Add patch fixing zipnote segfault
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
X-List-Received-Date: Mon, 06 Jan 2020 22:05:21 -0000
Content-Type: text/plain; charset="UTF-8"

This patch has been applied in several Linux distributions

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 .../zip/zip-3.0/zipnote-crashes-with-segfault.patch  | 20 ++++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb                 |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644
meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
new file mode 100644
index 0000000..aa10add
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
@@ -0,0 +1,20 @@
+Close the correct file descriptor
+
+https://bugs.archlinux.org/task/47713
+
+Upstream-Status: Pending
+
+diff --git a/zipnote.c b/zipnote.c
+index 5e02cb6..996f012 100644
+--- a/zipnote.c
++++ b/zipnote.c
+@@ -661,7 +661,7 @@ char **argv;            /* command line tokens */
+     if ((r = zipcopy(z)) != ZE_OK)
+       ziperr(r, "was copying an entry");
+   }
+-  fclose(x);
++  fclose(in_file);
+
+   /* Write central directory and end of central directory with new comments */
+   if ((c = zftello(y)) == (zoff_t)-1)    /* get start of central */
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb
b/meta/recipes-extended/zip/zip_3.0.bb
index a2cd771..c00a932 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -12,6 +12,7 @@ S = "${WORKDIR}/zip30"
 SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz
\
            file://fix-security-format.patch \
            file://10-remove-build-date.patch \
+           file://zipnote-crashes-with-segfault.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"

-- 
2.7.4

