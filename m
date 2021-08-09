Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web10.23646.1628519607058271562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 07:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=Scab10J5;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==8553fca37df==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1628519563-0fb3b001bfab5e0001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id zvCGzS6EfKhvHdfC; Mon, 09 Aug 2021 10:32:43 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=XSpLbQv8jfJ+n7b0ta4XOPSy6FOrrYowZKif2l+ltfQ=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; b=Scab10J5GNKm46E
	mEADZk7QvhqxOlYQzKJMYRPxNhH1YHUQ2BhayzDTGQc9dq6NOgm0Ru6veYrIsXLIj1o4jdfuhyQqF
	FuRdjQkVAMFS1S8gpSC6ZPKznCN9X+Zzt+A7kmTv+HuEw/mTWkbIvPz8spVO2ZCRRqx7Tw4D5mOla
	Xg=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 11056898; Mon, 09 Aug 2021 10:32:43 -0400
Subject: [meta-networking][master][PATCH 1/2] curlpp: fix QA Issue after LDFLAGS change
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
To: Khem Raj <raj.khem@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
X-ASG-Orig-Subj: [meta-networking][master][PATCH 1/2] curlpp: fix QA Issue after
 LDFLAGS change
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <randy.macleod@windriver.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
 <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
 <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com>
 <040fe5d8cd3914e7c19fc70ae6d18894b07f8073.camel@linuxfoundation.org>
 <6bb55159-9b49-3229-a15c-eee730560fb7@cybernetics.com>
 <5e21ec72-667f-6e48-eefc-843312544fe4@cybernetics.com>
 <CAMKF1srcLEBkk1udvadr1xeh8qsgr-i-8+hT_ZvL-2Nak-tsjg@mail.gmail.com>
From: "Tony Battersby" <tonyb@cybernetics.com>
Message-ID: <3402ae7b-3814-0da3-44fd-0f7517569fc2@cybernetics.com>
Date: Mon, 9 Aug 2021 10:32:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srcLEBkk1udvadr1xeh8qsgr-i-8+hT_ZvL-2Nak-tsjg@mail.gmail.com>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1628519563
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 1002
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Adding -f*-prefix-map to LDFLAGS caused the following issue:

QA Issue: curlpp.pc failed sanity test (tmpdir)

Fix by filtering out -f*-prefix-map from *.pc files.

[YOCTO #14481]

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---
 meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index 6ce52d717..263de81c7 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -16,3 +16,10 @@ S = "${WORKDIR}/git"
 inherit cmake pkgconfig binconfig
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install:append() {
+    sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+        -i ${D}${libdir}/pkgconfig/*.pc
+}
-- 
2.25.1

