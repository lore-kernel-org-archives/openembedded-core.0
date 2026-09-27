Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0772FCA5FA2
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:46:47 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40594.1790527603347819114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J7kN1PgD;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so11385295e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527601; x=1791132401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=68gg9ByA6M88S6qSgcXHIK2tuPHx71CQp1fadLjgP38=;
        b=J7kN1PgD9aHOEnVlrhUc5mkJRAETiCQS1+lODDdQ9s3yzR8F2rd7VAFDBCFBMIRziL
         J5pvPSLoR2qxAs6kn9UaArCtF/DL4PJRMVcRFCgjoKXu8l8F7Wx4T3FFGCC2ZRMLrQ0n
         P48IqlbAzjIeVGlR9KSsMUD0LVcaKdRMzHv0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527601; x=1791132401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=68gg9ByA6M88S6qSgcXHIK2tuPHx71CQp1fadLjgP38=;
        b=rb82fFx+qWEcB5zMuAUdGoFxtMdOzokQYFho6MhBd4/FrEG9zJq97+txknOK+xnZl2
         mjBTV9eMvhjg1cQmpfnm409xTwKo1oC5S/TA8WS/83EiFAIRjGE6LKGfFJWkFSTNRWc4
         HHEG1dwi4dbdbbmpkSilEWTo37uM5dvlErxpIqnpzUaaEoC6gvbi/CtsTB/gUEsy3Qba
         H3n67bLSUYTrdyEwVgz1c8Y+1/QHqzgghfS//V0QRZ4IlgqRr/v97g5XMJPP8BBRMm4i
         zxzrNGBuSzo4p/8v52DINAzTCfVen3Icbas7h0vNH7IeN5LoluGBWqMAQ4eibaoasJ82
         DN8g==
X-Gm-Message-State: AFuF++mLedCp/n/XYMHuvlg6Ea9kd9mJZX0d+gX1Kqc1y6BGaDNXdw1J
	Ct/xcI3whZSWUV4q1dAS9259pJvntY223lvlQ03FVV5F04rBmvu4R9BnOuc4/EQdlipUBMzyGUe
	A23Ihc5k=
X-Gm-Gg: AYBFou03a5g0jVm1qMkuwonIyEZPZF94zBi99iHFEaEu3Uwx5KwLoHy2iqbek9b9bht
	vLmXBWnjpfIAxz8aOkKHzVpVFzsGva93VIku6vARBbpn4b8bgQXakiNzdr20EtYccxXFNrcJ2Tz
	HUPJaMPJbZYpJJu3GaH3fldpYEH/CC8nJzVvUGtj/QJszH7cFvfeD1Gt9Si3861cGDb3vO5NLnP
	BJDbsz+MO0gmf0BRazo567g3VBfnfLijb1sHT6KzVrOdhkMzMDaB/caCkeRKQWXMTRoE+nOpO6/
	Hpvm3F91GztQovre9Vtuj5Agx5mqxhqA0KbmQZuVknaY2kooWRxECptPGMOm0U7+08PgicNUc3q
	Qda8mSKh1I3loDe0ZRI+hN/YpzJP7jFk6/kZbx8TYLURz1dvKBytXEhU8IZfhBzRMMg++AMDLNg
	V4dUB28iyrPUinq02Ho5YJRkvNxTo+eO7PKfppxn0RRONG2AVvxeD38dqJ6dvWiAP6cGwwPscUi
	6G2G2+Q6cR1qqoszMzIrXL5S2A=
X-Received: by 2002:a05:600c:6994:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-49fe66e6468mr179138135e9.20.1790527601529;
        Sun, 27 Sep 2026 09:46:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0029203absm54683365e9.6.2026.09.27.09.46.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:46:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] libpam: upgrade 1.7.2 -> 1.7.3
Date: Sun, 27 Sep 2026 17:46:28 +0100
Message-ID: <20260927164631.2484854-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
References: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246695

* pam_unix: removed support for creating new DES/bigcrypt hashed passwords.
* Login with existing DES/bigcrypt passwords is still possible.
* pam_unix: changed the default hash algorithm from DES to SHA512.
* pam_unix: always use unix_update helper if SELinux is enabled.
* pam_unix: fixed option parsing that could silently ignore "quiet" and
  "minlen=" depending on configuration line order.
* pam_access: fixed matching of fully qualified usernames.
* pam_env: fixed buffer allocation that could result in insufficient space.
* pam_faillock: fixed tally loss under concurrent auth failures that could
  allow the deny= threshold to be bypassed.
* pam_faillock: added logging when preauth denies access to a locked account.
* pam_group: fixed out-of-bounds read in wildcard matching.
* pam_limits: fixed maxlogins/maxsyslogins limits that could incorrectly
  deny login.
* pam_namespace: fixed resource leaks on configuration parse errors.
* pam_pwhistory: allow earlier passwords when remember count is reduced.
* pam_selinux: fixed memory leaks and corrected swapped arguments in log
  messages.
* pam_sepermit: fixed crash on malformed config lines, hardened lock file
  handling, and fixed leaking file descriptors on exec.
* pam_succeed_if: fixed broken ruser matching and prevented logging unknown
  user names in plaintext.
* pam_time: fixed out-of-bounds read in wildcard matching, fixed day-of-week
* parsing, and ignore rules with malformed time fields.
* pam_umask: validate umask, pri and ulimit values in GECOS.
* pam_userdb: fixed password comparison timing leak.
* Multiple minor bug fixes, build fixes, portability fixes,
  documentation improvements, and translation updates.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/pam/{libpam_1.7.2.bb => libpam_1.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/pam/{libpam_1.7.2.bb => libpam_1.7.3.bb} (98%)

diff --git a/meta/recipes-extended/pam/libpam_1.7.2.bb b/meta/recipes-extended/pam/libpam_1.7.3.bb
similarity index 98%
rename from meta/recipes-extended/pam/libpam_1.7.2.bb
rename to meta/recipes-extended/pam/libpam_1.7.3.bb
index e268ff4faaa..31e14a724ac 100644
--- a/meta/recipes-extended/pam/libpam_1.7.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.3.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam-volatiles.conf \
            "
 
-SRC_URI[sha256sum] = "3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc61419bfefc8aa1e531a"
+SRC_URI[sha256sum] = "2ce4765fd49df6693771ef2941f81e33d8ee14b94a81a5c7b369aa3b137b85a5"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 

