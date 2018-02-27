Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 2092 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Feb 2018 19:21:55 UTC
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 3D93B78563
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 19:21:55 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w1RIl3Jd003156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 19:47:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1519757223;
	bh=D7QYsvxQrLJN+Qvf4g4DAAs9UYJuDX30PvS6yQUGR2I=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=Bfxlcc+mSBirzVWrdqOm9HtEUt8F4/u/bL+mEM0gvGi4W4UqdCkFwR7GX9vmAAiw6
	62PulMz6bMQEI4MrjdLKwvKtsf0m7VBMVOBWBxEzz9Z8lMjGbGa++hA3566YGCgmv+
	YBtBruTNuj3xQfL5KQQ1Hz+8ItWY8HdMcWl9gukA=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w1RIkt2n014784 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 27 Feb 2018 19:46:56 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 839652973D8;
	Tue, 27 Feb 2018 19:38:09 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w1RIksDv014781
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Feb 2018 19:46:54 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.89) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1eqkH8-0007tW-3B; Tue, 27 Feb 2018 19:46:54 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 19:46:48 +0100
Message-Id: <20180227184648.30304-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.14.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.75
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.83
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] oe-init-env: search 'bitbake' outside of oe-core
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
X-List-Received-Date: Tue, 27 Feb 2018 19:21:56 -0000

atm, 'oe-init-build-env' expects 'bitbake' to be within the OE core git
repository.  This complicates the project setup because you have to
manage the 'bitbake' directory or symlink manually (or specify the
bitbake location explicitly).

Looking for 'bitbake' outside the main git repository will ease project
management significantly.  Now, you can put everything into git submodules,
clone the project with

| git clone --recursive ...

and continue immediately with

| ..../oe-init-build-env

E.g. when you had previously

| .
| |-- build/
| `-- sources/
|     `-- org.openembedded.core/
|         `-- bitbake -> ../bitbake

(where 'bitbake' must be created manually after cloning the project),
you can have now

| .
| |-- build/
| `-- sources/
|     |-- bitbake/
|     `-- org.openembedded.core/

which is completely managed by 'git'.

Patch adds $OEROOT/.. to the search path for 'bitbake'

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 scripts/oe-buildenv-internal | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 77f98a32b9..6773872326 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -101,6 +101,7 @@ unset BDIR
 
 if [ -z "$BITBAKEDIR" ]; then
     BITBAKEDIR="$OEROOT/bitbake$BBEXTRA"
+    test -d "$BITBAKEDIR" || BITBAKEDIR="$OEROOT/../bitbake$BBEXTRA"
 fi
 
 BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
-- 
2.14.3


