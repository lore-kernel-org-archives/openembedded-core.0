Received: from nm6-vm0.bullet.mail.ukl.yahoo.com ([217.146.183.234])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <cristian.ciupitu@yahoo.com>) id 1SkbHv-0006bV-RG
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 15:31:07 +0200
Received: from [217.146.183.209] by nm6.bullet.mail.ukl.yahoo.com with NNFMP;
	29 Jun 2012 13:17:36 -0000
Received: from [217.146.182.75] by tm2.bullet.mail.ukl.yahoo.com with NNFMP;
	29 Jun 2012 13:17:36 -0000
Received: from [127.0.0.1] by smtp106.mail.ukl.yahoo.com with NNFMP;
	29 Jun 2012 13:17:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1340975856; bh=YPvMT0pM8xZiSKffQy3Q15/WcPqKGBoomIticH0fIeM=;
	h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=4Z5wVo30J4dMVBYlSNJvLFs2LOTKakskq/nGpxeiSxWgctANYiAlNLtPoPBhicHaKc4zVDM5kE32hSF1HSCMo5C7Znu7wkszN9TL8KQYG4NbFJ+NHPAPijwBdvGNTCh1uj8TPeH2SmL9d6SWf74wK8ektKbNDvPitT1phwXNkH0=
X-Yahoo-Newman-Id: 813804.12040.bm@smtp106.mail.ukl.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: n9XrxsUVM1neFIJT89c1TTFGVrCh3jtDOHKeSd97k25STPE
	SNZsvh6p9Pq2BhTEhVmTs.sojgCfCOrZG2tecCo_F1OcqjrcHjLewVotqBy4
	raBwa1o3A3_Eb8tN3VqpL7zlK0crRLB9wa6rGMbav5ukga97lZTSd0r9.06W
	POLivCFpDaQDJr2RtrI80SghjqJwittfUTP1wYzjU65x1BJYyHQIqqtqlbve
	CAGbFY0CfQ78CDAoGlKuD5WUpPETbyIQtdMZX69__vHXwHi1fdWkKZ3qdp76
	GIXE493mV0aEXxcwDgqbKMQL9509f0zaBWUCzn4OLzbaX0tVcswqR2b6cbTP
	0FWT7P7N1ChsGBOxmw88wFw6ZyeOrSRrNTunJW9n0iiX_HFVO5FNxHNd5L2g
	LLx3d3U9Co_e3dyI.AresFQr3.rl21no9GNUQwdC4m8JDpwgIsAxKDB04gxw
	WLL42QZOJ30S5YIgI.4e8oNLi_XgglhoUTjWVtS4mBiEJpTrwAfqe
X-Yahoo-SMTP: QIDLLbuswBAf6HlXasbQ.RprPQDjUqWGJ2GDeck-
Received: from hermes.lizeanunet.tld.ro (cristian.ciupitu@81.180.234.249 with
	login)
	by smtp106.mail.ukl.yahoo.com with SMTP; 29 Jun 2012 06:17:36 -0700 PDT
From: Cristian Ciupitu <cristian.ciupitu@yahoo.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 16:17:26 +0300
Message-Id: <1340975846-14579-1-git-send-email-cristian.ciupitu@yahoo.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] runqemu: fix fedora pkg names when run fails
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
X-List-Received-Date: Fri, 29 Jun 2012 13:31:08 -0000

runqemu can fail to with the following message:

    You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
        Fedora package names are: mesa-libGL mesa-libGLU.

The libGL.so and libGLU.so files are provided by the mesa-libGL-devel
and mesa-libGLU-devel Fedora packages (yum provides '*/libGL*.so').

Signed-off-by: Cristian Ciupitu <cristian.ciupitu@yahoo.com>
---
 scripts/runqemu |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index caabf61..776f885 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -408,7 +408,7 @@ test -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so && li
 if [ "$libgl" != 'yes' ]; then
     echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
     Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.
-    Fedora package names are: mesa-libGL mesa-libGLU."
+    Fedora package names are: mesa-libGL-devel mesa-libGLU-devel."
     exit 1;
 fi
 
-- 
1.7.10.4



