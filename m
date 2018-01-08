Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD70788A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:00:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r78so15118865wme.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 08:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PlivXQXCnhobJss0hBgnWrb/6OC7OJ3eBnO3oVP1IQU=;
	b=p/R8ESB6jAF828TMg0cbCJ76p8NAO1KYh7slF44o4iFQQPdN29UmMdHQ2TH2w0Patk
	XqAZrsOAQZJYP0bheBGz4lOvr5HDaL8d/lKcsFpUXJjBTPwoQPsUt8D1d7CarCwnOGks
	ifi3Hk3sAe3lVHWtXxhxfo2PiNMkdbypKbOVtlRNp+QWbT0CBCDe7Dw1P8LwADgcKwNY
	nsbZA5wy/slcxltK1JZusAONb59ToSN9GKeRKBG8Gkqo3GZW4SfjGyDl/L5ORVBvM9xa
	MhsRQYo5QSFritX47szY0Qvvuc0e1rLbt6ubAC6OoWfYxEIWE501YYUE4g3+LIF8P4/5
	0kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PlivXQXCnhobJss0hBgnWrb/6OC7OJ3eBnO3oVP1IQU=;
	b=KGvyalQjKRlVVbd9ITrRAPyD5ZMdkwZt4m/ytyCparCWEsxsu/AGbBjcIfP6Ele59G
	nJ32uLY9w6UC8ikS4reDNv8m06YY/NiS7MlUqO+UNa9KHbLDsvOuxMQzjKQXI60WI7Gt
	SKD8/UCfQVyQSXmymJETpodki8ysFklLhfPH0sIMIWqit6RBOIhYLH0l8O2vcq/euiRO
	mN+ThPyEin0LrQvYVyPf7WAqg8gi2ZxY42YPysNkTHjRap2c5+4jeTxHO0Il2BE40yHf
	T8U3R2vUx4nNl3STKScEbcrdMAxnImHniUrIRXLKg1u4wKb+J95EaIFlyY/aYEciPyo/
	4VDA==
X-Gm-Message-State: AKGB3mL/XGx67RSNwDOb1TcSP2spwe87A+v+2tJ2IWfuOHvbWPytHYCh
	hy/bKgFkAGiEnJBr1tiHWmUNdeE8
X-Google-Smtp-Source: ACJfBouXvGNCMDo+i8wW0B+YcZtdpKdQPmlJsxWM8RbAYgT0kIbJjKJe9Q+6YUCs54R5Sm7KZ1lLUg==
X-Received: by 10.28.145.67 with SMTP id t64mr9657328wmd.83.1515427243685;
	Mon, 08 Jan 2018 08:00:43 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b15sm11386658wrh.5.2018.01.08.08.00.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 08:00:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 16:00:13 +0000
Message-Id: <20180108160021.4715-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/9] psmisc: improve autopoint-enabling
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
X-List-Received-Date: Mon, 08 Jan 2018 16:00:43 -0000

Instead of globally clearing EXTRA_AUTORECONF (which by default currently
contains --exclude=autopoint) use _remove to selectively remove the piece we
care about.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 527a1d590f3..82ef947709a 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -18,8 +18,8 @@ inherit autotools gettext
 
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they 
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext 
-#doesn't believe po/ is a gettext directory and won't generate po/Makefile.
-EXTRA_AUTORECONF=""
+# doesn't believe po/ is a gettext directory and won't generate po/Makefile.
+EXTRA_AUTORECONF_remove = "--exclude=autopoint"
 do_configure_prepend() {
     ( cd ${S} && po/update-potfiles )
 }
-- 
2.11.0


