Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 174736077F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:19 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id a6so1999969wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Um4EKfALWckU1NALYAfH9OgTnwy+aMztjsegcVGbaeM=;
	b=Dt1ZyM+E42P7GjPcEP1grblCWgFVTQeuUYUd5FQabhjnmPizgdauug45b2N0S09bb/
	F9W3bYnH8uX/31e3acoXvIaYFeZLOziPNqMsIcojKmcIMvqLeotDdIQ6ObQBeQO885Zb
	BMQo0Y5XmcwCu9H/4qkYgXVdxrrsIaYbVErs99m2m3t2zJlHfM+Bi1QLIzQkBG6IQdKa
	CBrYs1mjcVYev8365O0Mq29aGQ+fSbhRxSVD+T911deVdKXBk+88YuDwDxFT70y1YeF4
	1PhPdWtC8yWGyD+GDu4TYWgzihTRSj7fNQCGKKH8sKox0yeVLzbfOXdpE+icGYQsP1Yq
	8ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Um4EKfALWckU1NALYAfH9OgTnwy+aMztjsegcVGbaeM=;
	b=iYo6zZag42KTGV8FRc+oEsiOqrXUrQXRSN9EyqRIMuX2NJ9xgC9o0Y2MXZN39sbVGt
	lITOqtl1DeYo1RS0HGPjU68kO5ZsljljTY3tHkLpTHzNMRVm4CTxtf4JS+8KoNZdvH1u
	BhmC68Co4wUHhQS4V2bKwOGHkyluAbNGZQ/he5hRc8s7Q8tdhbIZWyoEWYz/KVrv59rH
	O9T0f8LW/CT8sgsplsJCxUDme6kC/yTX218OGt6p74/diSNp5WglrQVFXyT+k7NvIFrq
	cYIngCCPL5X9zRwlWLLSUI5RpEOx22Jp5Nf8+Mt6c3BF9+AvZ+FL2wUmEQb/gcovXFwz
	6Pag==
X-Gm-Message-State: APjAAAW69IWo3vbDzKIMCFawQ7G0g2F699SWbH0AqtPJWLa9JsNzla2o
	YOYDs6KK7G/DZsms9x1Y5UxwGJC4
X-Google-Smtp-Source: APXvYqwj1TJ3bbx7jqLw9dnGHz+oUe4pYwsYKUx3MfPjAK6558uA1gnKfDmoMYxQrvEs55yADcn1Jg==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr12082096wmi.46.1582141700592; 
	Wed, 19 Feb 2020 11:48:20 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:44 +0100
Message-Id: <20200219194752.7967-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/13] weston-init: use the drm/kms backend rather than fbdev one for qemux86 machines
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:20 -0000
Content-Transfer-Encoding: 8bit

The fbdev backend is not documented, and not the default;
as the emulated hardware in qemu now supports DRM/KMS
(both std and virtio), we should align with upstream default
and vast majority of users. Empty init file will cause
weston to default to the KMS backend.

Note that 3D acceleration via virgl is not required; the backend
renders fine via the software driver in mesa. However, kvm
is more or less required to keep the UI responsive.

Also, other qemu targets (mips and arm in particular) continue
to use the fbdev backend, as in the absence of kvm, the performance
of software GL paths falls to unacceptable level.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini | 0
 meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini    | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
 create mode 100644 meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini

diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.25.0


