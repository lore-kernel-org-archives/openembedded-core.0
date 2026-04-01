Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D831D10FCAC9
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 18:19:04 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20047.1775067537780283351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 11:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kWxLc8xi;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6688; q=dns/txt;
  s=iport01; t=1775067537; x=1776277137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nnRemVxtARQbQskCZfmriPG0btzS22ewdqdvuzKfZMI=;
  b=kWxLc8xiiD6xwxaxBH3bAaWflEHvWixZYoAD6wV8v3Lk2jDyBh6oM29S
   g8MYlPrKqiwwBJzAlWfFvfx2YyL1UD4Iri7KODXgb/29Tm5AZ4hOLYoyi
   CcrkZeJcm555JmYOb7gJ/xoX43pntDw73ZLZXVLxtyG1ijhaCJ+2Brg2D
   ANGn/W27nOG8baGNBJc4ShsW6FiI6JNdNkiP1SmbTXeZCgbCHTcs4yW8c
   bnXhe5GQT0RKeOGio+5azBnnsSbLauuSz4JAZIQBdMv+HvUaHkP6Agwnt
   szQfStusqDY+ARdODmC8nSaJvw3mDw4KmbzSioTGONEbb3/wOJxCRGgeU
   g==;
X-CSE-ConnectionGUID: 2+xDTLkkQqiwY3MpVlC1mg==
X-CSE-MsgGUID: GGHfIxgqSoCN7YK61pSatA==
X-IPAS-Result: =?us-ascii?q?A0B/AACiYM1p/5T/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?kcPcV5DSQOMcIlYA54aFIFrDwEBAQ9EDQQBAYUHAo0lAiY0CQ4BAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLAUYQHAMBA?=
 =?us-ascii?q?i8rIwgZG4JnAYJzAxG0d4F5M4EBg2gCQ0/bJgELFAGBOAGFPYgcWxgBhHonG?=
 =?us-ascii?q?xuBcoEVg2iBBYFcAQGBIhYQhlwEgiJ6FIFhHoJBBoJNiV1IgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBS4dcdG2BE4N+TgMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4Hi3ApgjY9PhMBK10oDAooAmcGCymSVydCkXqhDgoog3SMHpU6GjOFW6UQC?=
 =?us-ascii?q?5h7izaCU5VoaIRogWg8gUcLB3AVgyIJSRkPjioOC4NegX/BViYyCwMvAQEHA?=
 =?us-ascii?q?gcNAwuBaJABgXwBAQ?=
IronPort-Data: A9a23:x1YviaorTvvEnLlZJffIu3qngTBeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmBPviDN2Shed9/PI61px5VsJGGy9VrSVM+ry08H3gVp+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrf8Eo35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rw0EU1y0
 f8bESkMcSHYovqIxJniT+Y506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzRUr1SarLA6y2PS1wd2lrPqNbI5f/TVHZgIxBzJ/
 jyuE2LRLT46Ov2PxiO+9VmK2d7sw3rjY4sOPejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvuUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:asaKqK3xLsUxyKcES3xx6wqjBLUkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WByB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7N5ZwQt7eC3OF+eOxQpuW6zA==
X-Talos-CUID: =?us-ascii?q?9a23=3Ak2l1B2gsJE85NfAl5AVUDSXsDTJuKD7N4Ev0IEy?=
 =?us-ascii?q?BEGd2eeawUWGU0/phnJ87?=
X-Talos-MUID: 9a23:UQZnKAW/el6qHcXq/BDDpD9DJMhx2KOFLh88sstfo/KNKQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,153,1770595200"; 
   d="scan'208";a="705522906"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Apr 2026 18:18:56 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 8155018000271;
	Wed,  1 Apr 2026 18:18:56 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 0124BCC12A6; Wed,  1 Apr 2026 11:18:56 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [Scarthgap] [PATCH v3 2/2] vim: Fix CVE-2026-26269
Date: Wed,  1 Apr 2026 11:18:47 -0700
Message-ID: <20260401181852.3154298-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260401181852.3154298-1-adongare@cisco.com>
References: <20260401181852.3154298-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 18:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234458

From: Anil Dongare <adongare@cisco.com>

