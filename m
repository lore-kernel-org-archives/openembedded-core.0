Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAC67FDA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:17 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id z3so3124414plk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oLIjUHhuFis3lCiRnTDn8qETvmM4p4Cs7ZdatrBDJNk=;
	b=uMxwr0zAntfp5NrbbSQHnYCfDgzhpy50sQMWMnJMasFtbO3NkLTZL7q2qme1WAiU+8
	BKmjy2degXTTGlTR+ch1V8RscZkOJJ2Kiwh0yJjYjs6hc+tc80T7x6CVJMsOlW9XH71N
	ZbVxwP4lBd631VwZ2hNoA2He9t+S2l+JYjZZqtvnuzPx1C9hORje/iHZ7xQkigvvGffW
	kBpEt1sawyWjeaA4q7J+eljgT0U0NyPPB23fsAg5hXDb4GdK9J/TaqC0H7y5kU9Jyrnd
	ztugsrmP3I/kgwQFxG+GzSi9YiRG/eO401zdoFQCGFNqRiCByvwzG+ue36Et7Z+31juP
	SyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oLIjUHhuFis3lCiRnTDn8qETvmM4p4Cs7ZdatrBDJNk=;
	b=GsOPT/Tzv0oTtesXnrGfZFQ9GZGvCvEgOSJJZxMoX+3CK1E+0/BFLdF5zj0XBahU3p
	1ukqdGEtiO27sgXzOEcpE2hjseecDm7a/VTyu4oHHrK473D2zZQDCPIrpAYrcrCSWQdR
	W+Xe++y+i9eHIPP0E9oBP3iYbcvObsgQOfir+JEHNYWYfpWGE8U0z2NYr3H1WnzNxwa9
	fIYe50eUB7lSPr/FQzcuzBZP3QJzUxVND4DjldCbcLuc6cRNoDdwBwsoSLtYJdJF3JL/
	6NPhUYDNh2SpvFQIV6ezLY9OsRpsitSvDthAP3eIhB6NkXxOS2BXa9RJjtv96FSjJ9SL
	QZXA==
X-Gm-Message-State: APjAAAXfY9rM4hpPD7+/LC6O5V1ZbWkeSqFmzP72dRz3mTUIRtQw4yEp
	5Y0hFLE4o6A6kOfQzJ+zDMkkUW36hX8=
X-Google-Smtp-Source: APXvYqzFG5+frgYDxJ8ZfjBpUT6NZ3o5Qen8rr7XVa65rvUThN8C6sFgOCCeA1rxmuBFoEL/1EMrcQ==
X-Received: by 2002:a17:902:724a:: with SMTP id
	c10mr17090489pll.39.1576512018530; 
	Mon, 16 Dec 2019 08:00:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 07:59:57 -0800
Message-Id: <9d01a64844998d98fcfcebbe8580422094cd2dde.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 07/18] cve-check: ensure all known CVEs are in the report
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:17 -0000

From: Ross Burton <ross.burton@intel.com>

CVEs that are whitelisted or were not vulnerable when there are version
comparisons were not included in the report, so alter the logic to ensure that
all relevant CVEs are in the report for completeness.

(From OE-Core rev: 98256ff05fcfe9d5ccad360582c36eafb577c264)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


