Return-Path: <gavinli@thegavinli.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB6D7FAAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 22:15:19 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v19so11702847pfm.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=thegavinli.com; s=google;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KcRSQBfDWVESUb6T3zVZsMVOyHuOlSijvNN95yuoaKg=;
	b=atvHQcFMaiQLfEE4wm9I2DpCeFAvCASDqVkZybtiet4sMiONmN2KPavUm06uZeUli8
	bOCnPHSb1b52hlNxU17XL7IEJJJVr5+V2AdAr36bS1NhVwYuwg/jie3n+1ftAB4HOvPd
	S2Y0PIzyfLngsvFqpQ0NrNcBW36MRrgveikJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=KcRSQBfDWVESUb6T3zVZsMVOyHuOlSijvNN95yuoaKg=;
	b=qQi1e+CtEPRHWHvcnMFR68Fgnz9MjMI9AASxHF5UW8zSsPy5sb3T0/+sqjpjGGQthn
	TQzkdV8XHhUkuTjyBBNjqtpulAtLvMYo9RmCppIXFGGTzzGqT0KIFgMhe/WhiymJdxvd
	02xkseKy/5sHxFJQtOmM0s5sN1jmtTA7HwTJIGdTz1HKiBuHPmPQfEFiyxMOiGGhAN0Q
	B5R7PvBefaVChRbNi4rPp48WghmXqsPKvf16LtCxVlLr/K6BGcPevuSYvAEikq0TKznC
	hp9MgpHrQ/BSG3+yqUyx/5lkBU/g57qCKzv7KTJbehAxHfpXYnncEazsTGmRooL8BbSo
	tKxg==
X-Gm-Message-State: APjAAAXW2inST57pecU51Ebky7vF4uswHZnvGAGc5SFO7Uz+1gJiVZuW
	RXLjhQxqMt6bqhiR5qG2S529h4DxJf0=
X-Google-Smtp-Source: APXvYqx9Dk6BUUkEMxquRPNdMMHWkCO3mn07kOvPgxMQzcaKddUK4vWxHpTcfex8+MrxG0fji7C/nQ==
X-Received: by 2002:aa7:814e:: with SMTP id d14mr32756247pfn.39.1573510520152; 
	Mon, 11 Nov 2019 14:15:20 -0800 (PST)
Received: from mtgav.corp.matician.com ([2601:647:5a01:84c0::b5a])
	by smtp.gmail.com with ESMTPSA id
	v3sm20991526pfi.26.2019.11.11.14.15.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 14:15:19 -0800 (PST)
Sender: Gavin Li <gav@thegavinli.com>
From: gavinli@thegavinli.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 14:15:14 -0800
Message-Id: <20191111221514.1663272-1-gavinli@thegavinli.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Gavin Li <gavin@matician.com>
Subject: [PATCH] bitbake: prserv: fix ResourceWarning due to unclosed socket
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
X-List-Received-Date: Mon, 11 Nov 2019 22:15:19 -0000
Content-Transfer-Encoding: 8bit

From: Gavin Li <gavin@matician.com>

With PRSERV_HOST = "localhost:0", this message would occasionally pop up
during the initial cache read:

WARNING: /home/matic/ambayocto/poky/bitbake/lib/bb/cache.py:446: ResourceWarning: unclosed <socket.socket fd=10, family=AddressFamily.AF_INET, type=SocketKind.SOCK_STREAM, proto=0, laddr=('127.0.0.1', 45655)>
  value = pickled.load()

The file location stated is irrelevant; it just happens to be wherever
CPython decides to run the garbage collector. The issue is that after we
fork off a PRServer, self.socket is also duplicated. The parent side of
it also needs to be closed.

Signed-off-by: Gavin Li <gavin@matician.com>
---
 bitbake/lib/prserv/serv.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py
index be3acec36a..1d9148b817 100644
--- a/bitbake/lib/prserv/serv.py
+++ b/bitbake/lib/prserv/serv.py
@@ -243,6 +243,7 @@ class PRServer(SimpleXMLRPCServer):
         try:
             pid = os.fork()
             if pid > 0:
+                self.socket.close() # avoid ResourceWarning in parent
                 return pid
         except OSError as e:
             raise Exception("%s [%d]" % (e.strerror, e.errno))
-- 
2.23.0


