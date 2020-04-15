Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.17266.1586966182106119261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 08:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UHOFo1US;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id o10so13604276qtr.6
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kgaj6iA1uLNpWvtUmkEUf99UNAtg7XZD6HFNXkl/4bU=;
        b=UHOFo1USi6w4BU9RXDElbofrLmffx+DDyMlmNccvQ1StQvQXes5uauUqmSq5/RfqLC
         izL0YLLttDpcgH55MOaeQsPe4x5gDfWlzCqvfmHvi5kRgOMZTMdNfkOdZa472lN8lbVa
         DZwc6pEJlyiQMQGRw0a3zL26YUSaD1IEOKw1ouLfivUjKQD/08dHczZ5TF0jgdhGP1Os
         /82WMCyulUTtbXiboUbOCJzr1hXhqgZi9D0rObkZt6r8o1OQpQOhUj1Hg4S/Bu96FDiD
         DHewg7P9n7QBevlaQ2O8Yg9AIc3N8hOZiaMLfy5EYIjunhCD90nm/+M7lmHs64wDINLk
         a+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kgaj6iA1uLNpWvtUmkEUf99UNAtg7XZD6HFNXkl/4bU=;
        b=PSlky1KrcuHR/CVQKB+kPkvB9+wMhZ+N2U7b6ww9RXoQEXxUP0wEDdFhZMa2RNJ5P6
         1rtlXkCbFoh9A5nx2pzjWHgMVsN78X0w3tZz3EhXAkjlkNyEwh+xZ16pw9qMRNfxJA1n
         1W7mpMmEju8/+I4XSeAawCNsThTkA8N40C2Sj4N6/Lu4LrjYsFv/c/SCyvwbZGc/dILn
         DcHmeD7awMqPvhQ3G+bsx9NfF0tNZj3b+0QZ3HpKZ59pSIrui4hY53N/pdVsoRy1Yjkz
         0wX8FwRRhDNsPCAv/VqrpKctjNp+15c8yPoq0pAR4PYPyFjyhIxFWobt0nD55gqlTpnP
         Oxsg==
X-Gm-Message-State: AGi0Pub3HjPNApbK+KaL9LDjeELD+hPcvW0dnhppmszrPZDa12pw9JjU
	MvwO+eiU9NYRWeD094yvuDlLycDH
X-Google-Smtp-Source: APiQypIPBfxO8FZv7L9GRyNPuoGJl6jxKHyb7an1dyN4VcHNas7DlRRZPNd7fDLQcNenyREwEvwdCw==
X-Received: by 2002:aed:2e24:: with SMTP id j33mr21520094qtd.117.1586966181085;
        Wed, 15 Apr 2020 08:56:21 -0700 (PDT)
Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mbedesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id i2sm5296781qki.54.2020.04.15.08.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:56:20 -0700 (PDT)
From: "Maxime Roussin-B?langer" <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jeff.dagenais@gmail.com,
	champagne.guillaume.c@gmail.com,
	=?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Subject: [PATCH 2/2] tzdata: remove exit 0 from pkg_postinst
Date: Wed, 15 Apr 2020 11:56:10 -0400
Message-Id: <20200415155610.5579-2-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415155610.5579-1-maxime.roussinbelanger@gmail.com>
References: <20200415155610.5579-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation says that if you exit 0 in a pkg_postinst it will marked as
installed.
If you exit 0, before running postinst-intercepts defer_to_first_boot, the
pkg_postinst_ontarget script will not be present on target.

The "exit 0" in tzdata makes it difficult to have a bbappend with a
pkg_postinst_target step when you have `INSTALL_TIMEZONE_FILE = 0`

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 1e2d9bd1b9..1e2b440fb0 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -60,12 +60,8 @@ pkg_postinst_${PN} () {
 	if [ -e ${src} ] ; then
 		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
 	fi
-	
-	if [ -z "${tz}" ] ; then
-		exit 0
-	fi
-	
-	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
+
+	if [ ! -z "${tz}" -a ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
 		echo "You have an invalid TIMEZONE setting in ${src}"
 		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
 		tz="Universal"
-- 
2.20.1

