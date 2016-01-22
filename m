Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AB00B6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 01:47:42 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0M1lg8e014366 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 19:47:42 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012119474248-176296 ;
	Thu, 21 Jan 2016 19:47:42 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 19:46:53 -0600
Message-Id: <1453427213-6159-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/21/2016 07:47:42 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/21/2016 07:47:42 PM,
	Serialize complete at 01/21/2016 07:47:42 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-21_08:, , signatures=0
Subject: [PATCH] libc-package.bbclass: add LOCALE_UTF8_IS_DEFAULT
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
X-List-Received-Date: Fri, 22 Jan 2016 01:47:45 -0000

python hard-codes the encoding of many locales; for instance, en_US is
always assumed to be ISO-8859-1, regardless of the actual encoding of
the en_US locale on the system. cf
https://hg.python.org/cpython/file/7841e9b614eb/Lib/locale.py#l1049,
getdefaultlocale(), etc. This code appears to date back to python 2.0.
The source of this hard-coding is Xorg's locale.alias but is ultimately
justified by glibc's SUPPORTED.

This causes problems on OE, because any locale lacking an explicit
encoding suffix (e.g. en_US) is UTF-8. It has been this way from the
beginning (svn r1). That is not a bug, per se -- no specification
prohibits this AFAIK. But it seems to be at odds with virtually every
other glibc-based distribution in existence. To avoid needlessly
aggravating hidden bugs that nobody else might hit, it makes sense to
disable this behavior such that locales are named precisely as specified
by SUPPORTED.

I suppose that reasonable minds may disagree on whether or not the
current behavior is prudent; at the very least, this is likely to break
IMAGE_LINGUAS settings. So let's create a new distro variable
LOCALE_UTF8_IS_DEFAULT to allow either behavior. Set it to 0 and all
your locales get named exactly like they are in SUPPORTED. Leave it at 1
to preserve current OE locale naming conventions.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/classes/libc-package.bbclass               | 11 +++++++----
 meta/conf/distro/include/default-distrovars.inc |  1 +
 meta/conf/documentation.conf                    |  1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index adb4230..467d567 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -332,6 +332,8 @@ python package_do_split_gconvs () {
         bb.build.exec_func("do_prep_locale_tree", d)
 
     utf8_only = int(d.getVar('LOCALE_UTF8_ONLY', True) or 0)
+    utf8_is_default = int(d.getVar('LOCALE_UTF8_IS_DEFAULT', True) or 0)
+
     encodings = {}
     for locale in to_generate:
         charset = supported[locale]
@@ -344,10 +346,11 @@ python package_do_split_gconvs () {
         else:
             base = locale
 
-        # Precompiled locales are kept as is, obeying SUPPORTED, while
-        # others are adjusted, ensuring that the non-suffixed locales
-        # are utf-8, while the suffixed are not.
-        if use_bin == "precompiled":
+        # Non-precompiled locales may be renamed so that the default
+        # (non-suffixed) encoding is always UTF-8, i.e., instead of en_US and
+        # en_US.UTF-8, we have en_US and en_US.ISO-8859-1. This implicitly
+        # contradicts SUPPORTED.
+        if use_bin == "precompiled" or not utf8_is_default:
             output_locale(locale, base, charset)
         else:
             if charset == 'UTF-8':
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 0c6d018..ce42bde 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -7,6 +7,7 @@ KEEPUIMAGE ??= "yes"
 IMAGE_LINGUAS ?= "en-us en-gb"
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
+LOCALE_UTF8_IS_DEFAULT ?= "1"
 
 DISTRO_FEATURES_DEFAULT ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
 DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index e09f7d8..e3222ee 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -266,6 +266,7 @@ LICENSE_PATH[doc] = "Path to additional licenses used during the build."
 LINUX_KERNEL_TYPE[doc] = "Defines the kernel type to be used in assembling the configuration."
 LINUX_VERSION[doc] = "The Linux version from kernel.org on which the Linux kernel image being built using the OpenEmbedded build system is based. You define this variable in the kernel recipe."
 LINUX_VERSION_EXTENSION[doc] = "A string extension compiled into the version string of the Linux kernel built with the OpenEmbedded build system. You define this variable in the kernel recipe."
+LOCALE_UTF8_IS_DEFAULT[doc] = "If set, locale names are renamed such that those lacking an explicit encoding (e.g. en_US) will always be UTF-8, and non-UTF-8 encodings are renamed to, e.g., en_US.ISO-8859-1. Otherwise, the encoding is specified by glibc's SUPPORTED file. Not supported for precompiled locales."
 LOG_DIR[doc] = "Specifies the directory to which the OpenEmbedded build system writes overall log files. The default directory is ${TMPDIR}/log"
 
 #M
-- 
2.7.0


