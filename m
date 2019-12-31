Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 41A717FC1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 19:07:02 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id z12so30751137iln.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 11:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fs2inBfICTxAyfzSk1tRhj6+Y5haZfbVP9sTfZ9wWp4=;
	b=TGWFP1n0t3fVFCswYO15EofHTS3AweXJtcwed3SYNruNG7/i6MAKLea1LlNoACJyor
	bHxUG0Xs8hEe8WXG2F67dACM3IJGpW7TfGvO3GJugo4TLJqdcOE71DetOVwPSlcvlJJy
	ZJwxObBXFTBxip6Q158xbvuyr3EYWrNzTUBToRx6v9yQt+pZRhsFutDik8bx1ChS6yDJ
	i+xurh8rLcZ1nO9YnNZX1crDv8+uby+iEBKUTlKJzPn/s8A/khZ9T5dR2oMBiyx6hUZo
	WrH/FFWd4DPjp5/4MCZqx5GG3QL1rUewe8ams7Q/RCXfolC6qShdx75Sx+D1EihuGIA5
	qBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fs2inBfICTxAyfzSk1tRhj6+Y5haZfbVP9sTfZ9wWp4=;
	b=XtdGjNqY9Tb2o+V68g7TcAIMtLh6NXE9wZDIl/tLtD8oepJSu0w3T0LzFd2ygFgfaV
	8P17MzvMe+QbCgs9JUGlTVBA6KUMi4sFvc09CCdQ2l22s/Ec9nlxvwaDH9OE5zsn1f8c
	YdNlMxqFgQGRFk6KHJWRbC4cLo+IAZN+6zZipo4RyUzbo9o6Drt38ea1A/EqVL8PUTl0
	087MMRxxmkuICAjDbf/OeAN9cy8ToWCInfFQ0c6raST6ulKc3xsM5gJdC08tWAaSySeK
	hOKf7aH7Swba2VGaZSUzgpRJVn6gAzZ/72crv4A9K4cJX3UAlNcpvV20g5lqFVUTIblr
	XBBw==
X-Gm-Message-State: APjAAAXUkJS5jUSctV8CNbCPx5gN/fQJMVTzHPz7Jb4WXRspOg+58qB/
	WVbUckwvcExBL8Cor2+eM1dtNq3P
X-Google-Smtp-Source: APXvYqx9FnMLQ23om1379tQDMM+lzAsE7IYvcFYbLMr/QVHciRvx8GU86JZRulgotQILJXvfvyLw9A==
X-Received: by 2002:a92:5d16:: with SMTP id r22mr64900291ilb.230.1577819222909;
	Tue, 31 Dec 2019 11:07:02 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	s88sm18036056ilk.79.2019.12.31.11.07.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 31 Dec 2019 11:07:02 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Dec 2019 13:06:57 -0600
Message-Id: <20191231190657.2411408-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191230205941.1878175-1-JPEWhacker@gmail.com>
References: <20191230205941.1878175-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] python3: RDEPEND on libgcc
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
X-List-Received-Date: Tue, 31 Dec 2019 19:07:02 -0000
Content-Transfer-Encoding: 8bit

Python uses features of glibc that require it to dynamically load (i.e.
dlopen()) libgcc_s at runtime. However, since this isn't a link time
dependency, it doesn't get picked up automatically by bitbake so
manually add it to RDEPENDS.

There is an outstanding bug in Python to make it explicitly link against
libgcc at link time which would remove the need for this. See:
https://bugs.python.org/issue37395

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
index 137b540dba..78312b05f3 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -306,6 +306,8 @@ RPROVIDES_${PN}-venv += "python3-pyvenv"
 PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES_libpython3 = "${libdir}/libpython*.so.*"
 FILES_libpython3-staticdev += "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a"
+# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
+RDEPENDS_libpython3 += "libgcc"
 INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
-- 
2.23.0


