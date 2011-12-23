Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Re81Z-0004ee-Oj
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:31:14 +0100
Received: by iakh37 with SMTP id h37so11856538iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 08:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:message-id:subject:x-mailer:mime-version:content-type;
	bh=rgc8CDFbApF9Inlhs/VBLT4be5qL4PDOcpg8z2Go4Wo=;
	b=QFBNvyH1AT2FGzk2vm0BM5MFymqtXQ/0hkCcc+ZiCLVdCpAPt1wSdBKRgRvwRVESmm
	532LJAz70UGkh/f+7LzkTgqDRc/Uw9UtWzUO8UYbuUuNaPJbMHh6dgIixDz4QmaVvJfg
	a8kadkmJto8kU/EXnldAL9B+WxOxnfaQISr2c=
Received: by 10.50.188.166 with SMTP id gb6mr14460054igc.18.1324657441247;
	Fri, 23 Dec 2011 08:24:01 -0800 (PST)
Received: from frey.local (ip24-251-167-38.ph.ph.cox.net. [24.251.167.38])
	by mx.google.com with ESMTPS id wp7sm20571642igc.6.2011.12.23.08.23.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 08:24:00 -0800 (PST)
Date: Fri, 23 Dec 2011 09:23:57 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <3443259C5BCC4C21B2D92CD4C4B9AC73@gmail.com>
X-Mailer: sparrow 1.5 (build 1043.1)
MIME-Version: 1.0
Subject: [PATCH] buildhistory: avoid quoting issues with the layer list for build-id
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
X-List-Received-Date: Fri, 23 Dec 2011 16:31:14 -0000
Content-Type: multipart/alternative; boundary="4ef4ab1d_66334873_12d0c"

--4ef4ab1d_66334873_12d0c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The layer list is multiline, and includes quotes, so including it within
quotes is problematic, particularly if the revision includes characters which
are not valid outside of a quoted string in shell. To reproduce this failure:
do a build with an scm layer not on a branch.

Signed-off-by: Christopher Larson <chris_larson@mentor.com (mailto:chris_larson@mentor.com)>
---
meta/classes/buildhistory.bbclass | 5 ++++-
1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 39f5ff6..6a08db4 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -325,7 +325,10 @@ buildhistory_get_imageinfo() {

# Add some configuration information
echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id
- echo "${@buildhistory_get_layers(d)}" >> ${BUILDHISTORY_DIR_IMAGE}/build-id
+
+ cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id <<END
+${@buildhistory_get_layers(d)}
+END
}

# By prepending we get in before the removal of packaging files
-- 
1.7.8

--4ef4ab1d_66334873_12d0c
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>The layer list is multiline, and includes quotes, so including it wi=
thin</div><div>quotes is problematic, particularly if the revision includ=
es characters which</div><div>are not valid outside of a quoted string in=
 shell. To reproduce this failure:</div><div>do a build with an scm layer=
 not on a branch.</div><div><br></div><div>Signed-off-by: Christopher Lar=
son &lt;<a href=3D=22mailto:chris=5Flarson=40mentor.com=22>chris=5Flarson=
=40mentor.com</a>&gt;</div><div>---</div><div> meta/classes/buildhistory.=
bbclass =7C    5 ++++-</div><div> 1 files changed, 4 insertions(+), 1 del=
etions(-)</div><div><br></div><div>diff --git a/meta/classes/buildhistory=
.bbclass b/meta/classes/buildhistory.bbclass</div><div>index 39f5ff6..6a0=
8db4 100644</div><div>--- a/meta/classes/buildhistory.bbclass</div><div>+=
++ b/meta/classes/buildhistory.bbclass</div><div>=40=40 -325,7 +325,10 =40=
=40 buildhistory=5Fget=5Fimageinfo() =7B</div><div> </div><div> 	=23 Add =
some configuration information</div><div> 	echo =22=24=7BMACHINE=7D: =24=7B=
IMAGE=5FBASENAME=7D configured for =24=7BDISTRO=7D =24=7BDISTRO=5FVERSION=
=7D=22 &gt; =24=7BBUILDHISTORY=5FDIR=5FIMAGE=7D/build-id</div><div>-	echo=
 =22=24=7B=40buildhistory=5Fget=5Flayers(d)=7D=22 &gt;&gt; =24=7BBUILDHIS=
TORY=5FDIR=5FIMAGE=7D/build-id</div><div>+</div><div>+	cat &gt;&gt; =24=7B=
BUILDHISTORY=5FDIR=5FIMAGE=7D/build-id &lt;&lt;END</div><div>+=24=7B=40bu=
ildhistory=5Fget=5Flayers(d)=7D</div><div>+END</div><div> =7D</div><div> =
</div><div> =23 By prepending we get in before the removal of packaging f=
iles</div><div>-- </div><div>1.7.8</div>

--4ef4ab1d_66334873_12d0c--
