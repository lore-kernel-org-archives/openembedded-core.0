Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8392EC982E1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1701.1789682901167350169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PEkiDJtO;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so565235e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682899; x=1790287699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K1BtABK3eX9UJhHU4jN+1m7P4zg3dQPs59KjuIJsJvs=;
        b=PEkiDJtOFTSAPlWaRkHKtI0y1Yru/qhhWwD0DfffoHfaOPSmfTUx0nmF/yUONY7oCP
         tJNaqSumOb/4Hw7xrNuNFpxlAnbCYCA5HcAsa6Z9lFEeI7XNaHWqhUtO4BEOjjPvp1s6
         1OFlKs4x0+95OqKNWscbFp4rj/cJ65V4oHjdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682899; x=1790287699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K1BtABK3eX9UJhHU4jN+1m7P4zg3dQPs59KjuIJsJvs=;
        b=d4UDhhn/6VD0RkPwJ/lEI6kx4oPIrxVxBguqfgCh7upE1WOLlB25J9+pRiizcLLAgu
         Kz3srzzWDn6JBcdBT2b0FABflnW6hYXK157wfZV/bmSsUE70uQOs9g6lKp5NCQpPXvuJ
         Zf3I8TdqPzSE4dSyCTu25Kt2R+h78FhqBz/59ketnhzEsOgYEF5UP4hcy71o27ZuKnsR
         /tICOYTR3LbKlpNOMe7lKGd7Og5h+6HBPx4BKsj+FnD0f000sjWon2fcLY4xqtfTTvOV
         EZTqo+1vSYWcyhTo4CK8m6z1OTDbYUVGPx1RH8Lhvbmv5oyRcPSX56j1B7H1W0WkdmaA
         84XA==
X-Gm-Message-State: AFuF++kKDA08mIHjDcF4bmVPAHmxQn5x9ijAmkRMx7l0DJHvt0T72KsU
	aqXQzAnRJFrn062022iRm5pYCiyhQu3x5maLoi+08W4CCb9HzqkCSw/kpr7m9MhLWc2k7JX8qo+
	KwmKgKfw=
X-Gm-Gg: AYBFou0xe8GjAj4reU46KOKlDL8QBMhE3yjMoBo1ppSOh46xUIqjdTea6OFB6nFXc2A
	H+vR3G7lNKMRGp34t6HwDOut8C8nl/U9RSiHIFXsVyXAtesPRQQQv2oNeg03CXb5ekuYFuxOEkh
	YhRRQm9/1aASJwd7DOLk7fKqloNmuzbkDDTeVB552b4RIcDweF3MjDAj7jzHG+WhCf3prgkIO0X
	xgx6VD52qB66hkGDjOo8sww4pzPYx5+V3RXLyqqpkMfmZMx773LbVXyH13LRghptBbaFg9o+Aal
	R5Kh/kqja2Fw9RbxNhUItgfN8btSc87C/sRgxBXH9tQ6XLaZ/cmF5D6HkrtIH03GxzTz+cp3SwE
	tZboJEHnGQ5bVlk7TN9Vd0a42G9R22ssh9VgZ9ualrtJeP1+rhGDn1WZM7GEEg9cBmv/n+m/J9S
	sT4KvH47MBz5/aFdJY38NtbecQkFu9w7nSDUgyY3N8bcWiLglATFAwEzS8aXLbQHaIQmpRoU0kd
	+20yIY3SUEbwunPSZiHdXUE9hZYY1N+8dpLO8y0UQlPCj1C6UilVT9xkrOwPPpbjC5pAhffHLdo
	BsNuaoAtCQ==
X-Received: by 2002:a05:600c:820e:b0:49e:67bf:7e97 with SMTP id 5b1f17b1804b1-49fc5714c2dmr2819975e9.10.1789682899461;
        Thu, 17 Sep 2026 15:08:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 56/79] curl: set CVE_STATUS for CVE-2026-8458
Date: Fri, 18 Sep 2026 00:06:41 +0200
Message-ID: <93c410c455b92a2b1fe3b77347e57d02f344056b.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246151

From: Devansh Patel <devanshp@cisco.com>

CVE-2026-8458 allows a Negotiate-authenticated connection to be
incorrectly reused for a request using a different SASL service name.

Wrynose uses curl 8.19.0, which is within the affected version range.
The vulnerable code path on Linux requires both Negotiate authentication
and GSSAPI support, represented by the negotiate-auth and krb5
PACKAGECONFIG options.

The upstream fix [1] stores the SASL service name in struct Curl_creds
and includes it in connection-reuse comparisons. However, struct
Curl_creds was introduced by the credential-management rework in [2],
after curl 8.19.0. Therefore, the security fix cannot be cleanly
backported without introducing a substantial credential-management
refactor.

Use a conditional CVE_STATUS as the least invasive solution. Report the
CVE as unpatched when both krb5 and negotiate-auth are enabled. Otherwise,
mark it not-applicable-config because the vulnerable GSSAPI-backed
Negotiate implementation is not built. The default Wrynose configuration
enables negotiate-auth but does not enable krb5.

References:
[1] https://github.com/curl/curl/commit/5e99b73cf441d9c369768b9cd48b5389b9a2503d
[2] https://github.com/curl/curl/commit/8f71d0fde515aa4c68002477356c35bd79927729
[3] https://curl.se/docs/CVE-2026-8458.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index cd56e2aaaf3..dfc28539380 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -50,6 +50,7 @@ CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support i
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
+CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 

