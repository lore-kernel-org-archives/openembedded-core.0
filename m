Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1A5A871B26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:07:53 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id r185so51342904ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZLOByT0sGNfHGVlGWHs8jcBg9/6iEynAwL4VFcKcDqc=;
	b=B05JIMaJJ5VT2YcQplVTTwLTec5Cj4iWSWCq3sDxR/WEPMDrK+opxWi3GY0uUqc8lY
	DQ31FfHJpE8e1YsgjhtrczdL3MeJdLyvLqik1ZHkGq1S1Dcx4IRcHbPl/uuvuxesKnnr
	Sdue6jDhGJfJQNrVU7CBsE2A/VWC/bGwB6lk4R4dG98zYMAfMrA1ZJYk9SJ6IErvQj4h
	dbhgFtGPbTemdy61NeBP9uKJSDNVJx+WJ/KCdV7RibIsE4MuB/z5tFD7x79Hf8frH4ta
	iDngVhT3sJ11yAB8nskz/WCBCQQJuDLYRj9EzvszkmkA2TVUWT3uxP4d9fbwnd/pwRsa
	CFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZLOByT0sGNfHGVlGWHs8jcBg9/6iEynAwL4VFcKcDqc=;
	b=SQ9EEk9Nh757RiIBuUf7jhfzHUWrh0v6HezoCTpugZ5jOiXqVL8/tiakZnsweeoPgt
	K7ePawzpX0yynkSkp3YMFuKniPSpssNWMqgf+kKTGgneofkeE6YhYKMlPX+OgHWvhI7i
	HoTVXAUYmvwehHd23K48XhPN9HihxawqD3S33dLMKkth5znRYPKWSLT6qDGCJO3ruyIm
	Lc+RTc4bppsz9rkAOup/pxKryH09136AgwMScZ8z3VyyJMwHEkGxTGe7ZQNyCy7sQfLB
	WiLaW52pg6fQ7UU+O8JiUSvd9nSiuOIIV7Img9Lr2mniw/Ux2mKYZPps/GfKtNawgXSP
	6ChA==
X-Gm-Message-State: AIkVDXLNCfxYGB8Z41rIuzp1lm/rW3h8XhgQALGOd1Hk6L9JmZEtnnDAVQsmmzyET7tMjKjR
X-Received: by 10.36.61.207 with SMTP id n198mr4251761itn.60.1484064474179;
	Tue, 10 Jan 2017 08:07:54 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56084.dip0.t-ipconnect.de.
	[87.165.96.132]) by smtp.gmail.com with ESMTPSA id
	m196sm1391971iom.14.2017.01.10.08.07.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:07:53 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 17:07:24 +0100
Message-Id: <aba6fa129b00cb0b83766d4feeeb202603985d86.1484063948.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484063948.git.patrick.ohly@intel.com>
References: <cover.1484063948.git.patrick.ohly@intel.com>
Subject: [PATCH v2 08/11] runqemu: fix undefined variable reference in check_arg_path()
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
X-List-Received-Date: Tue, 10 Jan 2017 16:07:54 -0000

'arg' isn't defined, the right name there is 'p'.

This fixes a rather obscure error message when that code path
ends up being taken:

$ runqemu some/existing-file-name
runqemu - ERROR - name 'arg' is not defined
runqemu - ERROR - Try 'runqemu help' on how to use it

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7d84f19..9a5bca9 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -282,7 +282,7 @@ class BaseConfig(object):
                 self.check_arg_fstype(fst)
             else:
                 raise Exception("Can't find FSTYPE from: %s" % p)
-        elif os.path.isdir(p) or re.search(':', arg) and re.search('/', arg):
+        elif os.path.isdir(p) or re.search(':', p) and re.search('/', p):
             if self.is_deploy_dir_image(p):
                 logger.info('DEPLOY_DIR_IMAGE: %s' % p)
                 self.set("DEPLOY_DIR_IMAGE", p)
-- 
2.1.4


