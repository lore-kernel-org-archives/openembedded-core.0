Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UHvtH-000752-H1
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 13:43:49 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id B1B63D22E8; Tue, 19 Mar 2013 13:26:57 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 1732DD20D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 13:26:26 +0100 (CET)
Message-ID: <5148596D.7090503@linaro.org>
Date: Tue, 19 Mar 2013 13:26:21 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <D9D7124626ED1E43963D86B2657D5CCD03A69B7A@FRSNPREXC1.usr.ingenico.loc>
	<50117246.2030502@windriver.com>
	<CABcZAN=nH-rkHyVm8QwaFMyXmGPe=H3cAkM0kJkPsMLp82PEKw@mail.gmail.com>
	<50118D35.6070105@windriver.com> <1343332730.9574.4.camel@ted>
	<514829D6.3060607@linaro.org>
In-Reply-To: <514829D6.3060607@linaro.org>
X-Enigmail-Version: 1.4.6
Subject: Re: SDK and external toolchain
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
X-List-Received-Date: Tue, 19 Mar 2013 12:43:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I did not tested it without external toolchain yet and have
no idea is it good way at all. 

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 050e799..f5801a8 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -142,7 +142,7 @@ toolchain_create_sdk_env_script_for_installer () {
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
-TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE = "ncurses"
 
 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
@@ -161,6 +161,11 @@ toolchain_create_sdk_siteconfig () {
                        cat ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config >> $siteconfig
                fi
        done
+       if [ "${TCMODE}" = "default" ]; then
+               if [ -r ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${TCLIBC}_config ]; then
+                       cat ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${TCLIBC}_config >> $siteconfig
+               fi
+       fi
 }
 # The immediate expansion above can result in unwanted path dependencies here
 toolchain_create_sdk_siteconfig[vardepsexclude] = "TOOLCHAIN_CONFIGSITE_SYSROOTCACHE"



