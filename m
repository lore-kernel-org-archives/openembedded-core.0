Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQy5-0003kl-IW
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:09 +0200
Received: by mail-px0-f178.google.com with SMTP id 1so1933668pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=BzfPzE9HK1E5Gq1NoEYjFo3KZ+9JVP+qFFCUZcaPg7k=;
	b=cotWHicceU8XkNMhWYh188aa8px/T3XLE1D9Cy2yiVGBFI7zHUD3akiIFRPANKyu2G
	26of0diouGlaVqyF8INTi3J2TUuMmJyUkGs/G3lPb6IgTz/Ly2pw6PVwCclq1xy0dsc+
	dk0M8pqPlxvEE0CB9ApHr8lKtDJqEEWzuGdDk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=d+ghMWx7wGfDp3CJ4Gw1xcldYwbWcmkyrTSq5sgYzywlP+/rikNyNktKEp1E3xb3Tu
	4T5VKPDlVJISFGiHYIFmA7jVpga0Ag+HD8sGrvfoAZI45P9leIIlre5Tf7YU2tRsRMaB
	dqqi7V3pwWFQezion15ZafcYWgPaj5NtrtQJA=
Received: by 10.68.49.136 with SMTP id u8mr6664137pbn.170.1303757682083;
	Mon, 25 Apr 2011 11:54:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k4sm4057190pbi.62.2011.04.25.11.54.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:54:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:54:35 -0700
Message-Id: <ce7417bbe945b0ca85e7303857b4d84398ac7ba0.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 04/17] autotools.bbclass: Copy gettext files only if --disable-nls is not set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2011 18:57:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/autotools.bbclass |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 7ebf833..cbd2e96 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -127,17 +127,18 @@ autotools_do_configure() {
 			else
 			  CONFIGURE_AC=configure.ac
 			fi
-			if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			  if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
-			    : do nothing -- we still have an old unmodified configure.ac
-			  else
-			    oenote Executing glib-gettextize --force --copy
-			    echo "no" | glib-gettextize --force --copy
+			if ! echo ${EXTRA_OECONF} | grep -q "\-\-disable-nls"; then
+			  if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+			    if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
+			      : do nothing -- we still have an old unmodified configure.ac
+			    else
+			      oenote Executing glib-gettextize --force --copy
+			      echo "no" | glib-gettextize --force --copy
+			    fi
+			  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+			    cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
 			  fi
-			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			  cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
 			fi
-
 			fi
 			mkdir -p m4
 			if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
-- 
1.7.4.1



