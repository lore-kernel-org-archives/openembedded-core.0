Return-Path: <prvs=5989a55d29=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 99CFF607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 17:08:23 +0000 (UTC)
X-AuditID: 0a000213-f79066d0000013b8-1c-577552073b4c
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	63.E1.05048.70255775; Thu, 30 Jun 2016 12:08:23 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Thu, 30 Jun 2016 12:08:23 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] image.bbclass: do exact match for rootfs type
Thread-Index: AQHR0vICzDgRvRXQb0aC0Vtfzu4C3Q==
Date: Thu, 30 Jun 2016 17:08:23 +0000
Message-ID: <1467306469-15442-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.137]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWyRiBPQ5c9qDTcYOZRa4s7P9+xW/x4NpHV
	YtLOW2wOzB77565h9zi3cQWjx8Z3O5gCmKO4bZISS8qCM9Pz9O0SuDOenXvLVnCOq6K3bwt7
	A+Nsji5GTg4JAROJV4veMEPYYhIX7q1n62Lk4hASOMEoMb3rEyuEM4tR4vzWJywgVWwCRhLn
	rm9iBLFFBKIlls6YyQ5iMwvESPxecg8sLixgJ3Hjy192iBpniSWzNkHZehJXf60Bm8MioCrx
	unM1mM0r4Cnx8cUhVhCbEeiK76fWMEHMFJe49WQ+E8R1AhJL9pyHulRU4uXjf0D1HEC2nMT/
	LR4Q5XoSN6ZOYYOwtSWWLXzNDDFeUOLkzCcsExhFZiGZOgtJyywkLbOQtCxgZFnFKJibmJlj
	qJdaXFyWX5Kql5yfu4kRGB1cDEzCOxjnTLE9xCjAwajEw3vBrCRciDWxrLgy9xCjNAeLkjiv
	ipBSuJBAemJJanZqakFqUXxRaU5q8SFGJg7OQ4wSHFxSIsWpeSmpRYmlJRnxoNiKLwZGl1QD
	o43dJlVWtcDFjblPOja62py7XxX/W1Y55FbVpNdXEhn7d70UmnNpB8u9e/aejXGivMsXSOy9
	qyzGGO851emrctKhOTP951w4HHvlge09jfNtt3OC5i9TPqp+XFjvaNjKE+tVhU+UfZlxVYo5
	JneGsmF44Qlh78bmcxo/uC7n8t9JvHgyO9OKRYmlOCPRUIu5qDgRAIjScWiKAgAA
Subject: [PATCH] image.bbclass: do exact match for rootfs type
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
X-List-Received-Date: Thu, 30 Jun 2016 17:08:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Zhenhua Luo <zhenhua.luo@nxp.com>

Do exact match for rootfs type, instead of pattern match, to avoid
unexpected build error due to redundant rootfs type build.

E.g. when building ext2.gz.u-boot, both .gz.u-boot and .u-boot are matched,
the following build error will appear, actually .u-boot is not needed.
| mkimage: Can't open .../core-image-minimal-<machine>-<yyyymmddhhmmss>.roo=
tfs.ext2.gz: No such file or directory

(From OE-Core rev: 46bc438374de74af76d288520c6252c9b7840767)

(From OE-Core rev: 1d0ea655e266e7c5acc9c282fa91406fbe9bfb85)

Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6b9f979..64eb845 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -395,7 +395,7 @@ python () {
         rm_tmp_images =3D set()
         def gen_conversion_cmds(bt):
             for ctype in ctypes:
-                if bt.endswith("." + ctype):
+                if bt[bt.find('.') + 1:] =3D=3D ctype:
                     type =3D bt[0:-len(ctype) - 1]
                     if type.startswith("debugfs_"):
                         type =3D type[8:]
--=20
2.5.5

