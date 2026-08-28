Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A79C61DDD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3067.1787945916114966861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3RgyrN/Q;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso16417475e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945914; x=1788550714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=an3YBEFhymd6dqqE7p73sfjh3jvibpnKWZO2G67LNA8=;
        b=3RgyrN/QhzHNXJ88kK4N8DBuE0bOGgdeWEcx3Y1j+lt+Yj+0DDZXfqZNSPZzXRNTnv
         ZaMOy53R773nRyiC8ZCYyR8zoucKJzalbccNaLyU59+u0hyqc0cwhbIEHmfuDFciWo1S
         sLak/yPZOHhTK7Xfyu41vOP00OxZWtzXGmRSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945914; x=1788550714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=an3YBEFhymd6dqqE7p73sfjh3jvibpnKWZO2G67LNA8=;
        b=J1zLIaldud2VYyW/yp9THArpjGE/DhpwFFkv+17fxdfcJ7iJ+WVr7YKDn1E9wISnOv
         whj3YdBkht26ms3n2LOm19Wg2dOuuLMoDoudr+6nGpj5zom53qKvnN1lqYSB/0tLZbLt
         SF7W8ZuMSbxLvz/k/2nIGSdzaf/xFC7p+pwuxGssWv6AEXFHw7zAQ+qMdLDnfMAMz0S2
         Ub+e1cGe4cOC+judKMiA4VcwTd1a64gozPRU0OHWJIg1rywPVENYTtZ6WBu9wl3zHRJt
         u7UDGxRfok0xUc/vgLvOU/QYpqKheR2U531qwV2k/A/XKRoYl8OBnrFb6M7OcUR+v+0s
         WXmA==
X-Gm-Message-State: AFuF++leW6ABI+zev/YzExGdR+UlSCzN4SMAcFQu9Pj3nUZEVD5U9Esa
	6Q/WYsM+P0edkx/kcfwiZh4LOHH7Jm6S3bEQ8ypZhXp72h28eNKHQfhpeJPn2mrmnDphCPkiVQ2
	Hg44O0Tc=
X-Gm-Gg: AR+sD10iJABnhCtLMiHVnuWJxR+irFGscYoBqd2Z/ZcHc9ohKQqeo1x6OXM5dkyX9cm
	vw1LEyOW7JuUbXBFTdSrhYLN2gd/1W7EsLU7oX8a1kwWnmrNaY7kNkScxQhqukxV5MctT3TGEvs
	0W210WrcKJbcJ3dRzUUh0svUENsEwKyP5r9hd4JHwh8lNzVsGpf3/fkCNZGS/wMVLTaXSU4HwMY
	kwKjnkSPu8KX8FlZq5hxJboWjct7QpsuyAmpmXkybu6mS9SlliDugk540SKvwvYFWNE/QxyrghN
	VG/M1zjRkcvlBLxMH8r1ZyfTQnDSBHJKJiTHUFAb5VXzWnPHCAnY12ZE+2sxlh+E6C7QZwwh9KZ
	hdFFSxKKfL4PF2/3UV+fTmsGoU8WLsRFRxGox6AvRsq2qdRMURtAktbYWfW6IpOZEcFV/ZdHQTU
	3a7LVxCd1xYbZsI7sLPz20H6d//vadPixtPiOfsPrmaMKDF6LcwwNfW5BhWmSNJuP5bvmG5nl2C
	6prQnUJ8V5YJgE8hcSYcoDHcTxsSF4Mcmhf0ebmsY3YY/RD+CzbZ7yw3/flIZlMOx3Quge0qTA=
X-Received: by 2002:a05:600c:c4a7:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49cca26ceeemr34782995e9.0.1787945914393;
        Fri, 28 Aug 2026 12:38:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 52/56] curl: set CVE_STATUS for CVE-2026-9547
Date: Fri, 28 Aug 2026 21:36:02 +0200
Message-ID: <e32fc16287f0ca341727345945bfe45f502028d8.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244612

From: Deepak Rathore <deeratho@cisco.com>

Analysis:
- CVE-2026-9547 is tied to the libssh backend. [1]
- Wrynose curl 8.19.0 does not enable or expose the libssh
  backend in the recipe. [2]
- Hence mark this CVE as not-applicable-config for the default
  Wrynose recipe configuration.

Reference:
[1] https://curl.se/docs/CVE-2026-9547.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.19.0.bb?h=wrynose

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 994b1cff28f..72ea2298ea3 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -40,6 +40,7 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
+CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 

