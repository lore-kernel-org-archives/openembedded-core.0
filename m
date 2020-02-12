Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C8D99606BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 11:33:40 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so1860398wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 03:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/MSpH6ULdEH4/5F2Wn+aXuP8DIKeM74owGxFdP7278c=;
	b=Zf3r+ZyFh3OwTPTZqGk1mIlnEbYR9QKGREPgfYj7eL3zjNDc+bt/eMkUb/wh+pKPbT
	6lwEWPOhIoYGc5QVitkf/lOIe+44wLZyratSv46sOHBi8mddKJNEVOHo6IfIBPmvfOaF
	5YNNrAUG/kn2fM+mFd5h3cTb0z/F6ChQB9W0y+SV9hRvCGxnaNnnnTMAjSIKTEkHx8Kg
	isjvLy607FK+1DB8FG93FHDnkLOw6zexV2wWo6mUmwbS29pYPfhtI9J1qH+R3CDVpFwn
	5R5s2vUoSPz8XoaLTLBI0hu91JH2SeuWLSARYCJ1pNIVhHjSukpKtOvpDn5pfjeXyNJh
	GKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/MSpH6ULdEH4/5F2Wn+aXuP8DIKeM74owGxFdP7278c=;
	b=gvJtMmPZuI3LBM6Lq+WbDQNcPJ0QBzjaQNOsPqMpC/7+oDepuDmMwhCzQEyYmApx67
	8lu9IzLhXO31auI5r+HumVNbHO0pJu7M9tuADU0ri0J2xqlFWsXKXjjAK4h7DpASJz5d
	Zqoa02UTSfDByMS9O8iup4LNurAFGRj2tC1MewgS/EUXdLiw8hZfrqFnK6Wt0hXt6Dc8
	jUvxHSZxYY1qrvsAkYtfZcsxzZJHZyo/T7QF1DQp+n3RNcDnn8erqoyhwpRpPutyvuI1
	KE4JcKDVqoIc86Wj7DxRg0TbjVUGP/+5EfkAW3WQZTldrHucK0FQTlyX3dMFXL4ARwfq
	32Sw==
X-Gm-Message-State: APjAAAX1jszRg56hg4qs06dEP4YwoN6ejnqsGoswxMaycQatT2X1XshG
	/4tex2Ggp5eWrnermKBtcvqA2KNs
X-Google-Smtp-Source: APXvYqxWwf0FazlvNgCYiOUtsH10VzLAIJdoT7YNJl1teUT2sJ7pdfAbkKk5co/3ZxF708als2r55Q==
X-Received: by 2002:a5d:4750:: with SMTP id o16mr5639131wrs.91.1581507221121; 
	Wed, 12 Feb 2020 03:33:41 -0800 (PST)
Received: from localhost.localdomain ([195.89.163.130])
	by smtp.gmail.com with ESMTPSA id z21sm386377wml.5.2020.02.12.03.33.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 03:33:40 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 11:33:36 +0000
Message-Id: <20200212113336.62171-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] kernel-fitimage: fix devicetree reproducibility
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
X-List-Received-Date: Wed, 12 Feb 2020 11:33:41 -0000

Ensure that the order of dtb/dtbo files in the generated fitimage is
reproducible.

Fixes: 71bfa9838cbf ("kernel-fitimage: Handle overlays in EXTERNAL_KERNEL_DEVICETREE")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index d1b8cdc1f049..72b05ff8d1dd 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -391,7 +391,7 @@ fitimage_assemble() {
 
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n'); do
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
 			DTB=$(echo "${DTB}" | tr '/' '_')
 			DTBS="${DTBS} ${DTB}"
 			fitimage_emit_section_dtb ${1} ${DTB} "${EXTERNAL_KERNEL_DEVICETREE}/${DTB}"
-- 
2.17.1


