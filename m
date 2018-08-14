Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF4A79029
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:32:51 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id w14-v6so8523075plp.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=droCivGEqKmogyNEOqR5rSfjanR3M13EO1/d+OM4zA4=;
	b=IoBeGvNXmnnl+h/3AFeOcaW7C4C4XbKiDZg55Mkx1ILd1tc2tU22+m5cVk7XJWndrM
	hoDaTVztZJ7IlazGlL1jaHjCw4WhQ7CuCMSnVH5funz2UoK2ab/jv3aDLuEbTqWdZvmE
	e3RC7j3LdK0oyv/fFt3JT4Q8mH19Cx9u7GJ/oSyzobCHwit43e6EuxLTL95JI/RT+9bu
	8EasPMgSgry1OMEe9ZL2aNnB6ZNx3NNzD3eAeHL29IBEFzkKl0L9CcdY3KJEfEuBmrzX
	7HaSbjA6VseJpyQYVTOGPJ6jPEasWjWDCKVzO0VktWSrrdDO8OgR4eVVcFaaD+ekuwI4
	025g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=droCivGEqKmogyNEOqR5rSfjanR3M13EO1/d+OM4zA4=;
	b=bq1w7jJFqjxz8reiXM7AEd+4hR88X7BLMNV5nzd1HfgMjhErSlFlO2tbnCcL4GgR63
	KXEhePxR5KpE5LNPu3Jjo1p9+5ixCu3xeYyuwdgRsm9WGQVgwK1ePxwYQmQi2vm04YmG
	bq/W85NpXx4+GeeXxSXnmp5st4HEeNyF3qx9TxF9s3IhtJ71wcwBkSOuu8Pkt0NpwUMJ
	EmJ8bHLL8H9cEpJPjBw2F52ZLpn4qRsg6w6m1pkI6B4s+KQBUNcO2VBHyJkbpYok/SVj
	MEpq3YMD2n1BB0QiQZKD6kJUi8ZslSvHntTnrgYsenYKDLSr29J9idcDODfQZN+pkWaw
	dvBg==
X-Gm-Message-State: AOUpUlHLMi44RI2ktTb/B1lDSdww24PuxyGxXoGgUkOfCIhB4hx/2XYT
	baMrNYJkiQb+xvQVWy5nvcYXzhXY
X-Google-Smtp-Source: AA+uWPx9W0HG4n+9zcVv/unzrl2s/vjwAHXn/JzvthR6POO9FaTThiaecBQ+d3leh3gyUt7BGAWXnw==
X-Received: by 2002:a17:902:70cc:: with SMTP id
	l12-v6mr21215979plt.132.1534264371899; 
	Tue, 14 Aug 2018 09:32:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	v6-v6sm41075345pfa.28.2018.08.14.09.32.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 09:32:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 09:32:42 -0700
Message-Id: <20180814163243.24088-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V4 1/2] musl: Fix dirent struct alignment issue seen on armv5te
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
X-List-Received-Date: Tue, 14 Aug 2018 16:32:51 -0000

- its a general problem however observed on armv5te based boards in OE
  other arches either have ways to compensate for misaligned access in hardware
  or compiler does not use 8byte alignment

- fix internal linux headers

Full logs
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb349b6591e4dc8cc89dce32277..1ad8138819ced49851e618c9c063aa0ffc86718c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v4:
Update to latest upstream master

 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b56870cb3f..c13371014a 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
+SRCREV = "1ad8138819ced49851e618c9c063aa0ffc86718c"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.18.0


