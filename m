Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AF8C982DF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1599.1789682903489584902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o28mu0hK;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1337595e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682902; x=1790287702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NN465glGkKmk84bB/xeQLsl+0wp/QW2mQUDbWiXOyM0=;
        b=o28mu0hKe/5qO4W9AxraN5YXhcKDBTDdAtejk5PIr0ItFLgJm+xW4UirqoLmAD+g8c
         JqAk+wnxF+XxMeHrXAsUyv5Or44hRgasGqm8kJvCPwE5ZxjgSWBmnMuhvZ5j492Y4pTo
         SMseUE/TG9FdFjiM2RlWuxkmlIkUG7qlR5O8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682902; x=1790287702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NN465glGkKmk84bB/xeQLsl+0wp/QW2mQUDbWiXOyM0=;
        b=kRe6RYSypkax6QwD00X0ux86jjBkQ6Ckch+KOPFPgQbxRhHvpEwVnVA8NrAt3lE74/
         Dm1ElRgWJTXRpqQqGkZwbffLM4+0jD5ikySJT8UOGIeFQSVitBYhaOaFSM+Bb0eCwPwd
         A7elP4j3e4KbTLg6aTNQcR33ECqIkdQvlcieTsyeNxjrzHIyX4kZxQWikRvyanHx5E1i
         ifVoOdm5z/t21rXMs3X3jSKuXQMH42YH/Wer24eGb/iG8swBA8uZ2Aiove0UqiDKmcCm
         Q/PVC0VaUWR5ph/KPPYJZsOQN1XJp07PLqkJ3x9CnIokUQ1bKcXCZ68WiCxPwF/drpxB
         zZfA==
X-Gm-Message-State: AFuF++nCvJOgwYz05q9KRPtQZqo0H5wfCgPo1Ejbq3ApsNc+1ryb1s90
	XP3wPv5qWw8zefii8es9clkbhypDRjzNPpKiobAC2XCkJ/CXQCWn0dex8JTVq+Qxvp3F4LRNdrm
	JgGLEb0A=
X-Gm-Gg: AYBFou2wAydY6e7a5KOZifqbWlJgUeGsCW0sfmkV2kaTxg18zNrYMK/MgESasZnaeWj
	0UJD822Z4M5+QvwEkDeeWbVtyspaJSH7ajlre7xQe9pJ3ms49+3xxm8r3TBW0gbmhmsXWAfqkKd
	zjk2Y3Ck4CYM0YdDYIxT3D1fXJt6aF7FYUbPhwBICjHLwSw5doug1pBdaJEGECjQN9Gn8Fe2CDu
	1Zw9CarHrUuoykgOPvc5LtjXnY3C02bvdxX2WdGkhaFT2LWABwTeWfK5ql41ZQ2w6BKMs/+clX+
	IIQrDcUb57nN+3HkixbaF9NniiX9jKOsJU0UdaYXKg+fl/eNAw6AGzv2P2kAvMDzp7DNl0Y5wCL
	eEM9caEpOm9cfAgPjcaSK5hCLl/bcgr1qfAz/NCjeGVrZwnn58zQF+pyRehekyGKCOKuBpxEDoo
	jaKwL6SQ4c9v9eIJCikk5vKQIh3YjCbuMTLcphotvFbOohqJrjH0p/HK0pnAi6kbdXvf+3t5rDn
	uaz/ugIhb/tMRlJX3JbTfRvcUzVRIl0rV0zYGqII9EGgz5r3zul8exb6GmGptKLSK2+oM2zIpQ=
X-Received: by 2002:a05:600c:8b81:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49fc566ee41mr2933165e9.6.1789682901820;
        Thu, 17 Sep 2026 15:08:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 60/79] curl: set CVE_STATUS for CVE-2026-82209
Date: Fri, 18 Sep 2026 00:06:45 +0200
Message-ID: <70c3dee9e7a58c14635b4f69c4c0a3843abad901.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246155

From: Siddharth Doshi <sdoshi@mvista.com>

Analysis:
- The problem only exists when curl is built with libpsl support enabled.[1]
- The recipe is built with "--without-libpsl" option.
- Hence, ignoring the CVE for this recipe.

Reference:
[1] https://curl.se/docs/CVE-2026-82209.html

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 33aed045117..f6ddc4aa230 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -54,6 +54,7 @@ CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', '
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
+CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 

