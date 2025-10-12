Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3529CCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 14:26:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.19718.1760279167006009258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 07:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hx6XY91C;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso2523326f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760279165; x=1760883965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kF8dd1ZWoUDFH13PIc2a3GVlUd+5p7TkWcMjwcm9yb4=;
        b=hx6XY91CS4wb1fpp2ttfzJWM2VllsbKpHojkclTX65XORJxyp9ZLxviFT2uKU7TlJI
         9EH2olWz5qikKAOiGFCVdJPQ5Rq5moJAbaCVw6CvogZcNcTb8VHBVUAXhaA8P61R8hPg
         9YScNgafX8BuCUcmLjY48G9aaC7g92UKLZQNKgn54HpodGuRMV4LS6DtIb7esmlwxXEf
         zsCblYt3Ta+5xsg4aaHvuTktiSfindeMi5dl+mqurokqCdeA+ysieUykUXS+bdRMugZB
         pxPF0TnbGbVk8+XqzFg+hYaz3RGam94LHrecmcLr74orhsombTWV5K2bOtZvrtxONMS4
         qrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760279165; x=1760883965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kF8dd1ZWoUDFH13PIc2a3GVlUd+5p7TkWcMjwcm9yb4=;
        b=ZzGvilAnlYibkKScHq2JM8a2QAslveJoiOZp9r1uCTCxHGnspXIoANTXDu/LjVNVmV
         SBzQVQ3N/0LFUjhHw7wXWF8UF6OLXSUyNkp56UyRyYpesm6EFUWq08aVOMljouxxnGu2
         Qzpp7DS4e2MzfQydHBC17D6iT3QjrkrE1byJKLAEVQuZSPn0BZ5v2GfrPikri0ebYT//
         aeLCeKHUJANbNYoNdgRFDpSmTF1hSH2vYkSsD/cbTiBpsyyi/6wFqSTgmtuojJvPlbWZ
         bC1DKfV7CPQEfEPRyADnbPCrM4DkajIKKxJCVC7h2h56RcbhVjzoL7Hk6JiP5Wq2lPd6
         IDsA==
X-Gm-Message-State: AOJu0Yxp5Q7KEYdubMnRRMuIcu4RQZtnVb0Dhq668m/Bl6TluCpI/lvU
	gN4nBzw/3tHrOZGdazVq6fGylIZkBCP8kKks9BJQ93YvIcWMF/ucr4twA1Z34A==
X-Gm-Gg: ASbGncvHXVdaxA4mz2T9y6lxFUVJU6Gpg1Yz9hNU6RguDnlxZgaVE7KIaN3z5ftfoSN
	RnfLMj+40DxJRZtTZ1fCZ5IyXb6TTKwXarOcdYAKc7K1SXwDWc8ZCpBak77UucKel2aGUUf2Vt0
	NRs2yjCUw52Fx3G3kv4Dp7TBXB+fDoPwxd625rzOTl38Yar5TQS+VZXcLseghlXWuL/RXmxpGSG
	L+lYFvS5YoZ6fhvbuqUfr2HngjoPNb2R3Wq9GQ3xfkGVzD+phzHlQxP6VuVqQS90OSu9SdZ46i9
	DYaz+AdYKgxI7JiJaMfgfkSDy/2xK+mVKWDv/ocbCzGZfdZMKuQo07LnVpR59V6M1i2wfl8CM+C
	zG3i756gNslKhpivVc5Wc815TLqWl/ZhLzM81ktI=
X-Google-Smtp-Source: AGHT+IHkX7xvmwbrD52bewlnMcq40PdOuY3p/AZC6JZ7/r4XDde7c++9FD0260QyOTbMvB6/KKgZCg==
X-Received: by 2002:a05:6000:2408:b0:425:7291:cea4 with SMTP id ffacd0b85a97d-4266e8dde98mr11508705f8f.46.1760279165109;
        Sun, 12 Oct 2025 07:26:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583335sm13233975f8f.18.2025.10.12.07.26.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 07:26:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vte: upgrade 0.80.3 -> 0.82.1
Date: Sun, 12 Oct 2025 16:26:04 +0200
Message-ID: <20251012142604.1217215-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 14:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224735

Commitlog:
https://gitlab.gnome.org/GNOME/vte/-/compare/0.80.3...0.82.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-support/vte/{vte_0.80.3.bb => vte_0.82.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.80.3.bb => vte_0.82.1.bb} (96%)

diff --git a/meta/recipes-support/vte/vte_0.80.3.bb b/meta/recipes-support/vte/vte_0.82.1.bb
similarity index 96%
rename from meta/recipes-support/vte/vte_0.80.3.bb
rename to meta/recipes-support/vte/vte_0.82.1.bb
index 93aa864013..023d940394 100644
--- a/meta/recipes-support/vte/vte_0.80.3.bb
+++ b/meta/recipes-support/vte/vte_0.82.1.bb
@@ -19,7 +19,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
 
-SRC_URI[archive.sha256sum] = "2e596fd3fbeabb71531662224e71f6a2c37f684426136d62854627276ef4f699"
+SRC_URI[archive.sha256sum] = "79376d70402d271e2d38424418e1aea72357934d272e321e3906b71706a78e3a"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

