Return-Path: <kergoth@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 327257C876
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 21:36:33 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id o17so7197836wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 13:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C3tkgquslAnv3i0dxCaCMKoZroUfiA4X/GfVj/mIEK0=;
	b=g0wmpPrP+ReQ+Y5PGMFZ0dlb/vACCYLCJsRK5yHsWbtNeph8Jp+nIPxooFi/i2wQr3
	O8+JxUJgIihjCrw7sJcDLYR2/NbP3xla8cHFErZq++2wn40Vf4LRrPHborwPX96rL3Hp
	ywoTemwYSXeeuddoWH9h7umsByiW+yXRzeEK/QhhVyY9CwkwRYvxm+2ZvvwJMmRCyjJ+
	b/yvjGWBvgZPf2+vwEVrIjmZ4YaKCZMV/9vXyR0fTgTw1OWvZAyM61OlwqTpDLMIl9A3
	sYSNFP9XhpjHOkFAVQJCda12WITV5ij6Kfuj644Pf2XTx09L5fGksZgdulmtDA62+Psm
	q+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C3tkgquslAnv3i0dxCaCMKoZroUfiA4X/GfVj/mIEK0=;
	b=sBodulU2wAv21d0DL4kmbD28lVy4Bk5iJylTuHSBze+5N0IIkl6mvCmjeWoHI0L7fI
	gd/cmmWEspR4bnvGThBjqL5IV7udJMy6B0bupyU9dEyefzvrYMbOgBr3MKtIqkDP6hoE
	VvGsgvJLEESW11HkXtx8afX1x077nlHNBPPYSnLikZU60FYz4ElorxloNhqljyWpaRLt
	lSAb0GxDt64ea50ZkJvJnupeFzxafX8bbWXOEA4dgmKWPE+Yw7aIGpZUaUj/yzyiWLgK
	Ersdrl2XVneHm8xQCO6+edegf94/Kl4zRcj9cjtaPbAhpHjXAqwjn5XceG3Y7xK1K/WJ
	sT7A==
X-Gm-Message-State: APjAAAWcxTQsB/46pgbkvWF4KRMsqScONQOsh8fclvPx1f8vcPJWNxy7
	yNLU1Wdld9IoO2MV7/zrS1cCEsCSmNk=
X-Google-Smtp-Source: APXvYqwrsABPNGp+tEHdh/PoigkS+ArBwDW7u/LMHT44IEyZQMrky5CmrxBeJuH4gEGOtMEQ/Z4h/Q==
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr15078141wru.67.1551735393653; 
	Mon, 04 Mar 2019 13:36:33 -0800 (PST)
Received: from ubu18-mel-builder.alm.mentorg.com (nat-lmt.mentorg.com.
	[139.181.28.34])
	by smtp.gmail.com with ESMTPSA id x6sm11819411wmg.0.2019.03.04.13.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 13:36:32 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 21:36:24 +0000
Message-Id: <eb277ce46a63c5909acc6074c66679d8922393aa.1551735224.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1551735224.git.chris_larson@mentor.com>
References: <cover.1551735224.git.chris_larson@mentor.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] oe.scriptutils: add logger_setup_filters
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
X-List-Received-Date: Mon, 04 Mar 2019 21:36:33 -0000
Content-Transfer-Encoding: 8bit

From: Christopher Larson <chris_larson@mentor.com>

This function sets up the default bb.msg formatter and log filters, which by
default sends ERROR messages to stderr rather than stdout.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/scriptutils.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 0633c7066e..c361d0741d 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -29,6 +29,7 @@ import tempfile
 import importlib
 from importlib import machinery
 
+
 def logger_create(name, stream=None):
     logger = logging.getLogger(name)
     loggerhandler = logging.StreamHandler(stream=stream)
@@ -37,6 +38,20 @@ def logger_create(name, stream=None):
     logger.setLevel(logging.INFO)
     return logger
 
+
+def logger_setup_filters(logger):
+    import bb.msg
+
+    console = logging.StreamHandler(sys.stdout)
+    errconsole = logging.StreamHandler(sys.stderr)
+    bb.msg.addDefaultlogFilter(console, bb.msg.BBLogFilterStdOut)
+    bb.msg.addDefaultlogFilter(errconsole, bb.msg.BBLogFilterStdErr)
+    format_str = "%(levelname)s: %(message)s"
+    console.setFormatter(bb.msg.BBLogFormatter(format_str))
+    errconsole.setFormatter(bb.msg.BBLogFormatter(format_str))
+    logger.handlers = [console, errconsole]
+
+
 def logger_setup_color(logger, color='auto'):
     from bb.msg import BBLogFormatter
 
-- 
2.20.1


