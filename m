Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAC6C369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.8290.1745982028734820121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DDuGIxmt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22438c356c8so74107255ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982028; x=1746586828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AwPGRFU2tOkWQV+jZ0BCoPeVGS/6z98Ky4fwu5O/FI=;
        b=DDuGIxmt89dl8LMBZ/92NBz3LwHXLmxd9iboxfzftZp0Y150Kp42ULweCm4IPRLc44
         umQSNp7lype/hMtcKk3nxqSNIbmnUI9hhI8w9XlsH43qrnJ+BqfxrA9OXL4jwWmgUAnc
         5txSF05qZSjsuL0G37hZ6tnQUwEkd5aX4dwNR77Wpa3D43tN5cZvop0gWqCQHR+BizJW
         uJ9ia32biwm47Pq6GVKt1U7PmlRfiWwbeiRVAO59cFNlLkza3a0ozvN9ZaOtrQqQEyU7
         KwNFFDCox2fPVUt2c8Fk9nBGo7qxyRJVxE/WAAbIL0+lTbs4G7dzt8PoYc6Ub1WSWnA0
         skJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982028; x=1746586828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AwPGRFU2tOkWQV+jZ0BCoPeVGS/6z98Ky4fwu5O/FI=;
        b=MhTqZpDNnNTN2msLPB2R5nmsf9kqUljsnpYpRBLXIIUKxUrhnXq7+RRUBpwCndEoZA
         joMcWCNB/QBxoucL5NcqldNa3mcksOZg4eMEUblWydcQMnpEzJuEAKhCgCzvzH334gTt
         2OFNMXB8RgMJS4q3iilGqi+JzS+r3tmmGYBrxl8mG43PzkwVl6SPrY+D8iIAsW4ZY5zq
         llZBE2hfbiP8fTW6UxZ9r7qrdig5Pit8VB3/eKiBDdsUEfhpdPuvpNGZDMcF3kK3Ogmz
         isYgd7x2IyXFoduDgb+JdbQG4wJn5ANVT/JLkH0pQ/ZzTB0uw/3+LHEYDKofgA02a9eA
         HeTA==
X-Gm-Message-State: AOJu0YxrlsVIuZ3a+iT8cQNokAKk2aKkIRrs8JBFXASiTDntVZ4CkgKf
	Xsp9atewqfrAisLBp5QEIbPJ3jLm9EktNv6iTRI2Ton9iEWmmXnVvPz9tCAxsrhqTifiYJeW0pm
	q
X-Gm-Gg: ASbGncvgwrxkLp5m08sOnEVu5n+rnvRCf4R2w9KA//g022Im7zvVrOibkKFY+1xetfk
	sqLzklihpnRvVGiWCWCJL9JpwgjffRNUIHmIkI9OdToQSoB+HTVSKOU9EenG1M4szAMKYIATN2r
	HTqHMEbQU+2OJFV+REBykQm0ljPbpyU6mTfSGvpq0QBweKDdLfcmOvYZDQR9sjGCkJzMa32C+U0
	MvJsDwb/6k/4F27MplP9T+9qmJjCEUqSXdFHOUAMTs4KTNk8XwV0htShG8UwbXpA2iF/PRSxeg9
	/ht+Tws1as6y3icFKpTcsZZptnTOYh5RQquIZ/IQLw==
X-Google-Smtp-Source: AGHT+IG9wqyc7OrXI1m3gyNC3WV3KmfNBdpW+h+kkzUrUNEYTWZkM8xQh4NCMIQxUkulows0egjeUw==
X-Received: by 2002:a17:903:2acc:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22df356f9d7mr22449215ad.37.1745982027898;
        Tue, 29 Apr 2025 20:00:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/15] perl: upgrade 5.38.2 -> 5.38.4
Date: Tue, 29 Apr 2025 19:59:57 -0700
Message-ID: <a9edffbd3c129966d4028505940ae6286273f399.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215715

From: Archana Polampalli <archana.polampalli@windriver.com>

update include fix for CVE-2024-56406

https://perldoc.perl.org/5.38.4/perl5384delta

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/{perl_5.38.2.bb => perl_5.38.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.38.2.bb => perl_5.38.4.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.38.2.bb
rename to meta/recipes-devtools/perl/perl_5.38.4.bb
index b6c9cda7ae..e59022e2bd 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "a0a31534451eb7b83c7d6594a497543a54d488bc90ca00f5e34762577f40655e"
+SRC_URI[perl.sha256sum] = "fb888accf8b50b5180e91166e5153608be294c57c19878e95f7659c1f1f12758"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.43.0


