Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 666F87E2A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 11:51:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v19so4154029wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 04:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6l4qDiQhBJQFuj7YxAKbIUGg3pjehHHaztUQbIf3W/Y=;
	b=DeVhpcEnYHyVUHCIVM4DkOdhD2SgagFqVbJV4BNwlGOBAfVI+fxBwBScHUXbEhNMu0
	+Uq83uVRjT0f7VQVKYw2uXIbBabn8E6I8ivvBMYjvJXCCOn7IAeTRF55rMBR4RIexIjz
	LhWccmGwi6p0GLS8FjEuiqtnFcsTbutVmemZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6l4qDiQhBJQFuj7YxAKbIUGg3pjehHHaztUQbIf3W/Y=;
	b=jt0Q50+xx3s+/lk6kDykUQ06um8T5xCKtROq8Hg08a1zEpAKgfH+XRiRAn3Z2CZgwS
	rB8T534V6HD+iFe51DVo5GgAVNFi4cPFD3Q6G3wit+aW5V3BsLtFjQdm9BcqosD8Wdh5
	t7qumpvqXYVeoHIEuV9L9MSehTdbgISTNjeN0MrB3NlO5QURkjhr3ZfUCFFdcBoNEO91
	MYU9q/+KCebIfOrWHZRpqvGC6FC97oG5FMRIJfoIIEF2MIQRiBYIJ7wBIjCFnUj9PHJf
	DdWxM1vIdjNQSiM5nZ1rsX884iDEPtX4Xz247O6/0udmeTa/HkZeEhzBWKUxW3GHPl0f
	t9vQ==
X-Gm-Message-State: APjAAAX6vWNt0lhRMB+Wg5TrHbiS4d9aaXAcXZ7A84+Asmop1+3ISEmQ
	Cb8f3EcNBCyo1Mpj4Oh6ZEDBZBpu85U=
X-Google-Smtp-Source: APXvYqzval6ZBO71oqTl4y0F4iHISKXpGrhR4eYdhq2Ha0yPlprLpkB2JtarnOaCghih6D73yAY8/Q==
X-Received: by 2002:a1c:f319:: with SMTP id q25mr6390765wmq.129.1559130711818; 
	Wed, 29 May 2019 04:51:51 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l18sm17924492wrv.38.2019.05.29.04.51.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 04:51:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 12:51:47 +0100
Message-Id: <20190529115148.28833-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529115148.28833-1-richard.purdie@linuxfoundation.org>
References: <20190529115148.28833-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] populate_sdk_base: Use highest compression level for xz
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
X-List-Received-Date: Wed, 29 May 2019 11:51:51 -0000
Content-Transfer-Encoding: 8bit

Whilst this may take longer to compress, it reduces network transfer and potentially
extraction time so is worthwhile.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a7f0fe74390..59920a57a76 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -57,7 +57,7 @@ python () {
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz -T 0 -9 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
 }
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-- 
2.20.1


