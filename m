Received: from www50.your-server.de (www50.your-server.de [213.133.104.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13341.1795773070815596887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@triplebit-solutions.de header.s=default2507 header.b=iakJQT6a;
 spf=pass (domain: triplebit-solutions.de, ip: 213.133.104.50, mailfrom: kmeinecke@triplebit-solutions.de)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=triplebit-solutions.de; s=default2507; h=Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=6/YP+39fE6KVO6irZgRnj2Zdcrroxnq1Qcv1jk/k2OQ=; b=iakJQT6avfZpOYCqSD9zDxkBnH
	0MkuosRqYrelxjnme3NlRApwT8aTrlM4OQVmHzbcLOeESHleietBOeEcNCrQ5smBRhF6aNGVUuPXQ
	uTmZN/t9aQX3vP2rTXMeQGfr4Etz3NSsA0rp71R0uZEKYXZWm5Lw+CUl09wtXrVsnK1PAoPliBrgI
	5rtIErIfcSvkoDBgH40LJI0AzmKkuFuw/85pVNE18yChkyulq1pgFreHPxRhOIcYJr3+2TX2pLZiW
	JI0YMBdpQa2Y4uzoZsuSN5wtthMBYhIyauENdWIHEtRN5tqlfc9xbvVfOPjEvdnZKfSNfcszQMn+X
	OsLOOtrQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www50.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <kmeinecke@triplebit-solutions.de>)
	id 1xWsJB-0008DJ-2S
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Nov 2026 10:31:57 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <kmeinecke@triplebit-solutions.de>)
	id 1xWsJB-000FWu-1u
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Nov 2026 10:31:57 +0100
Message-ID: <1c58c344-a241-46fe-a473-3e4ce20b24b8@triplebit-solutions.de>
Date: Fri, 27 Nov 2026 10:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Karsten Meinecke <kmeinecke@triplebit-solutions.de>
Subject: [scarthgap] Backport request: insane: fix unimplemented-ptest error handling
To: openembedded-core@lists.openembedded.org
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 11:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251378

Hi Yoann,

Please consider backporting the following master commit to scarthgap:

   b62d5e681741394ad90501a83a1c66b0e3ab7ce3
   "insane: fix unimplemented-ptest error handling"
   meta/classes-global/insane.bbclass, 1 insertion, 1 deletion

Issue: the bb.note() in the unimplemented-ptest FileNotFoundError 
handler has no
conversion specifier but is passed '% d.getVar("PN")'. The handler that 
is meant
to swallow the exception therefore raises

   TypeError: not all arguments converted during string formatting

The affected path runs whenever 'ptest' is in DISTRO_FEATURES, so it is 
live for
every recipe on such a distro. It triggers when a file disappears while 
the check
globs ${S}, which in practice means incremental builds and devtool 
workspaces
where sources change under the scan. We are hitting it on 
scarthgap-based builds.

Target branch: scarthgap (bug also present on others branches).

The commit applies cleanly to scarthgap as of 1397cd8503; I attached the 
patch for convinience
if that helps.

Thanks,
Karsten Meinecke

 From 30c86236a83346a7236716e4d9d594629b1a375f Mon Sep 17 00:00:00 2001
From: Maxin John <maxin.john@gehealthcare.com>
Date: Tue, 27 Oct 2026 10:12:17 +0200
Subject: [OE-core][scarthgap][PATCH] insane: fix unimplemented-ptest error
  handling

Avoid TypeError when the unimplemented-ptest check encounters
a FileNotFoundError.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b62d5e681741394ad90501a83a1c66b0e3ab7ce3)
Signed-off-by: Karsten Meinecke <kmeinecke@triplebit-solutions.de>
---
  meta/classes-global/insane.bbclass | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass 
b/meta/classes-global/insane.bbclass
index 9004a9dce2..7631d3c730 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1357,7 +1357,7 @@ python do_qa_patch() {
          except FileNotFoundError:
              # pathlib.Path.glob() might throw this when file/directory
              # disappear while scanning.
-            bb.note("unimplemented-ptest: FileNotFoundError exception 
while scanning (disappearing file while scanning?). Check was ignored." 
% d.getVar('PN'))
+            bb.note("Recipe %s QA: unimplemented-ptest: 
FileNotFoundError exception while scanning (disappearing file while 
scanning?). Check was ignored." % d.getVar('PN'))
              pass
          return False

--
2.55.0
