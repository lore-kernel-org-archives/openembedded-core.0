Return-Path: <lucas.dutra.nunes@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8969E7317E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 13:15:26 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id b67so141076693qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 05:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/XIE2Jb+EyIV1n+aliDHuyPBV3t/gxp4faSmrp9tNdQ=;
	b=GatJgLmmVPpGuBZSCcccKzp7sl7uTfTXlnU5G0c0LAMtEahos8uW0ev1qiCLfrvVox
	tV6ZMwNBbQ/iRBLX7l1yFeSZmfsh1d/J9qad244MRIXrcjjiIihkv31iXQ6PoSJi4lsw
	ekskP/dSkIh01U7yQlpsG2zuBYxg2YZm2J9P/q4qW1hRokWsHA/Gek/KckbejqGp/emc
	EdkNMGKuDWGrJysgQzpMPM6N8fefe+wf2F4bImC/CdFPpue/I874KCX+th36IphwR9PX
	02o1OmXYxrgi3THgRmf4AvyzzpPJPpfkOdoq8EZpyL7wYgIPCebgJ6KFFkYZBX+sBRsi
	FFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=/XIE2Jb+EyIV1n+aliDHuyPBV3t/gxp4faSmrp9tNdQ=;
	b=UMYijgxTPYJApZtrZoxO8XKNq10GqujYdwrlZMAHo9U/UZPPOs3zkPdMvwF5i62vRj
	8KpAsNIz+lEE+0TPli7L+n8YcrIw16Fjlc0OT3QH+3tFAKFzDblvhrkHzeQIOcnv8ATL
	sGU6GYvXXEyy6csy/I8niBtoXX26X90MeGf9I+SB0i4TkXy9MhrPsF1ukHefj9+Uy4Xo
	ERiNtYjkyAsPFXj1J0mCamiQPeo5sN6zR202IooVKaqsNMRN5n5ZlzoTTrEblbxQmZdn
	BNgJOo07WC9i7DiD4Vet5bES50ADzXZ3GeTAu3/bS9l/KDpyDW1FWvYBU5spf7m5AOEu
	GOkA==
X-Gm-Message-State: AD7BkJK3e5dXTKnLtNLpwNdC382zeK1/aBhh/gKN4hW4M7AdwW4ywfgK+qg7S2skMJgfpg==
X-Received: by 10.140.99.72 with SMTP id p66mr26127111qge.16.1456838126821;
	Tue, 01 Mar 2016 05:15:26 -0800 (PST)
Received: from ldnunes.lab.ossystems.com.br ([179.105.251.106])
	by smtp.gmail.com with ESMTPSA id
	j67sm12905428qgj.35.2016.03.01.05.15.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 05:15:26 -0800 (PST)
Sender: Lucas Nunes <lucas.dutra.nunes@gmail.com>
From: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 10:15:16 -0300
Message-Id: <1456838116-10650-1-git-send-email-ldnunes@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Subject: [Documentation][PATCH] Server comm: try connecting 4 times before giving up
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
X-List-Received-Date: Tue, 01 Mar 2016 13:15:27 -0000

Instead of trying one time with a timeout of 20 seconds try 4 times with
a timeout of 5 seconds, to account for a slow server start.

Signed-off-by: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
---
 bitbake/lib/bb/server/process.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/bitbake/lib/bb/server/process.py b/bitbake/lib/bb/server/process.py
index 1e2b824..e387b30 100644
--- a/bitbake/lib/bb/server/process.py
+++ b/bitbake/lib/bb/server/process.py
@@ -53,10 +53,12 @@ class ServerCommunicator():
         while True:
             # don't let the user ctrl-c while we're waiting for a response
             try:
-                if self.connection.poll(20):
-                    return self.connection.recv()
-                else:
-                    bb.fatal("Timeout while attempting to communicate with bitbake server")
+                for idx in range(0,4): # 0, 1, 2, 3
+                    if self.connection.poll(5):
+                        return self.connection.recv()
+                    else:
+                        bb.warn("Timeout while attempting to communicate with bitbake server")
+                bb.fatal("Gave up; Too many tries: timeout while attempting to communicate with bitbake server")
             except KeyboardInterrupt:
                 pass
 
-- 
2.1.4


