Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB7DCA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 10:45:55 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4703.1790678749822984463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 03:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IHkLmk+D;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so32668775e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790678748; x=1791283548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ik1OKMGNQoyOgov40D1Cl4BNFv7s9QAZCY7N4zLrcd4=;
        b=IHkLmk+DAoCogtrGYZDxLIdueSaYtVT/398O9HCS7bwQt8/b+yyT/Q0pOxVgb4m6BK
         qQQshZ9eSzAcCNkNYdAtlr7InI3Fqfj3FCowaF+QJA3M1e6sieR/6ssF1NadtdreaVXS
         Hu/xj6MK3lwbA9nl2kR9tRd6g10RtwEi9UBSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678748; x=1791283548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ik1OKMGNQoyOgov40D1Cl4BNFv7s9QAZCY7N4zLrcd4=;
        b=wl0/oqLmM1NGjT//y3qGzHgWF83/alojry9XIpqVV8gHIazNY8JkxTpa/RyVJpPWNJ
         9DwA9tUF3EtRt6WQ1hnrWgtxelYxrKWgtID+f8nMuWbfKCP8GhWggXR016PHqCV/C99S
         khYIdecCuEvAsttO1zA3/Ug3UiIBAe6j1/EPJRVOU3wpSYXJLxwZFL/7bG1aSli4Pbyc
         vJEnBbRlSBeB/JhicksSHDJ9DFd5lMjK+5rG3gAdNRdG8SfcVd6KKCNtCA3OuNqa1VVo
         okI+kt/Gywdf4NQ9brodvBWSxFX16isg9Q0OOdMhUO5AR1gSpECRwTP36XMNkz0ZgTRB
         VF/Q==
X-Gm-Message-State: AFuF++mdVGmd75/cfwsHp6BsT1foC4nOrNGRuM2hza3x8nnwMUrWYjHa
	OFl02HvvEmjZ+/oLNPzHhjMPsbKqCAUvY2OL119CuiTgZtzhWK5faXLfX7O7CM6VhVYjVsB3nee
	r2N8iL7o=
X-Gm-Gg: AYBFou0ITyAyZ8YKbImXyAPKW0GbcjqN18Zz8JBh4RzvTiC+b0IIb/z4Drkk17SIvCT
	B7NfamOqaQqRPPGBHn7ElyPMXBP1z+UiN/Vpe9SX8fAjlegYjJ9G/C/PjYH++syC40GUg7I3R2x
	9yv6aJOtCMwnlBmtZUto6c2RMlNhgea2f+CEtmV4iwpjkKRHD15FQS5MeHrXSoyzYcyKKdwwnrh
	6MfqqJ+VdxjP/NRT/TEy8/eazxhLjRkVFCK0hP8Q2VYFhHdI/LtnTKge508OEoAQop/ZdKL6SIU
	DS/6XxqIAmmzcHWRXgiO2oXUhUQByxriev3dGdeDUAeS4VgHyh1UW8XiSF7OrvmbvghZGABKeYN
	yMVKgEOCbMvZzB/kjIdmnKStDlMxD+64BXWl4OlY0wk4I+S6dEbHg+FIU7JycQ1CKPSGms451MN
	nNehz7xtpHsF5t3VlcZ0IYOKZuYo82KIZ/fxcW/ppsT92VJCuHvITvANU4AP/EtPanmpqDcUPgM
	9uzFb59eTfjucFe171H+iiE36Iy6axGE2FA
X-Received: by 2002:a05:600c:8b88:b0:4a0:317:1996 with SMTP id 5b1f17b1804b1-4a003171a85mr102616575e9.27.1790678747851;
        Tue, 29 Sep 2026 03:45:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c2fb:8115:9b9:553a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d46478asm41827125e9.2.2026.09.29.03.45.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:45:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] groff: Upgrade 1.24.1 -> 1.24.2
Date: Tue, 29 Sep 2026 11:45:45 +0100
Message-ID: <20260929104546.3773440-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 10:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246851

This release resolves the following issues in the GNU Savannah ticket
tracker.

bug #68689: [PATCH] [mm] `mmroff` vulnerable to command injection (CWE-78)
bug #68688: [PATCH] [grohtml] `pre-grohtml` vulnerable to command injection (CWE-78)
bug #68687: [PATCH] [pdfmom] vulnerable to command injection (CWE-78)
bug #68152: [gxditview] SEGVs when invoked with no arguments

This release corrects command injection security vulnerabilities
(CWE-78) in the mmroff, pdfmom, and pre-grohtml programs.  The last of
these is a preprocessor that is run when groff or troff is run with the
`-T html` or `-T xhtml` options.  The vulnerabilities are variously
14-26 years old.  Malicious input can escape groff's default "safer"
mode, running commands embedded in that input at the user's privilege
level.  The groff development team recommends this release to any users
who employ the named tools or GNU troff output formats with untrusted
inputs.

Man page rendering is not vulnerable unless rendering (X)HTML.

This release also resolves a command-line argument processing defect in
the gxditview program.  It is not known to have any security impact.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-extended/groff/{groff_1.24.1.bb => groff_1.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/groff/{groff_1.24.1.bb => groff_1.24.2.bb} (97%)

diff --git a/meta/recipes-extended/groff/groff_1.24.1.bb b/meta/recipes-extended/groff/groff_1.24.2.bb
similarity index 97%
rename from meta/recipes-extended/groff/groff_1.24.1.bb
rename to meta/recipes-extended/groff/groff_1.24.2.bb
index dd5ebee3df2..e13996500fc 100644
--- a/meta/recipes-extended/groff/groff_1.24.1.bb
+++ b/meta/recipes-extended/groff/groff_1.24.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 
 SRC_URI:append:class-native = "file://build-less.patch"
 
-SRC_URI[sha256sum] = "74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7df8ba4c7b41e7cfd8"
+SRC_URI[sha256sum] = "f9c1efd5bebbe37fc6e1063db7473ce8df1e3e0be4ff0f43ce04fce57e9c5dd9"
 
 DEPENDS = "bison-native groff-native"
 RDEPENDS:${PN} += "perl sed"

