Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9639.1612362340936050161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NLsbD9nZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id 7so24567589wrz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 06:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOtDClzGtckBDcmkYmnkW0QA46Dpc7HyZkTTmEcxTX8=;
        b=NLsbD9nZTc//0mPuUMofuUPihLg+02FW2XtLmq8xfweIkNxZF93OHbxYBI1WLCK+rA
         jTBdRptzi2Devtevj3Qx2Q/WSMDfnsi635A5xbOX583Pu1E+19oZpVyJY5hBcRBDEH1+
         nwU5myKkMJkRnz0OCnILMb7i7qZbofIR4saB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOtDClzGtckBDcmkYmnkW0QA46Dpc7HyZkTTmEcxTX8=;
        b=S4VzevfVJkz+5KQiSmw5FM6WhQuRfML4aG2n35BmZWL8YjOn4heD2QRCYeEXsTt8XH
         iteeDxYpxOLvPAp9BRwvUhuTh8WCeUWE7fUprgeoyh3BTKE7l0RtFllOXn8Y1KjV0QNO
         vAmuKd3TG3UtDNvS8Cb7dfSGR72QaDJ4LTjCZsnq7X5ZvMOIeyFSDGAMrGMZJyIYjHCA
         ceZgro6/vLDJLPhh161cDMynT0ozvTKasJPOA1JPMqtJyMN5oFeXOloBWXT2bhagfl9L
         CcRfs2HqFb3wmf3UNzDYP15XGti5GNropIV0QtzrJVf8eV9NEPuxSX3EIK4psgncu5qk
         h5sw==
X-Gm-Message-State: AOAM530l920VsGUdtvH6fnhwoLDP4feHkRkf0NTHWjAvYll4n+j5oks+
	J7WNNAhM0x0BHinNham6BTDWrbtHOTyIAQ==
X-Google-Smtp-Source: ABdhPJytMWzqJufqG03kpBEAyRFh2pwWeaupKIfg/1nroA27OdDCz4I7EieCZlxKsHZsw2US+c7Shw==
X-Received: by 2002:a5d:4806:: with SMTP id l6mr3908334wrq.389.1612362339138;
        Wed, 03 Feb 2021 06:25:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a910:113:8225:ce6d])
        by smtp.gmail.com with ESMTPSA id r11sm3046178wmh.9.2021.02.03.06.25.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:25:38 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package: Ensure do_packagedata is cleaned correctly
Date: Wed,  3 Feb 2021 14:25:38 +0000
Message-Id: <20210203142538.1555064-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In an earlier commit, libprocps was split into a separate package leaving
no shlibs in the main package. A bug was seen where igt-gpu-tools wouldn't
build correctly in some cases as it thought the librbary was still in the
main package, throwing qa errors as a result.

The issue was due to an extra file being left in the sstate output of
the do_packagedata task in the shlibs2/ folder which contained the bad
shlibs information.

The reason for this was that the temporary directory used in this
task wasn't being cleaned so files which were deleted were not handled
correctly. Add a missing cleandirs entry to fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a77d532b66b..417e2252979 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2452,6 +2452,7 @@ python do_packagedata () {
 
     bb.build.exec_func("packagedata_translate_pr_autoinc", d)
 }
+do_packagedata[cleandirs] += "${WORKDIR}/pkgdata-pdata-input"
 
 # Translate the EXTENDPRAUTO and AUTOINC to the final values
 packagedata_translate_pr_autoinc() {
-- 
2.27.0

