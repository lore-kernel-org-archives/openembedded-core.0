Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id D0011720B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 10:33:34 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id r5so8928209qcx.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=eW7BuOe6zzRfRYvjETPSSgOh5gFm0/YXwzkuLD8BTnE=;
	b=wAekhCMgrlWr0WFbHO/AmH1Kvcm00n2Ytl9yjgEJrPNmYPqxeTPawzkBDYunAFAgM2
	I313/GyIunlOqUU+E5VzxfUCB0MgEX8seLgRK+5j/n1pq3Bbl3zhqoIY8uSel9O3ULJD
	umg3sp8QwF7rFvpdnaRcqb97sApNzZzbh+JWNMqPpdcrsqEpaYLX2mPUPX/IfvpZG/Eh
	2vc4w1TOCi0DvqMYKVCG+vC4cYR4X6oJ4HYnxGVM6D4ZT3oa5X+5BTUrlFYZH8ZzSgg8
	FxBFpKsigimiCRSGXPsczdv66ke5VD/4xjuFjxkKcFNp4D2/Jgw5OAu69jhO9sWVaTYi
	cV8Q==
X-Received: by 10.140.49.107 with SMTP id p98mr57503568qga.20.1415788414785;
	Wed, 12 Nov 2014 02:33:34 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.193.50])
	by mx.google.com with ESMTPSA id 78sm20647412qgp.2.2014.11.12.02.33.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 02:33:33 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1719A1C86BEB8; Wed, 12 Nov 2014 08:33:31 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 08:33:25 -0200
Message-Id: <1415788406-23120-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1415788406-23120-1-git-send-email-otavio@ossystems.com.br>
References: <1415788406-23120-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] sysvinit-inittab: Disable the carrier detect requirement for serial consoles
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
X-List-Received-Date: Wed, 12 Nov 2014 10:33:40 -0000

This aligns the params of getty with the ones used in Debian. From the
getty(8) manpage:

,----[ getty(8) manpage ]
|  -L, --local-line
|
|    Force the line to be a local line with no need for carrier
| 	 detect. This can be useful when you have a locally attached
| 	 terminal where the serial line does not set the carrier detect
| 	 signal.
`----

Reported-by: Craig McQueen <craig.mcqueen@beamcommunications.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Craig McQueen <craig.mcqueen@beamcommunications.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index c3244b4..657ef02 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -23,7 +23,7 @@ do_install() {
     do
 	j=`echo ${i} | sed s/\;/\ /g`
 	label=`echo ${i} | sed -e 's/^.*;tty//' -e 's/;.*//'`
-	echo "$label:12345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+	echo "$label:12345:respawn:${base_sbindir}/getty -L ${j}" >> ${D}${sysconfdir}/inittab
     done
 
     if [ "${USE_VT}" = "1" ]; then
-- 
2.1.1


