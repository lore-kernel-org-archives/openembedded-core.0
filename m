Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B2202770E3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:17:16 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f65so35376997wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=798gJHGa2AzjaZxaDQzdY/o5DdbLEEIlIjjJ//Sc9F0=;
	b=hHKiY9HA/AWGlBZslKthR1+lR2vKJAqJQpRj6PyvdKdGcoszvCkdFdgoIlmOdL+x8s
	ExtuqkL0Fu+ARMshYExd0mNhwi0RtDSgeSiAdy2W17DbfnjZKjCyp2MdmUooT9Vcsjtp
	hXR/Ap664fb0XYdTcmiPNFMwt9gaEQ+kaVJgMMl/W3i/Y4k6bb0so1TA9VDQHT+rVhAJ
	LTIvkPxSngpkujpq85gIQ6I1nfdrEePrQbERfsxcyOcmRkg6IMNbegvqGDeFtR1+J+4h
	ddf/dtjQB74DwCoPqPEw1OHYiJ6TV1RcK/+Gugs4Kq3JYIIgJirYYqNqDSZN1A3H3Gbv
	4Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=798gJHGa2AzjaZxaDQzdY/o5DdbLEEIlIjjJ//Sc9F0=;
	b=H+ebuiUq8l/vTPWgOwGBBN3qHbnM3IwrduFZvcebuq052QTPDGMjl64gX0mrujyHli
	BUaLWz+/DCLL2A63T+cpu1OTMPy0vdTvVu4+K3uZ9BDgmpaCZPkjwEv48B0cVjgyDFyr
	W4hZArfqsvC5FGeqUWXLAR84YNzfCYDwNz1V17WNa7xGcWPpfn/C6gbzR918YEFHCNtX
	srnvdX2tsBzvis/NZGETZ9J+s0ZNnkQ4wUZUynBak0ywBVsl5Rguy3pp7R4ZXHDqY7hr
	TAgc76GDQH8bLuMpz3/OCsSimrDZL/0ejovY+52GcsdFdcmN7z68KE4CjE38lHt/LrWt
	PiLA==
X-Gm-Message-State: AEkooutpTYOhsU/lpnycevSvA2nfYQhHGsV41VH29T4ActD+NsGMi6p5fNkTN0iDvSebyjwo
X-Received: by 10.194.235.229 with SMTP id up5mr79209671wjc.69.1470410236324; 
	Fri, 05 Aug 2016 08:17:16 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	qe2sm18285249wjc.28.2016.08.05.08.17.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 08:17:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 16:17:09 +0100
Message-Id: <1470410231-21681-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
References: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] autotools: move aclocal-copy to WORKDIR
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
X-List-Received-Date: Fri, 05 Aug 2016 15:17:17 -0000

To save time move the temporary copy of the autoconf macros, aclocal-copy, from
${B} to ${WORKDIR}.  This ensures that it can't conflict with anything in ${S}
and means the pruning code doesn't need to know about it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 1c884b4..22359d3 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -134,7 +134,7 @@ EXTRACONFFUNCS ??= ""
 do_configure[prefuncs] += "autotools_preconfigure autotools_copy_aclocals ${EXTRACONFFUNCS}"
 do_configure[postfuncs] += "autotools_postconfigure"
 
-ACLOCALDIR = "${B}/aclocal-copy"
+ACLOCALDIR = "${WORKDIR}/aclocal-copy"
 
 python autotools_copy_aclocals () {
     s = d.getVar("AUTOTOOLS_SCRIPT_PATH", True)
@@ -248,7 +248,7 @@ autotools_do_configure() {
 		if [ x"${acpaths}" = xdefault ]; then
 			acpaths=
 			for i in `find ${AUTOTOOLS_SCRIPT_PATH} -ignore_readdir_race -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
-				grep -v 'acinclude.m4' | grep -v 'aclocal-copy' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
+				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
 				acpaths="$acpaths -I $i"
 			done
 		else
@@ -288,9 +288,7 @@ autotools_do_configure() {
 				fi
 			fi
 			for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
-				for j in `find ${S} -ignore_readdir_race -name $i | grep -v aclocal-copy`; do
-					rm $j
-				done
+				find ${S} -ignore_readdir_race -name $i -delete
 			done
 		fi
 		mkdir -p m4
-- 
2.8.1


