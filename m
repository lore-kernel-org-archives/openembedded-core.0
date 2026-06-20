Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6275DCDB478
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5958.1781960421691507777
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wJ7+fOFK;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1727801f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960420; x=1782565220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/IIc6dHgRPbqXGGC7W8LtVBJRM0WJOlWcAnA+mmKOA=;
        b=wJ7+fOFKpxG8Ve8+rEc/qwtOi33Q1ol9xNmtuc0Cld4L3cqByVZxuugpRslGHw8++f
         dr5uVUH8lia09gsfTVa/nWJk+ooCNLCMN11RFcb//9MVWxGJPqztU09DHl73Gyt8ElZV
         DzoC4L6bY6w3NbH5Q5/NjNCCjAub4djgHF3Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960420; x=1782565220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/IIc6dHgRPbqXGGC7W8LtVBJRM0WJOlWcAnA+mmKOA=;
        b=ArKNnd44itk+TmTvrfCLBNWXL8Bg0/d0uAqjVHl87qmPSUggtGqPQtmhF3oO4y5m/A
         TdmUzK8kFT7f0a04/xB84Yy1Y0Sp5AkL2+NpHOm1MnXUEHQYeDy3SFVK6yngKGINOSzP
         8VuJP+2Z88LE83eytSntnmjujOcMZX+/w7Gmfkpikea9bDmfAO4zUYEmF5xSE/yICdRG
         6eoNwx9+d42HeJ860tTovBAwLqJ4sUx8ZQcqGpISJiOFsAaf/UbEzzyNyfL6hUiAzB9e
         01fuewSLtixw6HiNhnT/sRaLQ9EY/fF0OtuwzkSY9Jwpyx7ElMVJGawNADgxndGonJ+H
         XDHA==
X-Gm-Message-State: AOJu0Ywqb7l4MY9UATBHPoDIJDnydrLlQ0hzS6A18PwIS/Vp4gxYmHBw
	yxD9l/EvNpkCeAiPBdlnYnlopvNV806N48HLBOj2E1ovOfEd3FUxfcpRmSj3xCdJ734jFxQj6et
	sD5AF
X-Gm-Gg: AfdE7cl4Hue0QknZjN5tDQEwfPsKY8N5Q3A6XscJcndsUCfKsIEs3aLrpaiCsILSGip
	Hbxrd2RnL51bVu6cDSVhtrfix3sfC2uw1oTI79wu5kATXivBnO2sMDb8fM3z6Lw8aGV4oNWz9IB
	moNKZU10vTlOzgtGZ45BZ237Wt5TNHpk0AHoAH21THzFmUONdvA5c+rYF2EFn4hqqStVeV5hgwD
	s5wiQYe9FHJiP9OqRtw0XlSvyYsEOCMrD+vL8bo66OkYIMw/BhbEnE7MBrlhQDvIMMnjCWjPxXE
	3ZO70DViZ9tL27xQeYqtL6t+9oIXk1aagcaDPmvN0s+jqjD6NpZO5L9+oED2HC17+JYBTuzgQa+
	SzC5yIbFiV1RSKFjxZM7DyFO6lHy3xjnnotgPVHRjr3d363BGZSl0eksAOFC+3YsjFiduHW6sRI
	0ofU88WUDZFr6pixM01vpXuOdZqLfBJtX7QWf4+T9bIeieO1pqAGKHdHJYFfp6xXGYcnb/y1b+x
	jQOKo3LeWC/oXu4zBNz2GwPKbU=
X-Received: by 2002:a05:6000:1885:b0:463:d9:5b35 with SMTP id ffacd0b85a97d-46500a02aa2mr11759108f8f.1.1781960419837;
        Sat, 20 Jun 2026 06:00:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/36] sbom-cve-check-common: Fatalize command failure
Date: Sat, 20 Jun 2026 14:59:32 +0200
Message-ID: <90f0a75dafc3215b6b2f4f19c8f2b0d84304f252.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239226

From: Niko Mauno <niko.mauno@vaisala.com>

Change the bb.error to bb.fatal in order to avoid marking the
'sbom_cve_check' task successful, even when it encounters an error,
like:

  sbom-cve-check: error: [Errno 2] No such file or directory: '/build/layers/openembedded-core/build/tmp/deploy/images/qemuarm/.spdx.json'

  -NOTE: Tasks Summary: Attempted 5946 tasks of which 5283 didn't need to be rerun and all succeeded.
  +NOTE: Tasks Summary: Attempted 5945 tasks of which 5944 didn't need to be rerun and 1 failed.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit c56fed2c293dc384003e088154bc88c2d8aec472)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/sbom-cve-check-common.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sbom-cve-check-common.bbclass
index 32c29a0ec2c..1bd1af22b6c 100644
--- a/meta/classes/sbom-cve-check-common.bbclass
+++ b/meta/classes/sbom-cve-check-common.bbclass
@@ -117,8 +117,7 @@ def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=None):
         bb.note("Running: {}".format(" ".join(cmd_args)))
         bb.process.run(cmd_args, env=cmd_env)
     except bb.process.ExecutionError as e:
-        bb.error(f"sbom-cve-check failed: {e}")
-        return
+        bb.fatal(f"sbom-cve-check failed: {e}")
 
     show_warnings = bb.utils.to_boolean(d.getVar("SBOM_CVE_CHECK_SHOW_WARNINGS"))
 

