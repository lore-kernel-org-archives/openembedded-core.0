Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4696BE2D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Jan 2019 18:14:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id y11so28593066lfj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2019 10:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Bgt1QMb12Iaog87rhJ3Gvfu5XEkAsKrUu0e+wjMtZCo=;
	b=iKPtos6yMXrq256fFxz91OTlozLWXTGc5Da9+82zw0SQiqkWipElg8ACylogWWkfDH
	U1G3bsr6Wv7KOMnNCHyMbao8Hn3d8M8L8bfWkBKhTlGkulqz1mAe/IQYxm0RvP9PTzYc
	BNep0gJWp7/+t4GLn9A42+E1rzNN2R5gQR6J8PaT+auVAhcNovVAUQtu2Ujv79T6H01Y
	/u9MrHyXiz9WczuHYzIzbsBte4kzPxp2LM+OIfbQs2aYyVEtSHQkJducw1V+J9WifvdV
	zGbtOjZXcQc4WWr3KwWXs24F6PkCLYaYV17636TNGildHsQv3CpCGJrKiLos0iTqESoT
	3JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Bgt1QMb12Iaog87rhJ3Gvfu5XEkAsKrUu0e+wjMtZCo=;
	b=S9FlGUUV7r+R09fsYtmxF45/QYLqsABOb4ZHzsIP1UGjnwGARK9ug8TWib6fJ6H1/K
	voFCCh80dGvUnEvKWfFedZOOcjaHHkTxbrcaXv0Wqf6H6XbrLBJM9je41ChqeVMrrbx4
	hvJwPzq0Hx1Facb1UMVui2PKgPnrS6o/7ApotNwtXlPLmg7Tuzexq3dw/+AZSPhkJRdt
	Hce4uFcIge6jwydLeKli5G3fPiNRrkcp7IYspYQaJdDJCqxIIpS0epKtX38FBfGOKNci
	xbiatYTB+xc1uXDfvGDXDsdLA4r+PdWHLNS4aMvjWmS02KQV1NfixGuas/sTo9rjGeB9
	N1sw==
X-Gm-Message-State: AJcUukePO1c64wryow5AOjxGbc71EwAEk3PqW1hwqzSyf2R3Cjh5YLNl
	leg7vvmgDLLrw3L3I7AZERv7jEC5
X-Google-Smtp-Source: ALg8bN5lhBn1BJMr1vuhkNnuzSmj0mtsupGWc0QkljkUBm285l2VOP3R76rIbxgMfvecqD1x1IJRhQ==
X-Received: by 2002:a19:c413:: with SMTP id u19mr22236934lff.100.1546798462385;
	Sun, 06 Jan 2019 10:14:22 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	w9sm12295175lfc.66.2019.01.06.10.14.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Jan 2019 10:14:21 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Jan 2019 19:13:49 +0100
Message-Id: <20190106181350.25386-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [RFC][PATCH 1/2] buildhistory: simplify buildhistory_list_files()
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
X-List-Received-Date: Sun, 06 Jan 2019 18:14:22 -0000

Avoid duplicating shell code for the two cases, fakeroot/non-fakeroot.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/buildhistory.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index d1f3e6aa82..33eb1b00f6 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -519,12 +519,14 @@ buildhistory_get_sdk_installed_target() {
 
 buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
-	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
+	# This is somewhat messy, but handles where the size is not printed for device files under pseudo
+	( cd $1
+	find_cmd='find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n"'
 	if [ "$3" = "fakeroot" ] ; then
-		( cd $1 && ${FAKEROOTENV} ${FAKEROOTCMD} find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
+		eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
 	else
-		( cd $1 && find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
-	fi
+		eval $find_cmd
+	fi | sort -k5 | sed 's/ * -> $//' > $2 )
 }
 
 buildhistory_list_pkg_files() {
-- 
2.11.0


