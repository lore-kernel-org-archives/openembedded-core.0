Return-Path: <afenkart@gmx.ch>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 May 2016 09:21:35 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by mail.openembedded.org (Postfix) with ESMTP id B63596FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:21:35 +0000 (UTC)
Received: from localhost ([89.176.167.254]) by mail.gmx.com (mrgmx101) with
	ESMTPSA (Nemesis) id 0Lubnw-1bkM1v1ZDs-00znGa; Tue, 17 May 2016 11:16:31
	+0200
From: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 11:16:18 +0200
Message-Id: <1463476580-17779-2-git-send-email-andreas.fenkart@dev.digitalstrom.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1463476580-17779-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
References: <1463476580-17779-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
Sender: afenkart@gmx.ch
X-Provags-ID: V03:K0:ZFlrn19lcRCkCtfYIdJpUj2GP0nRzxAXis9xHa3pFa+wKM7nvW0
	aknK70rVQrTME2TnjcUhwz/QTzfrX43lJVxX2EWtk2dj9/+gXFXAG2EpJOvL72wCS2LAaVb
	ZLpSEsWEr5OHFOhTkcdXmLQnOxhMYLj2JSzEd6M02YFm0hAs/FBJDWT+4Cm7+vylAZOMF70
	By4pQX+pVENSDqiof1XFQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:eHDQtZNGobU=:5Q8PfIiGSeRdOMpl91wOXQ
	F3LvlTAqWBk0Hn5Cmfo8GH5sPc6pp5OwZi+UIcslQKdrDX+6O1Ifdg8hxW+tAUUqUafu2kSYV
	sg2NXYXBpvgjlC5XNmuyZDracpw+gXvhrAzDV8KNLGukEQ5J8bk7iU2r+J++YlrAPsgAwgD9a
	dcEiUc4luMjN4uAysVDVMSPUxcVTJFAw4ufSa7cIo8RqHqBu4LjL00MzwtfOSz4PrbpJqUUeu
	f150hrG8kwwKAlTNz+hlGEOzpw9+PVSMQGTKH1bsvN0NbV/jAvGLkwJYACvkwATNfbeoJx+R2
	SiRdWo+L4g242aFr0mOJjyWcotY2pX6E6MUGanLvhwJxWsTz5ET8Tg9xanbz6K+qX0O9y95xZ
	f8Le5cLK2PGsPYCqd4/xhZSHN5jay9bRUpO0TU53nVDsIrgvqd29QfkZ4+r/dvEtotQbxJ5WV
	mxR7GsAXqhmRnzkTeaj/5qisXwodHwqML86+NQEu34pijSLjlrjNeXy+SEQxU5tt2k8dcSylb
	Yz6lEBQ/3rrN5okDp0yi7WPxnFN7DzsebFU3j9X7WauzMNXdC/HjWKZrtaN8rVE3L9Cr/2FQm
	MngP1C+TVxNMrmHzDwGH4Rum6hZpMcwcr4YzEJ43izKI1psFRUN10mRjikEB4utyqc6EbKt6q
	9L0wc+U0p9EbqKVg6S6LLmGI6Jgk9ae51K/BU+WagjtedCXDL8hXMyhOcrWKUiucszSjywPfO
	oxEEy9l+glafKYRs45ZU9R6EkTyB4+Mp5Q1L4mSRUkoLH4QNnnAgeUquP9Y=
Subject: [PATCH 1/3] kernel.bbclass: allow to override KERNEL_FIRMWARE_PATTERN
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
X-List-Received-Date: Tue, 17 May 2016 09:21:36 -0000

Allows to add LINUX_VERSION to firmware package names

Signed-off-by: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
---
 meta/classes/kernel.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6e3e81e..c135b14 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -404,8 +404,10 @@ pkg_postrm_kernel-image () {
 
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
+KERNEL_FIRMWARE_PATTERN ?= 'kernel-firmware-%s'
 python split_kernel_packages () {
-    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    firmware_pattern = d.getVar("KERNEL_FIRMWARE_PATTERN", True)
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern=firmware_pattern, description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
-- 
2.8.1


