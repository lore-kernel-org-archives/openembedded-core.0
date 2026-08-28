Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70E9C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 10:54:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3754.1787914450571946685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 03:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UvVSsTAX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so5866945e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 03:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787914449; x=1788519249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRAAilaBpRrDBkgB5sWes7MzXLT0+t1+2bZux2DT5zM=;
        b=UvVSsTAXEt+FmMHof1AP0UbEWZ2FnQb9KPnsr0WvNHjw0iBH84T4IrZ3iH+oFsgi5t
         IT6cppFK31AqaWbbrP2KZLsDX/UR6bSXYft1e+C5nupc88fZVvUq+bjJQKphyVytATih
         vtdEY8DTSPiXQ8GnQV4ABxZX1Or3gaE4GU+DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914449; x=1788519249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dRAAilaBpRrDBkgB5sWes7MzXLT0+t1+2bZux2DT5zM=;
        b=XUZDQhDYejsY0vnYPW/J6GoTVKJuII8X+zDfGNiuOfUTRmUJiFAdSQFnzL82m2kP9r
         Ul+Y4I3ldURTkOUPbkZy30YaTDwr2chKcxbUW4JN3E7v/Xr46U5O/rn7aNEl59bsWza8
         zW6jIkq3io9JH8D4584aAsmvpsyTmRMQIaLz4zbbPpYRbDRxhizg2XsJ22+k+sHdBdLL
         TDyggqxHR5DdAI3ejouZWDoQkRHrfNmAsILkPOo0iZrKMyewvTn9haDSqhEI7P8WLcfY
         8jKE/rUNboftaWY9ItrnBnsPpmkeP6FOPzbnDdF+d0v0BciB5Jctat+wUDl0qLc0Nw7M
         2nsA==
X-Gm-Message-State: AFuF++npAtbnPULhYZDAqJqFzlLOE0/Et6DN0myUhKUxs6CNLmtgoXiC
	bnAh4zjmbtal18p6ZvxTHAQV0WGRjgQ5C2cPYGeBjljlrGeiNfN+wSUvNTZ00B/05Mixt22CN6c
	Fz5/v0zU=
X-Gm-Gg: AR+sD11LqqmIioOo+2FuOCE2KqR4/wq/g0bNsG3QA/FNEloYMWsxWq9G4runXf7fGWM
	QKYTb9IUboPXZU4cxYo+eybsD0Mso7Pfuem00c71wyrb35yQpc8TXc4qLQ3UEkPAW0T9i/QaGyz
	6eS6P/8bm+X4PzYLXZ4+ggwKBgFNlyyQ2HAiKTAqKo6dzTDeai/p2yS8hvC7m9OlSseMIdQ+wI9
	AVZ7J1JsHRH3u+XAm5TY/iwqWkuG1U1PAy9IC4/6kFKuo6aCI5NA3Ag6jcBWe2jFBkI8yLgNvJD
	b+EPBTIEibKhlCKBDKPQyF1OVeJqx0qZ+SWbH30vgcceVpc83trX2xDxVuF4ppFJbc0Bneb6c3Y
	sINBHN1+1ezbgBT4nkZMtyjWD+KG3lRkkIHxl8fHgT3++x5mQcgwHX6XOZQLSWYPCokv/pNJdht
	7pQyqLvegTPqPiaE65Et7itV/GXuI6yWC6dgn38slyq1h/Zhed2vMeR3hyyczXT/Le5p5ngU8JU
	RrT3fgQYb/KKZSDHZLEMShRH/sC
X-Received: by 2002:a05:600c:8587:b0:499:dbae:43d3 with SMTP id 5b1f17b1804b1-49b91c489bbmr80636275e9.9.1787914448404;
        Fri, 28 Aug 2026 03:54:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4f9esm2746145f8f.11.2026.08.28.03.54.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:54:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "files/ext-sdk-prepare: Ensure all dependencies extract correctly"
Date: Fri, 28 Aug 2026 11:54:06 +0100
Message-ID: <20260828105406.960288-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 10:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244531

This reverts commit f8336d39ddec1600b231a8117441e3927e661087.

This breaks SDK_EXT_TYPE = "minimal" with SDK_INCLUDE_TOOLCHAIN = "1" since
the toolchain extraction doesn't work well with --runall do_build. We don't
want toolchain build components.

Revert and we'll have to find a better way to fix the other issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/ext-sdk-prepare.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index ed03b77ae62..89b04030899 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -69,7 +69,7 @@ def main():
     with open(logfile, 'a') as logf:
         logf.write('Preparing SDK for %s...\n' % ', '.join(sdk_targets))
 
-        ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet --runall do_build %s' % ' '.join(sdk_targets))
+        ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet %s' % ' '.join(sdk_targets))
         if not ret:
             ret = run_command_interruptible('bitbake --quiet build-sysroots -c build_native_sysroot && bitbake --quiet build-sysroots -c build_target_sysroot')
         lastlog = get_last_consolelog()

