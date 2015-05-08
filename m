Return-Path: <philippe.coval@open.eurogiciel.org>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7D69C60138
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 13:56:45 +0000 (UTC)
Received: by wgiu9 with SMTP id u9so73317176wgi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=open.eurogiciel.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=KZeh+mS7eEwWM7ZRUxPfwx1vdm4r+QkeS7VWt/0k6ik=;
	b=UcXG+DgkEYoKiv6aDX3SfsuAmhSUGBJ8cxUdKynDYgkvpr6im+ki2zyRaa81q8bGsG
	mlp197Je68pMj+Jh/MxFQV4PSZ4WU7TtqJm7MecOWWAV/DGBsyhPQTxY4SxsW7yPRl49
	JMdsMKElCM0yJvsiF3lN1fHjZSqEeVvRfomhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KZeh+mS7eEwWM7ZRUxPfwx1vdm4r+QkeS7VWt/0k6ik=;
	b=RQrwQpcUfYHbRmKAh84MsqQCBKuWzO+rzwR9B/blUJAtCOdnpkrRJXe6Vw1jKtta+9
	eQ8thLRNTDgFqXNXGs0JqTHy7GD8wY0VHJ2faU+IB7mL12o6zb9RVHpmEPzKsp+CNUkE
	IMhKqLRxB64xzPLz4vbBpAHYZqVF3GiE82udtbjEbPPao6+sPul1EI9qCUTiN1PsfUTq
	dGGu8mQFMtwG6zcmCH8IiLplQB4R9pgpew7YxevsSeH7MvRQI6PKg1R6azu72iyPLLzO
	IwPFv1Mo5OKv9n790cYD6eX3nBm2/CmpwXCmTLYEkWI2CxVZVmQYUabsCle5QkIhRSKs
	P93Q==
X-Gm-Message-State: ALoCoQkPvthFbAAD9Dfm8Csn6WrYhtD9HbL3W9js6OWz42RMGrdODURbIYK0OntiT4roHA2VX7wy
X-Received: by 10.194.61.133 with SMTP id p5mr7792918wjr.132.1431093406876;
	Fri, 08 May 2015 06:56:46 -0700 (PDT)
Received: from pcl ([82.236.136.171])
	by mx.google.com with ESMTPSA id l3sm9508513wib.11.2015.05.08.06.56.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 May 2015 06:56:46 -0700 (PDT)
Received: from pcoval by pcl with local (Exim 4.82)
	(envelope-from <philippe.coval@open.eurogiciel.org>)
	id 1Yqilf-00024M-En; Fri, 08 May 2015 15:56:43 +0200
From: Philippe Coval <philippe.coval@open.eurogiciel.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 15:56:40 +0200
Message-Id: <1431093400-7922-1-git-send-email-philippe.coval@open.eurogiciel.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] weston-init: support system's configuration file
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
X-List-Received-Date: Fri, 08 May 2015 13:56:46 -0000

Look for OPTARGS variable in /etc/default/weston
and set it as weston's service default options.

This can be used to force system's supported backend.

Change-Id: I0562c9326df5b46226093199873ef58d77aeae75
Signed-off-by: Philippe Coval <philippe.coval@open.eurogiciel.org>
---
 meta/recipes-graphics/wayland/weston-init/init | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index 8e662e0..2e938f4 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -8,6 +8,10 @@
 # Default-Stop:      0 1 6
 ### END INIT INFO
 
+if test -e /etc/default/weston ; then
+        . /etc/default/weston
+fi
+
 killproc() {
         pid=`/bin/pidof $1`
         [ "$pid" != "" ] && kill $pid
@@ -34,7 +38,7 @@ case "$1" in
                 chmod 0700 $XDG_RUNTIME_DIR
         fi
 
-        openvt -s weston
+        openvt -s weston -- $OPTARGS
   ;;
 
   stop)
-- 
1.9.1


