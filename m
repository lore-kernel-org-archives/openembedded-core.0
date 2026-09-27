Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D873C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:46:57 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39688.1790527608201637563
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cHJl7J6f;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so3975465e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527606; x=1791132406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dd39/kd5xXB8krlLNfcRyQuH/kZvUcEbydpfNolyJV8=;
        b=cHJl7J6fBanLbCYGYu/fhKGhlOZwxC+dMxz/rgJfr4vePgonAuNoDYe5jteIHrwhYV
         Ku3x5bSs/9GWY9GEqbEkiT64uAzZHnHYX7MxWO5d10JCWjhnYYyK+gZ/pk42yPCvxGBv
         k0InJcK6gd3O4SZmgJzVogSbS/8dtRFrvuMnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527606; x=1791132406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Dd39/kd5xXB8krlLNfcRyQuH/kZvUcEbydpfNolyJV8=;
        b=OomkQfD4MUN+Jdz11E+3EG2Zy2VAmwmQclnM82TVsYQ20gHQ5AfSQhEZGzOp3MhQge
         uUjpVEK47Hg4iCQ6XFc+6NMjzKMmqaEECyzGrjeGdXvijk5kKbfGbY3Ka78kOGwOCgh3
         5KLU77i4o6XbfT8DlFfURCoqUMKSIdwA29F5WT/aiAwRwtzjcWDfOUEzp/FhV3ANPm8W
         4O0eePLZmaogAX5fkk+ixUKFrNTHvI3n0MLuPYEa1wig6Fys/+TCFea30qT7eULoQEMU
         YhupjNIbdKw9p7ZcqqcTd6t1mQsUwWZm/jQYBWtsSkfcGYEzU0TyRgAMoOU6PQcMqP36
         x1CA==
X-Gm-Message-State: AFuF++mkYj6p4J59BPVA4ckQblAljOp2RzNa9ZAw0oLT2bNLbpIbX/n7
	LfhgcHIEimDw5sjMqA85rdj8xlLtRFQ488SAJCfrqXBqQLBCqAdrf3EMGmM8N1r3y5VUS28NYr7
	I9sG8/xs=
X-Gm-Gg: AYBFou3MegEPaoMAog99RT4iJ1eCPw91JOWauqsKgqRd74Ah+1IbxNr/XGBRDJ8DJMF
	awaHnyB09TQTNz/Z332Xd9cyVWjtVTTcdD+dFvY58KH3UYTp8bEr/MgPTEe1YLQ0x+ffn+2dRM0
	WHzqPBSJJxAX6WcqwidKcG6YX8PXQsZNs4KcBx83F1XicBxrcLWciSzLuUcIGclzi0YfiWxNYNl
	xAG4b7kI7HcJn8KVuscILL8zoHjtPj1URyDzknbq/FmqH+pWaLsE0Gtj07d7fCS/mhe3iTe4YvJ
	tlTc8X37A93Mb5mUuHBnIUij1vY+LoCv6olMn8Cvw9LNRMaRxbPpbH3t9J2iBKgT7B9l0qntwbW
	zx6M+jcuhl3WvGlYs2TLwxDkMyPX4002nmG7u2qJ1RsTYrixtfXPW57Y2+Yj3NGO2I/HHTRCTmI
	XPlmB0mfFbzAxllfwlxul60z2xaIIGVhi4n8KQTtI1X2lmiopbOE+gmTuQm1FxEzKtIfWoL1FDN
	u28mZTTGeIvQGss/8eLtXBerVgnynzzJbRhtQ==
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr195432755e9.4.1790527606457;
        Sun, 27 Sep 2026 09:46:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0029203absm54683365e9.6.2026.09.27.09.46.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:46:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] python3-uv-build: upgrade 0.12.17 -> 0.12.19
Date: Sun, 27 Sep 2026 17:46:31 +0100
Message-ID: <20260927164631.2484854-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
References: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246698

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-uv-build-crates.inc               | 12 ++++++------
 ...-build_0.12.17.bb => python3-uv-build_0.12.19.bb} |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.17.bb => python3-uv-build_0.12.19.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 486d993c327..3ba46dd5de9 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -58,7 +58,7 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
-    crate://crates.io/either/1.17.0 \
+    crate://crates.io/either/1.18.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/encoding_rs_io/0.1.8 \
@@ -166,8 +166,8 @@ SRC_URI += " \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
-    crate://crates.io/ref-cast/1.0.26 \
-    crate://crates.io/ref-cast-impl/1.0.26 \
+    crate://crates.io/ref-cast/1.0.27 \
+    crate://crates.io/ref-cast-impl/1.0.27 \
     crate://crates.io/reflink-copy/0.1.30 \
     crate://crates.io/regex/1.13.1 \
     crate://crates.io/regex-automata/0.4.18 \
@@ -367,7 +367,7 @@ SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf8270
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
-SRC_URI[either-1.17.0.sha256sum] = "9e5e8f6c15a24b9a3ee5efec809ccd006d3b30e8b3bb63c39af737c7f87daa1d"
+SRC_URI[either-1.18.0.sha256sum] = "252afb9ae5eaa683babdc6a068b3f5726eb19e05070c731f9b2a23a7c3e8ed34"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[encoding_rs_io-0.1.8.sha256sum] = "fba3fe847045ecff794b9c138293a80db914678c453ad63fbf0c6a9eb6e00b22"
@@ -475,8 +475,8 @@ SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
-SRC_URI[ref-cast-1.0.26.sha256sum] = "216e8f773d7923bcba9ceb86a86c93cabb3903a11872fc3f138c49630e50b96d"
-SRC_URI[ref-cast-impl-1.0.26.sha256sum] = "2c9283685feec7d69af75fb0e858d5e7378f33fe4fc699383b2916ab9273e03c"
+SRC_URI[ref-cast-1.0.27.sha256sum] = "7e440fb4e4b4147295338efb76001ab9e4efc0e5839df2c47fc5ac2381d365c3"
+SRC_URI[ref-cast-impl-1.0.27.sha256sum] = "92ecd8964f8453721699a1ed72037b0db49ce2f5a5138486ee89bed6f67cdf3a"
 SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
 SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
 SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.17.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.19.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.17.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.19.bb
index 322ac35f488..9004a762480 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.17.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.19.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "ae5cd835cf479a76efb161ddb9c6411acf63f5687dacd3d56d15e9a5783f740f"
+SRC_URI[sha256sum] = "6b605574da32cefd4264727f7e391e77fe289686192a7eb772e69b3e705da577"
 
 require ${BPN}-crates.inc
 

