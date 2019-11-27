Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7BFD77FC0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:00:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s5so26795182wrw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ySgwyLgna8TMpx2gOFCpckNX+8VS5FMlc9psqBwtLco=;
	b=B0ebvKiU6M000h/iGRMGDIyM/rq04v9GDrOdQLkIXP6X70nkKko2wnfzhiRDsrRwy9
	4Xh1H28pL+DhVZ087wjZIKeet/JCNooc6MLpQ8P0gafgD0PaTDb6Cn0B79bBmPxjtGn1
	jGuUNeJnlGagm4ZVd7GzhLR44l+HsG6sjK1hOpsTOXjnKLTdSM8cN7WDtgOj+/6N81Fk
	rrMsL1Wb39vk+FGJ359GP8KNXgmpFZG5OLdqFM6fLhzd0A3qKju0W0kBg3bQNZNwJH/X
	sZFoTrQpnqGmME5e3QW/lMeGCX/evtZ3oNu6wIS8FtUcQo0wbUyIBfyaQF44mF2S1VdH
	GMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ySgwyLgna8TMpx2gOFCpckNX+8VS5FMlc9psqBwtLco=;
	b=ActmoTiY1IW+D5GkXNven6JgVIVya4/Eufcoco2Rr9LiPVy4fvnH9J000FZUNk6eN/
	OZ0N86a8loHgHYw9aukoJ6192OFwaakoWiEBYjqubp7uMUxMLzkCVqt5ZnHR8ZGu2esj
	KegD5/dtJlyy7tkyJwB2QNJIiFJPxCw1a5Gu/SYw7GGECSdSv7GBG1QlDj58sLW7kW/W
	TQAEDP8xgZMSOjyaXd/QxLdcxSzIkmY3OUMgEsxxtC8IZ6fF2SVl2dBI30cQfLRKFsMl
	VidckOvWjrf7u0KddMRusWEZARzwOmMWMkBan9o2yO4IIQ2P5yqSwheEb4OTpvsAiBq7
	k9SQ==
X-Gm-Message-State: APjAAAUDnPxgWAGa5yTH9fghnxktjGZIVWWK2UJPLQh+L659FGsoSqSG
	DSCGIeHuXV4Ay7RGK9jqZGlc2tV9HZQ=
X-Google-Smtp-Source: APXvYqxx0V0Ru8sBL/qjB3iKGDB1/E0uaA6QVSlZBeC1RXNUZTZIKwAobgIVsvCKAU2OOA140dJhsQ==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr1881351wrv.396.1574863239009; 
	Wed, 27 Nov 2019 06:00:39 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o1sm19372284wrs.50.2019.11.27.06.00.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 06:00:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 14:00:28 +0000
Message-Id: <20191127140030.7838-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127140030.7838-1-ross.burton@intel.com>
References: <20191127140030.7838-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] python: restore bytecode optimisation
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
X-List-Received-Date: Wed, 27 Nov 2019 14:00:39 -0000
Content-Transfer-Encoding: 8bit

The upgrade from 2.7.3 to 2.7.9 in oe-core cb02ecb introduced some
copy-paste errors which inadvertandly disabled the generation of
optimised bytecode (.pyo files).

Restore the intended behaviour and bring back .pyo files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python/01-use-proper-tools-for-cross-build.patch | 6 +++---
 .../python/python/fix_for_using_different_libdir.patch      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index 7d8e95fe5cc..56992210a23 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -36,18 +36,18 @@ Index: Python-2.7.13/Makefile.pre.in
  		$(DESTDIR)$(LIBDEST)
  	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 -		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
 -		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 -		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
diff --git a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
index 5f7309367c4..b4e72193ff8 100644
--- a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
+++ b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
@@ -52,8 +52,8 @@ Index: Python-2.7.9/Makefile.pre.in
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
 -	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
-+	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}$(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
+ 		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
@@ -64,7 +64,7 @@ Index: Python-2.7.9/Makefile.pre.in
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 +	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
- 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 -	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
-- 
2.20.1


