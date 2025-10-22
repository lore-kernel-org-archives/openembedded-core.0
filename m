Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8242CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 13:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.9811.1761140630971593709
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 06:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mL7DFd/h;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E8B9AC0AFF6
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:43:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD486606DC
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:43:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD542102F242F;
	Wed, 22 Oct 2025 15:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761140628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dlZQImflgUHpw8eDuRnkVvwSMACGDLcDxa9EHfXNiuI=;
	b=mL7DFd/h+PpBbw4d1/wgOUAKQtewtY0bva2DW5LGMwHGlpdSdTv0MfgbilIhInWugglPSm
	UxhaWrGEhpB+SIraEYSLWjO3xcbtqLkuShl0rDxBr+6lfeafEepFJXJHQDKRmZDU3mzANF
	iyxRUbML40cnfD4dTSvRpy3hR3PVrV666jFFjgWKCiioemtiHvtdyNhLJqJU+rB2dpDmn3
	CGVCEEl4z3Ffc2wB9hv2ewcYHcAr/VoUeDns9OUsiCv8ej3Zr7maMKvhZsl+lxPmPKWuuW
	aGYN2KdHV7mAWFplV8CtLPtmvUH6fpu5U5OxVfPW6RhxsGSmYqu0uAP/8gcnmw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 22 Oct 2025 15:43:15 +0200
Subject: [PATCH] oe-build-perf-report: filter used measurements for each
 commit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-mathieu-buildperf-multi-bitbake-commits-v1-1-180328529ea5@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHLf+GgC/x3NSwrCMBRG4a2UO/ZCGiwatyIO8ri1PzZtyUOE0
 r0bOvwm5+yUJUEyPbqdknyRsS4N/aUjP9nlLYzQTFrpoVdac7RlglR2FXPYJI0c61zADsXZj7B
 fY0TJ7OzNKBPu5ho8tdqWZMTvPD1fx/EHnitNAHkAAAA=
X-Change-ID: 20251022-mathieu-buildperf-multi-bitbake-commits-ba7909d894dc
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761140626; l=2979;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=wc4Jx2LB2yTjEej6q+p/sSwNL2xRrV/qNEAe7O0m2KQ=;
 b=R/U68aneMGfbcKA5fnNfTYOA7ozIqSnKuVEfpiytmW+t9cAC8l7VLQkx6HptNrrNxteu6vwW7
 cRTbzj8akouCGSXZ6y2GsqXCRzKu+HbE4Q9wHUXbvsTPHQWXWlh+jCP
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225194

As the poky repository is no longer used, measurements are indexed using
the oe-core commit. But as bitbake, oe-core and meta-yocto are now
retrieved from separate gits, while measuring performances for a given branch
at some time interval, we can get the same commit for oe-core but
different ones for bitbake or meta-yocto. As a consequence, metadata
associated with the same index (oe-core commit) might differ.

Today this is not supported, as we do expect all metadata for a given
version remain the same.

For each oe-core commit, filter the measurements, in order to only keep
the ones with the metadata matching the last measurement found for the
said commit.

Fixes [YOCTO #16014]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Fixing some buildperf issue [1] occurring after the bitbake-setup
switch.

I was tempted to send this as an RFC, as I'm not really sure if this the
best solution here. I decided to filter-out the entries with different
metadata, but we could also want to merge them or integrate them as
different results.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=16014
---
 scripts/oe-build-perf-report | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index a36f3c1bca34..2d51e84444ba 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -133,12 +133,19 @@ def read_results(repo, tags, xml=True):
     if xml:
         git_objs = [tag + ':metadata.xml' for tag in tags] + [tag + ':results.xml' for tag in tags]
         data = parse_xml_stream(repo.run_cmd(['show'] + git_objs + ['--']))
-        return ([metadata_xml_to_json(e) for e in data[0:num_revs]],
-                [results_xml_to_json(e) for e in data[num_revs:]])
+        metadata, results = ([metadata_xml_to_json(e) for e in data[0:num_revs]],
+                             [results_xml_to_json(e) for e in data[num_revs:]])
     else:
         git_objs = [tag + ':metadata.json' for tag in tags] + [tag + ':results.json' for tag in tags]
         data = parse_json_stream(repo.run_cmd(['show'] + git_objs + ['--']))
-        return data[0:num_revs], data[num_revs:]
+        metadata, results = data[0:num_revs], data[num_revs:]
+
+    # Filter on results with version matching the last one
+    valid_bitbake = metadata[-1]['bitbake']['commit']
+    valid_meta_yocto = metadata[-1]['layers']['meta-poky']['commit']
+    return zip(*[(m, r) for m, r in zip(metadata, results)
+                 if m['bitbake']['commit'] == valid_bitbake
+                 and m['layers']['meta-poky']['commit'] == valid_meta_yocto])
 
 
 def get_data_item(data, key):

---
base-commit: 7a900ff52d76490f42236f9dd898ded0da77058e
change-id: 20251022-mathieu-buildperf-multi-bitbake-commits-ba7909d894dc

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


