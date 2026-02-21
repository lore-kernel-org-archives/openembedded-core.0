Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC264C61DD9
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:42:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16678.1771663360331432376
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cTnW5RRW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48378136adcso16917565e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 00:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771663358; x=1772268158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntg1dCd+fNhVFVl3pynp+2xINIxswzKdjsFpSPP+tQs=;
        b=cTnW5RRWxwmCwCsZVkN1E3fo8RAo7u0mHxh0PUvyheZgjh7r65Yn8ZFOF62JPL12sK
         MkE+JxT+Vplc18zQrcJBCZqXsbsOyzZV/65O6xXpKpYtxY3/BgXXX/AOosUT9DnWCbp2
         dlrHFQeemeTqMGPOZsJ3FXPHfxmz9n0K1LmDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663358; x=1772268158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ntg1dCd+fNhVFVl3pynp+2xINIxswzKdjsFpSPP+tQs=;
        b=iim4VcrAInEXgqg7i6LvKjyZhHjm5DNq+bAuFnp7Tl2jrJyenHcKiOW/jaf3dfMqx1
         YdynvofsC81OD5D/tP7htcz3yOC+bpQgOKECXLXjTOxMnbGDwZE6kQEfROg+NlDEFEkm
         0/noZ7iK/FjqcTs2BW0uW1DfJdTGZmPkrYiUhdM/MCqDAZR58LKn6Tdx+Ad+9cb/+ihG
         Gm8FmneBkR5yGuTuQrpBUWzyeePVmTdqIqEZYy4/eiEUzJY0relwtxSNbbAlcN0kpGkf
         +LCR9A5+Se+HWK0f0JkyeTD3YJLZk0zX56phIYpRiTRLMy+w7Zlr6LTvmDnnrZGTeztI
         y19A==
X-Gm-Message-State: AOJu0Yyua3DgagQpIryg4vNrml/eebRsM+wamyz5ygH5EH9OP4LXMnb7
	gdlB+UDEL5vb6q6Qg4VG4ksVfGZTCRulencEDGnbL7Fp+D1ZxMjO6FAnii+0uw9GFALDn0iA7BG
	qAtWRBE0=
X-Gm-Gg: AZuq6aIJYP6mzN33J51aSM9LWTfRwQ8ufUsRFVcyI9eRIGDjzm0zbIbFJj5kr8TRyY+
	xCUWKds3KUbgDxvZm/3eRw4xbAL1VoJ03ZMzMZrifrcer+mDNv8+BvFfetNgJVd8t7jJdtuzJxH
	cZB+sfrwYgxqVeyUUTITfIGNj91xANRLXLEu0K0jIiGQwFsuww3t10crYX2f60bBhVIxd6xlWnO
	YW3m4JXvpaW+cvyD7nMAjBkHucP34pcvyg06SqfRcsDXWUXBnDQLuca5tjoWQKng0Wm3OZiS0Sk
	7IOo18RrrR1hG6Uf9eikstoh5YHe48smAIq826SOjgEdfNXAHyO3fjvxeTBnUc5HVu/szr8NM5Y
	VHQQezkBxU1aYKU8gUNV2qw6KIs4Wy/1sdXeKkSPH1yHg2DbSYE/HqUZyYMqSF0yo4ZUsFZBSW+
	2Hm7SIjwaNRrl+pSFUtm0xjvlH2yE6RZh5RtJSwoGc9LD8DMBCWhE=
X-Received: by 2002:a05:600c:3b20:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-483a95eabadmr38328345e9.5.1771663358089;
        Sat, 21 Feb 2026 00:42:38 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:9a04:85e4:d902])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm205898295e9.1.2026.02.21.00.42.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:42:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] distro/defaultsetup: Enable space optimization tweaks
Date: Sat, 21 Feb 2026 08:42:30 +0000
Message-ID: <20260221084230.3219379-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
References: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231613

This enables a collection of tweaks which reudce build output size where
the output has been found to be particularly problematic.

This reduces sstate object size as well as on disk build footprint, it
also helps memory usage for linking some of the recipes. This in turn
improves built speed and the smaller sstate objects are faster to compress,
decompress and transfer over the network.

This change has been tested in poky for a long time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 871fe7b4e88..c6be00e80cf 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -7,6 +7,7 @@ require conf/distro/include/tclibc-${TCLIBC}.inc
 
 require conf/distro/include/no-static-libs.inc
 require conf/distro/include/security_flags.inc
+require conf/distro/include/yocto-space-optimize.inc
 
 require conf/distro/include/uninative-flags.inc
 require conf/distro/include/yocto-uninative.inc

