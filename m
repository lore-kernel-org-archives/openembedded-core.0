Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 94C757F888
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:31 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id az3so13795160plb.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aZJc32Zz1cRIVlfB/T8UFNjdqaOrYiIO9kflt7piKM4=;
	b=grP9g3IcmxZ83LixMoqoWf400G60aw/IQ/anLKQXxXOiCw71mg2kaQIp1hLAUEWvVP
	hQKssX196sJZEBcQxrVsliI+wITtkAK5GFiSmJqGEYd21Jhl1BIJWlyKIpTc0PYqw6/a
	D8HNOODs5jsPndI9gUOz92ft+OvOEf+gZcMOdHBBYxER9Vl4ofMNXtzb3a5pEk9BzyvO
	+lafdOzgPp05GfccZmWgH8JSu0nLZ3wtIC8EhkY8YDOsoVNlwkPyJALrLUXF+cKnHAaQ
	iYYI4uiniUKXjBmoYH7hPPbdd4ktRYoDOgCPwbDc1CdpCTpXA3piT017FAbv5S5CtFvs
	xTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aZJc32Zz1cRIVlfB/T8UFNjdqaOrYiIO9kflt7piKM4=;
	b=tph0Ar2bWRmStIuNFQSMZTCLkJIBaa4VFptbdrvyoSRY/Ruq6cNgFBL1zCbiu5mc0S
	0kW0jp1n3uNzM9HM6d1KCop+T5FXWOwim5jiyLC87gQyU4joquuDa73z1BPZzm3fRJin
	QzhmuMjcqe7LpriJqa4RWIBBh3a1beaiJILux3dwF9r5ECKcvdTri28ulk1H/SnmLJ+X
	OLpC4O2HiXkejQmC96srNfgLp2Y7FsNs6Nl8LS2ot1eyT2UpRwjdJSu29/bWSQCuh1SK
	w77PvVduC8nZiEOB83riljRAmi5sKfdkmWIP7fZUdhpufHB9NtXlr+6cF3dOA+adVxOG
	l4rQ==
X-Gm-Message-State: APjAAAVnyiL/Oi1qAAG0J1E+jEMNsVTkUALMTPZGvnQWawNa0MeOkBm/
	32a6xfn+T8JRwuvMYK5X0oUgQNoLnwI=
X-Google-Smtp-Source: APXvYqzeaveg39vpTPpxWKgP0F+lNhf6H409kgSD2ozv88E9gVbO9F+i8Bsgu8XpI23K8FMWPIwJMQ==
X-Received: by 2002:a17:90a:191a:: with SMTP id
	26mr40664818pjg.111.1577645072462; 
	Sun, 29 Dec 2019 10:44:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:01 -0800
Message-Id: <20191229184415.19514-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/19] cmake.bbclass: Define LIB_SUFFIX
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:32 -0000
Content-Transfer-Encoding: 8bit

This variable is used in lot of cmake based packages to denote libdir in
multilib environments, now a days there is a better way to include
GNUInstallDirs module but thats upto these packages to adopt. Defining
this helps compiling a bunch of recipes in extended layers when using
multilibbed builds.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cmake.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 11ffb0d33f..a046daa6ea 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -174,6 +174,7 @@ cmake_do_configure() {
 	  -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
 	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \
 	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix') + '/')} \
+	  -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
-- 
2.24.1


