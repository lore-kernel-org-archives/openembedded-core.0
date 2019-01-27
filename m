Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA107C3C4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 11:20:13 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id c9so15603987itj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 03:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Ud9aWlIXO/DEfphiefjQnWmkqRvL0F7d3uEVDB4dkcE=;
	b=hTMLgjNXgopK0RaCJKvLPImDxCkAA0FwedOMA0AgdqqYnM5HGc5B90WQLhT5Tkwrnp
	cxY83WpGGjbyY8V13+RngtSsyxKlEXG0vEO4ZZeAuQWYD7nb5W/Ra6Ub06eYlkmORe97
	jNFkzhwxPY9HNJ4WPbT6V0DrIYm+gqTfg2TJu7G8YO3CIwebqteAxlD+Ubcfnq7spZqg
	cwU8GY+/gr5fQkVO37EDnpMAfpKmdeqU30GPOMWNbMPw8wljtJPzyc2I5K0G1MVKPc+t
	hFYzqh4nZWbUuvK8UOV7pc4Ea55eZk+sHIHZ22cG4Y7VKW/TzkDNyUMxIus7CQ4soUPa
	7aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Ud9aWlIXO/DEfphiefjQnWmkqRvL0F7d3uEVDB4dkcE=;
	b=PgNDjhcomHd2Be514zQcomb2T8vNOUliLvjzwjUJUywjzF1y5EagPOezF/OA2Xn7C6
	7SOZfazvYARyynd9dAJLehGnORHmGSRa/RLxvUqAn0dibOC/iggkAVv2Vz/BQFs5eM1w
	UwdsbzTH3rFATbDkwVZsrZFBvkaZHfUauPG77R7UnvPK37lv4eMsN5vO0AXRFf/uJXpP
	kmNwFgDT6+uKxUmUBl/MwfLOhFGgn6/APGrgryovu/67IDVhyoAZy1n9V6XUqnEm1pIA
	PMEG4vICBR16rxHHoQ237+xIyvYWw3gHH712nzU/6r0BsufK2T4eUEPgeO4lItDosnYy
	U6QA==
X-Gm-Message-State: AJcUukd1DLhinqc1z+rJlE8h12xjENlN8WuaP1DKIdKAt/NPKxrqEiHY
	qEJE9BnIhQtA+sz/ebyZ5UJeRrIsJ8g8qMrQb7cWnFED
X-Google-Smtp-Source: ALg8bN4VZcXO2H11122GyzTx6EAeI1Pf8m4zHrJjBIBhbcUQsl7sTSBGmMFsaFp+eiyzbSl/wBiHoBn5x8zUz4DXf0E=
X-Received: by 2002:a02:3003:: with SMTP id q3mr11332738jaq.16.1548588014223; 
	Sun, 27 Jan 2019 03:20:14 -0800 (PST)
MIME-Version: 1.0
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Sun, 27 Jan 2019 12:15:56 +0100
Message-ID: <CAJkqNs1k-3FpBQQ7HUvx2H7-bDr27DiAGBEcriP7v=hE8tn+uw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/1] gcc-shared-source: Fix devtool missing patch/unpack tasks
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
X-List-Received-Date: Sun, 27 Jan 2019 11:20:13 -0000
Content-Type: text/plain; charset="UTF-8"

Devtool needs to execute these tasks so we cannot disable them
and if SRC_URI is empty we don't need to disable them anymore.

Changing task dependency so that sources are extracted when running
devtool modify. Setting EXTERNALSRC so devshell can find the shared
gcc sources.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13036

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc
b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index aac4b49313..d8967b1e72 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -1,11 +1,6 @@
-do_fetch() {
-   :
-}
-do_fetch[noexec] = "1"
-deltask do_unpack
-deltask do_patch
-
 SRC_URI = ""

-do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
+do_unpack[depends] += "gcc-source-${PV}:do_preconfigure"
 do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
+
+EXTERNALSRC_pn-${PN} = "${S}"
--
2.20.1

