Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B166BC369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 16:47:04 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.3333.1744303619589340627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 09:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UFrV3m1n;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025041016465725d6757fc0837522d6-89gmlo@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025041016465725d6757fc0837522d6
        for <openembedded-core@lists.openembedded.org>;
        Thu, 10 Apr 2025 18:46:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=byDEK0LlVEKbPMq+iEHK9ouw4coVANesQYupFiFTiQU=;
 b=UFrV3m1n9KlBmqS6RB7yVqXDVsRqyp7ILyfK3EwSoOfB+na+w/nquTMtn2rjumudiQel4S
 NhjM8D1/xdEhRojPu7QS7kHXTVNiLGeyE2BYq547oYggv2XhPv4KVw48u1RQYLPyZcpDg6Y/
 +Ll2pizENIz812ZwdlNd6T7VkBwfEP5CMp/mq3o4v1L4v90uKAT2kwwQ8UvhKn2KvyluuMgF
 me9/xD40iQG3O+Lws7L2ZY9LF0TlvR2yshMrqTi+4YeHaoYT5E+EMIVjqJS1+0icIGrPaf1k
 +xxmq631fn1VGOOGKY764j2trr7vha3fSz4Ki64ZvIuiPTCiqlGi1dHA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] cve-update-nvd2-native: add workaround for json5 style list
Date: Thu, 10 Apr 2025 18:46:07 +0200
Message-Id: <20250410164607.9085-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 16:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214683

From: Peter Marko <peter.marko@siemens.com>

NVD responses changed to an invalid json between:
* April 5, 2025 at 3:03:44 AM GMT+2
* April 5, 2025 at 4:19:48 AM GMT+2

The last response is since then in format
{
  "resultsPerPage": 625,
  "startIndex": 288000,
  "totalResults": 288625,
  "format": "NVD_CVE",
  "version": "2.0",
  "timestamp": "2025-04-07T07:17:17.534",
  "vulnerabilities": [
    {...},
    ...
    {...},
  ]
}

Json does not allow trailing , in responses, that is json5 format.
So cve-update-nvd2-native do_Fetch task fails with log backtrace ending:

...
File: '/builds/ccp/meta-siemens/projects/ccp/../../poky/meta/recipes-core/meta/cve-update-nvd2-native.bb', lineno: 234, function: update_db_file
     0230:            if raw_data is None:
     0231:                # We haven't managed to download data
     0232:                return False
     0233:
 *** 0234:            data = json.loads(raw_data)
     0235:
     0236:            index = data["startIndex"]
     0237:            total = data["totalResults"]
     0238:            per_page = data["resultsPerPage"]
...
File: '/usr/lib/python3.11/json/decoder.py', lineno: 355, function: raw_decode
     0351:        """
     0352:        try:
     0353:            obj, end = self.scan_once(s, idx)
     0354:        except StopIteration as err:
 *** 0355:            raise JSONDecodeError("Expecting value", s, err.value) from None
     0356:        return obj, end
Exception: json.decoder.JSONDecodeError: Expecting value: line 1 column 1442633 (char 1442632)
...

There was no announcement about json format of API v2.0 by nvd.
Also this happens only if whole database is queried (database update is
fine, even when multiple pages as queried).
And lastly it's only the cve list, all other lists inside are fine.
So this looks like a bug in NVD 2.0 introduced with some update.

Patch this with simple character deletion for now and let's monitor the
situation and possibly switch to json5 in the future.
Note that there is no native json5 support in python, we'd have to use
one of external libraries for it.

(From OE-Core rev: 6e526327f5c9e739ac7981e4a43a4ce53a908945)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index b8faee68d6..9808120cab 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -226,6 +226,11 @@ def update_db_file(db_tmp_file, d, database_time):
                 # We haven't managed to download data
                 return False
 
+            # hack for json5 style responses
+            if raw_data[-3:] == ',]}':
+                bb.note("Removing trailing ',' from nvd response")
+                raw_data = raw_data[:-3] + ']}'
+
             data = json.loads(raw_data)
 
             index = data["startIndex"]

