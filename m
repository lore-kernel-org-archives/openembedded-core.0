Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5FKl-0001jE-8n
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 12:42:35 +0200
Received: by bwz5 with SMTP id 5so1711285bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=rJUWx+R8L3SOo932/UrM3kKUImtd6UukLcAWaYPtllE=;
	b=iEbCrHQwl82weY5/eGlMogT7yv/zIebHNnwyNL+mdKu2HYBjEIisxzHJBNQBdoOpi7
	p3sMrJgaLPpD7z/OeoHLu9x28hCcwex4MxqbpuV+fsmZbjXBw9KbI4jNiX5GhzfY6Ks4
	X3rL7OAHZ0HJ8gOWlNR6j2qmKZjOa4OTg1WXw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KdYXM/zcZqkwNoj6whLqFjTJGh2uTt5LJRdVdEiiQrfvHY5N2Oj8UBMrI/HltEyHH9
	7SGbNZtjg1OGapeUMtf9Nwga/iufsb9GtttMtvwmq/dd2n8g9a38oOwYtm1voaUglWLh
	trULT5MpC2+LCvt7E3JV3bpzQ8Bo3AiP+lrmY=
Received: by 10.204.81.224 with SMTP id y32mr2189365bkk.152.1301568016329;
	Thu, 31 Mar 2011 03:40:16 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v21sm649125bkt.11.2011.03.31.03.40.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:40:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:40:08 +0200
Message-Id: <ca0ffb747b87caed609b2edf08f963751dbc8873.1301567822.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301567822.git.Martin.Jansa@gmail.com>
References: <cover.1301567822.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
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
X-List-Received-Date: Thu, 31 Mar 2011 10:42:35 -0000

* This was done generically in bitbake.conf this should be done on
  demand and distutils based recipes seem to need it. So we define it
  here.
* imported from OE 629ae87eadeec1068c3778e14488b549029adffb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/distutils-common-base.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index f66a5cd..b6caf24 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -4,6 +4,8 @@ EXTRA_OEMAKE = ""
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
+# libtool 2.4 does not export with LDFLAGS but distutils need it
+LDFLAGS_prepend = "-L${STAGING_LIBDIR} "
 
 PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
 
-- 
1.7.4.1



