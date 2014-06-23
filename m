Return-Path: <jatedev@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id AC61F62252
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 15:07:05 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id w7so6079454qcr.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wps3x4cfebyhXNU9svhvL6WW0VpB4sPfovdykQTkhLY=;
	b=XKwVYMczkWh4kkfSRj3+13WgbLM2naZcBRgFDyQv7GIY4WUin+/bFOsRtj6r3jKvN9
	tEXEMWCLG4wh87qy3T9JEjqekWCCYV7cutClRaFlbMf2t0ZFKa4O2tq30FkN2vhXdkha
	TP14sgrCc0B/3v+EgqUchIhsGXDHBRokdGUWgWbCU6qvyBtC6ja8PFww3sjsEmosXkJA
	KkwINMoftj407Z1Sbnf3JYyUAahxaKanv2NXgK4BW35yd3mAx0ogqpIPHVzFC5JZarKB
	O6GDWnLgvF/9pe1ZHbgFXCV5lppM8EnZCu/SFMYsJRsJ6HVM4xfmxgPL1KbkSG18YBfM
	vjIQ==
MIME-Version: 1.0
X-Received: by 10.224.163.146 with SMTP id a18mr14487029qay.31.1403536026895; 
	Mon, 23 Jun 2014 08:07:06 -0700 (PDT)
Received: by 10.140.91.84 with HTTP; Mon, 23 Jun 2014 08:07:06 -0700 (PDT)
In-Reply-To: <1403533002-1118-1-git-send-email-jatedev@gmail.com>
References: <1403533002-1118-1-git-send-email-jatedev@gmail.com>
Date: Mon, 23 Jun 2014 11:07:06 -0400
Message-ID: <CAPphmgbm851LepCazfd6mjYQZdOgAgqo=6jCxt5xP1-2Vrz-Ag@mail.gmail.com>
From: Jate S <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Install list-records with resolvconf package
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
X-List-Received-Date: Mon, 23 Jun 2014 15:07:07 -0000
Content-Type: text/plain; charset=UTF-8

I had sent this to the wrong list.

---------- Forwarded message ----------
From: Jate Sujjavanich <jatedev@gmail.com>
Date: Mon, Jun 23, 2014 at 10:16 AM
Subject: [PATCH] Install list-records with resolvconf package
To: openembedded-devel@lists.openembedded.org, sgw@linux.intel.com
Cc: Jate Sujjavanich <jatedev@gmail.com>


The resolvconf script uses /lib/resolvconf/list-records, but the recipe
does not install it. This causes an error when /etc/resolvconf/update.d
runs.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 .../resolvconf/resolvconf_1.75.bb                  |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
index 7310c83..77eac7a 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
@@ -40,8 +40,14 @@ do_install () {
        install -m 0755 bin/resolvconf ${D}${base_sbindir}/
        install -m 0644 README ${D}${docdir}/${P}/
        install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
+
+       # resolvconf requires /lib/resolvconf/list-records
+       install -d ${D}${base_libdir}/${BPN}
+       install -m 0755 ${S}/bin/list-records ${D}${base_libdir}/${BPN}
 }

+FILES_${PN} += "/lib/resolvconf/"
+
 pkg_postinst_${PN} () {
        if [ -z "$D" ]; then
                if command -v systemd-tmpfiles >/dev/null; then
--
1.7.9.5

