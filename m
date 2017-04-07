Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id CD08277E44
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 21:33:59 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id b187so100228321oif.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vRQ5QH6rB2gQ5ZG7KujDm+KWBJdq8xrvRn/Lzhb3mks=;
	b=A+OJskBTNkd9BdWueaEnosucqKOtm3dr5u9gNqQdpbh3OMUhtDJABWj5nNi/iZWKoq
	GMEL/vYNLO3dtPVjdaMRUfUVJOLh0+QRu5FBUrYvvIiCJbylrUcdhE+dhgkG72pXdyDf
	guIHXZjDIqRGV2fIkr8vfkpHUluvDSPzxFlC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vRQ5QH6rB2gQ5ZG7KujDm+KWBJdq8xrvRn/Lzhb3mks=;
	b=d3z/0L7/y6jiByJVSrSO1wMXbKktOmEzujFF2ShiOs/qbP5zwFrCKocGtwEBFd/7J6
	lWG5M1NcfdqQfWEZDcV8PuzfW1pCI7bODQEFr7IgDQZjAQty+dr0yzHT5xmFwQ/Hs0/T
	v+XIiug9FLjp5pCkDT8ttdKIeZIU+MSwv6iYegak2ME6cjyisaw41TtjFdjbq+waw5XJ
	A/3HYQtLkE9HMzy53Xg+difKJpRwdA7l2P2zpN4tiSwi8BtzULggQlh3VQjBwGxOycgi
	854AirMIeDpFy9HgZXc2wPD5VA/Y5AOPjv6qcL66WTrzevFpoYEwebzjz2tdycYvsJtr
	f5CA==
X-Gm-Message-State: AN3rC/5ljfdmocJz2Mlm5rMzULSPBnJ/jAmc8L8WaT3INwm7LOGzXnHINjiG1BXSyyS9JAzh
X-Received: by 10.202.78.130 with SMTP id c124mr390962oib.20.1491600840976;
	Fri, 07 Apr 2017 14:34:00 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	o12sm2138798otb.14.2017.04.07.14.34.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 14:34:00 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:33:45 -0500
Message-Id: <1491600825-3905-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][morty] base-files: resize only serial tty's in profile
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
X-List-Received-Date: Fri, 07 Apr 2017 21:34:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Backported from master.]

We don't want to run resize on non serial consoles. There's
been an earlier attempt (6557787), so this builds upon that.

The problem we're seeing is that if there is text buffered in
the virtual console (like from a desperate user trying to
enter login details), resize will get stuck while calling
  ioctl(tty, TCSETAW);

Since serial consoles are named (not just numbered), this
change limits resize's reach even further to run only on
/dev/tty[A-z] (thus avoiding /dev/tty[0-9]).

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 7367fd1..c616616 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -26,7 +26,7 @@ if [ -x /usr/bin/resize ] && termpath="`tty`"; then
   # Make sure we are on a serial console (i.e. the device used starts with /dev/tty),
   # otherwise we confuse e.g. the eclipse launcher which tries do use ssh
   case "$termpath" in
-  /dev/tty*) resize >/dev/null
+  /dev/tty[A-z]*) resize >/dev/null
   esac
 fi
 
-- 
1.9.1


