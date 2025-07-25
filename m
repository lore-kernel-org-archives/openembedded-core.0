Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DB7C87FD1
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:57 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.26745.1753469095844840168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1j6groIu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b271f3ae786so2049392a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469095; x=1754073895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzAxt/O2Fay1mqf/qQx9AHOhDhpUFstU1dd9oPxAxLQ=;
        b=1j6groIuab3b9BlAIQ5sKNewwHMpozRNUaucMYu7+PlOOo9g28OChI4y7Km3xX9J1v
         GPymVziqroT+jCG+TiTjYZrCDuRSPw7cLQXhcVkfOQyFZZXLGqXZhRSMheylWajUrW8s
         /xR3yBHKK5XLbbS1gAdIiChPHoxOGJpOWSd/bdEy+wOTCb2Ag6lhKNLBRdMgP2fMrV1U
         CIni2pszSMAAkVSj+9fFtHeBSQ3E1ytoiygfoLgJGiY+SO1A7RxDIAXT12wyCAdzaeXa
         28F85YynjzpcRPITVGN1TWB051r2vlEhQjV2Lpsut7cdAmqnV43Ca1NM4LlIGf6rtCYq
         fcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469095; x=1754073895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzAxt/O2Fay1mqf/qQx9AHOhDhpUFstU1dd9oPxAxLQ=;
        b=i4OasLbo1upxMONegX+RQjjDBZPhkGZgVkL9AekhecCy05wGUg9r60kAms28D6xeJI
         K/CebzJPLELsBDeuMg4MiZQKbljrX4cj9a6D9MvkOt2eYK7XQkMmSfnEhMUAtxDltkUL
         ArKkAU+6O2fA/lft7lfUfCPgTjosGFtaQfNNtdAZn5CST9Inu2Pxf898AZPvlfHW7szW
         AgzaFPmUit8YF+pD2AUufcFtmuKjBPjVB/nxK4Yxant4eOcEH7HAvnuK0SmB5E1KD81s
         JNkRRfY/gqlQrdNCv7557rj0ftaedKPy7pGJ1/1xW72ECk8QOM7VEcqcPhfFi69m2U+b
         m/Eg==
X-Gm-Message-State: AOJu0YwjoM1h0BJUo2yv9b4bzmRzntLx/ufe8yJWsdZpjMu3bIqQDZ/y
	VoUpLnrzw8BJJZaS4lKoycj+ZZRM6vcWFItRn1/y0c06sF8JOcqIF568FIAURxUxhN5cyRPUlzS
	PiW73
X-Gm-Gg: ASbGncttLWCRAEm1In7+rrneDiOTu4g/HcsjSsnIDJB4eWhrUyvpWiLygF21rdU9e+w
	Fk2M8kbZPrJ9+DnXcFB/y5FtQDGPx33nVmCS6yFR6BY8JQ8I+DcdSy/jgfJ14rxtP2/g3CsoELB
	HimJoBv6D9BXKTNxTT/N/H1tCn4XJvEfVZhNL9WF0R4eY7oN3OLGy6YGE/BuxJBRW1BD8k/M8tB
	g5IB+wclshIKo6Ht5zlX0/TmUfKZTvZS06kNnIJjbGxk778ac0kbKpwQhFO57epv+Eyii2puK0k
	4ThEPXA+qdwfWnxQAYKWbNsuYz0Lzi/PZfIVL9K0R2lZVfzmEvmp2zL+BCTAThImnUgT+mmjkE8
	4YVoJdzxCSrIGsw==
X-Google-Smtp-Source: AGHT+IEJ2/VNwUCKMKjaLx8GV7evY52AuM3Hw4q7on1JVqq0YEazIOL2VUphtKhleoeZ7glyd2ngqQ==
X-Received: by 2002:a17:903:183:b0:234:914b:3841 with SMTP id d9443c01a7336-23fb3164644mr40805535ad.39.1753469095079;
        Fri, 25 Jul 2025 11:44:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 12/16] mtools: upgrade 4.0.44 -> 4.0.45
Date: Fri, 25 Jul 2025 11:44:26 -0700
Message-ID: <77340d2bb1f31e305394df5d589fc0d3a0c5cd9a.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220928

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed iconv descriptor leak
- Fixed size of error message buffer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: cc1975888ffdc58655e80d3d14450cf68ee0f719)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.44.bb b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.44.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.45.bb
index d8dd671be2..34040d7a0d 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.44.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "37dc4df022533c3d4b2ec1c78973c27c7e8b585374c2d46ab64c6a3db31eddb8"
+SRC_URI[sha256sum] = "0b008a96bd0efe0e542fa4383d469af66bc4a93394990b103730a8160a67d618"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.43.0


