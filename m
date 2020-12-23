Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web12.11570.1608742230510671111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 08:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4D1K2W00QJz1rxcC;
	Wed, 23 Dec 2020 17:50:26 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4D1K2V6TsTz1tSQw;
	Wed, 23 Dec 2020 17:50:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id xCdngQi1u6Ky; Wed, 23 Dec 2020 17:50:25 +0100 (CET)
X-Auth-Info: M2cAYKvW1xVGeW4v0qZGfdbYXSYyFHOIP6n5XCNQ+GM=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 23 Dec 2020 17:50:25 +0100 (CET)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Krzysztof Zawadzki <krzysztof.zawadzki@nokia.com>,
	Randy Witt <randy.e.witt@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@intel.com>
Subject: [PATCH 2/2] meta: toolchain-shar-relocate.sh: Filter out post-relocate-setup script
Date: Wed, 23 Dec 2020 17:50:03 +0100
Message-Id: <20201223165003.221976-2-marex@denx.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223165003.221976-1-marex@denx.de>
References: <20201223165003.221976-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The toolchain-shar-extract.sh script updates the SDK relocation paths in
post-relocate-setup.sh, so avoid doing this twice. This is generally not
a problem, unless the SDK path is a subset of the SDK relocation path, in
which case the resulting path is substituted twice. To trigger the issue,
  $ ./tmp/deploy/sdk/poky-glibc-x86_64-core-image-base-core2-64-qemux86-6=
4-toolchain-3.2+snapshot.sh -y -d /home/oe/.local/opt/poky/3.2+snapshot
which generates relocation path
  /home/oe/.local/home/oe/.local/opt/poky/3.2+snapshot
instead of
  /home/oe/.local/opt/poky/3.2+snapshot

Fixes: 93ec145f42 ("toolchain-shar-extract: Add post-relocate scripts")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Krzysztof Zawadzki <krzysztof.zawadzki@nokia.com>
Cc: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/files/toolchain-shar-relocate.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain=
-shar-relocate.sh
index 9c358a53e2..94d288ce05 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -58,6 +58,7 @@ done | xargs -n100 file | grep ":.*\(ASCII\|script\|sou=
rce\).*text" | \
     awk -F':' '{printf "\"%s\"\n", $1}' | \
     grep -Fv -e "$target_sdk_dir/environment-setup-" \
              -e "$target_sdk_dir/relocate_sdk" \
+             -e "$target_sdk_dir/post-relocate-setup" \
              -e "$target_sdk_dir/${0##*/}" | \
     xargs -n100 $SUDO_EXEC sed -i \
         -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
--=20
2.29.2

