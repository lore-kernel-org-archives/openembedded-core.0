Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF4977D49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 12:49:21 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id r16so39672659ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:mime-version
	:content-transfer-encoding;
	bh=+E/xaYekmijtvYO0L5GvSMA2c7UMkgp5kUcitWgjXlc=;
	b=r6uRmK8jCNBzntoh3ZHUsBmL1gQyPnAXZCsqahonbMW4gpX00r2Mowb/RO4jBGOPBQ
	CUvnGIB0FyskzT1QasSocFI6i7dna75ojMUlOyjwEvPpjwAzyrENZwuryUhG5s3fG/ln
	u01RGiGldpIpc7etQQjLQSQF50xH7q/ngBiQnkiXSZIc4zyBWTH5BoHhu2JfXMoAbMW+
	V4c/H5XIWtj1N21Kmahb4yMBfTJHCo8JEOinaVHC+B7IAXPOlJkyAgisOe/pw9iiRAv1
	WgNZyBBCZ4mtiOC4NtO3YCCa5zJepe0CbMKlGgrjuhpKGnIOpLFDIgrHlUb5pd198cub
	0iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:mime-version:content-transfer-encoding;
	bh=+E/xaYekmijtvYO0L5GvSMA2c7UMkgp5kUcitWgjXlc=;
	b=dlJKLM7rDFYNfcanHNxr5HodzA+CJDLshkXKMGgFYLGBagb0suhzhxcl09i+S2+plQ
	lKqymYKVJPqk64Yvhh/0ZLuPzrISm7Hr9QTWkKfkliT7UAapQ7XZ3YUy3S3uHcXS+WYx
	+EZVTWFd4ShLxsLe3Xe4y7gVNp8+dlnhYffnfTOcfT7QONbiYg3YDAY8xZgh/P/qzJep
	jjN+WYe9sbcSy68cXtr/l6miGnzMsFM08BnhCoY9PJ9C9Bt7gZVgQWNO3OqorsME40HL
	0v5BBeQ0Fbr6I6WSahpFzAc8WefdpJSB10cIIviJWQJa0o7ZT9vYK9R6eZrjqPgTNIUa
	M1Uw==
X-Gm-Message-State: AN3rC/7cL58LzZQgb75U4Qesxoeou0wmP/2Oej8+O7gB62YOEny5DST75C1LzMTUpmbuKFEa
X-Received: by 10.36.61.131 with SMTP id n125mr10940081itn.91.1491828562314;
	Mon, 10 Apr 2017 05:49:22 -0700 (PDT)
Received: from pohly-mobl1 (p57A56DBC.dip0.t-ipconnect.de. [87.165.109.188])
	by smtp.gmail.com with ESMTPSA id i7sm6359722ioe.48.2017.04.10.05.49.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 05:49:21 -0700 (PDT)
Message-ID: <1491828558.10884.112.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Apr 2017 14:49:18 +0200
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: go-cross: incorrect dependency on tune-specific libgcc
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
X-List-Received-Date: Mon, 10 Apr 2017 12:49:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I'm currently extending the yocto-compat-layer.py so that it can detect
invalid signature changes when changing MACHINE. go-cross-x86_64 shows
up as broken when comparing signatures for MACHINE=intel-corei7-64 and
MACHINE=qemux86-64.

Both machines share the same go-cross-x86_64, but that DEPENDS on
libgcc:

meta/recipes-devtools/go/go.inc:# libgcc is required for the target specific libraries to build properly
meta/recipes-devtools/go/go.inc:DEPENDS += "go-bootstrap-native libgcc"

And libgcc itself depends on the tune flags for the target architecture
and thus is different for these two machines:

$ bitbake-diffsigs -t go-cross-x86_64 do_prepare_recipe_sysroot -s 563f419e3854c2351e2cbbf33a9025f6 64e378fd9853a6cd6a4e7f684f52d2fc
Hash for dependent task gcc/libgcc_6.3.bb.do_populate_sysroot changed from afb6b55c0e2b7d2e816b3d2d214a7326 to 208fac5ae428b07a4aa491b130879e4a
  Hash for dependent task gcc/libgcc_6.3.bb.do_multilib_install changed from 596e1612d7b84b7a9c1b409ee78cca89 to d41e2e835d0abe7646e53e3d63ce00cd
    Hash for dependent task gcc/libgcc_6.3.bb.do_install changed from 9ca4126c69fcceb410253a0603c3d76b to cb0c49687a91ea17f1027c6394baacab
      Hash for dependent task gcc/libgcc_6.3.bb.do_compile changed from ab80902424c73af49257cc3f6fe049aa to 436f978a703476968bd5ae1c1915ee5a
        Hash for dependent task gcc/libgcc_6.3.bb.do_configure changed from eb0c36d87f32ce1ceb7d1e42609578fb to f62c98806faf3a28c2144919b89d3460
          Hash for dependent task gcc/libgcc_6.3.bb.do_prepare_recipe_sysroot changed from b037b950e346bef71a4f8fd2c6a2195c to d4564b5730941279392932e3c670a5a5
            Hash for dependent task gcc/libgcc_6.3.bb.do_fetch changed from e64cd9e029ed63ba3a09e5fe085b7057 to ea4d3f9d10544219ceb8591d5a5a4041
              basehash changed from 8744593af2eddb60244788f2b9476e2d to dabeb22478ef501e35311af75119a2cf
              Variable TUNE_CCARGS value changed:
              " -m64 [--march=corei7 -mtune=corei7-] {+-march=core2 -mtune=core2 -msse3+} -mfpmath=sse [--msse4.2-]"

Does this fix look correct? It turns go-cross into a package that is
specific to the tune flags for the target. That fixes the signature
check, and go-helloworld for both machines still builds okay (haven't
tested anything else):

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 85f71a2e9a6..ac41c80d377 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -26,7 +26,7 @@ export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
 export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CXXFLAGS}"
 export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_LDFLAGS}"
 
-DEPENDS += "go-cross-${TARGET_ARCH}"
+DEPENDS += "go-cross-${TUNE_PKGARCH}"
 DEPENDS_class-native += "go-native"
 
 FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 68f5efd6c09..83015b49a99 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -2,7 +2,7 @@ inherit cross
 
 DEPENDS += "gcc-cross-${TARGET_ARCH}"
 
-PN = "go-cross-${TARGET_ARCH}"
+PN = "go-cross-${TUNE_PKGARCH}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
 
The alternative would be to drop the libgcc dependency, but I have no
idea whether that would work at all.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




