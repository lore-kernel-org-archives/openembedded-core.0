Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F296C64ED6
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:10 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.3920.1676835066981424027
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UiN10vDJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id bp28so927901wrb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDbMdnvuwBtrk848WVCB2hK3ubrSFKK8fluyE85oQ2g=;
        b=UiN10vDJDJtgc/pIEoN4Gf8ekFDzJajAB213l8+8+KI92pzE4qQx9CPPLzLuGc3DPv
         R2dmIR2YHdSwIcyTHHRJjTVf9rqvs95bfxF9nYcqpldvMO9DfZqQRutW1rBcu0mJWpd1
         E5ACIHkSCBFM8LVYAfikdjPa1kwH3iwbBt/u+EdCQiTKMoU4xbyNX0FVDWctDFKCOoCV
         YkWWoLnguiu5BYQRThNKfCCKykIb9R/+XVAy+2Qhx/EVc6xPUhgGK8giHwJezvFCu5K3
         z8bwY2UkhZGi5VfWb/igtLWn5qRcP6g5SQG98szsalsoFL6WagCt4/lUARVkVFl90n34
         xAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDbMdnvuwBtrk848WVCB2hK3ubrSFKK8fluyE85oQ2g=;
        b=a46ZyPVRKbKBW4bDXSIY3CPIlAwXEePuGZMY5+yrYnh4ZYx4IfVbfcYhwRva+FjUHl
         vsbWhFW2TpbtguWklr2dAEI//o4QZO7IH5bdiJHs/ipUORUTiac/xVZS5w0JG+MOEqZG
         H8SM3w7ARRBNHf4qYECxkN4RLrvEei3oTm/0MLfa2kWFw3/DDmTcPYkmrdYNsfM02dk1
         D8XIAu86TZQKse+CPecSBKsRkacmJ0qCVFJyB/Yq/tf7Ol2IsE4fBU96lXn5CT8pFaCE
         ykq/CQ1cvauLYNsB4OO3DxZXLBtJdIjjWx6gOjTxrIl1UMKmmUZyOxrmjTwxQFtTFfBY
         4OpA==
X-Gm-Message-State: AO0yUKVeQIzXtD8hI/MBC0B1Qp9VVUejgWTpT5cdaRmk7iTSmj5nn38A
	ctaE4p7DQCJFlf3AewxY+aqfgVNUrHo=
X-Google-Smtp-Source: AK7set+CnNrwk8LPx9dbGVZxq7VsBc3oO6+NqpFd762GyjWSVQqp48PGSRdHziCWnsv0DZNlriaJDA==
X-Received: by 2002:a5d:4088:0:b0:2c5:5870:b589 with SMTP id o8-20020a5d4088000000b002c55870b589mr1566373wrp.14.1676835065308;
        Sun, 19 Feb 2023 11:31:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/39] scripts/oe-setup-layers: do not clobber json module with a variable named 'json'
Date: Sun, 19 Feb 2023 20:30:24 +0100
Message-Id: <20230219193101.338397-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177345

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-layers | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 6c02262663..c8012fa670 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -112,10 +112,10 @@ parser.add_argument('--jsondata', default=__file__+".json", help='File containin
 args = parser.parse_args()
 
 with open(args.jsondata) as f:
-    json = json.load(f)
+    json_f = json.load(f)
 
 supported_versions = ["1.0"]
-if json["version"] not in supported_versions:
-    raise Exception("File {} has version {}, which is not in supported versions: {}".format(args.jsondata, json["version"], supported_versions))
+if json_f["version"] not in supported_versions:
+    raise Exception("File {} has version {}, which is not in supported versions: {}".format(args.jsondata, json_f["version"], supported_versions))
 
-_do_checkout(vars(args), json)
+_do_checkout(vars(args), json_f)
-- 
2.30.2


