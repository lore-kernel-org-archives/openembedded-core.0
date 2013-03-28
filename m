Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1ULFIq-000467-H4
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 17:04:23 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id E5FCBD22E8; Thu, 28 Mar 2013 16:46:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 55B84D22B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 16:46:29 +0100 (CET)
Message-ID: <515465CE.6080803@linaro.org>
Date: Thu, 28 Mar 2013 16:46:22 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<51540716.40400@linaro.org>
In-Reply-To: <51540716.40400@linaro.org>
X-Enigmail-Version: 1.4.6
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Thu, 28 Mar 2013 16:04:31 -0000
X-Groupsio-MsgNum: 37200
Content-Type: multipart/mixed; boundary="------------010504090900010207070600"

--------------010504090900010207070600
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

W dniu 28.03.2013 10:02, Marcin Juszkiewicz pisze:
> W dniu 28.03.2013 06:51, Khem Raj pisze:
>> I have added gcc 4.8 recipes and the branch is here=20
>>
>> git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
>=20
> =C3=9Cbercool! Will do tests with aarch64.

After some hacking (see attachment) I got it built and booted
core-image-minimal.

Problem was with paths - lib contra lib64. Will look at it more next week=
.


--------------010504090900010207070600
Content-Type: text/x-diff;
 name="aarch64.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="aarch64.diff"

diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index 2e2f75a..39f053c 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -78,3 +78,13 @@ FILES_libgomp-staticdev = "\
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+
+do_install_append_aarch64() {
+
+    if [ -d ${D}${libdir}64 ]; then
+        mv ${D}${libdir}64/* ${D}${libdir}
+    fi
+    if [ -d ${D}${libdir}64/.debug ]; then
+        mv ${D}${libdir}64/.debug ${D}${libdir}/.debug
+    fi
+}
diff --git a/meta/recipes-devtools/gcc/libgcc_4.8.bb b/meta/recipes-devtools/gcc/libgcc_4.8.bb
index 47669a2..51ed2ff 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.8.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.8.bb
@@ -51,7 +51,11 @@ do_install () {
 	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
 		mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir}
 	else
-		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
+        if [ -f ${D}${libdir}64/libgcc_s.so ]; then
+            mv ${D}${libdir}64/libgcc* ${D}${base_libdir}
+        else
+            mv ${D}${libdir}64/libgcc* ${D}${base_libdir} || true
+        fi
 	fi
 
 	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target

--------------010504090900010207070600--
