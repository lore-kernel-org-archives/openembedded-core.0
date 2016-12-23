Return-Path: <marcel@ziswiler.com>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
	by mail.openembedded.org (Postfix) with ESMTP id A09E471DC1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 12:43:11 +0000 (UTC)
Received: from marcel-pc.toradex.int.net ([84.227.37.153]) by
	mrelay.perfora.net (mreueus001 [74.208.5.2]) with ESMTPA (Nemesis) id
	0M6DOO-1cW8Ey0uOg-00yAFk; Fri, 23 Dec 2016 13:43:06 +0100
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2016 13:43:00 +0100
Message-Id: <20161223124300.27778-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.9.3
X-Provags-ID: V03:K0:WStX0puaH0CvU9h+c40Hberla6yWQkQWlZ34xN3ZAr3EJOTYVlZ
	zuaxvp0HwpwF8iiPOGrH2E5y/tSTiwV2KkWk0DflsgX74qTxZRjRxlqkyvrx+PDsssXjLf3
	Nk+emD/S4w7TT7FTGMz8fDoIeyfY8OI1KXq9CuBTmk3TiMvHMSxO+hVXFJcCrMSfcmLk0nx
	bA7CziS7ryrqdMpoj/nYQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:sqNbQo0Q7MI=:q4oqXDsqLZvxhYFYEjoT4P
	Tl3LkW99hoRCYrBPA2IkFZMnWocpW+cie2hTW+u4vTy/84x7DPhkkZ+MajQ8ZHuwpAPVexLR/
	fSW5tlaKcsnvzM2T/WecogoTcc/85hxPkMul4+F13dXHNEbvEpsyUx6dLl8fGLfIyoXfVbFaJ
	4yopC7fyDEt1jksIBuXOU+ej2G0UI7HIvCyY6S6QvheYqoHiJ5KXZoi9qSRUhyAoyft6K8ykc
	Y1+55XcamTLMeziIGcHxFZttiV+fRJX+y3ZSxahLNb6p3Yq5RREXDIATKlHoLsXWHDGoFOO0e
	65I2o+2fBhSDEuBMX/cHFiL4GYTKbdHZ+bE4HXfdzJCPcHdhrJeTpv79bvrCzVHg79umx0P58
	ywaXXHqi/YxgcGOWbuDJWMrZ8xzCv46dxVuSy+q1kN80NuqTm1KX6OlkAgPbC4QhgQoRVO7WB
	WNPdmsqCHhp/mzwJEN6B37AobIS1RF0TifrV0JV0U0YWeE8c+VvOjOomx7u3tUd/t7B9F2aSU
	oIbMpkagDsXUI6xIicpQgbuPxK9iIpkSckpPysyi6IdWvStujmb1Eu4kKkgLoiuTNPNKl4i8s
	mZ50v1XMqrF+Ta876k9knt2aRdQWlbbDM7+oQh/rUTS+JKyr/IWnjXGKXJgqw237C6T0yUGu0
	JNHa0vkz3jiX8F9Ut5nI8grUFH0/tfrkFaFN+jq2iQ5Ddthbl7FP97hzLRu3fCtnNp4A=
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Stefan Agner <stefan.agner@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] xinput-calibrator: fix operation on multihead configuration
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
X-List-Received-Date: Fri, 23 Dec 2016 12:43:11 -0000

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

As e.g. the Toradex Colibri T20, Apalis/Colibri T30 and Apalis TK1
modules are multihead capable and if HDMI is plugged in while the xinput
calibrator was run this led to the following error message:

root@apalis-t30:~# xinput_calibrator_once.sh
Unknown option: 640x480

Fix this by just using the first detected heads geometry definition.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Re-send after having subscribed.

 .../add-geometry-input-when-calibrating.patch                 | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
index 9dc94ae..296b075 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
@@ -1,6 +1,6 @@
-From 1cb83759632bb218559c4d0d65ff79f868c03dc5 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Tue, 9 Aug 2016 17:03:31 +0300
+From d4699c60c773e75a68227f82afea0b607667a4c0 Mon Sep 17 00:00:00 2001
+From: "Marcel Ziswiler" <marcel.ziswiler@toradex.com>>
+Date: Thu, 22 Dec 2016 11:34:31 +0100
 Subject: [PATCH] add geometry input when calibrating
 
 Send monitor geometry to xinput_calibrator when running the script
@@ -9,8 +9,11 @@ Update:
 
 Upstream-Status: Inappropriate [no longer maintained]
 
+Multihead capability update curtsy Toradex.
+
 Signed-off-by: Jonathan David <jonathan.david@ni.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
 ---
  scripts/xinput_calibrator_pointercal.sh | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -24,7 +27,7 @@ index fccb197..fea7c2f 100755
  fi
  
 -CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
-+RESOLUTION=$(xrandr | awk -F '[[:space:]+]' '/ connected/ { if ($3 != "primary") print $3; if ($3 == "primary") print $4 }')
++RESOLUTION=$(xrandr | awk -F '[[:space:]+]' '/ connected/ { if ($3 != "primary") print $3; if ($3 == "primary") print $4 }' | sed q)
 +CALDATA=`$BINARY --geometry $RESOLUTION --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
  if [ ! -z "$CALDATA" ] ; then
    echo $CALDATA > $CALFILE
-- 
2.9.3


