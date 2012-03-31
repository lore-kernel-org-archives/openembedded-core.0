Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SE6aT-0005pz-ES
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 00:15:57 +0200
Received: by wibhj13 with SMTP id hj13so1500279wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 15:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=x/yHyWlk2Q+DQQ7LUxsdfu9zeiEm4S3Bkc0MUZ6Q5Kc=;
	b=PxigrGsSH8u+EK/rwJml830shO/JP9yPJvCUav5/tQO5/xsTj6a3oKcbRxHYGa8JWd
	KcC3avbcIPDvOcWY1KMpyfCtvlt4oy7Fdv9QaTaAIHqbD3lu6aTfEBPRQd/97iqnM7SW
	CkaxGSR6sju79zbHPq/OGs5mgTS55p609s7uMDxCWxwT4FHx8YpTzPhVAfTAnsx26S/G
	NgXGdtY6fQrhkNEoO98J0nkXXcGUI3abyrlf4trLATmiAzlPQjFOuFACTD/Bc+HxAoXE
	sMGg/L7Ng0Yig5xxdYdcvnuJg8pEpXB/k2/olEc31QCIWEXCPCWD/Gjy9cJKj1Apx0Qg
	mSwA==
Received: by 10.180.8.231 with SMTP id u7mr9645060wia.9.1333231611498;
	Sat, 31 Mar 2012 15:06:51 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n15sm19728045wiw.6.2012.03.31.15.06.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Mar 2012 15:06:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2012 00:06:43 +0200
Message-Id: <1333231604-24561-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333231604-24561-1-git-send-email-koen@dominion.thruhere.net>
References: <1333231604-24561-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlbNUDYMy1cz48uFXe2tacT0IggcNg/fJb9IfzqxJgvtuIU2A1J+06kgfR0dWIQWiJUxoEZ
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/3] buildhistory: record all builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Mar 2012 22:15:57 -0000

When nothing has changed an empty commit prefixed with "No changes" will get generated so that the commit log of the buildhistory repo provides a complete log of all builds performed, not just those that resulted in changes.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/buildhistory.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 386c32c..2224340 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -405,6 +405,8 @@ buildhistory_commit() {
 			if [ "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
 				git push -q ${BUILDHISTORY_PUSH_REPO}
 			fi
+		else
+			git commit ${BUILDHISTORY_DIR}/ --allow-empty -m "No changes: Build ${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on $HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
 		fi) || true
 }
 
-- 
1.7.2.5



