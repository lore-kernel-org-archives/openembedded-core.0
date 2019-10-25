Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1488B7FA8F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 08:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4E7D39C03EE;
	Fri, 25 Oct 2019 04:40:05 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id R3PqifRNTHSl; Fri, 25 Oct 2019 04:40:04 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id BC14C9C02D0;
	Fri, 25 Oct 2019 04:40:04 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id uJO7a5-oyVXx; Fri, 25 Oct 2019 04:40:04 -0400 (EDT)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id BDB8B9C03ED;
	Fri, 25 Oct 2019 04:40:03 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 10:39:50 +0200
Message-Id: <20191025083952.14591-6-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025083952.14591-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191025083952.14591-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [RFC][PATCH v2 5/7] recipetool/create.py: replace 'latest' keyword for npm
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
X-List-Received-Date: Fri, 25 Oct 2019 08:40:04 -0000
Content-Transfer-Encoding: quoted-printable

The new npm fetcher allows the 'latest' keyword to be used to download
the latest version on the registry. But the keyword must be replace
as soon as the version is determined to have a stable generated recipe.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/recipetool/create.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index 932dc3f374..e49e73ed9b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -833,6 +833,8 @@ def create_recipe(args):
         elif line.startswith('SRC_URI =3D '):
             if realpv and not pv_srcpv:
                 line =3D line.replace(realpv, '${PV}')
+            if scheme =3D=3D 'npm':
+                line =3D line.replace('version=3Dlatest', 'version=3D${P=
V}')
         elif line.startswith('PV =3D '):
             if realpv:
                 # Replace the first part of the PV value
--=20
2.20.1


