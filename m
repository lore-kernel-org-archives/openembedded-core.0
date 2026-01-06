Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8360CEFD0C
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 20:47:02 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100300.1767732418577055720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 12:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HcCR/Koj;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8bd07cab115so13792385a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767732417; x=1768337217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N2IxZU1r9ba7gxaE86SmA/VDazfuHLvIdM9IRPMBZ0=;
        b=HcCR/Kojc7AKHBbYl0KiCJnt72mifSwVlaC1T0BBYf+SCgAeszfOKONzIPYh26sqXX
         //+d2x/tWfkuB+SfZOAZwBwBbgvzAa4Ms+xk3aaBwPdPU9zp7ZA0DdRGQ8Eo/tJ+FVnT
         WiS8/fwdfti/5rxWAnm9nMM2kcy+3L0/RRL7v2lyzlsmWWOWbYT4T+Doq7eoHHdL2EM9
         iuJevE3Fm4xW6yKakTDaAnC5493OVs8tI6ZsvnmWau8IHKi4Pk+1D5BmfFBp5n6iMreb
         vyot/tBSq8pCIkWR8QSTVL9Lm1+hHlGH6wBO1nxrMemT7FVZgH0mnyZgAvptInfJFdvd
         I1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767732417; x=1768337217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9N2IxZU1r9ba7gxaE86SmA/VDazfuHLvIdM9IRPMBZ0=;
        b=gV+V0wX2kstQP7oT/5D700hkOqZl+uiQvmeSuzDtOUdy1bj8NYu4+m42unIA4pPjhF
         Z6u/vbheuahuSeMGDtC10MBVEqsLRT0YepFbFVTuT1znldq3YQkD0v7hBwcBlDqKoChE
         2OeTrNF2K7J7jkqZnmnimE5sDNj3xyIgwhMhoz8hh/pB04oTIOQXGhXxterB6aNdrOK3
         n/5+Ck1IIETkJhmrJknZ7pIA2tQxGO09/nnYCM0TWyNrZJy1NgEf+4OvF+K2VoqUeYqY
         oeEOhJ2Jf+Z5LJYoTXu/4AudArVfWtRZ6F1EkxFRmcvjOzsikSpiAtbUB3Mfs6LbGtgH
         Vn+w==
X-Gm-Message-State: AOJu0Yxiircaf6bLPuEVfKb2rjRI2oUq9Xc9V3raZmMUTzpymcUonOpU
	VCUfPdy/R3uLl/OsGVB3v2TYyWII6a4yNRe6s43E7fiTYeVGg+n7uSvDaacQJtEy7pY=
X-Gm-Gg: AY/fxX64rbgG2jomlTfCrFGOykFJMp58ZDmZ8G66wYrnb3zUqAv6HNQFJDJcKcw/xej
	AsepR25Fv+9n45ZRWFlRp4InNDUzJjs72tWe14OBklBphuJ1Wkl+GD9O5Kl+6hlc35pWKAhx/lQ
	QPPv3wL+fj2I3Zoziulg5fSWSso2ZQSnAP+6AKvL5vqHrmcSFGqshF9itztfbsQFmg6skpnmAM+
	vJXvCxVR+Q83CudH/38h9Buhkv/GjS8OTgCKoTHcyv9euWEKjyfppCpWbw0kLDoLDdifTTiQLFf
	4KjYMoTXBsJZRjozGeOrA4POEpEPlJ/+RGpLAeBS0SsFBJ75vtUphB2ZFDUw+E8RFiCfqOyAtgd
	1L6ujilYHRS/hBeRt9PAjIYsMbiVnCrk8/0LdXjHE/pvdEyVf8eh/0//aUvf4nnfzATsz42LUnM
	OyziA5I3He24RL9eBPbxjFrghOGzBpViBkYLGhjkEh3SncU0gMh/r9wPw=
X-Google-Smtp-Source: AGHT+IHhzjBbLQYexJnayIMP6NC/KkjsR1JqaOELrNcyVjhyy83LT285c3tIU2vVIXTlSXag2nHAdw==
X-Received: by 2002:ad4:576e:0:b0:880:55fc:c984 with SMTP id 6a1803df08f44-8908429cff1mr2944926d6.5.1767732417569;
        Tue, 06 Jan 2026 12:46:57 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm20361976d6.8.2026.01.06.12.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:46:57 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v3 3/4] generate-cve-exclusions: Move python script
Date: Tue,  6 Jan 2026 15:46:45 -0500
Message-ID: <20260106204646.3417382-4-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106204646.3417382-1-valentin.boudevin@gmail.com>
References: <20260106204646.3417382-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228927

The script should be located with other scripts in scripts/contrib
instead of staying in meta/classes/.

Update the new .bbclass to match this modification

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 meta/classes/generate-cve-exclusions.bbclass                    | 2 +-
 .../linux => scripts/contrib}/generate-cve-exclusions.py        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (100%)

diff --git a/meta/classes/generate-cve-exclusions.bbclass b/meta/classes/generate-cve-exclusions.bbclass
index 254ea5531d..100d2e99b6 100644
--- a/meta/classes/generate-cve-exclusions.bbclass
+++ b/meta/classes/generate-cve-exclusions.bbclass
@@ -28,7 +28,7 @@ do_clone_cvelistV5[doc] = "Clone CVE information from the CVE Project: https://g
 addtask clone_cvelistV5 before do_generate_cve_exclusions
 
 do_generate_cve_exclusions() {
-    generate_cve_exclusions_script=$(find ${COREBASE} -name "generate-cve-exclusions.py")
+    generate_cve_exclusions_script=${COREBASE}/scripts/contrib/generate-cve-exclusions.py
     if [ -z "${generate_cve_exclusions_script}" ]; then
         bbfatal "generate-cve-exclusions.py not found in ${COREBASE}."
     fi
diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/scripts/contrib/generate-cve-exclusions.py
similarity index 100%
rename from meta/recipes-kernel/linux/generate-cve-exclusions.py
rename to scripts/contrib/generate-cve-exclusions.py

