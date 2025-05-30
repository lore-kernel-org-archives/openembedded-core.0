Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4114EC5B552
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:25:35 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.4124.1748604330661913987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FLoweZll;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551fe46934eso2379246e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748604329; x=1749209129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UwULjfA4+Svk25iwrC+LSMPyUqWecEmIahklQsp95UU=;
        b=FLoweZllDdUjLxcE48VW9gXkSPPux08OOw1T3vYoiYOtEeeXtfNiYVnu89O6dSKadV
         hw9hKP4s9nYEK1POMlG9LBZ/tf4ztQlio/wlXlhncQ+Pk2zrmXTpUz8PvS8++aaXSgnN
         6AKN7InBntmorXgPLqEPMk4CRNVTRdItHoXvqzTzKGe5SEJgkGHU32UdMObdlrsFQHA3
         TNn7KX0PRD5XyMlhV+uPWpNwdjqKcHf1FBNVavaxcIBI2cbJWgUcFof0x4P6IW0/khQi
         2IKEBJDhlDLpED6fYMWJVWzrmNH1yZtv+Csp5YqLTCPmeKtCaDPIMlizBVyjsVYh8dQv
         ba5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748604329; x=1749209129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwULjfA4+Svk25iwrC+LSMPyUqWecEmIahklQsp95UU=;
        b=amRvCSEwF7PhqN57N7eCBUfBvD2/2kCzKM+noMm7ekTizMxZr6PTa0WtIHvAnpa+et
         JqDG/PyS/mbpH+w40Y0EICvJIIXMQww2n7SZUn+aO4ytB4de3TmJYG3cIMZyft8M2G4t
         0K5oG8MyuCbXFQj9Wip7X8UmDxTV2tzeHGpTBO82jxNtcOEKxOEy+Lx+8MYn5S+8jQYi
         3G5VnH++TATjc4Jd2omccldZUQ+YDGfh25ILCgEh9rXjq62cwpbYEnKAzbs0eHmgWLmo
         0bLo0ETbajF5TSPZVfln9Id8MZQ9rSiFygezoG0nVvTdWXNq1XU7zpkq07bpA17A9riC
         6JpQ==
X-Gm-Message-State: AOJu0YwbNmRnReQwyZz8Bb6ynjGsgJCeCWxxf/7sPsnFBBUPgcb4Neuk
	Qfy3MxJjPhBG/HQT9mVbKnaumyUnbGht2r7fGahvltQ2ShsfNsZbzqTTxACBadcxTYFRlVkVTvc
	rRrH2GFw=
X-Gm-Gg: ASbGncsu/Reuv3acmxx3CXxg91sqYh/8sqUKtJgKG9WDSnzl9JikPNxDL/PYTTGbU72
	+7W4QnA/lMzw0CxNP5Jwy6uNKkr5862f39ijNodRG3iHGynNIjKQP7DtPFqtPhpLy2FeDxSxFLS
	gmUY2uc4enngQdwysOPcIQizWMCefo+TR/m4Ctj3Qwqu/d90avlNKxw2PwB8GoKlWUV079zxB43
	C00SYeQwVuN0drneucM/Nf2F4LN7PwRl4u2M3FXBJdH2000O2ZfV/GAuXz8Kn3Xh/UScg+x/nj9
	E5fzKdWiRltECOm2xjyMkBFmbU/xsyF/wR69DaJJKKn3mpsSx7NRYBQ9FQqv7cI4V6ftchjfoLh
	cM04NCGeTCXHiD6vor8b+9tVerplf716hQeB59PQ=
X-Google-Smtp-Source: AGHT+IGBRTErJ2QW7tlI9DHT4XDvTAjWCo+rTPKDcT+I21vD4/s+2svNX51mAOKdLgeP3jJAroSlHA==
X-Received: by 2002:a05:6512:114b:b0:553:268e:5011 with SMTP id 2adb3069b0e04-55335b4688amr2539096e87.26.1748604328554;
        Fri, 30 May 2025 04:25:28 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d35dsm667377e87.46.2025.05.30.04.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:25:28 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 1/5] wic bootimg-efi.py: fail build if no binaries installed
Date: Fri, 30 May 2025 14:24:55 +0300
Message-ID: <20250530112459.776330-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217492

With systemd-boot, some builds included correct EFI
bootloader binaries and some not. Thus some builds
booted and some not. Check that some boot binary
was installed so that build fails if none were installed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 7 +++++++
 1 file changed, 7 insertions(+)

v6: no chnages

v5: separated from modular kernel changes, changed from shell "ls" command to
    python glob

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 96c710bf77ad..e0ee2f712774 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -367,6 +367,13 @@ class BootimgEFIPlugin(SourcePlugin):
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
                                source_params['loader'])
+
+            # must have installed at least one EFI bootloader
+            out = glob(os.path.join(hdddir, 'EFI', 'BOOT', 'boot*.efi'))
+            logger.debug("Installed systemd-boot files:\n%s" % out)
+            if not out:
+                raise WicError("No EFI loaders installed to ESP partition. Check that grub-efi, systemd-boot or similar is installed.")
+
         except KeyError:
             raise WicError("bootimg-efi requires a loader, none specified")
 
-- 
2.43.0


