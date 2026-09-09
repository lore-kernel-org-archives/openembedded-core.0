Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777FDC79FB5
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:29:59 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6310.1788938997869206717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I0T7rgbU;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482ea739de2so3777704f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938996; x=1789543796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D5nVIsp0yZDdbNKYrsbtkKMh0YPln7Jf4OMKnxCwP9A=;
        b=I0T7rgbUbDq5ZUq6t/rGXg9Ij7Su8oHCFIiZ47XBQthxG8v7IPHyJxQR5owiuL5zyb
         HU/g54KP38xxCMazZgF8f4pBUJME6HpBV+VuwAQ/aCkmt4OmOPtXhEUPAGznrtAKSH0V
         rHkcvlGggnhgIPrcyx04n+PJTtkfb5OjunB18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938996; x=1789543796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D5nVIsp0yZDdbNKYrsbtkKMh0YPln7Jf4OMKnxCwP9A=;
        b=JiPnjXUF/gtJz9/1zIA/xAqoJtCDU30Br8MhLS4dUpyfp0XAtB/ljiDfmXLE1xKJrT
         xXeiLYeK091kfR/jTIt8Dss7+4vxTToZ1RdXZ2rExB76s3NlSKFLwL7k6lDKDxAH2G8+
         PQ1tV/JO6FSE7Y1FAV1bAytjPXEoBkb3NmNr0MJqXZNWs7nrgxs5oERBD8YTprzgQNam
         P4CQNCkKvCHUP4YkA45+76FWl2OQe2j+r6Juo4PV8kE1IeooFoSswzysQJ6EHXuES2gg
         EjMoL9BHjJlb/YqH5sWwnzWMsmiX2KIl3TYuD8ZFPHwEkzyEnE4bvHRgXdMge55ZeGJd
         RDJw==
X-Gm-Message-State: AFuF++kGgH4BiUVq7zt8odGXQh9kwKHyurBO2w011Su3Dl2Qork8DL8g
	L/VJzlW6KitjHjo83WIibHmFmTAkdPrrHjs+C9Vogv1idfjrDMF9LndB/AFV+dtCAiX5qpb4B8X
	HkuOeLDY=
X-Gm-Gg: AYBFou1TBgM4Uhuxff6IhOr1bv1BjaoHMVZkVi/JQb88OnS4q+oHu0IpN9sq3eR5REQ
	FTLoTt9SNS5NjGwFOqtPRGJdP+uk8BcfQNnCkjI+7HNcO03gZ/YNLuwj+AkJqtR9CQVb4k5Nvgk
	osqhrpy3930U+ScxuH1QvHz7idz+kibts1lriqkD4UVWuOxexA3fiT/golpeolvg3cR7zne9CE7
	yrD7c3sHXzKmphHHokm/AaFxSfpd4Kn97ntJeeUJPrahTcVrNk4cejssSdwKlJNMuOhLTpc+18f
	yyHBI4I/gAD6vuT3yPTHu/eirfyNHFnzYmTncFpmnuU8skN8pynMEd2T62OWXc4tTxomYIGxpHL
	ecpi5kn0gXRhvsf7Pxu1G0qn0fZ4bUNrs+9sgC3xir13L3ushIZQea9gSAV50+CZeTBY0gDWEUU
	BeWmISNM3Hb8h9+4M2UIhkEStenjvtYYmbrraHhLQXXtOV57ad5RLuaUg/+1OtjuBCLfqI3Hwje
	1k+aL8TBLocx0AIgmt1S4w9mdjuw2Iy1B8Mr5GTWpd+rnc8hSiTyQdpKw1JD1jpbeDXxeK0OTAs
	ZL20fgpLMQ==
X-Received: by 2002:a05:6000:2c11:b0:485:8c16:a349 with SMTP id ffacd0b85a97d-4858c16a7e9mr33190548f8f.33.1788938996019;
        Wed, 09 Sep 2026 00:29:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/38] openssl: upgrade 3.5.7 -> 3.5.8
Date: Wed,  9 Sep 2026 09:29:05 +0200
Message-ID: <097d3e6f4c5835e8baaf6daf125b3ea212d5acce.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245415

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 3.5.8 is a security patch release. The most severe CVE fixed in this release is Moderate.
This release incorporates the following bug fixes and mitigations:
* Fixed QUIC server being able to trigger double free when processing INITIAL packet. (CVE-2026-18798)
* Fixed heap buffer overflow in CMS key unwrapping. (CVE-2026-63072)
* Fixed invalid pointer dereference in CMP server via crafted protectionAlg. (CVE-2026-63076)
* Fixed unbounded memory growth in QUIC server incoming channel queue. (CVE-2026-14456)
* Fixed RPK server signature algorithm selection being able to dereference a missing certificate. (CVE-2026-14457)
* Fixed excessive memory use buffering DTLS records for a future epoch. (CVE-2026-54874)
* Fixed untrusted Sender DN being used as a format string in CMP response validation. (CVE-2026-63073)
* Fixed CMP indefinite cache growth of extraCerts. (CVE-2026-63074)
* Fixed QUIC ACK-only packet retention being able to cause memory exhaustion. (CVE-2026-63075)
* Fixed possibility of AEAD forgeries with empty ciphertext when using EVP_Cipher(). (CVE-2026-75803)
* Fixed checking of authentication tags for empty ciphertexts for AEAD ciphers in CCM cipher mode.

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-357-and-openssl-358-25-aug-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db81c1a42a0f552d9a8ec124f004ae2063d58c33)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.7.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.8.bb
index 212879dfa35..cc148f07c7d 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.8.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8"
+SRC_URI[sha256sum] = "a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

