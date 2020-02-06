Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 20D5960AF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:36:02 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e25so5091900qtr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CdFVkLjmh/6ID/s320qZcuRQJJPypIeesmc+fQDAXXQ=;
	b=u4PAO0wWizVu2VLrP5cpU7h+i6Oy/sP9FrnwOlZ3upzXaMtBlAaNcC2CjexDddfTjc
	D8OtPMAUw/Pokeu/28IiCrUVGGGDV2tS/cfQUCBvv0KNpMEVg+4TCvBM6Uli3w+IORnD
	rmVH3BU+ZRhmedwvgglCe4nTQFNWCjIs4oORSYNowEY+bNZVrFC8hSv+JcvzCuJhYFnv
	uhzx3UFHTMuJ4x6pI6qlkxQVamunoikdeM0hs6sjizgftfpm7/JIaMRBmSWc4EiepWbr
	WMyFUgPz9YJ8Z2J+deqU+/eSPzJpc+z8UZuYcP2LDChoFIhhc91lo4H/I4vkl8VGtgWF
	BhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CdFVkLjmh/6ID/s320qZcuRQJJPypIeesmc+fQDAXXQ=;
	b=pE+PrAr9m2YvIVRCoJigd0jGW/US6RanNGJ1jXkTKJvi/eZffuHxs6SGCzkE+o73YO
	sQsIZzxW4pTWhAo0NIjIPo63RflZN8EK9Qt31e25QemYqgSeTg8AeyAUFrjI5LSCeu0c
	NLjR5jqwjBAPLUFBw/ZLLZg/muwSAXKFRQBKGBQnNLmO2lk69r/eUyq1OxLLRwQYu3OU
	nKz4NYKGu6y2EMreUUikdGt4b21XdcpHMq6GGxS0rG0nYA7C8S4raZz4XsA7wCt708CL
	eQWG7cEZduRC6adszwN2j202wLP6vsXQtzzevhzqO+67u3pF1/g6u+cgkyLjL69mGskU
	Bx6w==
X-Gm-Message-State: APjAAAWspU0s64GuU1y0VeblJrZai26R828DizAnnx/s4V42KKK11VMv
	yXntte6p0dSH6B4P9YPn5Lo=
X-Google-Smtp-Source: APXvYqyNRLFLTkcxG5KKslHVHmdZt4Od1niPgGqIfBtfx73TrVvxrm5pR64qaC7wRwMQPNTvonaa7A==
X-Received: by 2002:ac8:3886:: with SMTP id f6mr3618000qtc.160.1581010563044; 
	Thu, 06 Feb 2020 09:36:03 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.36.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:36:01 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:49 -0500
Message-Id: <308b2425ab2d20304fe33ada34a3089967a24af8.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] kernel-yocto: Only override CONFIG_LOCALVERSION if LINUX_VERSION_EXTENSION is set
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
X-List-Received-Date: Thu, 06 Feb 2020 17:36:02 -0000
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

CONFIG_LOCALVERSION may already be set in a defconfig or config fragment
and this should not be unconditionally overridden.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 9a4d2864eb..e8a9b1f18e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -359,8 +359,10 @@ do_kernel_configme() {
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
 
-	echo "# Global settings from linux recipe" >> ${B}/.config
-	echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
+	if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
+		echo "# Global settings from linux recipe" >> ${B}/.config
+		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.19.1


