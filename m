Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C74960190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 00:40:44 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id i124so572072pgc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 17:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ousek+oKIzTQc8BasbJM4q+4kcjkry/9mhavwQGpkpk=;
	b=YEacZSF1OMQs87103uaM36oyqexrp6mp38cns0TdJcafrjy9ovu5wIYDEjVQgREND4
	OZlysqMmUq/dRSPsrsY5R+OHDQ+ICS9/T7XvuwMoxTsMnXHUKKAUk/Q7KdbqdbSM5z80
	KVTacWVF+VeWksrYEJ4aYREBSgLuU/PHMDW4pVbUg99TV1OBj2RqOyym3IrHWwyIDEGb
	wq6P4IREGMHKo+4RhtJcj+UmYOK28dHvBrfYXM1+OQCGjngXsFt6zgfJ5trFKyJf74Ae
	R4UYqAUf/FNvmD4fdpPwsWBeU38E7tJhXJ5SPJCoL29oIVcebq3vTRmtBEnZrbn8lyFf
	21pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ousek+oKIzTQc8BasbJM4q+4kcjkry/9mhavwQGpkpk=;
	b=V7cizKPAD4mgFlMnF6XK74HF8d1cdzaDlxv72T9cjOWUDi/p25pvJOkdB6f8mnDcuC
	XWPFJrsNWXdv6iCAfe3l0G8ZiebJ4MfpCrJAF46cWISVYODvtoF1SmWy7d39XFsDECiA
	4325pL2nGFQhwRNSEv6/rGxmAcs+OOFce02rzn2ta4VBez+d9sCJ4oSeC5LCk6pc8pr7
	yWRaE+yDrBYmqkIiTAmq3w2teDZJsZMldD3lIZQXOu144XRBrtOqj8U0TO4SSOLPLdCG
	TDvm7XYoVgGluvVD9bfGj8sAQaGwgePkDf0vvgEaXuwMt40eXb6UT2Eml5xygJlOnRjQ
	QI9g==
X-Gm-Message-State: AElRT7HrltwffBuJKXUzMp2GM6DyqgD2R608Qpe5j0iEinFkBwtp5PL7
	kPZDazHubHpn08/vahq6I7OXOWHK
X-Google-Smtp-Source: AG47ELtJhfhosmEGgxZcFU0Osxq3yeRsDPSeKPUKIxlhmMlTeMzZY93NA2No29ZCK8mxT804Tz0M3Q==
X-Received: by 10.99.107.6 with SMTP id g6mr30401943pgc.109.1522111245330;
	Mon, 26 Mar 2018 17:40:45 -0700 (PDT)
Received: from ip-172-31-22-0.ap-northeast-2.compute.internal
	(ec2-52-78-229-153.ap-northeast-2.compute.amazonaws.com.
	[52.78.229.153])
	by smtp.gmail.com with ESMTPSA id 76sm30976pge.5.2018.03.26.17.40.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 17:40:44 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2018 00:40:36 +0000
Message-Id: <1522111237-1869-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [PATCH 1/2] waf.bbclass: Throw error if waf doesn't exist
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
X-List-Received-Date: Tue, 27 Mar 2018 00:40:44 -0000

From: Amanda Brindle <amanda.r.brindle@intel.com>

Before, waf.bbclass would fail to catch FileNotFoundError. Now, it will
catch this error and say that waf doesn't exist.

Fixes [YOCTO 12553]

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/waf.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index f9a851d..19e9376 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -15,6 +15,8 @@ python waf_preconfigure() {
             d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
     except subprocess.CalledProcessError as e:
         bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % e.returncode)
+    except FileNotFoundError:
+        bb.fatal("waf does not exist in %s" % subsrcdir)
 }
 
 do_configure[prefuncs] += "waf_preconfigure"
-- 
2.7.4


