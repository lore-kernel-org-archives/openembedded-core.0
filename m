Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJoKx-0007dp-UE
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:55:12 +0200
Received: by yxn22 with SMTP id 22so2361309yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=x+B8Z0Td2cXvsqsrDER+NCwMOhAFpiQso/oFO883I7Q=;
	b=soXZ1s2R54zurWnEH6E/WgA9OMX3ecL29uf24x8UmdBqm3YXpozYXRm/RdLMZ5nsE5
	9Rms9FhvbKynS+ALSZlLlfZ46plrIj5JaTBq2PNW1r4YkJRNycr8boLXmCNfis/2IkWl
	SeJWnpWrue7EAYn5S143u9CBtwx3VcBnQnoEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Jr5EMlciWqmCrOEGrt7B3jZWoCZFyB9Fs596W4Xu5YCh+aXL0jO+BBu0ssmja51ArQ
	T89199s3McGP3zKrxzKlcFSCQnIE3clR1DevaWEdD7gQDX/IxHdoKlb2he+BeTxn08C7
	iG835f4T5VmSjYOJPqY+wS8O4qXaGtOEItmIc=
Received: by 10.150.47.6 with SMTP id u6mr626034ybu.31.1305039133766;
	Tue, 10 May 2011 07:52:13 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id u20sm3193051yba.15.2011.05.10.07.52.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:52:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2011 14:51:58 +0000
Message-Id: <1305039119-1469-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
References: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH 2/3] qmake_base.bbclass: add generate_qt_config_file task
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
X-List-Received-Date: Tue, 10 May 2011 14:55:15 -0000

This writes a qt.conf inside WORKDIR to properly configure projects
based on CMake. This is required since qmake variables (returned
by -query command) are fixed into the binary and can only be
changed using a qt.conf file.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/qmake_base.bbclass |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index 24a0f11..a054efd 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -31,6 +31,20 @@ oe_qmake_mkspecs () {
     done
 }
 
+do_generate_qt_config_file() {
+	export QT_CONF_PATH=${WORKDIR}/qt.conf
+	cat > ${WORKDIR}/qt.conf <<EOF
+[Paths]
+Prefix =
+Binaries = ${STAGING_BINDIR_NATIVE}
+Headers = ${STAGING_INCDIR}/qt4
+Plugins = ${STAGING_LIBDIR}/qt4/plugins/
+Mkspecs = ${STAGING_DATADIR}/qt4/mkspecs/
+EOF
+}
+
+addtask generate_qt_config_file after do_patch before do_configure
+
 qmake_base_do_configure() {
 	case ${QMAKESPEC} in
 	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++)
-- 
1.7.2.5



