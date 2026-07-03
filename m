Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C651EC44507
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87931.1783067403659677028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XlZ/mSd+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47122683cf3so212539f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067402; x=1783672202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zahXOdzhuZpHY86GOtO3C00gbrIocz01aP9/drwaISc=;
        b=XlZ/mSd+TD4FcvQd7zSnTE5haNa5slVWNLOMEb2la+Bvv+W5a61+mFVRsjyksj+tTi
         pyo5EoCKhp0EYpzICqxZ993i46j2YQ6JYOQQPe+zlAqms+iAKeLoc4wh5KWcAjNst8mb
         cDCLvxdS+JtLNbnG0Y0QgAvVpQviF8tSjaHrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067402; x=1783672202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zahXOdzhuZpHY86GOtO3C00gbrIocz01aP9/drwaISc=;
        b=XoG1p/u3jcIrVi1lThYyrVZhzKEArS0jD9P3bd/2CllMdYTI3FswMYB5Is5KnKjPen
         7CcB/qmai7/Nq2oN+XusLLASNBqOoYzX5kjChTbsCbILAMM17iqZuY6u3RWqkQVZwVob
         sn5XEdg1IVwJ9aX0YOO93zrdjjHwyQlJjomXuGVLn02S9XyzFmorGmRUTMNc8pqV1yeb
         xrbR8VFSW3riZfvv/yXbNFQwjjYc4sDOVxGNVGHB16OFqo42tr9upyLeRbpSKdjsMaom
         9p/2urb1Rcp+6i0vWCESUxoogrniYPNxxGAspoaOHvAxu4+limZUY7u3wS2VhIoOQPfY
         T15Q==
X-Gm-Message-State: AOJu0YwBUNQ1+vWANZg7enIb0pTrE48ZHEteqE41RgI0sHPyiSHn8/z5
	jpp5+jc+KKIra+WrmptynnJb44xxrx7I5W3VKJKU6vAR+fT4XAZbDgZgBK2n//90hDZqSZGWHn5
	7Ala/EnU=
X-Gm-Gg: AfdE7cmBdsKW3WM4cRl7XlI6kpjNKWh32muvdGPgPOAjl0JTceVNm4SRlhOzZyYaYaH
	fPcJzgQ2Bxje5FVpgFZHn6OQTVgP7M8SKVGWlD7PSjh6LiSOwZ7LCjZ7l/Wbt+lKK57A1xDcl79
	+5C6lTh0sg6IjYMYPU/UzzUaIONmgWoBUOV6cUr9ok69iuIqtfC0BX9xG1yKoxcnJikQc3RZG79
	7yBDQF6ScI2v3vIJ2QMQvPGfR6u9GbJLKFFxKDTjc6McVu77CdhQpWCiyxebyFsQUrzVADyprm7
	r+2KSpfcc+JXRDATCpiVILB5Sr9WnPx+wYxYFbLInYL0qda1uJdlmSEwp/ujt0InOy2Ku//LkD9
	r6CIGWFjjOKEDHhUPzWXaeWhiA744IhYm5Y6xOqtjlz4Ghi02l8ojDYF7+VBx2xpiti7smJdpG5
	3VUxha5OOoDJOcUjkIu1cZMaEkPWIdXizVbkG4OaSUBxNmjkjTHzTA
X-Received: by 2002:a05:6000:27ce:b0:477:80fa:f474 with SMTP id ffacd0b85a97d-47780fafbe8mr10031895f8f.38.1783067401792;
        Fri, 03 Jul 2026 01:30:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/15] mesa/mesa-tools-native: Upgrade 26.1.2 -> 26.1.4
Date: Fri,  3 Jul 2026 09:29:45 +0100
Message-ID: <20260703082955.1585712-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240087

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ad82be99a66..bc7bef8d080 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch \
 "
 
-SRC_URI[sha256sum] = "bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0"
-PV = "26.1.2"
+SRC_URI[sha256sum] = "072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6"
+PV = "26.1.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

