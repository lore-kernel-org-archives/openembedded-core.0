Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S2jeB-0004CF-EG for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 14:32:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TDOJch030435
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 13:24:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30161-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 13:24:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TDO8cG030429
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 13:24:09 GMT
Message-ID: <1330521852.24508.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Feb 2012 13:24:12 +0000
In-Reply-To: <1330512429-29934-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120229104508.GA3844@jama.jama.net>
	<1330512429-29934-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] layer.conf: exclude meta-environment with SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Wed, 29 Feb 2012 13:32:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-29 at 11:47 +0100, Martin Jansa wrote:
> * it's machine specific and depends on TIME
>   basehash changed from 30e97f9eeed1df8488b62b4fb47a3a0c to 72ea9a277e6599ae9052b169b9a94f1b
>   Variable TOOLCHAIN_CONFIGSITE_SYSROOTCACHE value changed from
>   /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/share/x86_64-oe-linux_config_site.d
>   to
>   /OE/oe-core/tmp-eglibc/sysroots/qemux86-64copy/usr/share/x86_64-oe-linux_config_site.d
>   Variable TIME value changed from 084543 to 085638
> * causes task-cross-canadian to be also machine specific

I think a better way to fix this might be:

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 6fc9c13..6ca85d9 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -127,6 +127,8 @@ toolchain_create_sdk_siteconfig () {
                fi
        done
 }
+# The immediate expansion above can result in unwanted path dependencies here
+toolchain_create_sdk_siteconfig[vardepsexclude] = "TOOLCHAIN_CONFIGSITE_SYSROOTCACHE"
 
 #This function create a version information file
 toolchain_create_sdk_version () {
@@ -138,6 +140,7 @@ toolchain_create_sdk_version () {
        echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
        echo 'Timestamp: ${DATETIME}' >> $versionfile
 }
+toolchain_create_sdk_version[vardepsexclude] = "DATETIME"
 
 python __anonymous () {
     deps = d.getVarFlag('do_configure', 'depends') or ""

Cheers,

Richard



