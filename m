Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id A669A77144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 20:11:58 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id ho8so28255408pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 12:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EXetrFKBy6nd5N52wUabRHhQqxzuTK8stVr5o7pRJBI=;
	b=BdZeh4pSUbn+LSw0W2PoV/Df5/bEuG0a8bMBREnO1bFKDdKOcpg5C/ODJUSt4fPl8r
	N3EuzmHeX0lDRk0zeLx0Ua/9tY0dO1jocbMoy5NtBFxgNTqZMHgXA6xz7W8KmQrZmmV+
	aZaKlCTbu3KjoftmRLzKFYgTZ4em/C7K9GpLyuOZLjpirJkhDTH5+nn+0xKeDt5lbiqN
	qbm81s8Juk2eEKU9PXhFqHA+VTmS4oC6ybiSu0NRnji66jm73RhRy/fFZTLQzj3L76Ib
	rA3U1hIaUO+XLakgRr5Q6BQNuCibTR0bEH9lQJNMla/tr/zvV3JxzusLSNrZPvSFwRzy
	4Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EXetrFKBy6nd5N52wUabRHhQqxzuTK8stVr5o7pRJBI=;
	b=fmacgb/Qv1mXQscqOm7sb0NjfeIagiLqUNPOOwfpzPqsXGm9J+NFUx2bQDZpV0KpwC
	KGeesUyMkqw8ttgBl+RxbVOauO2RhoehAmZ0qJTiHW6z/qbMBkKgkmMew8EOTosleJeb
	kk46WaZlXPK/xXTE07qlQ4CDBwKaIrqK5U/y5gvrIjXO2WaSZwD1+Fh4Tm2WNNSCvoVg
	5H03lWkFXyriGBsPaO8Oux/shuHWzedMb6Tx//WqfR4xKJPa3FtCQzDk25OM73Kc3UUl
	BY1qZeYlsLXeqiaeCsZEMLzwqfUsWAgOEnkr9pssE3kcjlfeZ0IbkE252+pbPgFK9nxD
	yIcw==
X-Gm-Message-State: AG10YOQH6cSRcxy7JK846o41PRtPfv+DW8PVRStifskpjJoi6oVRenlmN9SKHJsQtgKhtw==
X-Received: by 10.66.120.77 with SMTP id la13mr7485928pab.74.1454011919080;
	Thu, 28 Jan 2016 12:11:59 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	x10sm18329407pas.37.2016.01.28.12.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 12:11:57 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2016 12:11:52 -0800
Message-Id: <1454011912-11757-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] autotools.bbclass: don't create subshell to delete configure scipts
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
X-List-Received-Date: Thu, 28 Jan 2016 20:11:59 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/autotools.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 1400b44..4601148 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -226,9 +226,9 @@ autotools_do_configure() {
 	# for a package whose autotools are old, on an x86_64 machine, which the old
 	# config.sub does not support.  Work around this by installing them manually
 	# regardless.
-	( for ac in `find ${S} -ignore_readdir_race -name configure.in -o -name configure.ac`; do
+	for ac in `find ${S} -ignore_readdir_race -name configure.in -o -name configure.ac`; do
 		rm -f `dirname $ac`/configure
-		done )
+	done
 	if [ -e ${AUTOTOOLS_SCRIPT_PATH}/configure.in -o -e ${AUTOTOOLS_SCRIPT_PATH}/configure.ac ]; then
 		olddir=`pwd`
 		cd ${AUTOTOOLS_SCRIPT_PATH}
-- 
1.9.1


