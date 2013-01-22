Received: from mail-qc0-f171.google.com ([209.85.216.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1TxfWf-0001E6-QD
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 16:12:42 +0100
Received: by mail-qc0-f171.google.com with SMTP id d1so954296qca.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 06:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=C44ZPYbyeOPgKFzvEfxhR0KkdWLmeU+Bll9k+Clz2x8=;
	b=K2FyFeKWQXp6JYmS46Dis10urBIHFGYFXx4ZepTNwMv30zcQVruvMljUvh6L/FaNf4
	annVR7HkVvKhsUaUY1jDtFSFIJDXpW8hzFzNOW4WfyaAAnTtE/LuI9w1EavBKblLzjQP
	fsxTdRMxW9Mr+27qjAvIVtKuVqPZl7Yt4UPATh70XUV2HbckKfhU/0mApbBUity1LNMF
	g7clqKeo9oPGsHQSMAU1mpleu8rmPPJJEsO2dj8020fIzBLkRq9qDxNMwuGBM9GoAef1
	56qtFBn9bpy/3EK9RLi24Bpbl1gdVDFklQfIQ4p0KJwUtOmY2VVWiaN6xa6Ib+63G0gW
	RxFA==
X-Received: by 10.224.185.148 with SMTP id co20mr23544786qab.94.1358866627319; 
	Tue, 22 Jan 2013 06:57:07 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-240-188-95.ronkva.east.verizon.net. [96.240.188.95])
	by mx.google.com with ESMTPS id fv7sm11184437qab.3.2013.01.22.06.57.06
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 06:57:06 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2013 09:57:02 -0500
Message-Id: <1358866622-12739-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] base.bblass : Add support for cmake to PACKAGECONFIG.
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
X-List-Received-Date: Tue, 22 Jan 2013 15:12:42 -0000

The cmake class uses EXTRA_OECMAKE to adjust the cmake configuration. This
patch adds support for this, if the cmake class is used by the recipe.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/classes/base.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f7b6fb8..bedbc4d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -467,7 +467,10 @@ python () {
                     extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
-        appendVar('EXTRA_OECONF', extraconf)
+        if bb.data.inherits_class('cmake', d):
+            appendVar('EXTRA_OECMAKE', extraconf)
+        else:
+            appendVar('EXTRA_OECONF', extraconf)
 
     # If PRINC is set, try and increase the PR value by the amount specified
     princ = d.getVar('PRINC', True)
-- 
1.7.11.7



