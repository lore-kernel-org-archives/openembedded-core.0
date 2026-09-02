Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A53C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 08:56:05 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8219.1788339358954237282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 01:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=KUopygiS;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=5844; q=dns/txt;
  s=NAESA-Selector1; t=1788339357; x=1819875357;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DAGWF7oYn25l52g5WCGTbt3Z8mZNNbdWJOhHLpIaBNo=;
  b=KUopygiSVDpOJA+XGH1W5aX2Jkxt5gEwljJRmsb8W34lxqh8KOKhGf6X
   F+ORpPjYdhIYKnoQWX2cDzLU8kU2H9jcUFZSqjyhg/rIeL8A9zTRNLtCE
   H7H+X2fR1zcSYwUGAsQvliCxZsraJ+DYPMAJgad5rST6bAFE1Og+FAh//
   LaM29Ryib5erFzDwjSHntk36qGM3LHnX5AK+8Nej/ydPzymz/gJhxbMuj
   oLWti61BSW2JO3u8WEzaS5fsjDszWzU6vQFsO3dQh2LlRNmrftdhgoF+c
   0egocID+tZHamVmAo5lHVoce4XkfV0pLOV82ybSe9UDzFCipILGMcQd5K
   Q==;
X-CSE-ConnectionGUID: KrYNEfJ/Tq2vMwhmlGiQ4g==
X-CSE-MsgGUID: uxMb1bKNTLWT//mffwaR5A==
X-IronPort-AV: E=Sophos;i="6.25,257,1779170400"; 
   d="scan'208";a="62402067"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 02 Sep 2026 02:55:56 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] vim: Fix for CVE-2026-73071
Date: Wed,  2 Sep 2026 14:25:43 +0530
Message-ID: <20260902085553.2299768-1-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 08:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244905

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/f8126294a526aa80c5123eb3079e325daee9ec75
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73071

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-73071.patch            | 128 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73071.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73071.patch b/meta/recipes-support/vim/files/CVE-2026-73071.patch
new file mode 100644
index 0000000000..6012bfd396
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73071.patch
@@ -0,0 +1,128 @@
+From f09adcf1b1a876e8a9b00a7b3ea15865ff194aad Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Thu, 16 Jul 2026 18:39:24 +0900
+Subject: [PATCH] patch 9.2.0844: [security]: use-after-free on json decode
+ error
+
+Problem:  [security]: use-after-free on json decode error
+          (@tdjackey)
+Solution: Report the position from the current reader
+          (Matsumoto Yasuhiro)
+
+json_decode_item() caches "p" into js_buf, but json_decode_string() can
+refill via channel_fill(), which frees the old js_buf. When the string
+parse then fails (e.g. an invalid \u escape), the shared error path passed
+the now-dangling "p" to semsg(), a heap use-after-free read reachable
+pre-auth through the socketserver.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-69ch-22ch-r887
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/f8126294a526aa80c5123eb3079e325daee9ec75]
+CVE: CVE-2026-73071
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/json.c                        |  4 ++-
+ src/testdir/test_clientserver.vim | 53 +++++++++++++++++++++++++++++++
+ src/version.c                     |  2 ++
+ 3 files changed, 58 insertions(+), 1 deletion(-)
+
+diff --git a/src/json.c b/src/json.c
+index b0d98a290..340347e42 100644
+--- a/src/json.c
++++ b/src/json.c
+@@ -1420,7 +1420,9 @@ item_end:
+ 	res->v_type = VAR_SPECIAL;
+ 	res->vval.v_number = VVAL_NONE;
+     }
+-    semsg(_(e_json_decode_error_at_str), p);
++    // "p" may dangle into a buffer freed by a js_fill() refill in
++    // json_decode_string(); report the position from the current reader.
++    semsg(_(e_json_decode_error_at_str), reader->js_buf + reader->js_used);
+ 
+ theend:
+     for (i = 0; i < stack.ga_len; i++)
+diff --git a/src/testdir/test_clientserver.vim b/src/testdir/test_clientserver.vim
+index 8aa9428f2..148e46910 100644
+--- a/src/testdir/test_clientserver.vim
++++ b/src/testdir/test_clientserver.vim
+@@ -360,6 +360,59 @@ func Test_client_socket_server_custom_path()
+   endfor
+ endfunc
+ 
++" An invalid JSON message that spans two socketserver read buffers must not
++" crash the server: the parse buffer is refilled (and freed) mid-string, and
++" the error path must not report the position from the stale, freed cursor.
++func Test_client_server_socketserver_json_refill()
++  CheckFeature socketserver
++  CheckNotMSWindows
++
++  let g:test_is_flaky = 1
++  let cmd = GetVimCommand()
++  if cmd == ''
++    throw 'GetVimCommand() failed'
++  endif
++
++  let actual = cmd .. ' --clientserver socket --servername channel:2002'
++  let job = job_start(actual, {'stoponexit': 'kill', 'out_io': 'null'})
++  call WaitForAssert({-> assert_equal("run", job_status(job))})
++  call WaitForAssert({-> assert_match('channel:2002',
++        \ system(actual .. ' --remote-expr "v:servername"'))})
++
++  let ch = test_null_channel()
++  for _ in range(50)
++    let ch = ch_open('127.0.0.1:2002', {'mode': 'raw', 'waittime': 100})
++    if ch_status(ch) == 'open'
++      break
++    endif
++    sleep 100m
++  endfor
++  call assert_equal('open', ch_status(ch))
++
++  " The server reads at most MAXMSGSIZE (4096) bytes per read, so a single
++  " message longer than that is split across two read buffers. Keep the JSON
++  " string open past the split to force a refill (which frees the first
++  " buffer), then end in an invalid \u escape so the parse fails.
++  call ch_sendraw(ch, '{"k":"' .. repeat('A', 4200) .. '\uZZZZ')
++  sleep 500m
++
++  " The server must survive the invalid message and stay responsive.
++  call assert_equal("run", job_status(job))
++  call assert_match('channel:2002',
++        \ system(actual .. ' --remote-expr "v:servername"'))
++
++  call ch_close(ch)
++  call system(actual .. " --remote-expr 'execute(\"qa!\")'")
++  try
++    call WaitForAssert({-> assert_equal("dead", job_status(job))})
++  finally
++    if job_status(job) != 'dead'
++      call assert_report('Server did not exit')
++      call job_stop(job, 'kill')
++    endif
++  endtry
++endfunc
++
+ " Uncomment this line to get a debugging log
+ " call ch_logfile('channellog', 'w')
+ 
+diff --git a/src/version.c b/src/version.c
+index 92cd53129..43e4bb45b 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    844,
+ /**/
+     736,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1da47d9243..a69356cf96 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
+           file://CVE-2026-73071.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


