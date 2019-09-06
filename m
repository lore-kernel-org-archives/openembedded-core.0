Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 86CF57F35F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 07:23:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q17so661807wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 00:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zQqfWzHkjMIaa2hv7WR1Jd3JI80gqOhHLIy4xP3fbio=;
	b=OUBKu1byhrXKP0tgEg0pzmpCrro4IDE6/cGm1AyqViI/9KN6XoOTxNA2URzs01ZGtq
	ehCwiTAJ/Qpo2ENSm1nxGE+PTkdZe/VGr3SKDKSDGLzM2Gpe1jjFWeUZ+JURV11tt2QH
	6DetozPPoosY+xsv5GcSXrYFT1xELo7oChOa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zQqfWzHkjMIaa2hv7WR1Jd3JI80gqOhHLIy4xP3fbio=;
	b=mKNx7u6cqAV1fveRbzSgf6hD/6f3Rq4FRn9ikXtmdr/Q9QIFSh85AahzyrD/U8q7f6
	YyC9nwT2sE7RLv/vpx/y4WGKNSCdpZTh9u12uqMNPccpoMeYf9tfA3pgu5uWGLQ+k7rr
	poT8UCL7+ylAqSgjMTN8+SVQ230DOP53S7T7dS+Vd6wYeJniFiJuYVs9jAtGqotuzkU1
	NxJONyT1OCUCc/G7ciXCEbUEFnwVIzGODH1+h19Gt2+TK2Hmj4odoHRQlvQrxOvpImCO
	AR2ifBnpYpoZ4eXXeSDZZI9/azSa5lJHGTMY9IdwmwYqEsYpib51nM4J9kOo1YDoA01K
	EcIw==
X-Gm-Message-State: APjAAAVy5jsyMae+ArdjfyLUFTf3guAdbnGdqExhKfsrRWKwjBdiHq2G
	gpnDo3x+w21lLdF2DYsCs2G9NiKz2UIuDQ==
X-Google-Smtp-Source: APXvYqzHYQdSEwVIePLc9Lh2kZt6DlzEG7rQjH6sCWDRi/OCwee8YscmOnhvtlqvaRVV1HjvPnE9wg==
X-Received: by 2002:adf:afed:: with SMTP id y45mr5611447wrd.347.1567754632016; 
	Fri, 06 Sep 2019 00:23:52 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b15sm4777951wmb.28.2019.09.06.00.23.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 00:23:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 08:23:47 +0100
Message-Id: <20190906072347.31616-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
References: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] gcc-cross: Fix header file corruption problems
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
X-List-Received-Date: Fri, 06 Sep 2019 07:23:51 -0000
Content-Transfer-Encoding: 8bit

gcc's makefile can move files, replacing with the contents "timestamp". This
corrupts the headers and breaks things like the gcc testsuite.

Add in a fix to ensure the headers are not corrupted through their hardlink copies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index e417b898734..95af6d89a9d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -212,6 +212,9 @@ do_gcc_stash_builddir[cleandirs] = "${BUILDDIRSTASH}"
 do_gcc_stash_builddir () {
 	dest=${BUILDDIRSTASH}
 	hardlinkdir . $dest
+	# Makefile does move-if-change which can end up with 'timestamp' as file contents so break links to those files
+	rm $dest/gcc/include/*.h
+	cp gcc/include/*.h $dest/gcc/include/
 }
 addtask do_gcc_stash_builddir after do_compile before do_install
 SSTATETASKS += "do_gcc_stash_builddir"
-- 
2.20.1


