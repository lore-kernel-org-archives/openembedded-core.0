Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web12.1284.1627393015524332145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 06:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=q2QV3cHH;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==842db41608d==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1627393014-0fb3b001bf175c0001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id qIVjbLLp7b1JLYJA; Tue, 27 Jul 2021 09:36:54 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=ZJcaWEAszscb2ya/gEaSqUeVXUcnPLzdYdrj0cXtg5M=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To; b=q2QV3cHHd7wHkh4LlhKPsLgMBLrAtttL3JcgV8t8vE3T
	zECd1gaokirHzZ+PfaIMoOSLcUq5KeOi5pNnuLeLzTJnnaBw/wun9K565GNlHckWhSCWVMtUdarJC
	akYCCNPMe+odvu0CK+CFkqtkSeAqxTMZHTw3eYq3EQGjmM5FdE=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 10999391; Tue, 27 Jul 2021 09:36:53 -0400
To: openembedded-core@lists.openembedded.org
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Cc: randy.macleod@windriver.com
From: "Tony Battersby" <tonyb@cybernetics.com>
Subject: [master][PATCH 3/4] bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
Message-ID: <30028597-3dcb-cbe2-f7a7-54b0e7bd8e1f@cybernetics.com>
X-ASG-Orig-Subj: [master][PATCH 3/4] bitbake.conf: add DEBUG_PREFIX_MAP to
 TARGET_LDFLAGS
Date: Tue, 27 Jul 2021 09:36:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1627393014
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 1128
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

-f*-prefix-map flags are required when linking with LTO enabled to make
the output binary reproducible.

See discussion here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473

[YOCTO #14481]

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---

/usr/sbin/lspci from pciutils is a good program to test that shows how
adding -f*-prefix-map to LDFLAGS makes a program binary reproducible
with LTO enabled.

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 160abf40ee..c0d2e3f82f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -595,7 +595,7 @@ TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_
 ASNEEDED ?= "-Wl,--as-needed"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
-TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
+TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBUG_PREFIX_MAP}"
 # mips does not support GNU hash style therefore we override
 LINKER_HASH_STYLE_mipsarch_libc-musl = "sysv"
 
-- 
2.25.1

