Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD7477144
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:14:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2015 08:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,689,1437462000"; d="scan'208";a="828323917"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 16 Oct 2015 08:14:54 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id BC3EB6A4005;
	Fri, 16 Oct 2015 08:13:54 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 18:16:39 +0300
Message-Id: <1445008599-30066-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest/signing: New test for Signing packages in the package feeds.
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
X-List-Received-Date: Fri, 16 Oct 2015 15:14:56 -0000

[YOCTO # 8134] This test verifies features introduced in bug 8134.

It requires as resources the files from meta-selftest/files/signing:
For 'gpg --gen-key' the used input was:
key: RSA
key-size: 2048
key-valid: 0
realname: testuser
email: testuser@email.com
comment: nocomment
passphrase: test123

Depends on: http://lists.openembedded.org/pipermail/openembedded-core/2015-October/111550.html

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta-selftest/files/signing/key.pub     |  30 ++++++++++++++++
 meta-selftest/files/signing/key.secret  |  59 ++++++++++++++++++++++++++++++++
 meta-selftest/files/signing/pubring.gpg | Bin 0 -> 1204 bytes
 meta-selftest/files/signing/secret.txt  |   1 +
 meta-selftest/files/signing/secring.gpg | Bin 0 -> 2582 bytes
 meta-selftest/files/signing/trustdb.gpg | Bin 0 -> 40 bytes
 meta/lib/oeqa/selftest/signing.py       |  51 +++++++++++++++++++++++++++
 7 files changed, 141 insertions(+)
 create mode 100644 meta-selftest/files/signing/key.pub
 create mode 100644 meta-selftest/files/signing/key.secret
 create mode 100644 meta-selftest/files/signing/pubring.gpg
 create mode 100644 meta-selftest/files/signing/secret.txt
 create mode 100644 meta-selftest/files/signing/secring.gpg
 create mode 100644 meta-selftest/files/signing/trustdb.gpg
 create mode 100644 meta/lib/oeqa/selftest/signing.py

diff --git a/meta-selftest/files/signing/key.pub b/meta-selftest/files/signing/key.pub
new file mode 100644
index 0000000..e197bb3
--- /dev/null
+++ b/meta-selftest/files/signing/key.pub
@@ -0,0 +1,30 @@
+-----BEGIN PGP PUBLIC KEY BLOCK-----
+Version: GnuPG v1
+
+mQENBFYeMycBCADISkEj+u+3SkGbmC4b09StA3Fk4J8bKZrTTpQqUhOH4QFIQpso
+q96Q907h/ABAgB+IV0SGIeN866E7BqToqoXZ74X6EoyXWdndaMaFZSj+oNqqg6Gi
+hVsuGNpvRyyXSCYW8w9H2lFx09UufFrUxoSeP2iVdJJaUAmb8e00PCwkYrS2BZEa
+tO2VgllbaqczldmlUGnkIZt8YUSQSI/xZBDYUvbcZYBaOnDH1SDQl26f+bgyeIyS
+TW5TZb96o4tMfiifgPoqAapAxQLahG0WtjF/n1yNV5wUNQYsEQf6/h6W2rHGsCP5
+6FVFnr/ZPVam9iHUxL4lvJSI8dEH37s9GmarABEBAAG0LXRlc3R1c2VyIChub2Nv
+bW1lbnQpIDx0ZXN0dXNlckB0ZXN0ZW1haWwuY29tPokBOAQTAQIAIgUCVh4zJwIb
+AwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQezExa11krVLM2wf/fW1C8DPx
+tZEyl6iPXFjNotslo+t2TL6jPefC22KmbokJCtCnxcopBjQRuhUSNDTkXkUdVagy
+TaaYILV8XGajTmcVGQTaKeh+j6TM6CBGApQB5KhHvZCyvNBrGcNyuiex0Sm/rIhS
+fZre6ptZM/026W2kLwwJESXzHJEqCoFmU6aSOUCVyiDgMfcNw6c4NmEoqZtLdnxU
+B7Nac98o933AIvaaQMGtKIOcyOM7P/dyv8eMc38z2ew5bEB8E9aSdg5koXb3zIt5
+IKea631k4INAsFFyLMQNSmmKV7RK0miF5b4hGyekrYZRtiic5+dq5aWnVka4hBfi
+x31euxwQE87gQLkBDQRWHjMnAQgAt7C9QCFPWzLGQuQ/YaQub+8s2lYNQnmfwDHm
+5PuON+Wj/f5GyQhHKsbdUAPZ7GsjFIQnva7xNYYF/IvpC+0saB5NLMkBzjfIsg92
+6MkadAKlOR2o9gKlF59mulsJmJqNFTXiRcVXvpUnU8WB9ECmm321XfYHhk+4EMay
+H3OUZ0k6dEmvrWBTKNTR7M0z6j/jW+8J3vP3L9k1H+OV0EZwAKXfbh1lN4H467jY
+3gA7FU1WDmA06HphoSaFUEGTuXGtrRP0eksCUj3BtVygXnyQb379dISDOWcs/9Ke
+v3KMrZWgDnA4pH1eQpjycBhwKOCHYyhSSVOwCS3DGkaaklmQZwARAQABiQEfBBgB
+AgAJBQJWHjMnAhsMAAoJEHsxMWtdZK1SoPsIAKadG/tvS5COCyF8FuriL89Ysfov
+kMRKeb9hsMDbKX2lm3UtoS5ErmpkEUO/SbazQYm6/vYc8noQquqhkIdCljIvpWDv
+17tXEFfTGA493dlTTEWFt5bvzbQN6OhBu3904lAE4JGtlOOa9OKDeguwXbneLOyl
+dnlj2f7rw05cB9t/RDu7T11dTI39BMTUUm1lpWxYJk41o59b9g+fpJZkiIAJwnN3
+MwM1u9/AWfTqjNRgMAO5dIYceceTwGogujG+xz93flt+NjQhILG0T9jd0DFBgIAX
+Zq4PzX5aFDKjGoFaOOZ6r+kppBLH/HN6okMGIcfqaPPdnJI1MXFQvFzUNpo=
+=2cSJ
+-----END PGP PUBLIC KEY BLOCK-----
diff --git a/meta-selftest/files/signing/key.secret b/meta-selftest/files/signing/key.secret
new file mode 100644
index 0000000..70ef829
--- /dev/null
+++ b/meta-selftest/files/signing/key.secret
@@ -0,0 +1,59 @@
+-----BEGIN PGP PRIVATE KEY BLOCK-----
+Version: GnuPG v1
+
+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
+=WYHR
+-----END PGP PRIVATE KEY BLOCK-----
diff --git a/meta-selftest/files/signing/pubring.gpg b/meta-selftest/files/signing/pubring.gpg
new file mode 100644
index 0000000000000000000000000000000000000000..756dc41ac5e36ab3a7fe62229c34ac3bce5f8878
GIT binary patch
literal 1204
zcmV;l1WWsw0SyFJ9y2Ea2mr`RK_mL_w@N{qm@XUB)U5+?WZ<70DVozxlqymahv5N8
zLYpY7-jMfB;rswVfFFogM1~>beCwe*2Bhe!h1u_g`Vx$nS=rra#)V}l{-D~bgQ22@
zTP_&dZ$~VbNG2BZ4@cTjansc<d|K4Tgq}ZWm2{F?Pzjsy?KC_rBx1C-1(6!G?UjOA
zTWY5>mD#0GY2+cBd|^b8NRRPk5ZF@o++~1TI&jC;Akdd?pZT~lc#M)wZc}BydZUX>
zekh-S`YHjcK*a*ugl!hKF@K+2jaQr$H3lpZ2m1aVmfEq#up{~CRYjh^**#XK_94{7
zz9qbri1E<}-@82;W~%@Z0RRECEp%mbbaiuOav&&fZ)0z5ZDnqBDIh#_Wpi|Ob7gWs
zbY*jNWo=<;Y%XJOZ9a(sI0O>`0stZf0#+U~CjuJ-1`7!Y2Ll2I6$k<e3JU}l0s{d8
z9svRufB*^!5PLB(Yh7fmQq0>2|9x#j@H6qXkusO4k6c*IqT3~->vl}Oqdn)s+hV3}
zi3tkOr^U)C1~d`66%sTw<X%M`Rj4verkEhLd|YOuPG=Pv1llR+evhQg=paS{lmX<Z
zN4=1;ywGbI!*aSOvC%2NtcX&5n%?T0Su_1M>20Jh3<(h>^Bj>X3V~)*rjj{8mC7LC
zG4~C_r#LoYD5;xEc6?L^vs!cCDEEE9BKDd<!L2BRoXF!lKlgIK$Bc7-GuiApY(RVy
z){=G(WTAHV%!_#-r<&`1WZ;89uu*a>#0^SmidVEs(rAU{z9AbYq^*WgwkVwE=W6Ap
zr&dO|gcst+eO|j95EIVeK(GP;1GxbW1Xdn1Cjkfmx3IlHAx~Q}#zN#jVWci^?=0F@
z4MKUJz%l0J`;Ir|qy7Fy$p}X(#@$c@+3ag06oe<euJJX71^kQY3+*gu9!)IC0nRtb
zvJZCX$r^M5r8ym__5!6BpJuvS37DFV6*b~T#aF(SCsW0N^gyPYeYIWo2Zm3$5XQ0}
zbChREI&?{|tzc6q)Y0tCGwMI%Tki?p^Y<^=H6P=Z&_-|orQdEHWjBHN>$uq706P^;
zRt{h^=z3wHCWTNzleuxNtrPTmO9E0o!L?kVUVM;me*JWWgE?m`|I(hna*VB&pbl_2
zq<vmOnDTHKa46u1V<=KdQ?Lmw!x~1Kl39>v01*KI0f_-01Q-DV00{*GRvt4a0vikf
z3JDN<F)?dhWUW%5`v?H0og4daOOTEWA$%6<;xErwvHCBN#7cR;VX(m4DSf4zbuFPT
zM6PON5ktR8wzENry8iYY@_G=e>Y<Q_LY6WwrC{&ZyH^lb(-;mt-Pu!2MTNJP@6EIg
z=;%Sae{|wd1mKaal;fK8;)8k%uwA*{EbOIrd1KlB>%&f52it!{JG)O^T}+Mr1jN)*
zZDplwSSC(2qn}&$51*u#WQc$X!gF^s12wzfz*+R_jMQK-1G#jD9C^o+z-l16F}}w?
zcYa%bHZ&n1v9wRv-Ow>XfPfcft`E(AS`;#)8i86k=6bK`DWnp|{BwGuLk1zo>S*)b
SoRT#$aZtQm)Ha&10ssSklOTWq

literal 0
HcmV?d00001

diff --git a/meta-selftest/files/signing/secret.txt b/meta-selftest/files/signing/secret.txt
new file mode 100644
index 0000000..5271a52
--- /dev/null
+++ b/meta-selftest/files/signing/secret.txt
@@ -0,0 +1 @@
+test123
diff --git a/meta-selftest/files/signing/secring.gpg b/meta-selftest/files/signing/secring.gpg
new file mode 100644
index 0000000000000000000000000000000000000000..9824d1ae36571268e6b86aa3e41a70257ed7562c
GIT binary patch
literal 2582
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

literal 0
HcmV?d00001

diff --git a/meta-selftest/files/signing/trustdb.gpg b/meta-selftest/files/signing/trustdb.gpg
new file mode 100644
index 0000000000000000000000000000000000000000..a50fe580cae8cfb33506ab2dfa6eb35b7c3b4900
GIT binary patch
literal 40
acmZQfFGy!*W@Ke#Vqgf9^S;i20{{S8tpeo$

literal 0
HcmV?d00001

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
new file mode 100644
index 0000000..0e194d5
--- /dev/null
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -0,0 +1,51 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+import os
+from oeqa.utils.decorators import testcase
+
+
+class Signing(oeSelfTest):
+
+    @testcase(1362)
+    def test_signing_packages(self):
+        """
+        Summary:     Test that packages can be signed in the package feed
+        Expected:    Package should be signed with the correct key
+        Product:     oe-core
+        Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        package_classes = get_bb_var('PACKAGE_CLASSES')
+        if 'package_rpm' not in package_classes:
+            self.skipTest('This test requires RPM Packaging.')
+
+        test_recipe = 'ed'
+
+        gpg_dir = os.path.join(self.testlayer_path, 'files/signing/')
+
+        feature = 'INHERIT += "sign_rpm"\n'
+        feature += 'RPM_GPG_PASSPHRASE_FILE = "%ssecret.txt"\n' % gpg_dir
+        feature += 'RPM_GPG_NAME = "testuser"\n'
+        feature += 'RPM_GPG_PUBKEY = "%skey.pub"\n' % gpg_dir
+        feature += 'GPG_PATH = "%s"\n' % gpg_dir
+
+        self.write_config(feature)
+
+        bitbake('-c cleansstate %s' % test_recipe)
+        bitbake('-c clean %s' % test_recipe)
+        bitbake(test_recipe)
+        self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
+
+        pf = get_bb_var('PF', test_recipe)
+        deploy_dir_rpm = get_bb_var('DEPLOY_DIR_RPM', test_recipe)
+        package_arch = get_bb_var('PACKAGE_ARCH', test_recipe)
+        staging_bindir_native = get_bb_var('STAGING_BINDIR_NATIVE')
+
+        pkg_deploy = os.path.join(deploy_dir_rpm, package_arch, '.'.join((pf, package_arch, 'rpm')))
+
+        runCmd('%s/rpm --import %skey.pub' % (staging_bindir_native, gpg_dir))
+
+        ret = runCmd('%s/rpm --checksig %s' % (staging_bindir_native, pkg_deploy))
+        # tmp/deploy/rpm/i586/ed-1.9-r0.i586.rpm: rsa sha1 md5 OK
+        self.assertIn('rsa sha1 md5 OK', ret.output, 'Package signed incorrectly.')
-- 
2.1.0


