Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61776C4707B
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 14:03:36 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.23907.1704463410744349945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 06:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jTtgYADH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6da202aa138so1100281b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704463409; x=1705068209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqXIqU+PRG4O6z9Gvq8AUakeAfM/VJmEo6BgkeV5+1I=;
        b=jTtgYADHxRbrjEupFOdiH8fhEJq52cqFOF56DDMy+eNg4oHNbGJtnkeXfm0p2eKutz
         S+oFESiZmRZMy5Va/CR/anGXgFHb2xIpc9EORw/wsQWjpuf/VT6FhjL+nqMxuOxr3ikM
         z0l7yG82uWhNpgZUFwdvJuCGbStXLY8zgIalrf9Z5Pjq6v79rK4JTkZzVT7DS9Kpm/lu
         Vcn/qETd3XOq7KGieJxAv/suSGZlljGhw/ZdZYmpyeDasgSEY5WmLffskSi2GmC2034p
         Il6UO5SqbVsHjFU3H+bk7t+HY5SBluXMijAl8ZwkVicLM+CkcPVWtGk+MRB5mDdMiw5Z
         k7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704463409; x=1705068209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqXIqU+PRG4O6z9Gvq8AUakeAfM/VJmEo6BgkeV5+1I=;
        b=RUy0/BbHmlUtDy9WuwsupQQz/Upy4uc8R3sbjNL/xh31UVoZBZEm+kpnOmxuk2sYp8
         SvHf57LarB70lQxKymSuFPijHXtXbU0OskTneaFadc/FjOy3klUXv8b2cOZyKCYCDoWX
         igSfgy1v5OpJwdapqRZJ/WrtQvBDWGXh+M+G6DoJ9M/KnEymgKZlDoY0JlOjw2/Chw8U
         hW7jbE1n8dAkTwEGglKCyIJqKoNfxvTpV9AqUrJA70M/Al1J8PIIoVCbC7J7WoGqFPUW
         4QawAwDwwnhuJogooQMmRD7X16sqPk3htmCae3/727F7IXbZnfVLJpMjeK48M0YfSwRf
         FftA==
X-Gm-Message-State: AOJu0YzyGeHFh2pYK72vToNtTTg9Jq670rpu8LaF58bAt4ihIIqFqE7n
	+9zHvimZFrcPrvcfppT3+pBiITfb59l1PKg9RZU4xOXp/OgMPw==
X-Google-Smtp-Source: AGHT+IE+pPAt14d8rmh/FxUxbNTpayHc7zRq+oqRyyRCdKvcYsxAGfYVSj3OE6ngOqFREotykl+mCA==
X-Received: by 2002:a05:6a20:9387:b0:195:1bcd:f60c with SMTP id x7-20020a056a20938700b001951bcdf60cmr2472416pzh.35.1704463409400;
        Fri, 05 Jan 2024 06:03:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id y2-20020aa79e02000000b006d9bcf301ffsm1430097pfq.194.2024.01.05.06.03.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:03:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] cve-update-nvd2-native: increase the delay between subsequent request failures
Date: Fri,  5 Jan 2024 04:03:07 -1000
Message-Id: <9e03b7a9879fd16e32f4eccb78b438f6fa9db74d.1704463208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704463208.git.steve@sakoman.com>
References: <cover.1704463208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 14:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193364

From: Dhairya Nagodra <dnagodra@cisco.com>

Sometimes NVD servers are unstable and return too many errors.
There is an option to have higher fetch attempts to increase the chances
of successfully fetching the CVE data.

Additionally, it also makes sense to progressively increase the delay
after a failed request to an already unstable or busy server.
The increase in delay is reset after every successful request and
the maximum delay is limited to 30 seconds.

Also, the logs are improved to give more clarity.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7101d654635b707e56b0dbae8c2146b312d211ea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 0a8b6a8a0a..69ba20a6cb 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -114,7 +114,10 @@ def cleanup_db_download(db_file, db_tmp_file):
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 
-def nvd_request_next(url, attempts, api_key, args):
+def nvd_request_wait(attempt, min_wait):
+    return min ( ( (2 * attempt) + min_wait ) , 30)
+
+def nvd_request_next(url, attempts, api_key, args, min_wait):
     """
     Request next part of the NVD dabase
     """
@@ -143,8 +146,10 @@ def nvd_request_next(url, attempts, api_key, args):
             r.close()
 
         except Exception as e:
-            bb.note("CVE database: received error (%s), retrying" % (e))
-            time.sleep(6)
+            wait_time = nvd_request_wait(attempt, min_wait)
+            bb.note("CVE database: received error (%s)" % (e))
+            bb.note("CVE database: retrying download after %d seconds. attempted (%d/%d)" % (wait_time, attempt+1, attempts))
+            time.sleep(wait_time)
             pass
         else:
             return raw_data
@@ -195,7 +200,7 @@ def update_db_file(db_tmp_file, d, database_time):
 
         while True:
             req_args['startIndex'] = index
-            raw_data = nvd_request_next(url, attempts, api_key, req_args)
+            raw_data = nvd_request_next(url, attempts, api_key, req_args, wait_time)
             if raw_data is None:
                 # We haven't managed to download data
                 return False
-- 
2.34.1