Pick patch from [1] also mentioned in [2]
[1] https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef11970
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-26269

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../vim/files/CVE-2026-26269.patch            | 150 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-26269.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-26269.patch b/meta/recipes-support/vim/files/CVE-2026-26269.patch
new file mode 100644
index 0000000000..1f9a72bca1
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-26269.patch
@@ -0,0 +1,150 @@
+From 3cc246980b800454dda0603af410c77a8c1926e0 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Fri, 13 Feb 2026 10:27:12 +0100
+Subject: [PATCH] patch 9.1.2148: [security]: Buffer overflow in netbeans
+ interface
+
+Problem:  [security]: Buffer overflow in netbeans special_keys() handling
+Solution: Limit writing to max KEYBUFLEN bytes to prevent writing out of
+          bounds.
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-9w5c-hwr9-hc68
+
+CVE: CVE-2026-26269
+Upstream-Status: Backport [https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef11970]
+
+Backport Changes:
+- Excluded changes to src/version.c from this backport. This file only tracks
+  upstream version increments. We are applying a security fix, not a version
+  upgrade. These changes were skipped to maintain current package versioning
+  and avoid merge conflicts.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit c5f312aad8e4179e437f81ad39a860cd0ef11970)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ runtime/doc/version9.txt      |  5 +++
+ src/netbeans.c                |  2 +-
+ src/testdir/test_netbeans.py  |  4 ++-
+ src/testdir/test_netbeans.vim | 57 +++++++++++++++++++++++++++++++++++
+ 4 files changed, 66 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/doc/version9.txt b/runtime/doc/version9.txt
+index b82071757..b32400f17 100644
+--- a/runtime/doc/version9.txt
++++ b/runtime/doc/version9.txt
+@@ -41899,4 +41899,9 @@ features, but does not include runtime file changes (syntax, indent, ftplugin,
+ documentation, etc.)
+ 
+ 
++Patch 9.1.2148
++Problem:  [security]: Buffer overflow in netbeans special_keys() handling
++Solution: Limit writing to max KEYBUFLEN bytes to prevent writing out of
++          bounds.
++
+  vim:tw=78:ts=8:noet:ft=help:norl:fdm=manual:nofoldenable
+diff --git a/src/netbeans.c b/src/netbeans.c
+index 4f5378512..8a341a20b 100644
+--- a/src/netbeans.c
++++ b/src/netbeans.c
+@@ -2302,7 +2302,7 @@ special_keys(char_u *args)
+ 	if ((sep = strchr(tok, '-')) != NULL)
+ 	{
+ 	    *sep = NUL;
+-	    while (*tok)
++	    while (*tok && i + 2 < KEYBUFLEN)
+ 	    {
+ 		switch (*tok)
+ 		{
+diff --git a/src/testdir/test_netbeans.py b/src/testdir/test_netbeans.py
+index 0d6b09680..585886fb4 100644
+--- a/src/testdir/test_netbeans.py
++++ b/src/testdir/test_netbeans.py
+@@ -112,7 +112,9 @@ class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):
+                   'startAtomic_Test' : '0:startAtomic!94\n',
+                   'endAtomic_Test' : '0:endAtomic!95\n',
+                   'AnnoScale_Test' : "".join(['2:defineAnnoType!60 ' + str(i) + ' "s' + str(i) + '" "x" "=>" blue none\n' for i in range(2, 26)]),
+-                  'detach_Test' : '2:close!96\n1:close!97\nDETACH\n'
++                  'detach_Test' : '2:close!96\n1:close!97\nDETACH\n',
++                  'specialKeys_overflow_Test' : '0:specialKeys!200 "' + 'A'*80 + '-X"\n'
++
+                 }
+                 # execute the specified test
+                 if cmd not in testmap:
+diff --git a/src/testdir/test_netbeans.vim b/src/testdir/test_netbeans.vim
+index d3d5e8baf..d1be5066e 100644
+--- a/src/testdir/test_netbeans.vim
++++ b/src/testdir/test_netbeans.vim
+@@ -958,6 +958,58 @@ func Nb_bwipe_buffer(port)
+   sleep 10m
+ endfunc
+ 
++func Nb_specialKeys_overflow(port)
++  call delete("Xnetbeans")
++  call writefile([], "Xnetbeans")
++
++  " Last line number in the Xnetbeans file. Used to verify the result of the
++  " communication with the netbeans server
++  let g:last = 0
++
++  " Establish the connection with the netbeans server
++  exe 'nbstart :localhost:' .. a:port .. ':bunny'
++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
++  let l = ReadXnetbeans()
++  call assert_equal(['AUTH bunny',
++        \ '0:version=0 "2.5"',
++        \ '0:startupDone=0'], l[-3:])
++  let g:last += 3
++
++  " Open the command buffer to communicate with the server
++  split Xcmdbuf
++  let cmdbufnr = bufnr()
++  call WaitFor('len(ReadXnetbeans()) > (g:last + 2)')
++  let l = ReadXnetbeans()
++  call assert_equal('0:fileOpened=0 "Xcmdbuf" T F',
++        \ substitute(l[-3], '".*/', '"', ''))
++  call assert_equal('send: 1:putBufferNumber!15 "Xcmdbuf"',
++        \ substitute(l[-2], '".*/', '"', ''))
++  call assert_equal('1:startDocumentListen!16', l[-1])
++  let g:last += 3
++
++  " Keep the command buffer loaded for communication
++  hide
++
++  sleep 1m
++
++  " Open the command buffer to communicate with the server
++  split Xcmdbuf
++  let cmdbufnr = bufnr()
++  call appendbufline(cmdbufnr, '$', 'specialKeys_overflow_Test')
++  call WaitFor('len(ReadXnetbeans()) >= (g:last + 6)')
++  call WaitForAssert({-> assert_match('send: 0:specialKeys!200 "A\{80}-X"',
++        \ ReadXnetbeans()[-1])})
++
++  " Verify that specialKeys test, still works after the previous junk
++  call appendbufline(cmdbufnr, '$', 'specialKeys_Test')
++  call WaitFor('len(ReadXnetbeans()) >= (g:last + 1)')
++  call WaitForAssert({-> assert_match('^send: 0:specialKeys!91 "F12 F13 C-F13"$',
++        \ ReadXnetbeans()[-1])})
++  let g:last += 1
++
++  sleep 10m
++endfunc
++
+ " This test used to reference a buffer after it was freed leading to an ASAN
+ " error.
+ func Test_nb_bwipe_buffer()
+@@ -967,4 +1019,9 @@ func Test_nb_bwipe_buffer()
+   nbclose
+ endfunc
+ 
++" Verify that the specialKeys argument does not overflow
++func Test_nb_specialKeys_overflow()
++  call s:run_server('Nb_specialKeys_overflow')
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index ae1c95973d..640aa2c9da 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://CVE-2026-25749.patch \
+           file://CVE-2026-26269.patch \
            "
 
 PV .= ".1683"
-- 
2.44.1


