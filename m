Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF9BC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 11:10:10 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.43925.1744024200684493203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 04:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kaUTAoJi;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfed67e08so42230081fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 04:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744024199; x=1744628999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wbqnlumWq8VWnol22agokQgXdJbyTcLK8hyAV++BgQA=;
        b=kaUTAoJi+IOzWCJ5MrYkZq9/RPDH2lAJTbML1z3q3AkU5VXBtd5J3pT2y5JmxgwuZW
         ZRxDZeg5nBImKradVtrZPXckGQJuBRsEIm5z55M2fO36i4KOffU+Vl5IgvzVJ7jE6+Xg
         LXszRL4R52g9iXkTpyNlmHCy+AmEhSiHZyz4p+qPQXn4Lq6ouVVdr1smzycL42sNLzIy
         jFDELRtfxkxc24jddWRv1/RyVhzpa2WuDvg5fCXLTRWzWd+IxAL0Mxgxq3TDA79movWk
         aL3/dwWYXyAr+vcERIZJgk/X7BBgm5GQSm1IHvB93sJnZdpshGdF5mPVHnJdnACLSlO5
         O4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024199; x=1744628999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbqnlumWq8VWnol22agokQgXdJbyTcLK8hyAV++BgQA=;
        b=GXsy5r1f0vDDWT5jHhhIFZhvOAqjzR9Q7yhUHgamzZsKhtY+2k+To1tKYz5pWD5XkV
         dO3GJ9fx3AmnaDq42ulRjrnrPqdfEEAkpxD2H+v1EzHEOI7GMv8EI7dyvscSsOb9G8x3
         DEnFsWalDeoUnKh60p3oDWI58i2W4wIKWm1iPwn5+V0TH04iakjE83RIlsPz/GDWwWLB
         qcEbLmxKHBx+do8bIFwO6S+rPOlpymepS1uVckudZb387OKO1Wil8f3QNhlVbVMfRNvq
         fGb2nK/zFinSvkjcGQuJwfdIcVyoMuiljTg/v4qVxtyMxcT1QuvOZwPe+9QOh7reVmj0
         TfFg==
X-Gm-Message-State: AOJu0YwQvnnZMjjJuxER05xdZZMzbEZF71+Ub0sa0iSYmg9l8DHBFsll
	/B4S+v09vDAPZKg7IzkyY+wWwwAyoUPzFmoBpuJeY7Jgd2j01DEo3kE7zowcuyd6IK5SB+TQGV7
	fD6k=
X-Gm-Gg: ASbGnct0GqUl8ppbMrSYjoUxKZuh98P/005EE2oPK+6QkvhQ7Cc3cS2ASjR4eLMKFdZ
	npQhBYEMxiMe7+YNOhBb0jfxXLQ9epBDpcS5xi+zETUzzxdgS74ByY0/msQvPmNpU8a2OT7GKjL
	AFUc5ATgFiwyTBLthN5qoWL5ORL0pbo1n1DEvfFcMpXLVi1eEpT062q5nsXdtdv5fPMnqXkSktc
	2ztj1Kk37QgIVr/WyplhyleJUCywQPwydv+cqNr6sKN/UrUtOBZGQSeWvX79gRsaeSiZaiGgqGo
	863p0qX+Pqc0ft4nd62i9lQ8L9dQBirdbc5PAEPmzvIylqsGzY89EtHioEGMF9iSnGwU9EzK+b5
	u/esu542y8fNXajvQVtTG8w==
X-Google-Smtp-Source: AGHT+IFHPi4smRdcfjbIzs9N0VVJQQOiIUX8ataw6crtMlkqG+dvLwDmBEgQsIfOGUm867YsUJeOGg==
X-Received: by 2002:a05:651c:30c4:b0:30b:c96a:74c with SMTP id 38308e7fff4ca-30f0a0ec4f7mr39858511fa.1.1744024198895;
        Mon, 07 Apr 2025 04:09:58 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce83fsm15352581fa.108.2025.04.07.04.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:09:58 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa wic.py: clean image build dir before rebuild in test_permissions()
Date: Mon,  7 Apr 2025 14:09:45 +0300
Message-ID: <20250407110946.47038-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 11:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214449

The test builds images using wic and then with bitbake
and compares results. This fails at least on aarch64
build machine and multiple target machines due to
pseudo errors. Fix by cleaning the build recipe
build directory before rebuild.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 4f5d43b5ee..55c655cd6d 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -674,6 +674,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
 
                 config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
                 self.append_config(config)
+                bitbake('-c clean core-image-minimal')
                 bitbake('core-image-minimal')
                 tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
 
-- 
2.43.0


