Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE237FA88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:14 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id p24so11232752pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MTPlbdV2kzNVJ0uYniwmPagNs43B4KG0ZEqQNd7r3mQ=;
	b=aeWlzGirFbhlc88pfwyNzvlYVTDkxoGsyHh4Tx+HZWPP3HmSVoOuQuIkmdCiFTT57e
	D0aNrizRYL+H+2AvsjV/4Lb7M9fNN9CBku6XZjMXN//l91GRNaiJpx+bZAiaa1Y9lRc5
	h0r8gEoarx6dr36RyS9z40Atb25DnOl3jNuThkEwLK2z+PFM03Ox0YVXilcPH44ZQTny
	wxo9ScH9w+UcMD3n2O/qj9F/uhcilYr91w/yrXMolTOpwTiiPHONPGztqVae3pu6KNsK
	VdIKovlsJSV2gIKoUBUv3B1iPk/NokKjljUGyeUltAMT+m7LjECVRQ+XFAuQTv5H2HFY
	MolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MTPlbdV2kzNVJ0uYniwmPagNs43B4KG0ZEqQNd7r3mQ=;
	b=GWweqUf6wG4+5EVgVzBkdZArUg52MRjlrvRQFg3CGnwHwISOPqNw2t6iFBaaxyJ68l
	NqYBIPUMqSLQRNfRiFXTmFbV4QZKiZaHLSr2h4BFrT9nnZ9RnOTVlwXIg3zwNfDlJcRy
	5Re3iBnPZ1FW+0O6Z7hFbhdeUHWaQCoUeTkzB6gAuzsrWuzPx0Vr6wRQCKzq7TnTj3b6
	0gobeHTV3f2hfg8R0cucgXri/Moi+xaBTq7XF5p4lT/lHg2y4oMiFAKM/zKnJipqHzHa
	kyfopNcfFBFFsoOznBax9iF2f6uSWUsfsfVVh3Cp5UBgGmmVYk21jqUcE+zw3vV2I+Ao
	3uGg==
X-Gm-Message-State: APjAAAXbyKF1BlbiGaPXG4Gn6T7pVf509ktyiQvAVyIq776aGkcDM4hd
	SViDpJkUONbpjhxnLqmlDMgs8vW5
X-Google-Smtp-Source: APXvYqwyAGdwOkRYoccXaAxbvLCCqhMngn/wCIO7F9ePXN73ry8/3kdueQT/1y1NK8XUwhzFCIbcWQ==
X-Received: by 2002:a63:cf4a:: with SMTP id b10mr29206687pgj.86.1573497015270; 
	Mon, 11 Nov 2019 10:30:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:49 -0800
Message-Id: <29d926802e7f8b4614a2dafa0af4c923912e1811.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 07/21] cve-check: ensure all known CVEs are in the report
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2019 18:30:14 -0000

From: Ross Burton <ross.burton@intel.com>

CVEs that are whitelisted or were not vulnerable when there are version
comparisons were not included in the report, so alter the logic to ensure that
all relevant CVEs are in the report for completeness.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c00d291..f87bcc9 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -208,12 +208,14 @@ def check_cves(d, patched_cves):
 
             if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
+                # TODO: this should be in the report as 'whitelisted'
+                patched_cves.add(cve)
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
             else:
                 to_append = False
                 if (operator_start == '=' and pv == version_start):
-                    cves_unpatched.append(cve)
+                    to_append = True
                 else:
                     if operator_start:
                         try:
@@ -243,8 +245,11 @@ def check_cves(d, patched_cves):
                         to_append = to_append_start or to_append_end
 
                 if to_append:
+                    bb.note("%s-%s is vulnerable to %s" % (product, pv, cve))
                     cves_unpatched.append(cve)
-                bb.debug(2, "%s-%s is not patched for %s" % (product, pv, cve))
+                else:
+                    bb.note("%s-%s is not vulnerable to %s" % (product, pv, cve))
+                    patched_cves.add(cve)
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
2.7.4


