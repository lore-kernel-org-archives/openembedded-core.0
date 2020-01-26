Return-Path: <gavinli@thegavinli.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id C54757F362
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 05:35:38 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x7so3423021pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2020 21:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=thegavinli.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gW6nmoeGvTdlxW1vDhNCCaYHNvKFvLWereUdvelZPXo=;
	b=P4YcyGOblpVo1C6r1dTgkb1lqCHH8pDVxjlgqMGdcBLwveISPwX4QJuTMjTcbf88TS
	YMcTbaAbX71GP9XhHTF/WjjKA+DA/Y6mxu9dndcK/3ee8ZVqFTkk9twyNmCDDzNbzg1r
	f/9wIWcFBuUf8uZMIdAZbrX3UF6LGpvscR3cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gW6nmoeGvTdlxW1vDhNCCaYHNvKFvLWereUdvelZPXo=;
	b=MxNcqkv4jZKQio4z3LGeI/BjsrR8evdu/wBsGIBNVL19DvFSU9B+2evlPqM6oWTi7w
	U6mZWINIBEC+LDhAGDrx2wnWcMTeKZOeLjTogeJekHOXXBLMMgHVhem1vBSBdODmI2Jr
	0M/Ak8/4XEh3a68HviJXjRNGabZS+fWqGQb1NYkI+4vVlRR+/ea0k027jaCBVsGBIf0N
	6tQicmKybkHKpSxtJNqUmbVP/YDTVC8ZC9TJPHrgZGc1y0T8+a1MdGm8omgOQWIc5yiL
	BzOJfqMFMk2bTOVK6C52GFHj9TUVibV+gq8xC2Hl+8YX7VVELjwZjyIXdrbINSrNDsDk
	kc1A==
X-Gm-Message-State: APjAAAVYlgyia6GIFm+y6vYj2uXY7I95xAsYENy+/aHnVtrHL5dpfvm9
	e4dvY/M/SCh9svptc/mTLT8Wmv5erWw=
X-Google-Smtp-Source: APXvYqyonhZLAjcW5gF+HotE14dvT25ZSGga6glKogl9xhw+1bdISguiMganORAuIHUqmxFhRNovSg==
X-Received: by 2002:a65:66d7:: with SMTP id c23mr13388643pgw.40.1580016939650; 
	Sat, 25 Jan 2020 21:35:39 -0800 (PST)
Received: from march.lan ([2601:647:4c01:5bf1::80])
	by smtp.gmail.com with ESMTPSA id
	b24sm11081801pfo.55.2020.01.25.21.35.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 21:35:38 -0800 (PST)
From: gavinli@thegavinli.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jan 2020 21:35:34 -0800
Message-Id: <20200126053534.800346-1-gavinli@thegavinli.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Gavin Li <gavinli@thegavinli.com>
Subject: [PATCH] kernel-yocto: fix defconfig detection in find_sccs()
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
X-List-Received-Date: Sun, 26 Jan 2020 05:35:38 -0000
Content-Transfer-Encoding: 8bit

From: Gavin Li <gavinli@thegavinli.com>

The current code would cause a file like "config.bin" to added to the
config sources list. I am sure the intention was to add any files with
defconfig in its name and not the other way around.

Signed-off-by: Gavin Li <gavinli@thegavinli.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 87c681f1c3..32b32ac291 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -31,7 +31,7 @@ def find_sccs(d):
         base, ext = os.path.splitext(os.path.basename(s))
         if ext and ext in [".scc", ".cfg"]:
             sources_list.append(s)
-        elif base and base in 'defconfig':
+        elif base and 'defconfig' in base:
             sources_list.append(s)
 
     return sources_list
-- 
2.24.1


