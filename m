Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 05EB3605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 16:55:15 +0000 (UTC)
Received: by wmww144 with SMTP id w144so223332763wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 08:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=iuow8CP0+8JqDwmGlFCEQ2ZNIZAytJxqjTVRQPHoJMY=;
	b=p63TXyDx0aumMFoP5hvJfE7V0JJyqkWKS3J2S4QkkwgeDgq2Ev0mqEpww+5Yho2ntP
	UW1PFfqnNTu6E9x0TkuXa1tIz5OmW4UtQ3emCptskohkofxA1H2uI/9vlrUws9aKp0MC
	9qsYpyyFY3O7UrotTGXO+IQKX+CuOJM5CuudYIhedZ6kAJXrYHeILMRUy6JMggYtmW8Q
	uiaZ/LqJc+K2DeHoJMfHc7VgoPehd48TWq3KRL7g75ngJRqPQEOaXyASQ9GHxGpj3OIf
	hKrZZLkLzzSAa2vJ43jA5ygKFQKUrZw0LlMnJdfyWx4YDhp85uE10tBntgKrQrMfLMM1
	dJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=iuow8CP0+8JqDwmGlFCEQ2ZNIZAytJxqjTVRQPHoJMY=;
	b=HN6IIlbtCXSuPzq9J5sbOoPjAQQpkRKAiChBp8CBX1VPYi3RpGHA6D6yGtB/7QFpQe
	SLkOKonyf7o6oDofH5nBodrKSJ72Ia1wPiYWF+kgxNRQb7kahadDAYTCYekUNeWngcY8
	vtiu/jRGHLm0zqsWFCzwrUx+F4Q7FlH4qQWNZvhxtgnJNQso3gUF8o25y8wDy3VjIgsG
	SvLxVtl2AUaLLydkHh6drQXIY0DVyATQNWmsyG5O14lT3qcw4n/Qe5aZKoz/k6m/YFCz
	vDXsLfhbB1krjX9Q3KT/Wl3x11qC+2PCrmREjff6WvqJBRnRvDHBVuEHydshIiQ5gRnr
	2NRA==
X-Gm-Message-State: ALoCoQmSNEVwr62Xwv0RNT8E/VqxW8kVAxKrekHO5fQi195KsU3hxplK8AgMHk4LF/M1+aTyEi+O
X-Received: by 10.194.187.179 with SMTP id ft19mr6155284wjc.176.1449075316116; 
	Wed, 02 Dec 2015 08:55:16 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n127sm31540389wmf.12.2015.12.02.08.55.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 08:55:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 16:55:09 +0000
Message-Id: <c2a486451e9218b62178bef81cbe011b87b2ee6c.1449075091.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449075091.git.ross.burton@intel.com>
References: <cover.1449075091.git.ross.burton@intel.com>
In-Reply-To: <cover.1449075091.git.ross.burton@intel.com>
References: <cover.1449075091.git.ross.burton@intel.com>
Subject: [PATCH 1/2] base: check for existing prefix when expanding names in PACKAGECONFIG
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
X-List-Received-Date: Wed, 02 Dec 2015 16:55:17 -0000

When the DEPENDS are added as part of the PACKAGECONFIG logic the list of
packages are expanded so that any required nativesdk-/-native/multilib prefixes
and suffixes are added.

However the special handling of virtual/foo names doesn't check that the prefix
already exists, which breaks under nativesdk as in that situation there's an
explicit nativesdk- prefix *and* MLPREFIX is set to nativesdk-.  This results in
the same prefix being applied twice, and virtual packages such as virtual/libx11
ending up as virtual/nativesdk-nativesdk-libx11.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e6d1599..4ea400e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -363,7 +363,10 @@ python () {
                     newappends.append(a)
                 elif a.startswith("virtual/"):
                     subs = a.split("/", 1)[1]
-                    newappends.append("virtual/" + prefix + subs + extension)
+                    if subs.startswith(prefix):
+                        newappends.append(a + extension)
+                    else:
+                        newappends.append("virtual/" + prefix + subs + extension)
                 else:
                     if a.startswith(prefix):
                         newappends.append(a + extension)
-- 
2.1.4


