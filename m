Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web08.20622.1607632107724083345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 12:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OGpNY7Hv;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: kergoth@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id o4so5322832pgj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 12:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hk5EoboWuyAeQEVa2pwhUI/OTup9W6ONCW2yyjcV0kQ=;
        b=OGpNY7HvAfor1Bh4NI5w7VsLpqbVPU1+DozLSSS2bLiTO2bIO65d93NBHfZrAx1vfq
         VcfzPBZaJ7+lRmieAVDWrfUTpujyPH43sRihIzRQEYv1KLzaDPWZofN4bgfJOYWWtIVc
         MvZP12DDTUKQuuK6Pv6ElO/fsNAFVQSByzvL1j5q5MI+zaRpYMp8KVn1uJmQ0M2i/Zq8
         XCTJROUwYWzuAPyfqkqcegvAzrhDvdhxX1GVvnouxYzl4usmIySIG7zrKMhS8O/+PhfG
         JLdVp1TmQ6BkO3nP3fRqjwHjhaN54PYKdEn+Du8cLA9nrhOi90vUu/ciThEl82/e0DQz
         he/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hk5EoboWuyAeQEVa2pwhUI/OTup9W6ONCW2yyjcV0kQ=;
        b=qHtNMiLDCNkR/H6+X4i7T/IynCtE5EgkrIM3hau/rGMr7dYwtx9laZmo/9wUHDzVuZ
         gYCT8/1Ghm3WHU8PWuLJMsBeE4M8fS0P363DuG1hgRRnX/DO8ms4nd/I9RFQJi8I85uk
         7Dt2q8QFkOza+84hqGvfBJ2TQesx6V7rbHuEJvXlVw7qx6R3Xh998u1jSsNGOulVV8LP
         hIGe4d54Vy4Sy1a//QGZ42uc5KhH3iu/cZjxAmBp10MJvEoNxAgJy3rwCPfl6qIZnYHM
         GJJmGk7VmzX8iiIM2tELBTg2wYpcRztwneD4yLEGXmM373nOt6DfL431NAL0hmx+CYR/
         IycQ==
X-Gm-Message-State: AOAM531GkIiIiZC6An8Rgsb24iRjVLu30UXxmwQRZwoP4F6cF6HT0sVD
	Xiumgfcj3kJeu17uN/6RASmH7cCvg0OniA==
X-Google-Smtp-Source: ABdhPJytYl31uuYC9yjfg1h7C6WoC+qZq+QDdfbRgt+ySqTSO3Dy29+2VbOlPHLFiRLEkCzQ6xy4Bw==
X-Received: by 2002:aa7:8d86:0:b029:19e:cb57:2849 with SMTP id i6-20020aa78d860000b029019ecb572849mr2883279pfr.54.1607632106664;
        Thu, 10 Dec 2020 12:28:26 -0800 (PST)
Return-Path: <kergoth@gmail.com>
Received: from localhost.localdomain (ip72-201-170-237.ph.ph.cox.net. [72.201.170.237])
        by smtp.googlemail.com with ESMTPSA id jx4sm7030625pjb.24.2020.12.10.12.28.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 12:28:25 -0800 (PST)
From: "Christopher Larson" <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/2] Exclude OVERRIDES from vardeps for a couple funcs
Date: Thu, 10 Dec 2020 13:28:01 -0700
Message-Id: <cover.1607630988.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions are primarily *appending* configuration entries to the
overrides, they only get it to ensure it's set at all, so doesn't belong
in the vardeps. Having a dependency on OVERRIDES means you cannot use a
bbclass like distrooverrides without changing the signatures of recipes
using this class.

Christopher Larson (2):
  grub-efi-cfg: exclude OVERRIDES from build_efi_cfg vardeps
  uboot-extlinux-config: exclude OVERRIDES from
    do_create_extlinux_config vardeps

 meta/classes/grub-efi-cfg.bbclass          | 1 +
 meta/classes/uboot-extlinux-config.bbclass | 1 +
 2 files changed, 2 insertions(+)

-- 
2.29.2

