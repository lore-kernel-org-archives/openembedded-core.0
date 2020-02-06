Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 43AE160D93
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:36:05 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id db9so3246851qvb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Cwwz/3Cgi4/T3NwTNGFFDDDdDxNQv5m0K8Tvm+TV+Do=;
	b=DBqiNBR9V2XD3LGjP2zGe4mfqznUsrHYDqFk8mT4xASM8y9XcDeY0+IorhvHHWU83F
	RggMltoLduSUEjZeYNSzBuI1Nt0d88NjQQbYuJRyeuC+YrnH8Ea/R1PnPimlJXptSPY2
	96UTcdWXw9XfdsBNqCen6QbxuR/Y1GRXiHxkj0h/GdDUGfuDGbr0fwWVxxCbMZ6IGGFR
	K9rgWd29Oyg0FJJMfypSp0S8Kq0gb0tUFFuvGgVhrUi4MlctvQHSEkKg06bquytnQMu6
	eVTQ4twcbAkDMAEMKtR2heT+ZSGREsof1FSP8165gLofvPMqbpQLISOCMDsy/lpJpmYF
	QzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Cwwz/3Cgi4/T3NwTNGFFDDDdDxNQv5m0K8Tvm+TV+Do=;
	b=riQtjOA+vwgkcKZd9ZIl4X6WaeNEZ8jOFpQ6f39TUVN8X3qJfYnVh12TbDeHg4pc49
	umQ3Y+ksBTLwSqGv4AFGn+6oY3HxC6F5e8oh6HhbwC3mwSe/rY4xTRxHb4wJ7McL+Opf
	wBpqeRGX9F59B4LDVIvYVsKtmXOrehEQ6KHghAd4v3wVPJl/nBAgkQI/TX1e4d/xQynh
	6aLiGJJT30N36k1PthlgVEz/Jo9DftSjKGMpbkS/CsKNy1brNXHts355ame1aVIyGPxh
	W8bB8ItPr9r+2l9MvjYgQ+gfFPU3OHFf0KpoEwikeSj++dMMnSO13RNpsmUChmW0o2kZ
	bYyw==
X-Gm-Message-State: APjAAAXNv9QMKr3+Rzq9UmbJABJ9ngqX2o4vzz8NiL/Oy6yIrsp+UdPM
	QMUb0YjiZgDiyZesFwCKhFQ=
X-Google-Smtp-Source: APXvYqyNna1M6nelCpUQqVtm3RpQFd//rsdIADmhm9oAZCmx7NxgFFI4rcrUIMkYVu49HLl2dazY5w==
X-Received: by 2002:ad4:4dc9:: with SMTP id cw9mr3415441qvb.0.1581010566152;
	Thu, 06 Feb 2020 09:36:06 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.36.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:36:05 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:52 -0500
Message-Id: <36300ff0f34f374ade66d2a35d0f9771a187ec7e.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] kernel-yocto: fix defconfig detection in find_sccs()
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
X-List-Received-Date: Thu, 06 Feb 2020 17:36:05 -0000
Content-Transfer-Encoding: 8bit

From: Gavin Li <gavinli@thegavinli.com>

The current code would cause a file like "config.bin" to added to the
config sources list. I am sure the intention was to add any files with
defconfig in its name and not the other way around.

Signed-off-by: Gavin Li <gavinli@thegavinli.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index d961901b74..918d101d3d 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -47,7 +47,7 @@ def find_sccs(d):
         base, ext = os.path.splitext(os.path.basename(s))
         if ext and ext in [".scc", ".cfg"]:
             sources_list.append(s)
-        elif base and base in 'defconfig':
+        elif base and 'defconfig' in base:
             sources_list.append(s)
 
     return sources_list
-- 
2.19.1


