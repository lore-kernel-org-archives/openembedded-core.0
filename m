Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896BAC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 03:42:01 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.6920.1644291720481712507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 19:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ei13qpWt;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bkylerussell@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id t17so13646810qto.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 19:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNeuJrXfBxEv0hQ+HtW175kX726KlUK8n/up5JoCes0=;
        b=Ei13qpWtLrUaIkwXreiUC1/7Z5uUTzNhamY8o5WIFjqkKxkAw5Js8TxQ3N9u+uB6I1
         bFTakfnA/QjjX+nEBCWgPH5d+xs96Ng+g0X8V3pgAS9e9rBYmn5ypatv03KP4MjihpwZ
         pRXFQDWK2RE2ABmQ8B7qcOFC349I9rV1z/YLZPTd1VRmI3pFPt+NXYBDC/tpJjQjBG//
         DcMWfnHh7Lj3DpOE6l6IXq98ruZyrqRG61SaqPlFWnTFC89LpX/08ArLGQaRST67UPMO
         54p8KAXr0vfpj2c/g4HBemCb/6f6clkR+OFQiHh9aVn7Ci6lluSCtjjI2R76CyM2D152
         Hgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNeuJrXfBxEv0hQ+HtW175kX726KlUK8n/up5JoCes0=;
        b=q14+1NvyuxGas68P2nghyAVM9x6ravbbuBbM+fL8OWOydt/dBRFND81TkkF5q9Dv+D
         fyPZAFuVvgNYYGZG5LGL7UVQWybY6U7lUr0kztflbyNTQBfPTdfPIRdI3V2Xq2UdahD1
         1Us4+NT6dwOaaYjRqNHnwEbYt6I36LIhC4e4mFGozc9xnAPmN/ShRXBdKBMJQByFQ9fs
         LNXualD3J1rtqAYPNN4oreCOE0U3z6eWYqb9yc3deUX1wkUi5fK+En0lTVH74PgokAiR
         vZCeK385/ErTJkDCv28lBHHiZhK0KGiZmjzeXZ9hOILBq91wqPXKJzRB1/0uBtFv0Qk2
         28Ng==
X-Gm-Message-State: AOAM5323olL8U37gGuyZX1PQSpwCCb/95toBy3qnDKOX4Cak/FXXl4yu
	0QpnNO0kC8j7vh5rebYQN5Y0VUqLLfzOxQ==
X-Google-Smtp-Source: 
 ABdhPJxhLm2bNdir4ucKQruViI/5Sc16lhxrRJ5YgPjq/cT3wPGfJEgTqyDPgfjwnt75q7S3mh9Fvg==
X-Received: by 2002:a05:622a:1353:: with SMTP id
 w19mr1844120qtk.584.1644291719429;
        Mon, 07 Feb 2022 19:41:59 -0800 (PST)
Received: from hercule.localdomain (cpe-74-138-104-174.kya.res.rr.com.
 [74.138.104.174])
        by smtp.gmail.com with ESMTPSA id
 b16sm6046825qtk.84.2022.02.07.19.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 19:41:58 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyle Russell <bkylerussell@gmail.com>
Subject: [dunfell][PATCH] rpm: fix intermittent compression failure in
 do_package_write_rpm
Date: Mon,  7 Feb 2022 22:41:49 -0500
Message-Id: <20220208034149.399705-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 03:42:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161472

rpmbuild can start processing random memory when processing the value
provided by XZ_THREADS, and unintentionally disable encoding for a
file descriptor that in fact requires encoding to be enabled in order
for lzwrite() to actually create an rpm.

  *** Fdopen(0x7f2030002b30,w6T16.xzdio)  | fdio 23 fp (nil)
  ==>     lzopen_internal("w6T16", 23, 1)
  ==>     lzopen_internal set encoding
  ==>     lzopen_internal clear encoding
  ==> Fdopen(0x7f2030002b30,"w6T16.xzdio") returns fd 0x7f2030002b30      | xzdio 0x7f2030004e30 fp 23 | fdio -1 fp (nil)
  ==>     lzwrite(0x7f2030004e30, 0x7f20789d8070, 6) encoding 0
  ==>     Fwrite(0x7f2030002b30,0x7f20789d8070,6) rc -1   | xzdio 0x7f2030004e30 fp 23 | fdio -1 fp (nil)
  error: create archive failed: cpio: write

When the encoding bit gets cleared on the LZFILE* struct, lzwrite() then
rightfully complains when it detects !lzfile->encoding, which then gets
bubbled up as a write failure when we go to create the archive.

This fix is available in the rpm 4.17-release.

Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/405fc8998181353bd510864ca251dc233afec276]
---
 ..._internal-mode-parsing-when-Tn-is-us.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch b/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch
new file mode 100644
index 0000000000..52110fa2b1
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch
@@ -0,0 +1,31 @@
+From 405fc8998181353bd510864ca251dc233afec276 Mon Sep 17 00:00:00 2001
+From: Vitaly Chikunov <vt@altlinux.org>
+Date: Wed, 6 Jan 2021 23:43:41 +0300
+Subject: [PATCH] rpmio: Fix lzopen_internal mode parsing when 'Tn' is used
+
+When there is number after "T" (suggested number of threads or "0" for
+getncpus), lzopen_internal() mode parser would skip one byte, and when
+it's at the end of the string it would then parse undesired garbage from
+the memory, making intermittent compression failures.
+
+Fixes: 7740d1098 ("Add support for multithreaded xz compression")
+Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
+---
+ rpmio/rpmio.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
+index ed1e25140..9d32ec6d9 100644
+--- a/rpmio/rpmio.c
++++ b/rpmio/rpmio.c
+@@ -798,6 +798,7 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
+ 		 * should've processed
+ 		 * */
+ 		while (isdigit(*++mode));
++		--mode;
+ 	    }
+ #ifdef HAVE_LZMA_MT
+ 	    else
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index c39a5208e5..376021d913 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x;protoc
            file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
            file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
+           file://0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch \
            file://CVE-2021-3421.patch \
            file://CVE-2021-20266.patch \
            "
-- 
2.25.1


