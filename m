Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (unknown [209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 98E956B70A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 18:28:01 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 20so3144962yks.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 11:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=3aVfwDemr941b+6RhfO9PRXsnpUXiTBhuww30c/dS0Q=;
	b=peHgZ/QWUGBU9sxNL1MKdipsqwmV8c8c7VVDwfJDoLw8++gBei/J7G8UzGmQ/graio
	SZir4OwVmxAPES36/AIrDYDPjHIHlWDPw9vPK8khVPxPqhoTffeYD4X3WCFhqIfEct0/
	ncG2+yJ7ZWx1LEtg7yf38tS7nAg/MfGzJH7cRvdqIX+UaYZx70dDcCghfRCz6mR8OEWO
	3VIYF8N6uz6v+7SxN/dKI9Dr1AHx10tct7qi59yGT0VFykObm49EqjMhl5kg39AlR5Mh
	xcD5zfwB3ADLaAu3T+sCkepR2GsgpgBsahUkpui9CnUIEWtcnC8LVqAgWzgbUYq0XviK
	lpXw==
X-Received: by 10.236.167.105 with SMTP id h69mr87973428yhl.30.1400783282313; 
	Thu, 22 May 2014 11:28:02 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id c66sm832770yhk.23.2014.05.22.11.28.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 May 2014 11:28:01 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id E270B1B13ADC1; Thu, 22 May 2014 15:27:54 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 15:27:54 -0300
Message-Id: <1400783274-7258-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc2
In-Reply-To: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
References: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [daisy-backport][PATCH 6/6] gdb: add PACKAGECONFIG for babeltrace
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
X-List-Received-Date: Thu, 22 May 2014 18:28:01 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Add PACKAGECONFIG for 'babeltrace' so that we don't have the implicit
dependency which might lead to problems when building images.

As an example of showing what problem we might have without this patch,
see the following steps which would lead to a failure.
1. IMAGE_INSTALL_append = " gdb"
2. bitbake babeltrace
3. bitbake gdb
4. bitbake babeltrace -ccleansstate
5. bitbake core-image-minimal

The rootfs process would fail with the following error message.
error: Can't install gdb-7.7-r0@i586: no package provides babeltrace >= 1.2.1+git0+66c2a20b43

(From OE-Core rev: 3c34d9391136b09bc2e7b0bda6cdc96507845c4b)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gdb/gdb_7.6.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb_7.6.2.bb b/meta/recipes-devtools/gdb/gdb_7.6.2.bb
index e864471..7e8a4fd 100644
--- a/meta/recipes-devtools/gdb/gdb_7.6.2.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.6.2.bb
@@ -5,6 +5,7 @@ inherit python-dir
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python"
+PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 
 do_configure_prepend() {
 	if [ -n "${@base_contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
-- 
2.0.0.rc2


