Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DF8C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:23:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.3921.1667877835838813420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=SQyHiJKP;
 spf=pass (domain: nathanrossi.com, ip: 209.85.214.174, mailfrom: nathan@nathanrossi.com)
Received: by mail-pl1-f174.google.com with SMTP id d20so11947388plr.10
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 19:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CU7uHV4teZeHBbZsV5s8Pr2xmgP8UjXKh7Dkn123JfQ=;
        b=SQyHiJKPisFaL2lbkeXBhketfl386lJGTlRnRKB50g2HJkJjCpdHB8siNLx1+kvv6i
         ENDCBhIjf6mhfh1FPILGNXWF+Nbb5wA7riYuagoFG6kzIFg+T3plffWQNufTshtPhD0O
         HMmnXFCuOGguw6atMmqHqen1z/OH0yT+Wb7084N/ykfCu8aGlVaTtaCwIxoxPGz5dQT4
         SvsNYF1iAODxnwjXXnXB6mzGbi7yR7L5Fkp4wDW+vcBk+ew4mRh+5pcWqPE/E7LP8eWF
         j/olEXjqlJbipRtMHrW15FhrhGjnA7s9+bQHGaMq/vttnFCVke2FcXuwRUCcfdmTmLrr
         usSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU7uHV4teZeHBbZsV5s8Pr2xmgP8UjXKh7Dkn123JfQ=;
        b=QfzEyo2riuf4zEEJSMqK7t0aVVXUaM0u5m1Z8KLyimGf6H7AGvdSCcQeL8tNPI1Tvb
         fqLnpUe9t5YivXZvqr6QHC6YQaZDKsoc826t6gCNTNHCRHBSlgCBbPAfEPG0GlLZnWgd
         0ARX+JkiRlZHS0q5Q+J4nyCS7q2QIf9amerRCi8PioKI6yf7kISTEs/7Tf6U/TOoT9ab
         4OhUwhZNkJoF0Zz9tiUa6gC7N5ZfSamsjkX8cWQ3DKUZAhy2QJdBEfLJZeza7VuT995F
         YMpJ22pd8VC+Ep4366wrxp6EMbmmQjV5ITqi7PiEgVpzGAxbcdzBrmYgiKZtF5b+3Rhf
         VevQ==
X-Gm-Message-State: ACrzQf0y7gtNiVb/UkeHVXTG7Qdq4hfrPtywJAP7gPQU1TLcWxGMINA0
	n9xQcbIx188llESptY0LNzybXEJER/s12g==
X-Google-Smtp-Source: AMsMyM7Gmd2H9I0J09EfWYXR2793ucfLQI12rqukSdLNtmizSJU8i1UvRk9P7vasCYKwDfBJK+hvKQ==
X-Received: by 2002:a17:90b:1113:b0:216:616c:5fa0 with SMTP id gi19-20020a17090b111300b00216616c5fa0mr25096472pjb.225.1667877834351;
        Mon, 07 Nov 2022 19:23:54 -0800 (PST)
Received: from [127.0.1.1] (117-20-68-146.751444.bne.nbn.aussiebb.net. [117.20.68.146])
        by smtp.gmail.com with UTF8SMTPSA id x4-20020a170902a38400b001782a0d3eeasm5670362pla.115.2022.11.07.19.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 19:23:53 -0800 (PST)
Date: Tue, 08 Nov 2022 03:23:42 +0000
Message-Id: <20221108032342.371283-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: 
 Nathan Rossi <nathan@nathanrossi.com>, Nathan Rossi <nathan.rossi@digi.com>
Subject: 
 [PATCH] oeqa/selftest/lic_checksum: Cleanup changes to emptytest include
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 03:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172945

From: Nathan Rossi <nathan.rossi@digi.com>

Config written to the emptytest include file is invalid after the test
has cleaned up its temporary directories resulting in the emptytest
recipe potentially having invalid content when parsed by successive
bitbake runs.

This presents the following error in tests after lic_checksum execution,
e.g. 'oe-selftest -r lic_checksum recipetool'

  ERROR: .../emptytest.bb: Unable to get checksum for emptytest SRC_URI entry tmpn_nyosnq: file could not be found

Remove the recipe include content once the bitbake runs are completed in
each lic_checksum test case.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
---
 meta/lib/oeqa/selftest/cases/lic_checksum.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index 5897a396d9..2d0b805b90 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -28,6 +28,7 @@ LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 """ % (urllib.parse.quote(lic_path), urllib.parse.quote(lic_path)))
         result = bitbake(bitbake_cmd)
+        self.delete_recipeinc('emptytest')
 
 
     # Verify that changing a license file that has an absolute path causes
@@ -53,5 +54,6 @@ SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
             f.write("data")
 
         result = bitbake(bitbake_cmd, ignore_status=True)
+        self.delete_recipeinc('emptytest')
         if error_msg not in result.output:
             raise AssertionError(result.output)
---
2.37.2

