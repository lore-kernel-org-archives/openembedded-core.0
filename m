Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web08.1159.1627392930197839879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 06:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=GmBEQ0rL;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==842db41608d==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1627392925-0fb3b001bf17530001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id TFbtmNKtfivUXO72; Tue, 27 Jul 2021 09:35:25 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=lpxK8SyY2GY4vDPMJnO/e4NC/g26UaLHgB49yVGLez0=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To; b=GmBEQ0rLMeczc71xHT4dtoiB/99s3LwzLjXZaegPWFx+
	LQ3v4Q5DjK2bdEIko2zX2Gdy/azUtomB2b75ikNQ1OJ4+XDnSzgQqIBnaHrG3DxDARMdSn1WigY2R
	rgTTzQi2zbzh+qmTw67XDxH33zTW4bAXGvfK4BnbMjNDKfwLto=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 10999376; Tue, 27 Jul 2021 09:35:25 -0400
To: openembedded-core@lists.openembedded.org
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Cc: randy.macleod@windriver.com
From: "Tony Battersby" <tonyb@cybernetics.com>
Subject: [master][PATCH 1/4] lto.inc: disable LTO for grub
Message-ID: <0960c6d7-785a-d4cd-4477-5cbbd276947f@cybernetics.com>
X-ASG-Orig-Subj: [master][PATCH 1/4] lto.inc: disable LTO for grub
Date: Tue, 27 Jul 2021 09:35:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1627392925
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 893
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

With gcc 11.1, compiling grub with LTO causes an internal compiler error
(ICE), and with gcc 10.2, files under /usr/lib/grub/i386-pc/*.mod are not
binary reproducible.

[YOCTO #14490] (gcc 11.1 ICE)
[YOCTO #14481] (LTO and binary reproducibility)

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---
 meta/conf/distro/include/lto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index 20895ad40d..5d64452c42 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -22,6 +22,8 @@ LTO_pn-perf = ""
 # webkit is not linking properly with LTO, disable until next time
 LTO_pn-webkitgtk = ""
 LTO_pn-xserver-xorg = ""
+LTO_pn-grub = ""
+LTO_pn-grub-efi = ""
 
 # Custom LTO flags
 # disable partitioning/streaming algorithm since its uses ASM
-- 
2.25.1

