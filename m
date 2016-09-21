Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD736FFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:30:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l132so6577010wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=v/iz9aOLkJKx08h63GnwakwykW/gGtO7Dmlt+votipI=;
	b=Vs2q+jFCLCaBr5RZ9TMfJ1VXv4sXdqQrMLx0u+IHbn8VqvPjH58rM7jVVbfMlPJ4cu
	UpCc3bFm+dyt64KXkECDYVWLrnVX8XBWYzYDCw+X2GoCINBsXhdAqT7cwV1rKcWpSvgF
	grHQ2y+dKFDcYQt9nCnNW3pz8WJMDYw6t05anKMh46pFkMnpK+Ie3TlB2dvC8iKVLbwY
	YGTM6T7Rcj1XtpLUsebthGrFVMcNovc4TmKMvxNMMhESkSzU/PWbzHmI3p8M6FA9Z2zd
	thE72tN5rZoPJZ2O+hYBJp1Ng62a6F4GRzjfpRIY+ZTGx4G5RQv+lBgHPgpr+XEdp5nL
	5Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v/iz9aOLkJKx08h63GnwakwykW/gGtO7Dmlt+votipI=;
	b=YQhfbGFhPD1pCaaSHyRS8R3ZV9nSFPXkQ2r9Z8vsbqbBqy33q8P02xR1CtBJpwsiT9
	JdXnNw0leoCPxddip3LoUDqAdMp96d+jV/uZZWSkaaRM6NxGJGILlAYePDSxuLGd1OZ0
	AmQ9ucjjUdrVPbtiZoxxCiimaJuSMCHmiokJCRnU1SpG5Zxf+t5cLLTeTkpLp/V3Suba
	xfzDKAXnllk+74M9h3LhlG71k4Kgr3Z3c+a8idC07+GS6NL8zXQ5f1FO0Ue/hT/san5Q
	jouQwaawPo9vw1GpjdMzPDdYCpzKO6lH/66jmpBFcCzgFW+O6Yfs5Auo0//9bbGjybmW
	KVAQ==
X-Gm-Message-State: AE9vXwN1PpTt5aOuyaWoAMxDILaLew5B1wjdHV0rA/s4GacVqpFVVEGbKq77AB3F7ZRlUw==
X-Received: by 10.194.242.101 with SMTP id wp5mr31849281wjc.44.1474435859871; 
	Tue, 20 Sep 2016 22:30:59 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06F5.dip0.t-ipconnect.de.
	[79.223.6.245]) by smtp.googlemail.com with ESMTPSA id
	bk7sm31695802wjc.36.2016.09.20.22.30.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 22:30:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 07:30:44 +0200
Message-Id: <1474435844-16942-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] scons.bbclass: reduce build time by adding PARALLEL_MAKEINST to scons install params
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
X-List-Received-Date: Wed, 21 Sep 2016 05:30:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During install all files are recompiled. This should be investigated further
later. Currently only one file is recompiled at the same time. Reduce install
time significantly by setting PARALLEL_MAKEINST option in do_install task.

Measured with recipes inheriting scons (gpsd do_compile broken for me) by
the following sequence:

without this patch:
bitbake pingus mongodb mixxx
bitbake -ccleansstate pingus mongodb mixxx
time bitbake pingus mongodb mixxx
...
real	48m5.467s
user	138m47.763s
sys	11m9.423s

with this patch
bitbake -ccleansstate pingus mongodb mixxx
time bitbake pingus mongodb mixxx
...
real	27m28.521s
user	146m59.951s
sys	10m56.218s

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/scons.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 1579b05..4f84ec0 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -10,7 +10,7 @@ scons_do_compile() {
 }
 
 scons_do_install() {
-        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} prefix=${D}${prefix} install ${EXTRA_OESCONS}|| \
+        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKEINST} PREFIX=${D}${prefix} prefix=${D}${prefix} install ${EXTRA_OESCONS}|| \
         die "scons install execution failed."
 }
 
-- 
2.5.5


