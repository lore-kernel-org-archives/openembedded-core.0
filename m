Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1552760620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 19:41:37 +0000 (UTC)
Received: by wmww144 with SMTP id w144so83067954wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 11:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9d6RETsZ/sE3B4yMS0CdRpBET3pICEQQy1hKuCXSfbM=;
	b=JOipYK+T2SHEdFuC1e/4sUFbrqna4/OGWAP+qAjOzqr/RtdvDveuqElgPtzMm/FOwZ
	P9QAng2VSh4TGACocmWq7z2+sA7IUD2G1KGq5rSI8lTaLIADVmRmquE0WwWAfJ+v2Fc7
	TzYpMDZFXUqCFJKvglbPT2ATGG+gxCmI7KG8fJnneI1piwbcDz7pVsjHM9FpDFDSFOJb
	8XYg1M0bYva5ZFynRDKMHmfFtRoj+GViG48QzwLz1sBvQTuMCtnnqoL9yXEM09l2Ct7N
	x+xbEAAJf0AmHiZG+me6FJmB1kZoHgVnD+/rkZLKDfa6j7gRyRY4aD82gtU7OprCKOHE
	mV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9d6RETsZ/sE3B4yMS0CdRpBET3pICEQQy1hKuCXSfbM=;
	b=cwRRgqT6IewDoI3Xkf/n6i2sisVtMXqGi5L7cWN9ZCaUyQv9VzfKEAQC6QxGKNNl/t
	hlCHiVE2GEsJUYiRoJkWCs23tkykpPT5GXdIBls5KhlTGj8ocNcNJhRxpWPqWvSIQ+TK
	ELiTYwZ8fTcpXT1PguC65GmNh2/dXjhs8Mzr6LIfqGcF8dZ+vltPezjgVAeb0j7UwEPk
	yUk4vnoMN/N/sp7R3HcjK9YVhyc8g3CTUbf9kKbW3YB97UAgy6yLb6GeJWtLDy0wOGUS
	cAbwlA0U0IHCc5lUDHqpXnJ5CPHnEbRRDcif3vKcUlhoN+2ruB0UTBIoITfKTnWG8j3A
	FxzA==
X-Gm-Message-State: ALoCoQlf8wJM893/RVsQTphrQynUOonHtwWxK3y28xRdInp672EvSoVZ2GGdQQfaVhJR3bjTMqoh
X-Received: by 10.28.156.75 with SMTP id f72mr6730062wme.91.1448480498118;
	Wed, 25 Nov 2015 11:41:38 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jj3sm17775854wjb.13.2015.11.25.11.41.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 11:41:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 19:32:50 +0000
Message-Id: <1448479970-9542-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1448479970-9542-1-git-send-email-ross.burton@intel.com>
References: <1448479970-9542-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] oeqa/sshcontrol: don't source profile
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
X-List-Received-Date: Wed, 25 Nov 2015 19:41:38 -0000

Instead of sourcing /etc/profile to get $PATH including /usr/sbin, just assign
to PATH in the ssh invocation.

The remote /etc/profile may not actually be manipulating PATH as we expect, and
there may be other commands which can interfere with the tests (such as resize
emitting a series of control characters on connection).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 00f5051..1658744 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -136,8 +136,7 @@ class SSHControl(object):
         timeout=0 - no timeout, let command run until it returns
         """
 
-        # We need to source /etc/profile for a proper PATH on the target
-        command = self.ssh + [self.ip, ' . /etc/profile; ' + command]
+        command = self.ssh + [self.ip, 'export PATH=/usr/sbin:/sbin:/usr/bin:/bin; ' + command]
 
         if timeout is None:
             return self._internal_run(command, self.defaulttimeout, self.ignore_status)
-- 
2.1.4


