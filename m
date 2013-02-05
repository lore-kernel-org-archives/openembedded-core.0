Received: from mail-bk0-f54.google.com ([209.85.214.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2l7e-0003zm-1T
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:11:50 +0100
Received: by mail-bk0-f54.google.com with SMTP id w5so153835bku.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=l4PnDTL4QP4R5TvBrd2N8rB3yOFAamGUsE0Iueqisn0=;
	b=T1nVvEzuCp4/yEJJrlqXLztPtm/iK4cSV2DLK2Rbh8gwrHPCllUBvLYw0HkELcUSLW
	+EZ9yYuMC5oWR4SasPomE0lpnHEqdUhHSIpKst3hTOyIAGGV9FNQ3v0WTaPyT/c0F4n8
	haXTljY/oj9Ba4US2XJ907IWACfzeQd/KlvIXVrQY429TkYjt2Zkq1I5SMywJ64tBkT4
	57yxyDGvTrQCj483xGqeVNhruLzHGpwLmYFPvgc40dvcXbaTnDEB+iL+/sgeATHHZHBq
	ivAv0EY8cSFjvo5ILjyuAazqo+cPoizkrKt1ZzLGf4TF28c7RBYQE/FhSTyTw8XvNaav
	BT0w==
X-Received: by 10.204.149.81 with SMTP id s17mr6627064bkv.117.1360079760512;
	Tue, 05 Feb 2013 07:56:00 -0800 (PST)
Received: from s42.loc (91-119-139-175.dynamic.xdsl-line.inode.at.
	[91.119.139.175])
	by mx.google.com with ESMTPS id gm14sm6744754bkc.7.2013.02.05.07.55.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 07:55:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U2ksG-0004XX-TZ; Tue, 05 Feb 2013 16:55:56 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:55:45 +0100
Message-Id: <c4bfd1da6209da458cb0944a719801346f300dd9.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
Subject: [PATCH 5/8] busybox: add ifup's ifstate dir to package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 16:11:55 -0000
X-List-Received-Date: Tue, 05 Feb 2013 16:11:55 -0000

ifupdown stores its ifstate into CONFIG_IFIPDOWN_IFSTATE_PATH.
Fixes:
ifup: can't open '/var/run/ifstate': No such file or directory

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 972e7d0..972df6d 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -199,6 +199,10 @@ do_install () {
                        install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
                fi
 	fi
+	IFUPDOWN_IFSTATE_PATH=`awk '/^CONFIG_IFUPDOWN_IFSTATE_PATH/{split($0,x,/=/);p=x[2];gsub("\"","",p);print p;}' ${WORKDIR}/defconfig`
+	if test -n "$IFUPDOWN_IFSTATE_PATH"; then
+		install -m 0755 -d ${D}/"$IFUPDOWN_IFSTATE_PATH"
+	fi
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 }
 
-- 
1.7.10.4



