Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8449AD2503C
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 07:15:01 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28262.1768202093914578450
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 23:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cGjniqX0;
 spf=pass (domain: mvista.com, ip: 74.125.82.54, mailfrom: vanusuri@mvista.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12056277571so6979397c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jan 2026 23:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1768202093; x=1768806893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hiJAOeNoG2MiQ21e99PhkP1xvNXMRLYqz4qFXCPOgTw=;
        b=cGjniqX09y1oqbxrVUmcAOnUt7Mxe9H75jZ/RE2LgjA2KOAzBQlPbvAKT6oHbdn3GA
         rdZ1F9Eg7t7GKhIRlwaTX1efSh1kG7Zh6oyzuEOdf0ABgkOdHFiC3WKh6Gsu9jkrYLaD
         kzGsqaaXvNXuJ4h7ug1x0LE99GRk970BMzVPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202093; x=1768806893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiJAOeNoG2MiQ21e99PhkP1xvNXMRLYqz4qFXCPOgTw=;
        b=lYdMWL/FfScKajv2Qe8eK//qOeVEIqybp1aLEvzDCbGhNkxFmV+oznRQ8B2pO1acf3
         gqLjsuSS1Fjmm9GxuxXR61LelEqCuPJ7KaDJZhrKzBMijLwjYh/LanxIItPfWcx24FRe
         4XM17gVc/u7/tr/NPm+4R4LXUBbg7j55SaD0/h/Plac3pp3a/9hEuUv5M4EoVh8Jo7Qq
         rWSMwOy+SGTusmBe/dv9z84mu68jlmY7vkvsAOg0C5GFT2Fb7+j9eeRyfH57U0w7x/sp
         oWS1lZecGpnSFVAD5GksSJg4Ct6sHGWixR1WNFWUIMfJ1eek0fAMjNYHb78LBQ9BS94i
         uy7A==
X-Gm-Message-State: AOJu0YwoKOmPW57sJbh4zK6U9HYz77r/y7U536lDcxfslto8TNrpZvG4
	Sme7t39W73cysfwssNVv93m2LcUjT09FCv6DD/tE/u86+A+IWhdoOFQiecOgpED31cLkMc+jvgh
	WXQXYzbM=
X-Gm-Gg: AY/fxX5UzcB9mMGBkAyDrAoYT16Jsuby+D5mdI1/WYnzJ9gvrR5fhyIkcF9UCQppYMZ
	6Q684PpDJ6fXtd+yebCYH/c7TtGg1quUE9ekWd8DU1FmyGt0aqy4GZg1hBin24jrPjMWE3TTBRj
	wUf0mnPyeHzHig1txRg2oC7a3CXz+ih0kFm/sJD/KfFZtW/+q2rXvblwF1aRvS0rKXUEPdoI+SH
	quXMY1luu0Ic4YPYCwhVrad3DMk8tb98SQonZ4e+94q7l2BioImM8o7Yxu11OWZJo6fQc6+qJ4x
	35DJAsVHk0/hRkpaq1KDF00jmd6lmCop///aIrxausWKx3xeHuFNCWn94afqKtZ+BtN+OudupWl
	OQrbQjFcyCOCmgUZDtWeaBYd++0fKnVVrJVUj/UCHa7aWZ+N6lE7yrYhUrwS8pn5ee3qppY2ku1
	3t9ixCbg4gz+G0L+UBXEeO+pwUN1lbwvWM
X-Google-Smtp-Source: AGHT+IEshP/tsD27jROO6Jj4hpvOospQxmqzTeinQi74sLX+SfJy5V4nCF83e2FKtgflNSyGVVeXpQ==
X-Received: by 2002:a05:7022:786:b0:119:e56b:989b with SMTP id a92af1059eb24-121f8af8169mr16136783c88.2.1768202092612;
        Sun, 11 Jan 2026 23:14:52 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:f9ef:40a6:7a1:14ea:6f03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a6386sm15607181eec.14.2026.01.11.23.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:14:51 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -> 2.4.9
Date: Mon, 12 Jan 2026 12:44:40 +0530
Message-ID: <20260112071440.2411292-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 07:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229184

This release includes fix for CVE-2025-68973

Changelog:
==========
* gpg: Fix possible memory corruption in the armor parser.  [T7906]

* gpg: Avoid potential downgrade to SHA1 in 3rd party key
  signatures.  [rGddb012be7f]

* gpg: Error out on unverified output for non-detached signatures.
  [rG9d302f978b]

* gpg: Do not allow compressed key packets on import.  [T7014]

* scd: Fix a harmless read buffer over-read in a function used by
  PKCS#15 cards.  [T7662]

* dirmngr: Do not require a keyserver for "gpg --fetch-key".
  [T7693]

* agent: Fix ssh-agent's request_identities for skipped Brainpool
  keys.  [rG6bf5696c85]

Release-info: https://dev.gnupg.org/T8001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-support/gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.8.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.9.bb
index a6e777abf8..4f60a4e7b2 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616"
+SRC_URI[sha256sum] = "dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.43.0


