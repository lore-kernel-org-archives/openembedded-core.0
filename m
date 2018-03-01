Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8288978882
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:26:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q83so13982940wme.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 10:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5jRtp5aKnWWjVdqmzqzmLfl+BSy7s6k0k8N6juY3WpA=;
	b=p1eMVgNEGVUrHC/4GqtSpOrdEQzFronfPNjUOkBLUCDPU6DrXL7fg2hNNz4/UdG3XN
	5+zTjckUmEsERTOgGO04tT6m9d0Ac7xKJKR0RNl0SdVPApNzSpXhED9FaQxCG2jiZBeu
	mZcc4RMB+3ZraSI4wF6SNCzrfvp3UgSBvZ7l4zT+a8s8R2KpMf512MLHSx1JxT5y8aqD
	e/+1qLxWDUkYcKyGC+7WxpE6xIBPZ5ArGsWgMvW5UNmM7MaTC/NSKOoz3qHzN3mSbgjL
	+vr8oT4xc8bx1qPY9E86rF4u5mSnLwwMlIcQQTqHi3aimgJ441bDzXVKrI3IdUeyjouT
	RDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5jRtp5aKnWWjVdqmzqzmLfl+BSy7s6k0k8N6juY3WpA=;
	b=DvTC2kfyIWyZ0M+fXcNI6IWwnqCd+6NAq8ZyEVkZWu0JeJyvzQgIwA4SyCXZgmZfwE
	1PRRG2hYP51tKQ7qOA9gpesFXleokc5pGG/LmCwoHWQkiLbcK4ZMKXIa8m4w0V67geyd
	CXl8Dynsw8r9HRNA4EnW5AF6QF+fRjnxLjsGFZM56rWo+Bw4GiblqhEdvJTfmpgWGcBN
	g5USjZixyY/oDzUO3KadlOdw3Bd5VeewiEdT5JtuyywH5zZxoiVY/g3mqlGJmiCRE81l
	hpmD7yyedWprGjT5/6ncknVI0j2T+bh872AKAyxXI4ei7R5/siCO+p8Mg/qwuz7IbB44
	2p3g==
X-Gm-Message-State: AElRT7E0pgHsxmpbzhrMzKFAgB1UjeNHSwSvMclb7ZH3to4YrnJloeu4
	IZu/7NIMvFOiBi2+XLlDjGolajLs
X-Google-Smtp-Source: AG47ELuIyrUAscaWy+V04jlj7Cy7y5dc8mROhJPULyDTzaHIXB3Fv+28tBZm+9ZzkMWbdbpKfxuAlg==
X-Received: by 10.28.109.148 with SMTP id b20mr2726155wmi.92.1519928806174;
	Thu, 01 Mar 2018 10:26:46 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h188sm4955285wmf.23.2018.03.01.10.26.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 10:26:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 18:26:28 +0000
Message-Id: <20180301182634.20502-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180301182634.20502-1-ross.burton@intel.com>
References: <20180301182634.20502-1-ross.burton@intel.com>
Subject: [PATCH 05/11] cross-localedef-native: add way to specify which locale archive to write
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
X-List-Received-Date: Thu, 01 Mar 2018 18:26:45 -0000

localedef has no way to specify which locale archive to use, and the
compile-time default isn't useful as it points to the work directory.

Add support to read an environmental variable for the path, and don't fail to
write a new locale archive.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glibc/cross-localedef-native_2.27.bb           |  1 +
 meta/recipes-core/glibc/glibc/archive-path.patch   | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/archive-path.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
index d633e9bc37e..f1e4a657cf4 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-eglibc-Install-PIC-archives.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://archive-path.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc/archive-path.patch b/meta/recipes-core/glibc/glibc/archive-path.patch
new file mode 100644
index 00000000000..b0d3158cfe4
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/archive-path.patch
@@ -0,0 +1,39 @@
+localedef --add-to-archive uses a hard-coded locale path which doesn't exist in
+normal use, and there's no way to pass an alternative filename.
+
+Add a fallback of $LOCALEARCHIVE from the environment, and allow creation of new locale archives that are not the system archive.
+
+Upstream-Status: Inappropriate (OE-specific)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
+index ca332a34..6b7ba9b2 100644
+--- a/locale/programs/locarchive.c
++++ b/locale/programs/locarchive.c
+@@ -569,10 +569,13 @@ open_archive (struct locarhandle *ah, bool readonly)
+   /* If ah has a non-NULL fname open that otherwise open the default.  */
+   if (archivefname == NULL)
+     {
+-      archivefname = default_fname;
+-      if (output_prefix)
+-        memcpy (default_fname, output_prefix, prefix_len);
+-      strcpy (default_fname + prefix_len, ARCHIVE_NAME);
++      archivefname = getenv("LOCALEARCHIVE");
++      if (archivefname == NULL) {
++              archivefname = default_fname;
++              if (output_prefix)
++                memcpy (default_fname, output_prefix, prefix_len);
++              strcpy (default_fname + prefix_len, ARCHIVE_NAME);
++      }
+     }
+ 
+   while (1)
+@@ -585,7 +588,7 @@ open_archive (struct locarhandle *ah, bool readonly)
+ 	     the default locale archive we ignore the failure and
+ 	     list an empty archive, otherwise we print an error
+ 	     and exit.  */
+-	  if (errno == ENOENT && archivefname == default_fname)
++	  if (errno == ENOENT)
+ 	    {
+ 	      if (readonly)
+ 		{
-- 
2.11.0


