Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0A79F7853C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:09:33 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t10so3380966pgo.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Nov 2017 03:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=wWaWO9jIEpgJKVU//zhOKPPkmh8144CK3Vk03CWKAIo=;
	b=HljKOSlbMTuICfE47AXtQwXDxoZr0CkkYfFYVGc6T6WMtJt4p7l/AQ+LXNDkA55+Sj
	wIE3S0YLxf7iY+wX04x0QlVaqJonmjJ1cnD69QkzaPTklaBeuhSyw09uJDnZpFRzHfFO
	W1mKpHa39sF09eVs2WVuXCRm7VHrkeP/uqGh/SIeLxLuLpM4cnkWMEZWXrglVAYpaalb
	SKdX7+nohklMM3yvf8uPi5Q3R/dvzUwDm2sc18WVDSPjK50KzSdIpKzyEBFnnHACwHcn
	1NLu4xMbV21Alhf4k55xGoeRU5aVg/PG45P8RGK9yc8R+wdkxH8uyX5c/vlxlWFDaVL8
	phOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=wWaWO9jIEpgJKVU//zhOKPPkmh8144CK3Vk03CWKAIo=;
	b=lwP9BnArXqr2lXwp1MFP8I8wvalCcWQXzMSznaefj5kTjoYUitV8vD0ddUA5r8Gham
	2T0+6ic5hY6Ng5fAQ1L7mOHOp+KlObVWUdFRFFPD8VzfAP3uXOVE9ZHWEbGod03INMch
	R2RJGYywOKocXlNtkxJ8E0wYTR+GEAnIWzcpPsXvRwfta8JyZoYsk1GBWnpKSi83bSrl
	mESak1WmewqpNo9YjD3CRscTPnOUohY2jhx6KkziV689ka08g6jEWPxci9xGaPqWAm3Q
	xir6Zy5vkteP1cPAoFizXHJ2e54n01RQODhH5BgqvuOEpAvEOTAKzgsCi5jlny77BRwq
	XSJA==
X-Gm-Message-State: AJaThX7P+S+q600VM7jcyFh4MKHHEL0CzP9YZwnPOC/9928iFIqk31Ce
	U4r/La9p36As9vYYbtveDOPxsHe1JSw=
X-Google-Smtp-Source: ABhQp+T2auZ2w7++NJZVvBePlVH/q+nB5vvWr7oj8upER9jgdEKbe+bubZ+QGfBGcaBOuKhhaajdUw==
X-Received: by 10.84.212.8 with SMTP id d8mr88306pli.75.1510225775193;
	Thu, 09 Nov 2017 03:09:35 -0800 (PST)
Received: from [127.0.1.1] (CPE-143-238-146-54.lns1.woo.bigpond.net.au.
	[143.238.146.54]) by smtp.gmail.com with ESMTPSA id
	a70sm11845112pfa.94.2017.11.09.03.09.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Nov 2017 03:09:34 -0800 (PST)
Date: Thu, 09 Nov 2017 21:09:25 +1000
Message-Id: <20171109110925.17183-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] busybox.inc: Fix bashism in compile, which fixes sh being suid
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
X-List-Received-Date: Thu, 09 Nov 2017 11:09:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Fix the bashism in the suid check. This ensures that the check works
correctly on hosts that default sh to e.g. dash. If this check fails the
suid shell workaround does not remove sh from the suid binary and
results in the target system containing a busybox.suid with sh as well
as /bin/sh -> /bin/busybox.suid.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Cc: Andrej Valek <andrej.valek@siemens.com>
Cc: Radovan Scasny <radovan.scasny@siemens.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 86f0c60249..4012f921c6 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -173,7 +173,7 @@ do_compile() {
 			done > .config.app.$s
 
 			# workaround for suid bug 10346
-			if [ "$s" == "suid" ] ; then
+			if [ "$s" = "suid" ] ; then
 				sed "s/.*CONFIG_SH_IS_NONE.*$/CONFIG_SH_IS_NONE=y/" -i .config.app.suid
 			fi
 
-- 
2.14.2



