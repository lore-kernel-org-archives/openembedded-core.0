Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 633A378256
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:24:09 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b189so7256126wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b50NM1j0UzoG7ZCvaWbsdOMK8FMy+bHlyMd11baDTiM=;
	b=SwRPqnem3pYZLa4nYB5GVOhektIAmdeKof5XeRkGjou+j/wW4+zcv6Md+8Er/chg2f
	G3xSm0xYL1eO0KWBzKrpRPZH4NzxyNszVy+XExgNi18iVq6N1EZ8RQFfvTmnbCM8z1Mn
	xjYOZILdl4+zvfuUbEeYxM579Oy6R1txgJLADkI0EWldqDC8AuvAmofgjQspEt/blh+T
	EtKgwcGf1OKef9C5Dz0hEzN7IADyEAG/ZLj1KS1FQ+XSaG0R0191x5awG/uZ9FikMtf5
	P8ihKRquhYej2psZj4307VChff5/egDEoWJt01VW3ixYZGK9zJDLUopQ6P7Frl9P1ycR
	S1HQ==
X-Gm-Message-State: AMCzsaXesFzCc66+1/60rmerkkaMsJeAVUjWXpcWuvmvhGXKiEdrcsi8
	3td0A5QHMk2fg+GEuR0DljoQWHmO
X-Google-Smtp-Source: AOwi7QCN4H1FWwGPhHKn1JTf188n9UBl+hbNUoIeEJJQKFH1Ddf5oXP+H46HblGwM9FnCVGzcUmElA==
X-Received: by 10.28.100.212 with SMTP id y203mr1595819wmb.64.1507292650666;
	Fri, 06 Oct 2017 05:24:10 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q81sm1628017wrb.88.2017.10.06.05.24.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:24:09 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:24:08 +0100
Message-Id: <20171006122408.8221-1-git@andred.net>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Subject: [pyro][PATCH] json-c: backport patch to fix gcc7 compilation
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
X-List-Received-Date: Fri, 06 Oct 2017 12:24:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

(The native version might be being built using gcc-7)

We can't cherry-pick a commit from master, as master
has upgraded json-c at the same time as applying
this patch, see commit
ccf630e78aad ("json-c: Upgrade to 0.12.1 release")

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 ...-FALLTHRU-comment-to-handle-GCC7-warnings.patch | 77 ++++++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.12.bb        |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch

diff --git a/meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch b/meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch
new file mode 100644
index 0000000000..df3b6002aa
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch
@@ -0,0 +1,77 @@
+From 9522ac8e5d5b20a472f3ffc356d388d36f7f582c Mon Sep 17 00:00:00 2001
+From: marxin <mliska@suse.cz>
+Date: Tue, 21 Mar 2017 08:42:11 +0100
+Subject: [PATCH] Add FALLTHRU comment to handle GCC7 warnings.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+---
+Upstream-Status: Backport [https://github.com/json-c/json-c/commit/014924ba899f659917bb64392bbff7d3c803afc2]
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+
+ json_object.c  |  1 +
+ json_tokener.c |  1 +
+ linkhash.c     | 22 +++++++++++-----------
+ 3 files changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/json_object.c b/json_object.c
+index 6cc73bc..77e8b21 100644
+--- a/json_object.c
++++ b/json_object.c
+@@ -552,6 +552,7 @@ int64_t json_object_get_int64(struct json_object *jso)
+     return jso->o.c_boolean;
+   case json_type_string:
+ 	if (json_parse_int64(jso->o.c_string.str, &cint) == 0) return cint;
++	/* FALLTHRU */
+   default:
+     return 0;
+   }
+diff --git a/json_tokener.c b/json_tokener.c
+index 7fa32ae..b32d657 100644
+--- a/json_tokener.c
++++ b/json_tokener.c
+@@ -306,6 +306,7 @@ struct json_object* json_tokener_parse_ex(struct json_tokener *tok,
+             tok->err = json_tokener_error_parse_unexpected;
+             goto out;
+         }
++	/* FALLTHRU */
+       case '"':
+ 	state = json_tokener_state_string;
+ 	printbuf_reset(tok->pb);
+diff --git a/linkhash.c b/linkhash.c
+index 712c387..74e3b0f 100644
+--- a/linkhash.c
++++ b/linkhash.c
+@@ -376,17 +376,17 @@ static uint32_t hashlittle( const void *key, size_t length, uint32_t initval)
+     /*-------------------------------- last block: affect all 32 bits of (c) */
+     switch(length)                   /* all the case statements fall through */
+     {
+-    case 12: c+=((uint32_t)k[11])<<24;
+-    case 11: c+=((uint32_t)k[10])<<16;
+-    case 10: c+=((uint32_t)k[9])<<8;
+-    case 9 : c+=k[8];
+-    case 8 : b+=((uint32_t)k[7])<<24;
+-    case 7 : b+=((uint32_t)k[6])<<16;
+-    case 6 : b+=((uint32_t)k[5])<<8;
+-    case 5 : b+=k[4];
+-    case 4 : a+=((uint32_t)k[3])<<24;
+-    case 3 : a+=((uint32_t)k[2])<<16;
+-    case 2 : a+=((uint32_t)k[1])<<8;
++    case 12: c+=((uint32_t)k[11])<<24; /* FALLTHRU */
++    case 11: c+=((uint32_t)k[10])<<16; /* FALLTHRU */
++    case 10: c+=((uint32_t)k[9])<<8; /* FALLTHRU */
++    case 9 : c+=k[8]; /* FALLTHRU */
++    case 8 : b+=((uint32_t)k[7])<<24; /* FALLTHRU */
++    case 7 : b+=((uint32_t)k[6])<<16; /* FALLTHRU */
++    case 6 : b+=((uint32_t)k[5])<<8; /* FALLTHRU */
++    case 5 : b+=k[4]; /* FALLTHRU */
++    case 4 : a+=((uint32_t)k[3])<<24; /* FALLTHRU */
++    case 3 : a+=((uint32_t)k[2])<<16; /* FALLTHRU */
++    case 2 : a+=((uint32_t)k[1])<<8; /* FALLTHRU */
+     case 1 : a+=k[0];
+              break;
+     case 0 : return c;
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/json-c/json-c_0.12.bb b/meta/recipes-devtools/json-c/json-c_0.12.bb
index a15455c9bf..072c092c0e 100644
--- a/meta/recipes-devtools/json-c/json-c_0.12.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
            file://0001-json_tokener-requires-INF-and-NAN.patch \
            file://0001-Link-against-libm-when-needed.patch \
+           file://0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch \
           "
 
 SRC_URI[md5sum] = "3ca4bbb881dfc4017e8021b5e0a8c491"
-- 
2.14.2


