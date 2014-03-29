Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 794476B6BA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 10:34:17 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so4892494eek.37
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=3MkT6UG+mVww38D9mNaye/XfgdKBdBmQNMxASqBWlBE=;
	b=tFIBqhJGcETVa18KH+6XXMNm6TO0zyON/I9ZXYGIACf2rr07FPAugTtb4RiSLaSlvB
	ZrecuiFHt3fVdlpP6oYI0pSnL720d887SwNrW63BPvp89sy8rkSJN/KuOz6jqmFNowYw
	4kn6VN84sBatzPpd6kHiFQD7AUYeXWmjAg77N+gPGivVXifl7ZDeYY8GM8KRqQctBsHa
	EVizg6eCNUsPayBnGZ4tXD0ui+nOaLtUKZajAZusKG0VbJtEQEUxYhGDxvQ6Ju9E0MHo
	VglyddGvsOi9oN5FLIoiC2HKxjrZuM+S33XNZncEOlSpPz1rbhZAX+A86TJ/a8MyYeyU
	heDA==
X-Received: by 10.15.53.69 with SMTP id q45mr16970659eew.22.1396089258264;
	Sat, 29 Mar 2014 03:34:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t50sm17820597eev.28.2014.03.29.03.34.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 03:34:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 11:34:12 +0100
Message-Id: <fec918d60851acc986bb9fe904a18482d8be6d88.1396089115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1396089115.git.Martin.Jansa@gmail.com>
References: <cover.1396089115.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1396089115.git.Martin.Jansa@gmail.com>
References: <cover.1396089115.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] sstate-cache-management: skip populate_lic archives when removing duplicates
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
X-List-Received-Date: Sat, 29 Mar 2014 10:34:17 -0000

* there are 2 issues

* all *gcc* recipes produce "duplicate" files and we cannot keep just the newest one:
  OE qemux86@ ~/build/oe-core $ find sstate-cache/ | grep gcc.*populate_lic
  sstate-cache/cd/sstate:gcc::4.8.2:r0::3:cd8d1a33b832662b624f5e4bd9f55154_populate_lic.tgz
  sstate-cache/cd/sstate:gcc::4.8.2:r0::3:cd8d1a33b832662b624f5e4bd9f55154_populate_lic.tgz.siginfo
  sstate-cache/d5/sstate:gcc::4.8.2:r0::3:d591af812395cc386e017fa2c8fa0722_populate_lic.tgz
  sstate-cache/d5/sstate:gcc::4.8.2:r0::3:d591af812395cc386e017fa2c8fa0722_populate_lic.tgz.siginfo
  sstate-cache/f7/sstate:gcc::4.8.2:r0::3:f74cfd4982fd7c349a5418f07297f955_populate_lic.tgz
  sstate-cache/f7/sstate:gcc::4.8.2:r0::3:f74cfd4982fd7c349a5418f07297f955_populate_lic.tgz.siginfo
  sstate-cache/74/sstate:gcc::4.8.2:r0::3:7489e4502cb446506b9829cda13c7630_populate_lic.tgz
  sstate-cache/74/sstate:gcc::4.8.2:r0::3:7489e4502cb446506b9829cda13c7630_populate_lic.tgz.siginfo

  OE qemux86@ ~/build/oe-core $ find tmp-eglibc/stamps/ | grep gcc.*populate_lic
  tmp-eglibc/stamps/i586-oe-linux/gcc-cross-initial/4.8.2-r0.do_populate_lic_setscene.cd8d1a33b832662b624f5e4bd9f55154
  tmp-eglibc/stamps/i586-oe-linux/libgcc/4.8.2-r0.do_populate_lic_setscene.f74cfd4982fd7c349a5418f07297f955
  tmp-eglibc/stamps/i586-oe-linux/gcc-cross/4.8.2-r0.do_populate_lic_setscene.d591af812395cc386e017fa2c8fa0722
  tmp-eglibc/stamps/i586-oe-linux/gcc-runtime/4.8.2-r0.do_populate_lic_setscene.7489e4502cb446506b9829cda13c7630

* the same for target and native versions of the same recipe:
  OE qemux86@ ~/build/oe-core $ find tmp-eglibc/stamps/ | grep opkg-utils.*populate_lic
  tmp-eglibc/stamps/x86_64-linux/opkg-utils-native/0.1.8+gitAUTOINC+c33b217016-r0.do_populate_lic_setscene.dd21a3c5444482ce90be4c9a33d806f1
  tmp-eglibc/stamps/i586-oe-linux/opkg-utils/0.1.8+gitAUTOINC+c33b217016-r0.do_populate_lic_setscene.8571422f9e311dc41bb6b21e71a09bc0

  OE qemux86@ ~/build/oe-core $ find sstate-cache/ | grep opkg-utils.*populate_lic
  sstate-cache/dd/sstate:opkg-utils::0.1.8+gitAUTOINC+c33b217016:r0::3:dd21a3c5444482ce90be4c9a33d806f1_populate_lic.tgz.siginfo
  sstate-cache/dd/sstate:opkg-utils::0.1.8+gitAUTOINC+c33b217016:r0::3:dd21a3c5444482ce90be4c9a33d806f1_populate_lic.tgz
  sstate-cache/85/sstate:opkg-utils::0.1.8+gitAUTOINC+c33b217016:r0::3:8571422f9e311dc41bb6b21e71a09bc0_populate_lic.tgz.siginfo
  sstate-cache/85/sstate:opkg-utils::0.1.8+gitAUTOINC+c33b217016:r0::3:8571422f9e311dc41bb6b21e71a09bc0_populate_lic.tgz

* similar problem for .siginfo file of do_patch:
  OE qemux86@ ~/build/oe-core $ find sstate-cache/ | grep eglibc.*patch
  sstate-cache/99/sstate:eglibc::2.19:r0::3:99b7e1d688e4c6c659b458c9c57611df_patch.tgz.siginfo
  sstate-cache/11/sstate:eglibc::2.19:r0::3:11401ddd208a753fee17696b14dc1e52_patch.tgz.siginfo

  OE qemux86@ ~/build/oe-core $ find tmp-eglibc/stamps/  | grep /eglibc.*patch
  tmp-eglibc/stamps/i586-oe-linux/eglibc-initial/2.19-r0.do_patch.sigdata.99b7e1d688e4c6c659b458c9c57611df
  tmp-eglibc/stamps/i586-oe-linux/eglibc/2.19-r0.do_patch.sigdata.11401ddd208a753fee17696b14dc1e52

* maybe these should have ideally identical signatures, but before it's fixed lets
  just skip removing them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index ffda05e..77afd68 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -225,6 +225,10 @@ remove_duplicated () {
   # Save the file list which needs to be removed
   local remove_listdir=`mktemp -d` || exit 1
   for suffix in $sstate_suffixes; do
+      if [ "$suffix" = "populate_lic" ] ; then
+          echo "Skipping populate_lic, because removing duplicates doesn't work correctly for them (use --stamps-dir instead)"
+          continue
+      fi
       # Total number of files including .siginfo and .done files
       total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz.*" $sstate_files_list | wc -l 2>/dev/null`
       total_tgz_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix\.tgz$" $sstate_files_list | wc -l 2>/dev/null`
-- 
1.9.1


