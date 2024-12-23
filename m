Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65350E7718E
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 16:35:55 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.16479.1734971079901590222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 08:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=edHWuyln;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: ribeiro.angelo224@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so3397641f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 08:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734971078; x=1735575878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKwY2kiSbGoaaVBn0OXBygAFk1cCvIcDHqJK9ArtjLI=;
        b=edHWuylnZa0zhDhJ1ihqlvnRTdoK+nPgS+o01W3fHHr3l8/wcwOwYsp2UnKBVZ0Ya4
         YEQ8h38ecPJbsXVSLlJr1g69PmjsGpjMbHFhRde/f9ZdBjN4A9waNrNWt10AkdoSEruZ
         9A+e1Q+XTg+krBYWOxBbDYmO5JAFZttxMseMfHWjfJUh9q+yJY3cVX8RSQLa3LnggGKr
         OiVxNyYdpVOne7fd5LFWsPafOwuIYPIE09MU9+ILnO6dPRy0Vas0Jp3ssPQBwvsBOyZ5
         jwYzmAFpykYxLkF9zCThL6db5IqP+X4OMoowlmwyOyEeJVZPVRcwkLgd1fRycTHIA3uw
         6OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734971078; x=1735575878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKwY2kiSbGoaaVBn0OXBygAFk1cCvIcDHqJK9ArtjLI=;
        b=e+Fx0nbOAPVcyoZ45Qb3uQcJXG3GdIvkRGCLsRHGwcsrxajuXP3+5MEoH8qghW1TnH
         Pyc/b6nszm5Opo2bBjgwZ9ObhFIDz9crUiuqJyoZtQo9ACCh8w8ho2txFOBLN/c/cIHv
         WunHwjwnAVWr7EfdYSQSUpz+AE5SJjeyITi1vxnnhKAUsoP7LbGZUcSs9HqgG6s3rpcP
         dj0hj2Cy6eX/ZslrTuZmCBcWHhABcqS5QhGBays/tR/HtCI1y/Cqd4kQtxULoG4hotEz
         DWcvgnTnu/djH/KEQGbsrd+lF9Cth0q2CezOnP8Ka83+PQ2OrNBRxp0GeA12uMbge3sd
         Vb/Q==
X-Gm-Message-State: AOJu0YxP2ZPfiVNv/x8ITVvMavxPjtYcsssA/aJPas3K9es/bCFlZibn
	3870fhD1bYeKfWRMtWo8b4iXtZ7gJ6+lv7J0/Yk/edDZCtCYbmvNRrfZjrSn
X-Gm-Gg: ASbGncuV47KVsqeAiaWO19LSO4sKzEz+rkeMd722Io7zVNGL7MnmVmksfe9BhyivFBM
	s6muvSvKiUkDOIoKN/aumMVDSOhUdJW8FaXI7YBoidPyTGo6vWHx7vuVUcTmHutUBMYNJ+xiUZ/
	aAGNv1+CNcHj9hBD6zXJWkk3auamUTKy1ZBvxfQ513ko5TJ16yilx3zzH2fv7KkbTW8PgTAedvr
	6iLbYmqMpVje230hU6L/ph1aC7GsqFKf2uwhOKE4O/F1Rc6e8jKk7/OFpebOcCOVCbKaomzHn6/
	2XqBaCugPechFYjlhEU=
X-Google-Smtp-Source: AGHT+IGZ8kaNoQI/GB11/N7ZzVcDbIRzLXTQfC6Gtk4Rd4W2OOzQM0G+TCaQKHMazDmszQzRoY812w==
X-Received: by 2002:a05:6000:1ac6:b0:386:2ebe:7ac3 with SMTP id ffacd0b85a97d-38a22408fb1mr9422827f8f.56.1734971077970;
        Mon, 23 Dec 2024 08:24:37 -0800 (PST)
Received: from L-PW01ZSFV.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829015sm11788138f8f.13.2024.12.23.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 08:24:37 -0800 (PST)
From: Angelo Ribeiro <ribeiro.angelo224@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>,
	Angelo Ribeiro <ribeiro.angelo224@gmail.com>
Subject: [PATCH] report-error: Add PN to error report file
Date: Mon, 23 Dec 2024 16:24:34 +0000
Message-Id: <20241223162434.98366-1-ribeiro.angelo224@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 16:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209046

From: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>

Extracting the PN out of the PF value is not allways trivial.
For example when PE is set the package name will have the PE value
before the '_' that clearly makes the division between name and version.
Other packages include a number in their naming separated by a '-',
for example mozjs-115 and openjdk-17.

Signed-off-by: Angelo Ribeiro <ribeiro.angelo224@gmail.com>
---
 meta/classes/report-error.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 1452513a66..2b880c8b0c 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -81,6 +81,7 @@ python errorreport_handler () {
             task = e.task
             taskdata={}
             log = e.data.getVar('BB_LOGFILE')
+            taskdata['recipe'] = e.data.expand("${PN}")
             taskdata['package'] = e.data.expand("${PF}")
             taskdata['task'] = task
             if log:
-- 
2.34.1


