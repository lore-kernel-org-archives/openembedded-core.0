Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F29174557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 11:51:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j5so12745340wme.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 04:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=mabJ1RYQCE2egKnVkZJk9a2rpy117ixKrtPOByZGNIU=;
	b=NFKc+5xUyv/+e/7g4wwvXM0dDD7cvg/z1PE+fdkvTdqkkag2DWtNGwaLKKSOggvXgj
	0is2nRG9vApjncAE83GS1l7udG4xPWk0r4okiSOQScGpVqZ+LEskpt1uuzvTBFzTx29v
	bmdSkTlEGiPhk2AL8yizQGPCKchzOPisslgpQpwqBK0CvSlX0/KAz8Q2zobuBsTHwRzj
	1rIWj13dgJLRSIU2+Qn4b64QP3Q9quPqB0X00RFPz9JCaznbfYtTODIhkYJs2S1BA+/r
	WDlPQjo2yIig56Tte0CrHxOchNeAI+Qm2rxKpfLuZ81/IGq7okOvdmGjAInvEjtNdHsN
	s5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mabJ1RYQCE2egKnVkZJk9a2rpy117ixKrtPOByZGNIU=;
	b=jzIv177To+IK2Ny+oPcthn4WQNV4bRdt8i5oxcFCoJDV4saJZFb7INLgYZ7hot6Rv+
	cCPN+YXzb1eUcByN9YqSNBnZSSahzRFbTVdBphFEPiRQFcxEEDfGSTniz/d1C/ZQbpNh
	oIrcS02FSd3wa1Bd44l/Jifbr42jYpuxHMPpSyJ+flmSkktOFdLT0Hlbdy3PTFjnCCbG
	f5yC1UPCSdthtFHfa9wZH3A2dUTTfIXiGfIpKXR0WlwSIdBQyCJn7VwQcorUVKjyAtEl
	Z47kkKhZ2/7fPGmhWVDHaawnq8ox3u6yQj9eIM6PvKJ28b8CqJlULpMTxOLj9cSliQyg
	smVw==
X-Gm-Message-State: ALQs6tAl6FUnmKdJB2HDlj67h4jpNGgdOmtvVhQ1N2vnVRGlJGA+183N
	JTUYGdTfikKuEZzImRIXBkY4iCHY
X-Google-Smtp-Source: AIpwx49zedov1maoUFKZWxBwrBmbu27JE2NGdadl4zAnVxeI3o5o/LbBc6EOwSHygiEe70IeZdSyAQ==
X-Received: by 10.28.40.4 with SMTP id o4mr19026639wmo.44.1524743468120;
	Thu, 26 Apr 2018 04:51:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o12-v6sm21104882wri.78.2018.04.26.04.51.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Apr 2018 04:51:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Apr 2018 12:51:04 +0100
Message-Id: <20180426115104.22748-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oe-buildperf-report: highlight large changes in the HTML report
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
X-List-Received-Date: Thu, 26 Apr 2018 11:51:08 -0000

If the relative difference is greater than 2%, make the text bold to highlight
it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lib/build_perf/html/report.html | 7 +++++--
 scripts/oe-build-perf-report            | 4 +++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index 291ad9d7216..d1ba6f25788 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -136,10 +136,13 @@ h3 {
             {% else %}
               {% set result_style = "color: orange" %}
             {%endif %}
+            {% if measurement.reldiff|abs > 2 %}
+              {% set result_style = result_style + "; font-weight: bold" %}
+            {% endif %}
             <td>{{ measurement.description }}</td>
             <td style="font-weight: bold">{{ measurement.value.mean }}</td>
             <td style="{{ result_style }}">{{ measurement.absdiff_str }}</td>
-            <td style="{{ result_style }}">{{ measurement.reldiff }}</td>
+            <td style="{{ result_style }}">{{ measurement.reldiff_str }}</td>
           </tr>
         {% endfor %}
       {% else %}
@@ -167,7 +170,7 @@ h3 {
             {% else %}
             <span style="color: orange">
             {% endif %}
-            {{ measurement.absdiff_str }} ({{measurement.reldiff}})
+            {{ measurement.absdiff_str }} ({{measurement.reldiff_str}})
             </span></span>
           </div>
           {# Table for trendchart and the statistics #}
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index dc999c45c15..0bd05f44ef0 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -416,9 +416,11 @@ def print_html_report(data, id_comp, buildstats):
                 samples[-1]['commit_num'] = commit_num
 
             absdiff = samples[-1]['val_cls'](samples[-1]['mean'] - samples[id_comp]['mean'])
+            reldiff = absdiff * 100 / samples[id_comp]['mean']
             new_meas['absdiff'] = absdiff
             new_meas['absdiff_str'] = str(absdiff) if absdiff < 0 else '+' + str(absdiff)
-            new_meas['reldiff'] = "{:+.1f} %".format(absdiff * 100 / samples[id_comp]['mean'])
+            new_meas['reldiff'] = reldiff
+            new_meas['reldiff_str'] = "{:+.1f} %".format(reldiff)
             new_meas['samples'] = samples
             new_meas['value'] = samples[-1]
             new_meas['value_type'] = samples[-1]['val_cls']
-- 
2.11.0


