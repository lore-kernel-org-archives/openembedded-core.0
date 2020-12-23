Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web09.11517.1608742230508744635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 08:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4D1K2T5fJPz1rxcH;
	Wed, 23 Dec 2020 17:50:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4D1K2T53T4z1tSQv;
	Wed, 23 Dec 2020 17:50:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id 3TkZ7_ZTTY8J; Wed, 23 Dec 2020 17:50:24 +0100 (CET)
X-Auth-Info: nCGkYbR8OSWz90QBtC3UqSB92oSgbwmcpQ/udCkNeec=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 23 Dec 2020 17:50:24 +0100 (CET)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Krzysztof Zawadzki <krzysztof.zawadzki@nokia.com>,
	Randy Witt <randy.e.witt@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@intel.com>
Subject: [PATCH 1/2] meta: toolchain-shar-relocate.sh: Do not use $target_sdk_dir as regex
Date: Wed, 23 Dec 2020 17:50:02 +0100
Message-Id: <20201223165003.221976-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The $target_sdk_dir path might contain special characters, for example if
the path is /opt/poky/3.2+snapshot . Prevent grep from interpreting those
as part of the regex by using the -F parameter and multiple -e parameters
to specify which strings to filter out. Also note that the previous regex
was using asterisk as wildcard (e.g. environment-setup-*), but that shoul=
d
have been regex (e.g. environment-setup-.*, with dot) to match correctly,
this is also fixed by this change.

Fixes: 9721378688 ("toolchain-shar-template.sh: Make relocation optional.=
")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Krzysztof Zawadzki <krzysztof.zawadzki@nokia.com>
Cc: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/files/toolchain-shar-relocate.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain=
-shar-relocate.sh
index e3c10018ef..9c358a53e2 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -56,7 +56,9 @@ for replace in "$target_sdk_dir -maxdepth 1" "$native_s=
ysroot"; do
 	$SUDO_EXEC find $replace -type f
 done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
     awk -F':' '{printf "\"%s\"\n", $1}' | \
-    grep -Ev "$target_sdk_dir/(environment-setup-*|relocate_sdk*|${0##*/=
})" | \
+    grep -Fv -e "$target_sdk_dir/environment-setup-" \
+             -e "$target_sdk_dir/relocate_sdk" \
+             -e "$target_sdk_dir/${0##*/}" | \
     xargs -n100 $SUDO_EXEC sed -i \
         -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
         -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
--=20
2.29.2

