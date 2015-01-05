Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA38727DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:40:45 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so29007001pde.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=YKrUcz8BccE8KpJsGAlH6Zvwp4tnm/6MuR3Ekjmv/KE=;
	b=ttovOJy23INboAzo4wEm7cJffYEQcUBNud+HuIzO7Pnavc2L9ALgFUMA3UAZUSPWFL
	mLTtD+6ek2d2XLLFJvBgsGnmV6aFdYwmx/A9CQxdlJcCmTgYoLj0JvUMs9LlQyK8ALFa
	1vg40NRtk9cDD1i3coeSrW2WfDZ/xXNvbKCHsD3H0AVzTfv9gF2ilAbU9SKg1MutDflI
	kdXpH/kZHCAann01dhBXEeGSgBw2EyyYtn+Ho8SYJZiy9UKlBfstIW1xbLg+k9dly+MO
	w3MPCseQSbKfvfwTKEZozEvvX/XtdNoEzkmviOh1sccluIqe7E/j6tvlfqLfrFexP0Qi
	fAIQ==
X-Received: by 10.70.129.207 with SMTP id ny15mr148404805pdb.152.1420490446550;
	Mon, 05 Jan 2015 12:40:46 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.40.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:40:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:36 -0800
Message-Id: <a4bf1b847d55b747e3e64350e508b791a297eb14.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 02/12] sysvinit-inittab: Disable the carrier detect requirement for serial consoles
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
X-List-Received-Date: Mon, 05 Jan 2015 20:40:49 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

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
(From OE-Core rev: a899c362be71cb7b94bd318c57702446b017005c)

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Craig McQueen <craig.mcqueen@beamcommunications.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


