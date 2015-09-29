Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DAD6C76710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 10:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TAstWX030032; Tue, 29 Sep 2015 11:54:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Y2yDVSNPr0oo; Tue, 29 Sep 2015 11:54:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TAsctv030024
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Sep 2015 11:54:50 +0100
Message-ID: <1443524078.5162.21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>
Date: Tue, 29 Sep 2015 11:54:38 +0100
In-Reply-To: <1443495255-12353-1-git-send-email-maxin.john@intel.com>
References: <1443495255-12353-1-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: fix ptest failures
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
X-List-Received-Date: Tue, 29 Sep 2015 10:54:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-29 at 05:54 +0300, Maxin B. John wrote:
> Remove dependencies for test targets. Otherwise, during ptest
> execution, "make" tries to rebuild those executables and fails
> there.
> 
> [YOCTO #8059]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../openssl/openssl/ptest_makefile_deps.patch      | 248 +++++++++++++++++++++
>  .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   1 +
>  2 files changed, 249 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/ptest_makefile_deps.patch

I get the feeling this patch is going to be a bit of a maintenance
burden :(. The dependencies there are valid from a build system
perspective but obviously problematic given the way we run the tests.

Perhaps a sed expression executed against the Makefile at installation
time in ptest might be a more maintainable way to do this? The pattern
we need to remove dependencies from does look pretty clear, at least
just looking at this patch?

I'm torn to be honest, the patch is explicit, the sed could be more
prone to breakage. How do we handle this in other ptest situations?

Cheers,

Richard


> diff --git a/meta/recipes-connectivity/openssl/openssl/ptest_makefile_deps.patch b/meta/recipes-connectivity/openssl/openssl/ptest_makefile_deps.patch
> new file mode 100644
> index 0000000..4202e61
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/ptest_makefile_deps.patch
> @@ -0,0 +1,248 @@
> +Additional Makefile dependencies removal for test targets
> +
> +Removing the dependency check for test targets as these tests are
> +causing a number of failures and "noise" during ptest execution.
> +
> +Upstream-Status: Inappropriate [config]
> +
> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +
> +diff -Naur openssl-1.0.2d-orig/test/Makefile openssl-1.0.2d/test/Makefile
> +--- openssl-1.0.2d-orig/test/Makefile	2015-09-28 12:50:41.530022979 +0300
> ++++ openssl-1.0.2d/test/Makefile	2015-09-28 12:57:45.930717240 +0300
> +@@ -155,67 +155,67 @@
> + 	( $(MAKE) $$i && echo "PASS: $$i" ) || echo "FAIL: $$i"; \
> + 	done)
> + 
> +-test_evp: $(EVPTEST)$(EXE_EXT) evptests.txt
> ++test_evp:
> + 	../util/shlib_wrap.sh ./$(EVPTEST) evptests.txt
> + 
> +-test_evp_extra: $(EVPEXTRATEST)$(EXE_EXT)
> ++test_evp_extra:
> + 	../util/shlib_wrap.sh ./$(EVPEXTRATEST)
> + 
> +-test_des: $(DESTEST)$(EXE_EXT)
> ++test_des:
> + 	../util/shlib_wrap.sh ./$(DESTEST)
> + 
> +-test_idea: $(IDEATEST)$(EXE_EXT)
> ++test_idea:
> + 	../util/shlib_wrap.sh ./$(IDEATEST)
> + 
> +-test_sha: $(SHATEST)$(EXE_EXT) $(SHA1TEST)$(EXE_EXT) $(SHA256TEST)$(EXE_EXT) $(SHA512TEST)$(EXE_EXT)
> ++test_sha:
> + 	../util/shlib_wrap.sh ./$(SHATEST)
> + 	../util/shlib_wrap.sh ./$(SHA1TEST)
> + 	../util/shlib_wrap.sh ./$(SHA256TEST)
> + 	../util/shlib_wrap.sh ./$(SHA512TEST)
> + 
> +-test_mdc2: $(MDC2TEST)$(EXE_EXT)
> ++test_mdc2:
> + 	../util/shlib_wrap.sh ./$(MDC2TEST)
> + 
> +-test_md5: $(MD5TEST)$(EXE_EXT)
> ++test_md5:
> + 	../util/shlib_wrap.sh ./$(MD5TEST)
> + 
> +-test_md4: $(MD4TEST)$(EXE_EXT)
> ++test_md4:
> + 	../util/shlib_wrap.sh ./$(MD4TEST)
> + 
> +-test_hmac: $(HMACTEST)$(EXE_EXT)
> ++test_hmac:
> + 	../util/shlib_wrap.sh ./$(HMACTEST)
> + 
> +-test_wp: $(WPTEST)$(EXE_EXT)
> ++test_wp:
> + 	../util/shlib_wrap.sh ./$(WPTEST)
> + 
> +-test_md2: $(MD2TEST)$(EXE_EXT)
> ++test_md2:
> + 	../util/shlib_wrap.sh ./$(MD2TEST)
> + 
> +-test_rmd: $(RMDTEST)$(EXE_EXT)
> ++test_rmd:
> + 	../util/shlib_wrap.sh ./$(RMDTEST)
> + 
> +-test_bf: $(BFTEST)$(EXE_EXT)
> ++test_bf:
> + 	../util/shlib_wrap.sh ./$(BFTEST)
> + 
> +-test_cast: $(CASTTEST)$(EXE_EXT)
> ++test_cast:
> + 	../util/shlib_wrap.sh ./$(CASTTEST)
> + 
> +-test_rc2: $(RC2TEST)$(EXE_EXT)
> ++test_rc2:
> + 	../util/shlib_wrap.sh ./$(RC2TEST)
> + 
> +-test_rc4: $(RC4TEST)$(EXE_EXT)
> ++test_rc4:
> + 	../util/shlib_wrap.sh ./$(RC4TEST)
> + 
> +-test_rc5: $(RC5TEST)$(EXE_EXT)
> ++test_rc5:
> + 	../util/shlib_wrap.sh ./$(RC5TEST)
> + 
> +-test_rand: $(RANDTEST)$(EXE_EXT)
> ++test_rand:
> + 	../util/shlib_wrap.sh ./$(RANDTEST)
> + 
> +-test_enc: ../apps/openssl$(EXE_EXT) testenc
> ++test_enc:
> + 	@sh ./testenc
> + 
> +-test_x509: ../apps/openssl$(EXE_EXT) tx509 testx509.pem v3-cert1.pem v3-cert2.pem
> ++test_x509:
> + 	echo test normal x509v1 certificate
> + 	sh ./tx509 2>/dev/null
> + 	echo test first x509v3 certificate
> +@@ -223,25 +223,25 @@
> + 	echo test second x509v3 certificate
> + 	sh ./tx509 v3-cert2.pem 2>/dev/null
> + 
> +-test_rsa: ../apps/openssl$(EXE_EXT) trsa testrsa.pem
> ++test_rsa:
> + 	@sh ./trsa 2>/dev/null
> + 	../util/shlib_wrap.sh ./$(RSATEST)
> + 
> +-test_crl: ../apps/openssl$(EXE_EXT) tcrl testcrl.pem
> ++test_crl:
> + 	@sh ./tcrl 2>/dev/null
> + 
> +-test_sid: ../apps/openssl$(EXE_EXT) tsid testsid.pem
> ++test_sid:
> + 	@sh ./tsid 2>/dev/null
> + 
> +-test_req: ../apps/openssl$(EXE_EXT) treq testreq.pem testreq2.pem
> ++test_req:
> + 	@sh ./treq 2>/dev/null
> + 	@sh ./treq testreq2.pem 2>/dev/null
> + 
> +-test_pkcs7: ../apps/openssl$(EXE_EXT) tpkcs7 tpkcs7d testp7.pem pkcs7-1.pem
> ++test_pkcs7:
> + 	@sh ./tpkcs7 2>/dev/null
> + 	@sh ./tpkcs7d 2>/dev/null
> + 
> +-test_bn: $(BNTEST)$(EXE_EXT) $(EXPTEST)$(EXE_EXT) bctest
> ++test_bn:
> + 	@echo starting big number library test, could take a while...
> + 	@../util/shlib_wrap.sh ./$(BNTEST) >tmp.bntest
> + 	@echo quit >>tmp.bntest
> +@@ -250,33 +250,33 @@
> + 	@echo 'test a^b%c implementations'
> + 	../util/shlib_wrap.sh ./$(EXPTEST)
> + 
> +-test_ec: $(ECTEST)$(EXE_EXT)
> ++test_ec:
> + 	@echo 'test elliptic curves'
> + 	../util/shlib_wrap.sh ./$(ECTEST)
> + 
> +-test_ecdsa: $(ECDSATEST)$(EXE_EXT)
> ++test_ecdsa:
> + 	@echo 'test ecdsa'
> + 	../util/shlib_wrap.sh ./$(ECDSATEST)
> + 
> +-test_ecdh: $(ECDHTEST)$(EXE_EXT)
> ++test_ecdh:
> + 	@echo 'test ecdh'
> + 	../util/shlib_wrap.sh ./$(ECDHTEST)
> + 
> +-test_verify: ../apps/openssl$(EXE_EXT)
> ++test_verify:
> + 	@echo "The following command should have some OK's and some failures"
> + 	@echo "There are definitly a few expired certificates"
> + 	../util/shlib_wrap.sh ../apps/openssl verify -CApath ../certs/demo ../certs/demo/*.pem
> + 
> +-test_dh: $(DHTEST)$(EXE_EXT)
> ++test_dh:
> + 	@echo "Generate a set of DH parameters"
> + 	../util/shlib_wrap.sh ./$(DHTEST)
> + 
> +-test_dsa: $(DSATEST)$(EXE_EXT)
> ++test_dsa:
> + 	@echo "Generate a set of DSA parameters"
> + 	../util/shlib_wrap.sh ./$(DSATEST)
> + 	../util/shlib_wrap.sh ./$(DSATEST) -app2_1
> + 
> +-test_gen testreq.pem: ../apps/openssl$(EXE_EXT) testgen test.cnf
> ++test_gen testreq.pem:
> + 	@echo "Generate and verify a certificate request"
> + 	@sh ./testgen
> + 
> +@@ -288,13 +288,11 @@
> + 	@cat certCA.ss certU.ss > intP1.ss
> + 	@cat certCA.ss certU.ss certP1.ss > intP2.ss
> + 
> +-test_engine:  $(ENGINETEST)$(EXE_EXT)
> ++test_engine:
> + 	@echo "Manipulate the ENGINE structures"
> + 	../util/shlib_wrap.sh ./$(ENGINETEST)
> + 
> +-test_ssl: keyU.ss certU.ss certCA.ss certP1.ss keyP1.ss certP2.ss keyP2.ss \
> +-		intP1.ss intP2.ss $(SSLTEST)$(EXE_EXT) testssl testsslproxy \
> +-		../apps/server2.pem serverinfo.pem
> ++test_ssl:
> + 	@echo "test SSL protocol"
> + 	@if [ -n "$(FIPSCANLIB)" ]; then \
> + 	  sh ./testfipsssl keyU.ss certU.ss certCA.ss; \
> +@@ -304,7 +302,7 @@
> + 	@sh ./testsslproxy keyP1.ss certP1.ss intP1.ss
> + 	@sh ./testsslproxy keyP2.ss certP2.ss intP2.ss
> + 
> +-test_ca: ../apps/openssl$(EXE_EXT) testca CAss.cnf Uss.cnf
> ++test_ca:
> + 	@if ../util/shlib_wrap.sh ../apps/openssl no-rsa; then \
> + 	  echo "skipping CA.sh test -- requires RSA"; \
> + 	else \
> +@@ -312,11 +310,11 @@
> + 	  sh ./testca; \
> + 	fi
> + 
> +-test_aes: #$(AESTEST)
> ++test_aes:
> + #	@echo "test Rijndael"
> + #	../util/shlib_wrap.sh ./$(AESTEST)
> + 
> +-test_tsa: ../apps/openssl$(EXE_EXT) testtsa CAtsa.cnf ../util/shlib_wrap.sh
> ++test_tsa:
> + 	@if ../util/shlib_wrap.sh ../apps/openssl no-rsa; then \
> + 	  echo "skipping testtsa test -- requires RSA"; \
> + 	else \
> +@@ -331,7 +329,7 @@
> + 	@echo "Test JPAKE"
> + 	../util/shlib_wrap.sh ./$(JPAKETEST)
> + 
> +-test_cms: ../apps/openssl$(EXE_EXT) cms-test.pl smcont.txt
> ++test_cms:
> + 	@echo "CMS consistency test"
> + 	$(PERL) cms-test.pl
> + 
> +@@ -339,22 +337,22 @@
> + 	@echo "Test SRP"
> + 	../util/shlib_wrap.sh ./srptest
> + 
> +-test_ocsp: ../apps/openssl$(EXE_EXT) tocsp
> ++test_ocsp:
> + 	@echo "Test OCSP"
> + 	@sh ./tocsp
> + 
> +-test_v3name: $(V3NAMETEST)$(EXE_EXT)
> ++test_v3name:
> + 	@echo "Test X509v3_check_*"
> + 	../util/shlib_wrap.sh ./$(V3NAMETEST)
> + 
> + test_heartbeat:
> + 	../util/shlib_wrap.sh ./$(HEARTBEATTEST)
> + 
> +-test_constant_time: $(CONSTTIMETEST)$(EXE_EXT)
> ++test_constant_time:
> + 	@echo "Test constant time utilites"
> + 	../util/shlib_wrap.sh ./$(CONSTTIMETEST)
> + 
> +-test_verify_extra: $(VERIFYEXTRATEST)$(EXE_EXT)
> ++test_verify_extra:
> + 	@echo $(START) $@
> + 	../util/shlib_wrap.sh ./$(VERIFYEXTRATEST)
> + 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> index 32d8dce..fd56841 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> @@ -36,6 +36,7 @@ SRC_URI += "file://configure-targets.patch \
>              file://run-ptest \
>              file://crypto_use_bigint_in_x86-64_perl.patch \
>              file://openssl-1.0.2a-x32-asm.patch \
> +            file://ptest_makefile_deps.patch  \
>             "
>  
>  SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
> -- 
> 2.4.0
> 



