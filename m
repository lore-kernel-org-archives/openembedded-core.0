Return-Path: <dominic.sacre@gmx.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Sep 2015 16:20:11 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by mail.openembedded.org (Postfix) with ESMTP id 31AA176E2E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 16:20:11 +0000 (UTC)
Received: from dastp.lan ([37.24.103.185]) by mail.gmx.com (mrgmx102) with
	ESMTPSA (Nemesis) id 0MUCTO-1ZBYXg0pu6-00R4UA; Thu, 17 Sep 2015 18:15:06
	+0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 18:13:44 +0200
Message-Id: <1442506425-5096-4-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <1442506425-5096-1-git-send-email-dominic.sacre@gmx.de>
References: <1442506425-5096-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:f9UKiS8KweJAX7BfKuuDbLCWuJqvMqPk9Qtp2qrJ9akX+HEzOZo
	7bdzMffHyWIXm2f2oY8mxxDhGWQkanE4cWmluZjm4DFTbR3+0IZrepIf4CArzfAQvzZmVI+
	qvrxPhixaecGo3szyItnXDTaPKcvWp8/pNNoVOrtDecQ+VJk3s+DDoLLnKxQdahmTF0O0Mc
	MOHE+8NTgFyenGx47rJ4A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ZXSKai513Vg=:/Ml3ERpFkXFcNZu7WZg8tM
	7U6/40c/4hwfKzBjNy6qBMPscXmO0qtw7EOIgr4P0ouNiJRnN6nrQm7cADeOFaSjgGgijNrtM
	vDFdxW9KeArCcaSWrx21Vu7QwZ+xNeVqJs6MYQYX7izkkhh+pB5nhorLyc6O6cnB16JH333Ti
	gPqeQxgDvj/X4AQwcCIUXQzXTRG4/nwzz25OVypoFcodu4stJH7mM2B7O6TIaObySGgnLSLT5
	WCY6ceGoB+tZEKD30rlZWdGTuUS27ardnpivRPlG1Ixe2SVHdRD7AQ4J/RC4YIFcyzH7UvuR9
	aIKiaPRRAy80guLDBQVOaud3UX1hYYDmRD+hoJBGXISlc9izFd4Cc7kpBFkhL1gh7CNSvyqWM
	KLMwO8ajkc5+L9d79h8AziUS85sP8h96nMP5Jio0ZgkIjuVgHe1jwkxaBHJRAnCXuCKVGz8VX
	m4hRbfLrVl2lsEnDOsNbvXWlgb7Qk0ish0sKpgUYz8lwN1/eS8qrkwjvE5o+fo3img/TCuqqs
	O9vumd8eL3RuBpAPxSuFFSf1UG/F17R7QvDDcSCF1q9CnPvSzwx7aPEYrv5KvJtJdd16myrVv
	lI9ZSlMaSH3YUWVbJx0ykc5zbsVUJSQMAcKyvsnglbzJyG01hBsnvDHd7l1T06kGkqQCud7LS
	toSNdwyTMb7ov3Ja6h0F9aCKYwQw/ZAcZsmyHPyzQau3QB2eYg5o1pV/lYO86tzsWkJ00GV3W
	pbrS+ONk/o/PfiNJ45CV32zE74Pspyo0rYiJ7A==
Subject: [PATCH 3/4] gzip: fix install if bindir == base_bindir
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
X-List-Received-Date: Thu, 17 Sep 2015 16:20:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Don't try to move binaries onto themselves if ${bindir} and
${base_bindir} are the same, as is the case on systems with a
merged /usr directory.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta/recipes-extended/gzip/gzip.inc | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 94480ec..58e5e0c 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -10,12 +10,14 @@ inherit autotools texinfo
 EXTRA_OEMAKE_class-target = "GREP=${base_bindir}/grep"
 
 do_install_append () {
-	# Rename and move files into /bin (FHS), which is typical place for gzip
-	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/gunzip ${D}${base_bindir}/gunzip
-	mv ${D}${bindir}/gzip ${D}${base_bindir}/gzip
-	mv ${D}${bindir}/zcat ${D}${base_bindir}/zcat
-	mv ${D}${bindir}/uncompress ${D}${base_bindir}/uncompress
+	if [ "${base_bindir}" != "${bindir}" ]; then
+		# Rename and move files into /bin (FHS), which is typical place for gzip
+		install -d ${D}${base_bindir}
+		mv ${D}${bindir}/gunzip ${D}${base_bindir}/gunzip
+		mv ${D}${bindir}/gzip ${D}${base_bindir}/gzip
+		mv ${D}${bindir}/zcat ${D}${base_bindir}/zcat
+		mv ${D}${bindir}/uncompress ${D}${base_bindir}/uncompress
+	fi
 }
 
 inherit update-alternatives
-- 
2.5.2


