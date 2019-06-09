Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B24A97E517
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:24 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w34so3643252pga.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=biaOccepS2D5b8YbSjWZaKIOibk62aaL/jfcAJ3l5To=;
	b=N8WozvQmu3Wc/6ynjgISIpwYOvn0ew6HClO8JUlM6ws+CBHh4ecPyC4HnFkXotWl9X
	C+zbCgL+cgKT/XjSGhL8IyjGyWmffvgxwN1zpuqU1FSpsUusvAtpKNrf7x+pmA/+Vol/
	JCTs+nbPxTOORNHPHASah9gQJZZkbW1dMfEwYFbJjXZyFVHUf/pWz0JpxWr14olu5Z5C
	wP8PmH9VNwVdmefu5C0z7CLEaMmh4FAC6nKuidMbAHAc9taolU15Xbk4gxReXqlS4Xd2
	ClIzjkH4UrkJwWDxY0N4yfomHHlMfRJidV1GfbbARjd4mYA4Zd0GP9P+VDErqbd00k+N
	H3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=biaOccepS2D5b8YbSjWZaKIOibk62aaL/jfcAJ3l5To=;
	b=U+CU1muVZMzhmz/dcwWoKPfKbr04FfVKhB2+53UH0d9S0jAAonJjfxN5YOx4LlLxVs
	tI7qJdHvGaYQgn44OwDf0ktCLRBuY8oXi3+1pQtiKIqUXACzlr6M1rCyzNi3XWljitH1
	xv2JWvYZDysMhwNPThQxv2FmxXdxL5IrnHQO67fcoak88LRdBJB8gnnFk7T1LrHee/zs
	mo8sp8J2CxIMCoHCql37AYkQi3VvOBYa+kZsl8/Kbhy8e9a3LgqwTKVARd4Etvhbf7By
	E8ZpNzPYPSLNGYSYge/HT826nWL8Vdg0uWNLg/qKuqss1HFpq/9zwKpxoz7nFqBjhNOW
	ckFg==
X-Gm-Message-State: APjAAAUJoY/HGRFf+zakdYPuQnBd5SfPQjuoBEmcdl8XcOY50Lvfv3HU
	AGmmvTLlqsdsYELypYRLU6OJbKVJ
X-Google-Smtp-Source: APXvYqzhS7uB6GtbABFBd6y3OZUs6zvfKXQXN4/qEYipBSSbWitOydeCpQtMkuxFxnyYSkucRTGIoQ==
X-Received: by 2002:a17:90a:80c4:: with SMTP id
	k4mr16752550pjw.74.1560092065669; 
	Sun, 09 Jun 2019 07:54:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:57 -0700
Message-Id: <2c87f79f25c9fb73ca98ab822fd2a1f8f24a9016.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 22/27] runqemu: Add the support to pass multi ports to tcpserial parameter
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:24 -0000

From: Kevin Hao <kexin.hao@windriver.com>

In some cases(such as the oeqa's qemurunner), we need to setup multi
serial devices via the '-serial 127.0.0.1:xx" and the order of them
is significant. The mixing use of "tcpserial" and "-serial 127.0.0.1:xx"
cause ambiguous issues and we can't fix it by only adjusting the order
of them. So add the support to pass multi ports to the tcpserial
parameter, this will make sure that the order of setting up the serial
is really what we want.

[YOCTO Bug 13309]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Fixes qemuppc hang in warrior]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/runqemu | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 39bed03..19fd521 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -438,7 +438,7 @@ class BaseConfig(object):
             elif arg == 'publicvnc':
                 self.qemu_opt_script += ' -vnc :0'
             elif arg.startswith('tcpserial='):
-                self.tcpserial_portnum = arg[len('tcpserial='):]
+                self.tcpserial_portnum = '%s' % arg[len('tcpserial='):]
             elif arg.startswith('biosdir='):
                 self.custombiosdir = arg[len('biosdir='):]
             elif arg.startswith('biosfilename='):
@@ -681,10 +681,16 @@ class BaseConfig(object):
 
     def check_tcpserial(self):
         if self.tcpserial_portnum:
+            ports = self.tcpserial_portnum.split(':')
+            port = ports[0]
             if self.get('QB_TCPSERIAL_OPT'):
-                self.qemu_opt_script += ' ' + self.get('QB_TCPSERIAL_OPT').replace('@PORT@', self.tcpserial_portnum)
+                self.qemu_opt_script += ' ' + self.get('QB_TCPSERIAL_OPT').replace('@PORT@', port)
             else:
-                self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s' % self.tcpserial_portnum
+                self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s' % port
+
+            if len(ports) > 1:
+                for port in ports[1:]:
+                    self.qemu_opt_script += ' -serial tcp:127.0.0.1:%s' % port
 
     def check_and_set(self):
         """Check configs sanity and set when needed"""
-- 
2.7.4


