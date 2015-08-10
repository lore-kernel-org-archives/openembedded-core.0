Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 398 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Aug 2015 15:28:08 UTC
Received: from root.phytec.de (mail.phycore.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id DFD5276873
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 15:28:08 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id CBCC6A0032D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 17:23:21 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015081017213007-138124 ;
	Mon, 10 Aug 2015 17:21:30 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:21:30 +0200
Message-Id: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 10.08.2015 17:21:30,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 10.08.2015 17:21:30
Subject: [PATCH] kernel.bbclass: Fix do_shared_workdir task ordering
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
X-List-Received-Date: Mon, 10 Aug 2015 15:28:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

commit 02d0a003d60326 [kernel.bbclass: Fix race condition] has surfaced
a bug in the generation of the shared=5Fworkdir. The task
do=5Fcompile=5Fkernelmodules adds the exported symbols of the kernel modules
to the Module.symvers. By creating the shared=5Fworkdir before the modules
are compiled, the symbols of the modules are missing in the
shared=5Fworkdir. Subsequent external module builds will not include the
ABI CRC of functions exported in modules. Modprobe will fail to load the
external module if CONFIG=5FMODVERSIONS is enabled.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d06f6cf..473f1f8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -249,7 +249,7 @@ kernel=5Fdo=5Finstall() {
 }
 do=5Finstall[prefuncs] +=3D "package=5Fget=5Fauto=5Fpr"
=20
-addtask shared=5Fworkdir after do=5Fcompile before do=5Fcompile=5Fkernelmo=
dules
+addtask shared=5Fworkdir after do=5Fcompile=5Fkernelmodules before do=5Fin=
stall
 addtask shared=5Fworkdir=5Fsetscene
=20
 do=5Fshared=5Fworkdir=5Fsetscene () {
--=20
1.9.1


