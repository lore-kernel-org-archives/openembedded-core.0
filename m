Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 622626026D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 22:37:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v4so6537632wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 14:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MbpxstCbvyH86fRaLTw2P/alVissgvwRQKAXomuGasM=;
	b=PSp7eVNgfezu87NqtPMb3j0tFJB96CTn+sD3H6ss5/jqSyC7A/6kixpJ6FPPOPu4At
	5viFKFXj5Y993zfFB8bGB5jm9ZmGA1Qssk+o0YUjrbazGGxtkFtxA60RCVOhy3GNEfaM
	5LJfHIk+XMp3tzLAOQaW7Owq/lbfx9HQRuQXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MbpxstCbvyH86fRaLTw2P/alVissgvwRQKAXomuGasM=;
	b=Vm3GaoJrABBQ3trQhO+7V0ZlW4j/SeOTyQZQm6WzdmAYXZACQs3qNc8ncOO2YzwgQr
	9mKRXbsfGiAi+EQ5s1AHcD1bgC4hCCwMUHGS07QPqwfBC6+xwKR6sDRRua19y/FQEFB9
	h99K52EyCC+v2mAt9yaJySPVjA369+o7wOBwTnQPE1tW1Opz0PLe5QNsBaKUSm/5IFf8
	CvdLw335CzzQRIC9a2EQWNsLRtYNbJFvLo2/wyZDMKMapXrd+FR7VpOMTa8TJzqWEv6v
	yFVDagHe3kuelkESp5JR1Nuc7qUJwDCPPbpylhrpbmpCnEArWesrwYQN3kUDsp12Gl62
	tZTA==
X-Gm-Message-State: ANhLgQ13LXrlVqeQPQXjtR2dIOoTMQ1iXCWczp03qQfvCJPiwTN5KkSK
	HoZ502ct4kjAsViCc71wj6jstFO9XYE=
X-Google-Smtp-Source: ADFU+vsoyj3jCVYEcIVumNDHkmwYL+oTHurpl2p91U/jqYP1ncT8oWh42iuAAQw9qJ6VGEZd5ZkaxA==
X-Received: by 2002:adf:b317:: with SMTP id j23mr11491791wrd.413.1583620671035;
	Sat, 07 Mar 2020 14:37:51 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q3sm18459574wmj.38.2020.03.07.14.37.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 14:37:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 22:37:48 +0000
Message-Id: <20200307223748.1178851-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200307223748.1178851-1-richard.purdie@linuxfoundation.org>
References: <20200307223748.1178851-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] reproducibile_build: Fix SDE file generation when unpack reruns
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
X-List-Received-Date: Sat, 07 Mar 2020 22:37:51 -0000
Content-Transfer-Encoding: 8bit

Currently, if an existing TMPDIR is rebuilt, do_fetch/do_unpack can rerun
but SDE would remain unchanged. This leads to different results compared
to a fresh build. An example change which triggered this is:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=cb4e69e6346a9fbeebf83a5d5397cacbd41d48b5

Instead, delete any existing SDE and recalculate if we're reunning.
Also rename and drop the do_ prefix since these are for tasks,
not functions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/reproducible_build.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 750eb950f28..8da40f656ac 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -150,11 +150,12 @@ def fixed_source_date_epoch():
     bb.debug(1, "No tarball or git repo found to determine SOURCE_DATE_EPOCH")
     return 0
 
-python do_create_source_date_epoch_stamp() {
+python create_source_date_epoch_stamp() {
     epochfile = d.getVar('SDE_FILE')
+    # If it exists we need to regenerate as the sources may have changed
     if os.path.isfile(epochfile):
-        bb.debug(1, "Reusing SOURCE_DATE_EPOCH from: %s" % epochfile)
-        return
+        bb.debug(1, "Deleting existing SOURCE_DATE_EPOCH from: %s" % epochfile)
+        os.remove(epochfile)
 
     sourcedir = d.getVar('S')
     source_date_epoch = (
@@ -197,5 +198,5 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
 
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
-        d.appendVarFlag("do_unpack", "postfuncs", " do_create_source_date_epoch_stamp")
+        d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
 }
-- 
2.25.0


