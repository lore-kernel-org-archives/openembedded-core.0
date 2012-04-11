Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1SHwEE-0000QR-PK
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 14:00:50 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1SHw5F-0003rW-Eo from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 04:51:33 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 11 Apr 2012 04:51:16 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.151]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.01.0289.001; Wed, 11 Apr 2012 12:51:32 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] utility-taska.bbclass: Add distclean task for removing
	sources
Thread-Index: AQHNF9kOoVoAazNe2kyHNsk6uU0xdJaVgx5Q
Date: Wed, 11 Apr 2012 11:51:32 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994053733DE@EU-MBX-01.mgc.mentorg.com>
References: <1334144886-2587-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1334144886-2587-1-git-send-email-noor_ahsan@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Apr 2012 11:51:16.0750 (UTC)
	FILETIME=[670782E0:01CD17D9]
Subject: Re: [PATCH] utility-taska.bbclass: Add distclean task for removing sources
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
X-List-Received-Date: Wed, 11 Apr 2012 12:00:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry about the wrong patches.

-----Original Message-----
From: Ahsan, Noor=20
Sent: Wednesday, April 11, 2012 4:48 PM
To: openembedded-core@lists.openembedded.org
Cc: Ahsan, Noor
Subject: [PATCH] utility-taska.bbclass: Add distclean task for removing sou=
rces

From: Noor Ahsan <noor_ahsan@mentor.com>

* Bring distclean task from openembedded classic.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/classes/utility-tasks.bbclass |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-task=
s.bbclass
index cbb000a..8379de6 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -28,6 +28,36 @@ python do_clean() {
 		bb.build.exec_func(f, d)
 }
=20
+addtask distclean
+do_distclean[nostamp] =3D "1"
+python do_distclean() {
+	"""clear downloaded sources, build and temp directories"""
+
+	bb.build.exec_func('do_clean', d)
+
+	src_uri =3D bb.data.getVar('SRC_URI', d, 1)
+	if not src_uri:
+		return
+
+	for uri in src_uri.split():
+		if bb.decodeurl(uri)[0] =3D=3D "file":
+			continue
+
+		try:
+			local =3D bb.data.expand(bb.fetch.localpath(uri, d), d)
+		except bb.MalformedUrl, e:
+			bb.debug(1, 'Unable to generate local path for malformed uri: %s' % e)
+		else:
+			bb.note("removing %s" % base_path_out(local, d))
+			try:
+				if os.path.exists(local + ".done"):
+					os.remove(local + ".done")
+				if os.path.exists(local):
+					os.remove(local)
+			except OSError, e:
+				bb.note("Error in removal: %s" % e)
+}
+
 addtask checkuri
 do_checkuri[nostamp] =3D "1"
 python do_checkuri() {
--=20
1.7.9



